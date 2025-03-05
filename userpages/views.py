from django.shortcuts import render,redirect
from django.contrib.auth.decorators import login_required
from .forms import *
from django.contrib.auth.forms import UserChangeForm

# Create your views here.

def index(request):
    return render(request,'userpage/index.html')
