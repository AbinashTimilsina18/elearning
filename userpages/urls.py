from django.urls import path
from .views import *

urlpatterns = [
    path('',index),
    path('profile',Profile,name='profile'),
    path('add_pdf',AddPdf,name='add_pdf'),
    path('add_video',AddVideo,name='add_video'),
    path('django',Django,name='django'),
]