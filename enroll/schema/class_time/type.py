from graphene import relay
from graphene_django import DjangoObjectType
from enroll.models import ClassTime


class ClassTimeType(DjangoObjectType):
    class Meta:
        model = ClassTime
        interfaces = (relay.Node,)
        fields = "__all__"
        filter_fields = [
            "day",
            "frequency",
            "start",
            "lecturer__first_name",
            "lecturer__last_name",
            "course__code",
            "course__full_name",
        ]

    @staticmethod
    def resolve_all(root, info, **kwargs):
        return ClassTime.objects.all()
