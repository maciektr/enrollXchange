import graphene
from graphene import relay
from graphql_auth.schema import UserQuery, MeQuery
from graphene_django.filter import DjangoFilterConnectionField

from .types import CourseType, OfferType


class CourseConnection(relay.Connection):
    class Meta:
        node = CourseType


class Query(MeQuery, graphene.ObjectType):
    courses = relay.ConnectionField(CourseConnection, resolver=CourseType.resolve_all)
    offers = DjangoFilterConnectionField(OfferType)

# class MyMutations(graphene.ObjectType):
#     pass


schema = graphene.Schema(query=Query)  # , mutation=MyMutations)
