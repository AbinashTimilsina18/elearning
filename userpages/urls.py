from django.urls import path
from .views import *

urlpatterns = [
    path('',index),
    path('profile',Profile,name='profile'),
    # path('add_pdf_video',AddPdfVideo,name='add_pdf_video'),
    # path('django',Django,name='django'),
]