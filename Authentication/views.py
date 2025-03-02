from django.shortcuts import render, redirect
from django.views import View
import json
from django.http import JsonResponse
from django.contrib.auth.models import User
from email_validator import validate_email
from django.contrib import messages
from django.core.mail import EmailMessage, send_mail
from django.contrib.auth.forms import PasswordChangeForm
from django.urls import reverse
from .utils import account_activation_token
from django.contrib.auth import authenticate, login, logout, update_session_auth_hash
from django.utils.encoding import force_bytes, force_str
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.contrib.sites.shortcuts import get_current_site
from django.contrib.auth.tokens import PasswordResetTokenGenerator
import threading
import logging

logger = logging.getLogger(__name__)

class EmailThreading(threading.Thread):
    def __init__(self, email):
        self.email = email
        threading.Thread.__init__(self)

    def run(self):
        try:
            self.email.send(fail_silently=False)
        except Exception as e:
            logger.error(f"Error sending email: {e}")

class EmailValidationView(View):
    def post(self, request):
        data = json.loads(request.body)
        email = data['email']

        if not validate_email(email):
            return JsonResponse({'email_error': 'email is Invalid'}, status=400)
        if User.objects.filter(email=email).exists():
            return JsonResponse({'email_error': 'email already exists. Choose another User.', 'available': True}, status=400)
        return JsonResponse({'email_valid': True})

class UsernameValidationView(View):
    def post(self, request):
        data = json.loads(request.body)
        username = data['username']

        if not str(username).isalnum():
            return JsonResponse({'username_error': 'username should only contain alphanumeric characters', 'available': True}, status=400)
        if User.objects.filter(username=username).exists():
            return JsonResponse({'username_error': 'username already exists. Choose another User.', 'available': True}, status=400)
        return JsonResponse({'username_valid': True})

class RegistrationView(View):
    def get(self, request):
        return render(request, 'auth/register.html')
    
    def post(self, request):
        username = request.POST['username']
        email = request.POST['email']
        password = request.POST['password']

        context = {
            'fieldValues': request.POST
        }

        if not User.objects.filter(username=username).exists():
            if not User.objects.filter(email=email).exists():
                if len(password) < 6:
                    messages.error(request, 'Password should be at least 6 characters long')
                    return render(request, 'auth/register.html', context)
                
                user = User.objects.create_user(username=username, email=email)
                user.set_password(password)
                user.is_active = False
                user.save()

                try:
                    current_site = get_current_site(request)
                    email_body = {
                        'user': user,
                        'domain': current_site.domain,
                        'uid': urlsafe_base64_encode(force_bytes(user.pk)),
                        'token': account_activation_token.make_token(user),
                    }

                    link = reverse('activate', kwargs={"uidb64": email_body['uid'], "token": email_body['token']})
                    email_subject = "Activate Your Account"
                    activate_url = 'http://' + current_site.domain + link

                    email_message = EmailMessage(
                        email_subject,
                        f'Hi {user.username}, please use this link to verify your account: {activate_url}',
                        'raibibek122@gmail.com',
                        [email],
                    )

                    EmailThreading(email_message).start()
                    messages.success(request, 'Account created successfully. Please check your email to activate your account.')
                except Exception as e:
                    logger.error(f"Error sending activation email: {e}")
                    messages.error(request, 'Error sending activation email. Please try again later.')

                return render(request, 'auth/register.html')

        return render(request, 'auth/register.html')

class VerificationView(View):
    def get(self, request, uidb64, token):
        try:
            id = force_str(urlsafe_base64_decode(uidb64))
            user = User.objects.get(pk=id)

            if not account_activation_token.check_token(user, token):
                return redirect(f'{reverse("login")}?message=User already activated')

            if user.is_active:
                return redirect('login')
            user.is_active = True
            user.save()
            messages.success(request, 'Account activated successfully.')
            return redirect('login')

        except Exception as e:
            logger.error(f"Error in account verification: {e}")
            return redirect(f'{reverse("login")}?message=Invalid activation link')




class LoginView(View):
    def get(self, request):
        return render(request, 'auth/login.html')
    
    def post(self, request):
        username = request.POST['username']
        email = request.POST['email']
        password = request.POST['password']

        try:
            user = User.objects.get(username=username, email=email)
        except User.DoesNotExist:
            messages.error(request, 'Invalid username or email, please try again.')
            return render(request, 'auth/login.html')
        
        user = authenticate(request, username=username, password=password)
        
        if user is not None:
            if not user.is_active:
                messages.error(request, 'Your account is not activated. Please check your email for the activation link.')
                return redirect('login')

            login(request, user)
            messages.success(request, f'Welcome back, {user.username}!')

            if user.is_superuser:
                return redirect('http://127.0.0.1:8000/admin/')
            else:
                return redirect('/')
        
        messages.error(request, 'Invalid credentials, please try again.')
        return render(request, 'auth/login.html')
    
    
def LogoutView(request):
    logout(request)
    messages.success(request,"You have been logged Out.")
    return redirect('/')
    
class RequestPasswordResetEmail(View):
        def get(self,request):
            return render(request,'auth/reset-password.html')
    
        def post(self,request):
            email = request.POST['email']

            context={
                'values':request.POST
            }

            if not validate_email(email):
                messages.error(request,'Invalid Email')
                return render(request,'auth/reset-password.html')

            current_site = get_current_site(request)

            user=User.objects.filter(email=email)

            if user.exists():
                email_contents = {
                'user': user[0],
                'domain': current_site.domain,
                'uid': urlsafe_base64_encode(force_bytes(user[0].pk)),
                'token': PasswordResetTokenGenerator().make_token(user[0]),
            }
            

            
            link = reverse('reset-user-password',kwargs = {"uidb64":email_contents['uid'],"token":email_contents['token']})
            
            email_subject = "Password reset Instruction"
            reset_url = 'http://'+ current_site.domain + link
            
            email = EmailMessage(
                email_subject,
                'Hi there, Please use this link to reset your password\n' + reset_url,
                "noreply@semicolon.com",
                [email],
                
            )
            EmailThreading(email).start()

            messages.success(request,'We have sent you an email to reset your password.')
            return render(request, 'auth/reset-password.html', context)

 
class CompletePasswordReset(View):
    def get(self,request,uidb64,token):
        context = {
            'uidb64':uidb64,
            'token':token
        }
        return render(request,'auth/set-new-password.html',context)
    
    def post(self,request,uidb64,token):
        context = {
            'uidb64':uidb64,
            'token':token
        }
        password = request.POST['password']
        password2 = request.POST['password2']

        if password != password2:
            messages.error(request, 'Passwords do not match')
            return render(request, 'auth/set-new-password.html', context)

        if len(password) < 6:
            messages.error(request, 'Password should be at least 6 characters long')
            return render(request, 'auth/set-new-password.html', context)

        try:
            user_id = force_str(urlsafe_base64_decode(uidb64))
            user = User.objects.get(pk=user_id)
            user.set_password(password) 
            user.save()
            
            messages.success(request, 'Password reset successfully, you can log in with your new password!')
            return redirect('login')

        except User.DoesNotExist:
            messages.error(request, 'User does not exist.')
            return render(request, 'auth/set-new-password.html', context)

        except Exception as e:
            messages.error(request, 'Something went wrong.')
            return render(request, 'auth/set-new-password.html', context)


def ChangePassword(request):
    if request.method=='POST':
        fm=PasswordChangeForm(user=request.user,data=request.POST)
        if fm.is_valid():
            fm.save()
            update_session_auth_hash(request,fm.user)
            messages.success(request,"Your Password has be changed succesfully")
            return redirect('/')
    else:
        fm=PasswordChangeForm(user=request.user)

    return render(request,'auth/changepassword.html',{'fm':fm})
