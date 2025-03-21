from django.urls import path
from .views import *

from django.views.decorators.csrf import csrf_exempt

urlpatterns = [
    path('registers',RegistrationView.as_view(),name='register'),
    path('login',LoginView.as_view(),name='login'),
    path('logout',LogoutView,name='logout'),

    path('validate-username',csrf_exempt(UsernameValidationView.as_view()),name='validate-username'),
    path('validate-email',csrf_exempt(EmailValidationView.as_view()),name='validate-email'),
    path('activate/<uidb64>/<token>',VerificationView.as_view(),name='activate'),

    path('set-new-password/<uidb64>/<token>',CompletePasswordReset.as_view(),name='reset-user-password'),



    path('request-reset-link',RequestPasswordResetEmail.as_view(),name='request-password'),
    path('ChangePassword/',ChangePassword,name='ChangePassword'),
    
]