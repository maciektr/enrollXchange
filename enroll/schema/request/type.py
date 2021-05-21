from graphene_django import DjangoObjectType
from graphene import relay

from enroll.models import StudentRequest


class StudentRequestType(DjangoObjectType):
    class Meta:
        model = StudentRequest
        interfaces = (relay.Node,)
        fields = "__all__"
        filter_fields = ["active", "lecturer__id"]
