from django.shortcuts import render,redirect
from django.contrib.auth.decorators import login_required
from .forms import *
from django.contrib.auth.forms import UserChangeForm

# Create your views here.

def index(request):
    return render(request,'userpage/index.html')


@login_required
def user_profile(request):
    if request.method == "POST":
        form = UserChangeForm(request.POST, instance=request.user)
        if form.is_valid():
            form.save()
            return redirect('/')
    else:
        form = UserChangeForm(instance=request.user)

    return render(request, 'userpage/user_profile.html', {'form': form})