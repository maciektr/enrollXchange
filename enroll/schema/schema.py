import graphene
from graphene import relay
from graphql_auth.schema import UserQuery, MeQuery
from graphene_django.filter import DjangoFilterConnectionField

from .types import CourseType, OfferType, ClassTimeType
from ..models import Offer, ClassTime


class CourseConnection(relay.Connection):
    class Meta:
        node = CourseType


class Query(MeQuery, graphene.ObjectType):
    courses = relay.ConnectionField(CourseConnection, resolver=CourseType.resolve_all)
    offers = DjangoFilterConnectionField(OfferType)
    class_times = DjangoFilterConnectionField(ClassTimeType)

    def resolve_offers(self, info, **kwargs):
        if info.context.user.is_authenticated:
            return Offer.objects.all()
        return Offer.objects.none()
    
    def resolve_class_times(self, info, **kwargs):
        if info.context.user.is_authenticated:
            return ClassTime.objects.all()
        return ClassTime.objects.none()


# class MyMutations(graphene.ObjectType):
#     pass


schema = graphene.Schema(query=Query)  # , mutation=MyMutations)
