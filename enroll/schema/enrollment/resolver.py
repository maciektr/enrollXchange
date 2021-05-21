from enroll.models import Enrollment


def resolve_enrollments(self, info, **kwargs):
    if info.context.user.is_authenticated:
        return Enrollment.objects.all()
    return Enrollment.objects.none()
