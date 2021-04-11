from django.core.exceptions import ValidationError
from enroll.types import UserType


def validate_by_user_type(user_type, user_label=None):
    user_label = 'Account' if not user_label else user_label + ' account'

    def __validate(user):
        if user.user_type != UserType.get_by_name(user_type):
            raise ValidationError(f"{user_label} type must be '{user_type}'!")

    return __validate
