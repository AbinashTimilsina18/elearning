from django.urls import path
from .views import *

urlpatterns = [
    path('',index),
    path('user_profile',user_profile,name='userprofile')
]