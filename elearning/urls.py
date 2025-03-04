from django.urls import path
from .views import *

urlpatterns=[
    path('add_category',AddCategory,name='addcategory'),
    path('all_category',AllCategory,name='allcategory'),

]