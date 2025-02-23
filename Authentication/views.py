from django.shortcuts import render, redirect
from django.contrib import messages
from django.contrib.auth.models import User
from django.core.exceptions import ValidationError
from django.contrib.auth import authenticate,login,logout
from .forms import *

def Register(request):
    if request.method == 'POST':
        username = request.POST.get('name')
        email = request.POST.get('email')
        password = request.POST.get('password')
        confirm_password = request.POST.get('confirmpassword')

        if password != confirm_password:
            messages.error(request, 'Passwords do not match.')
            return render(request, 'auth/register.html')

        if User.objects.filter(username=username).exists():
            messages.error(request, 'Username is already taken.')
            return render(request, 'auth/register.html')

        if User.objects.filter(email=email).exists():
            messages.error(request, 'Email is already taken.')
            return render(request, 'auth/register.html')

        try:
            user = User.objects.create_user(username=username, email=email, password=password)
            user.save()
            messages.success(request, 'User Created Successfully')
            return redirect('/auth/login')
        except ValidationError as e:
            return render(request, 'auth/register.html')
        
    return render(request, 'auth/register.html')


def Login(request):
    if request.method == 'POST':
        form = UserLogin(request.POST)
        if form.is_valid():
            data = form.cleaned_data
            user = authenticate(request,username=data['username'], password=data['password'])
            if user is not None:
                login(request, user)
                messages.success(request, 'Login successful')
                if user.is_staff:
                    return redirect('/admin/auth/user/')
                else:
                    return redirect('/')
            else:
                messages.error(request, 'Invalid Credentials')
                return render(request, 'auth/login.html', {'logForm': form})

    else:
        form = UserLogin()

    context = {
        'logForm': form
    }
    return render(request, 'auth/login.html', context)

def Logout(request):
    logout(request)
    return redirect ('login')