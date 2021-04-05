from django.urls import path
from . import views


urlpatterns = [
    path('', views.index),
    path('my-schedule', views.index)
]
