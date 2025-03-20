from django.urls import path
from .views import *

urlpatterns = [
    path('',index),
    path('profile',Profile,name='profile'),
    path('add_pdf',AddPdf,name='add_pdf'),
    path('add_video',AddVideo,name='add_video'),
    path('django',Django,name='django'),
    path('noticeform',noticeform,name='noticeform'),
    path('notice',notice,name='notice'),
    path('noticetable',NoticeTable,name='noticetable'),
    path('delete_notice/<int:pk>/', delete_notice, name='delete_notice'),
    path('createassignment',create_assignment,name='createassignment'),
    path('viewassignment',view_assignment,name='viewassignment'),
    path('delete_assignment/<int:pk>/', delete_assignment, name='delete_assignment'),
    path('submit/<int:assignment_id>/', submit_assignment, name='submit_assignment'),
    path('submission_success/', submission_success, name='submission_success'),
    path('assignment_submit/', assignment_submit, name='assignment_submit'),

]