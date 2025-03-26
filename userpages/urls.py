from django.urls import path
from .views import *

urlpatterns = [
    path('',index),
    path('aboutus',Aboutus,name='aboutus'),
    path('contact/',contact_us,name='contactus'),
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
    path('submit_assignment/<int:assignment_id>/', submit_assignment, name='submit_assignment'),
    path('submission_success/', submission_success, name='submission_success'),
    path('assignment_submit/', assignment_submit, name='assignment_submit'),
    path('delete_submission/<int:id>/', delete_submission, name='delete_submission'),
    path('transactionform/<int:course_id>/', transactionForm, name='transactionform'),
    path('esewa-form', Esewaverify.as_view(), name='esewaform'),
    path('esewaverify/<int:transaction_id>/<int:course_id>', esewaverify, name='esewaverify'),
    path('payment-success/<int:transaction_id>/', payment_success, name='payment_success'),
    path('payment-cancel/<int:transaction_id>/', payment_cancel, name='payment_cancel'),
]


