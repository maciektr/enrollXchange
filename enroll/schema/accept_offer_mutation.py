import graphene
from graphene import relay

from ..mail import send_offer_accepted
from ..models import Offer, ClassTime, Enrollment, StudentRequest, Lecturer, Student


class AcceptOffer(graphene.Mutation):
    class Arguments:
        offer_id = graphene.String()

    offerAccepted = graphene.Boolean()

    @staticmethod
    def mutate(root, info, offer_id):
        if not info.context.user.is_authenticated:
            return AcceptOffer(offerAccepted=False)

        user = info.context.user
        _, real_offer_id = relay.Node.from_global_id(global_id=offer_id)
        offer = Offer.objects.get(id=real_offer_id)

        if not offer.active:
            return AcceptOffer(offerAccepted=False)

        student = Student.objects.get(account=user)
        user_enrollments = list(Enrollment.objects.filter(student=student))
        user_class_times = [e.class_time for e in user_enrollments]
        user_to_trade = list(
            filter(
                lambda x: x.course == offer.enrollment.class_time.course,
                user_class_times,
            )
        )

        def user_has_class_time_to_trade(user_classes_to_trade, offer_exchange_to):
            if offer_exchange_to:
                return bool(set(user_classes_to_trade) & set(offer_exchange_to))

            # To allow offers with *any* exchange_to
            return bool(user_classes_to_trade)

        def user_has_collision(user_classes, user_classes_to_trade, offer_time):
            return bool((set(user_classes) - set(user_classes_to_trade)) & {offer_time})

        if user_has_class_time_to_trade(
            user_to_trade, offer.exchange_to.all()
        ) and not user_has_collision(
            user_class_times, user_to_trade, offer.enrollment.class_time
        ):
            offer.active = False
            user_enrollment = list(
                filter(
                    lambda x: x.class_time.course == offer.enrollment.class_time.course,
                    user_enrollments,
                )
            )[0]
            offer.enrollment.student, user_enrollment.student = (
                user_enrollment.student,
                offer.enrollment.student,
            )

            try:
                user_offer = Offer.objects.get(
                    enrollment__student=student,
                    enrollment__class_time__course=offer.enrollment.class_time.course,
                )
                user_offer.active = False
                user_offer.save(force_update=True)
            except Offer.DoesNotExist as ignored:
                pass

            send_offer_accepted(
                offer_client_mail=user_enrollment.student.account.email,
                offer_owner_mail=offer.enrollment.student.account.email,
                client_class_time=user_enrollment.class_time,
                offer_class_time=offer.enrollment.class_time,
            )

            offer.enrollment.save()
            user_enrollment.save()
            offer.save()

            return AcceptOffer(offerAccepted=True)
        return AcceptOffer(offerAccepted=False)
