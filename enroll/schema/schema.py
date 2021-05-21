import graphene
from graphene import relay
from graphql_auth.schema import MeQuery
from graphene_django.filter import DjangoFilterConnectionField

from enroll.schema.types import CourseType, CourseConnection

import enroll.schema.class_time.resolver as class_time_resolver
from enroll.schema.class_time.type import ClassTimeType

import enroll.schema.enrollment.resolver as enrollment_resolver
from enroll.schema.enrollment.type import EnrollmentType

import enroll.schema.offer.resolver as offer_resolver
from enroll.schema.offer.schema import AcceptOffer, CreateOffer, CreateOfferWithAny
from enroll.schema.offer.type import OfferType

import enroll.schema.request.resolver as student_request_resolver
from enroll.schema.request.schema import AcceptRequest, CreateRequest
from enroll.schema.request.type import StudentRequestType


class Query(MeQuery, graphene.ObjectType):
    courses = relay.ConnectionField(CourseConnection, resolver=CourseType.resolve_all)
    offers = DjangoFilterConnectionField(OfferType)
    class_times = DjangoFilterConnectionField(ClassTimeType)
    my_class_times = DjangoFilterConnectionField(ClassTimeType)
    enrollments = DjangoFilterConnectionField(EnrollmentType)
    matching_offers = DjangoFilterConnectionField(OfferType)
    student_requests = DjangoFilterConnectionField(StudentRequestType)

    @staticmethod
    def resolve_enrollments(self, info, **kwargs):
        enrollment_resolver.resolve_enrollments(self, info, **kwargs)

    @staticmethod
    def resolve_my_class_times(self, info, **kwargs):
        class_time_resolver.resolve_my_class_times(self, info, **kwargs)

    @staticmethod
    def resolve_offers(self, info, **kwargs):
        offer_resolver.resolve_offers(self, info, **kwargs)

    @staticmethod
    def resolve_matching_offers(self, info, **kwargs):
        offer_resolver.resolve_matching_offers(self, info, **kwargs)

    @staticmethod
    def resolve_class_times(self, info, **kwargs):
        class_time_resolver.resolve_class_times(self, info, **kwargs)

    @staticmethod
    def resolve_student_requests(self, info, **kwargs):
        student_request_resolver.resolve_student_requests(self, info, **kwargs)


class MyMutations(graphene.ObjectType):
    accept_offer = AcceptOffer.Field()
    create_offer = CreateOffer.Field()
    create_offer_with_any = CreateOfferWithAny.Field()

    accept_request = AcceptRequest.Field()
    create_request = CreateRequest.Field()


schema = graphene.Schema(query=Query, mutation=MyMutations)
