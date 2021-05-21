from enroll.models import User, Student


def get_student_by_account(user: User):
    return Student.objects.get(account=user)
