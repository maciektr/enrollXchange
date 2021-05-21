from graphene import relay
from graphene_django import DjangoObjectType
from enroll.models import Enrollment


class EnrollmentType(DjangoObjectType):
    class Meta:
        model = Enrollment
        interfaces = (relay.Node,)
        fields = "__all__"
        filter_fields = ["student__id"]

    @staticmethod
    def resolve_all(root, info, **kwargs):
        return Enrollment.objects.all()
