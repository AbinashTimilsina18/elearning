from django.urls import path
from .views import *

urlpatterns=[
    path('add_category',AddCategory,name='addcategory'),
    path('all_category',AllCategory,name='allcategory'),
    path('add_courses',AddCourses,name='addcourses'),
    path('all_courses',AllCourses,name='allcourses'),
    path('course_details/<int:course_id>',CourseDetails,name='coursedetails'),
    path('viewpdfvideo',PDFVideo,name='viewpdfvideo'),
    
]