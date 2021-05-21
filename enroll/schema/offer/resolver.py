from django.db.models import Q

from enroll.models import Enrollment, Offer
from enroll.schema.common import get_student_by_account


def resolve_offers(self, info, **kwargs):
    if info.context.user.is_authenticated:
        return Offer.objects.all()
    return Offer.objects.none()


def resolve_matching_offers(self, info, **kwargs):
    if info.context.user.is_authenticated:
        user = info.context.user
        user_enrollments = list(
            Enrollment.objects.filter(student=get_student_by_account(user))
        )
        user_class_times = [e.class_time for e in user_enrollments]
        class_time_fields = [
            (c.day, c.frequency, c.start, c.end) for c in user_class_times
        ]
        query_list = [
            Q(enrollment__class_time__day=fields[0])
            & Q(enrollment__class_time__frequency=fields[1])
            & Q(enrollment__class_time__start__lt=fields[3])
            for fields in class_time_fields
        ]
        final_query = Q()

        for q in query_list:
            final_query |= q

        prefiltered_offers = Offer.objects.exclude(final_query)

        unwanted_offers_ids = []
        for r in prefiltered_offers:  # temporary(?) solution to filtering by property
            for e in class_time_fields:
                if (
                    r.enrollment.class_time.frequency == e[1]
                    and r.enrollment.class_time.day == e[0]
                    and r.enrollment.class_time.end >= e[2]
                ):
                    unwanted_offers_ids.append(r.id)

        return prefiltered_offers.exclude(id__in=unwanted_offers_ids)

    return Offer.objects.none()
