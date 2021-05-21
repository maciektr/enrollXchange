from enroll.models import StudentRequest, Lecturer
from enroll.types import UserType


def resolve_student_requests(self, info, **kwargs):
    user = info.context.user
    if not user.is_authenticated or user.user_type != UserType.get_by_name("teacher"):
        return StudentRequest.objects.none()

    lecturer = Lecturer.objects.filter(account=user).first()
    if not lecturer:
        return StudentRequest.objects.none()

    return StudentRequest.objects.filter(lecturer=lecturer)
