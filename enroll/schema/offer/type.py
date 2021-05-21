from graphene_django import DjangoObjectType
from graphene import relay

from enroll.models import Offer


class OfferType(DjangoObjectType):
    class Meta:
        model = Offer
        interfaces = (relay.Node,)
        fields = "__all__"
        filter_fields = [
            "active",
            "enrollment__class_time__course__full_name",
            "enrollment__class_time__lecturer__first_name",
            "enrollment__class_time__lecturer__last_name",
            "enrollment__class_time__day",
            "enrollment__class_time__start",
            "enrollment__class_time__frequency",
            "enrollment__student__id",
        ]
