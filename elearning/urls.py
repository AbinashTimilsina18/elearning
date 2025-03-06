from django.urls import path
from .views import *

urlpatterns=[
    path('add_category',AddCategory,name='addcategory'),
    path('all_category',AllCategory,name='allcategory'),
    path('course_details/<int:course_id>',CourseDetails,name='coursedetails'),
    
]