from django.urls import path
from .views import *

urlpatterns=[
    path('add_category',AddCategory,name='addcategory'),
    path('all_category',AllCategory,name='allcategory'),
    path('add_courses',AddCourses,name='addcourses'),
    path('all_courses',AllCourses,name='allcourses'),
    path('coursetable',CourseTable,name='coursetable'),
    path('deletecourse/<int:id>/',delete_course,name='deletecourse'),
    path('course_details/<int:course_id>/', CourseDetails, name='course_details'),
    path('course/<int:course_id>/content/', PDFVideo, name='view_pdf_video'),
    path('course/<int:course_id>/payment/', payment_page, name='payment_page'),
    path('pdfvideotable', PDFVideoTable, name='pdfvideotable'),
    path('delete_pdf/<int:id>/',delete_pdf,name='delete_pdf'),
    path('delete_video/<int:id>/',delete_video,name='delete_video'),
]