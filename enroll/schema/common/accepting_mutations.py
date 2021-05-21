from graphene import relay

from enroll.models import Offer, Enrollment, StudentRequest


class Accepting:
    @staticmethod
    def freq_conflicting(a, b):
        return bool({1, 4} & {a, b}) or a == b

    @staticmethod
    def times_conflicting(a, b):
        return (a.start < b.end and a.end > b.start) or (
            b.start < a.end and b.end > a.start
        )

    @staticmethod
    def class_time_cmp(a, b):
        return bool(
            a.day == b.day
            and Accepting.freq_conflicting(a.frequency, b.frequency)
            and Accepting.times_conflicting(a, b)
        )

    @staticmethod
    def conflicting(time, exchange_to):
        if exchange_to.count() != 1:
            return True
        return Accepting.class_time_cmp(exchange_to.all()[0], time)

    @staticmethod
    def user_has_class_time_to_trade(user_classes_to_trade, offer_exchange_to):
        if offer_exchange_to:
            return bool(set(user_classes_to_trade) & set(offer_exchange_to))

        # To allow offers with *any* exchange_to
        return bool(user_classes_to_trade)

    @staticmethod
    def user_has_collision(user_classes, user_classes_to_trade, offer_time):
        for user_class in set(user_classes) - set(user_classes_to_trade):
            if Accepting.conflicting(user_class, offer_time):
                return True
        return False

    @staticmethod
    def test_user(user):
        return user.is_authenticated

    @staticmethod
    def test_active(obj):
        return obj.active

    @staticmethod
    def get_id(fake_id):
        return relay.Node.from_global_id(global_id=fake_id)[1]

    @staticmethod
    def test_exchange(user_to_trade, user_class_times, offer):
        return Accepting.user_has_class_time_to_trade(
            user_to_trade, offer.exchange_to.all()
        ) and not Accepting.user_has_collision(
            user_class_times, user_to_trade, offer.enrollment.class_time
        )

    @staticmethod
    def test_request(request, student):
        for time in list(
            map(lambda x: x.class_time, Enrollment.objects.filter(student=student))
        ):
            if Accepting.conflicting(time, request.exchange_to):
                return False
        return True

    @staticmethod
    def clean_offers(student, course, class_time):
        try:
            user_offer = Offer.objects.get(
                enrollment__student=student,
                enrollment__class_time__course=course,
            )
            user_offer.active = False
            user_offer.save(force_update=True)
        except Offer.DoesNotExist as ignored:
            pass
        try:
            user_request = StudentRequest.objects.get(
                enrollment__student=student,
                enrollment__class_time__course=course,
            )
            user_request.active = False
            user_request.save(force_update=True)
        except StudentRequest.DoesNotExist as ignored:
            pass

        def clean_objects(objects_type):
            offers = list(objects_type.objects.filter(enrollment__student=student).all())
            for offer in offers:
                for exchange in offer.exchange_to.all():
                    if Accepting.class_time_cmp(class_time, exchange):
                        offer.exchange_to.remove(exchange)
                        offer.save()
                        if offer.exchange_to.count() == 0:
                            offer.active = False
                            offer.save()

        clean_objects(Offer)
        clean_objects(StudentRequest)
