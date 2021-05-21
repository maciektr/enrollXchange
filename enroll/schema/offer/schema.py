import graphene
from graphene import relay

from enroll.schema.common.accepting_mutations import Accepting
from enroll.mail import send_offer_accepted
from enroll.models import Offer, Enrollment, Student, ClassTime

from .type import OfferType


class CreateOfferWithAny(graphene.Mutation):
    offer = graphene.Field(OfferType)

    class Arguments:
        enrollment_id = graphene.String()
        comment = graphene.String()
        lecturer_id = graphene.String()
        day = graphene.String()
        frequency = graphene.String()
        start = graphene.String()
        duration = graphene.Int()

    # on front end you can specify only those fields you ask for.
    # The rest is automatically set to 'any'

    @staticmethod
    def mutate(
        root,
        info,
        enrollment_id,
        comment="",
        lecturer_id=None,
        day=None,
        frequency=None,
        start=None,
        duration=None,
    ):
        _, enrollment_id_real = relay.Node.from_global_id(global_id=enrollment_id)
        enrollment = Enrollment.objects.get(id=enrollment_id_real)

        class_times = ClassTime.objects.filter(
            course=enrollment.class_time.course
        ).exclude(id=enrollment.class_time.id)
        if lecturer_id is not None:
            _, lecturer_id_real = relay.Node.from_global_id(global_id=lecturer_id)
            class_times = class_times.filter(lecturer__id=lecturer_id_real)
        if day is not None:
            class_times = class_times.filter(day=day)
        if frequency is not None:
            class_times = class_times.filter(frequency=frequency)
        if start is not None:
            class_times = class_times.filter(start=start)
        if duration is not None:
            class_times = class_times.filter(duration_minutes=duration)

        current_class_time = enrollment.class_time
        is_active = True

        acceptable_wanted_class_time = list(
            filter(
                lambda x: x.enrollment_set.count()
                <= (current_class_time.enrollment_set.count() - 1)
                and x.lecturer == current_class_time.lecturer,
                class_times,
            )
        )

        # in destination class_time there are N-1 students (in current N)
        # and both class_times have the same lecturer
        if len(acceptable_wanted_class_time) > 0:
            enrollment.class_time = acceptable_wanted_class_time[0]
            Enrollment.objects.filter(id=enrollment_id_real).update(
                class_time=acceptable_wanted_class_time[0]
            )
            is_active = False

        try:
            offer = Offer.objects.get(enrollment=enrollment)
        except Offer.DoesNotExist as e:
            offer = Offer.objects.create(
                enrollment=enrollment, comment=comment, active=is_active
            )
        if is_active:
            for class_time in class_times:
                offer.exchange_to.add(class_time)

        return CreateOffer(offer=offer)


class CreateOffer(graphene.Mutation):
    offer = graphene.Field(OfferType)

    class Arguments:
        enrollment_id = graphene.String()
        comment = graphene.String()
        class_time_id = graphene.String()

    @staticmethod
    def mutate(root, info, enrollment_id, comment, class_time_id):
        _, enrollment_id_real = relay.Node.from_global_id(global_id=enrollment_id)
        enrollment = Enrollment.objects.get(id=enrollment_id_real)

        _, class_time_id_real = relay.Node.from_global_id(global_id=class_time_id)
        class_time = ClassTime.objects.get(id=class_time_id_real)

        current_class_time = enrollment.class_time
        is_active = True

        # in destination class_time there are N-1 students (in current N) and
        # both class_times have the same lecturer
        if (
            class_time.enrollment_set.count()
            <= (current_class_time.enrollment_set.count() - 1)
            and class_time.lecturer == current_class_time.lecturer
        ):
            enrollment.class_time = class_time
            Enrollment.objects.filter(id=enrollment_id_real).update(class_time=class_time)
            is_active = False

        try:
            offer = Offer.objects.get(enrollment=enrollment)
        except Offer.DoesNotExist as e:
            offer = Offer.objects.create(
                enrollment=enrollment, comment=comment, active=is_active
            )

        offer.exchange_to.add(class_time)

        return CreateOffer(offer=offer)


class AcceptOffer(Accepting, graphene.Mutation):
    class Arguments:
        offer_id = graphene.String()

    accepted = graphene.Boolean()

    @staticmethod
    def mutate(root, info, offer_id):
        if not Accepting.test_user(
            user := info.context.user
        ) or not Accepting.test_active(
            offer := Offer.objects.get(id=Accepting.get_id(offer_id))
        ):
            return AcceptOffer(accepted=False)
        student = Student.objects.get(account=user)
        user_enrollments = list(Enrollment.objects.filter(student=student))
        user_class_times = [e.class_time for e in user_enrollments]
        course = offer.enrollment.class_time.course
        user_to_trade = list(
            filter(
                lambda x: x.course == course,
                user_class_times,
            )
        )
        if not Accepting.test_exchange(user_to_trade, user_class_times, offer):
            return AcceptOffer(accepted=False)

        offer.active = False
        offer.save()
        user_enrollment = next(
            filter(
                lambda x: x.class_time.course == course,
                user_enrollments,
            )
        )
        Accepting.clean_offers(student, course, offer.enrollment.class_time)
        offer.enrollment.student, user_enrollment.student = (
            user_enrollment.student,
            offer.enrollment.student,
        )
        offer.enrollment.save()
        user_enrollment.save()
        offer.save()
        send_offer_accepted(
            offer_client_mail=user_enrollment.student.account.email,
            offer_owner_mail=offer.enrollment.student.account.email,
            client_class_time=user_enrollment.class_time,
            offer_class_time=offer.enrollment.class_time,
        )
        return AcceptOffer(accepted=True)
