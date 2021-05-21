from graphene_django import DjangoObjectType
from django.contrib.auth import get_user_model
from graphene import relay
import graphene

from enroll.models import Course, Lecturer, Student

from enroll.schema.class_time.type import ClassTimeType
from enroll.schema.enrollment.type import EnrollmentType
from enroll.schema.offer.type import OfferType
from enroll.schema.request.type import StudentRequestType


class UserType(DjangoObjectType):
    class Meta:
        model = get_user_model()


class StudentType(DjangoObjectType):
    class Meta:
        model = Student
        interfaces = (relay.Node,)
        fields = "__all__"

    username = graphene.String()

    def resolve_username(self, info, **kwargs):
        return self.account.username

    @staticmethod
    def resolve_all(root, info, **kwargs):
        return Student.objects.all()


class LecturerType(DjangoObjectType):
    full_name = graphene.String()

    class Meta:
        model = Lecturer
        interfaces = (relay.Node,)
        fields = "__all__"

    @staticmethod
    def resolve_all(root, info, **kwargs):
        return Lecturer.objects.all()


class CourseType(DjangoObjectType):
    class Meta:
        model = Course
        interfaces = (relay.Node,)
        fields = "__all__"

    @staticmethod
    def resolve_all(root, info, **kwargs):
        return Course.objects.all()


class CourseConnection(relay.Connection):
    class Meta:
        node = CourseType
