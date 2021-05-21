from enroll.models import Enrollment, ClassTime
from enroll.schema.common import get_student_by_account


def resolve_my_class_times(self, info, **kwargs):
    user = info.context.user
    if user.is_authenticated:
        class_time_ids = Enrollment.objects.filter(
            student=get_student_by_account(user)
        ).values_list("class_time__id", flat=True)
        return ClassTime.objects.filter(id__in=class_time_ids)
    return ClassTime.objects.none()


def resolve_class_times(self, info, **kwargs):
    if info.context.user.is_authenticated:
        return ClassTime.objects.all()
    return ClassTime.objects.none()
