from django.shortcuts import render,redirect
from django.contrib.auth.decorators import login_required
from .forms import *
from django.contrib import messages
from .models import *

# Create your views here.

def index(request):
    return render(request,'userpage/index.html')

@login_required
def Profile(request):
    user = request.user
    if request.method == 'POST':
        form = ProfileForm(request.POST, request.FILES, instance=user)
        if form.is_valid():
            form.save()
            messages.success(request, 'Your profile has been updated successfully.')
            return redirect('/')
    else:
        form = ProfileForm(instance=user)

    return render(request, 'userpage/user_profile.html', {'form': form, 'user': user})

def AddPdf(request):
    if request.method == 'POST':
        pdfForm = PdfForm(request.POST, request.FILES)
        if pdfForm.is_valid():
            pdfForm.save()
            return redirect('add_pdf')
        else:
            return render(request, 'userpage/add_pdf.html', {'pdfForm': pdfForm})

    pdfForm = PdfForm()
    
    context = {
        'pdfForm': pdfForm
    }
    return render(request, 'userpage/add_pdf.html', context)

def AddVideo(request):
    if request.method == 'POST':
        videoForm = VideoForm(request.POST, request.FILES)
        if videoForm.is_valid():
            videoForm.save()
            return redirect('add_video')
        else:
            return render(request, 'userpage/add_video.html', {'videoForm': videoForm})

    videoForm = VideoForm()
    
    context = {
        'videoForm': videoForm
    }
    return render(request, 'userpage/add_video.html', context)

def Django(request):
    context = {
        'djangopdf' : Pdf.objects.filter(django_pdf=True),
        'djangovideo' : Video.objects.filter(django_video=True)
    }
    return render(request,'userpage/django.html',context)


def noticeform(request):
    if request.method == 'POST':
        notice_form = NoticeForm(request.POST, request.FILES)
        if notice_form.is_valid():
            notice_form.save()
            return redirect('http://127.0.0.1:8000/admin/')
        else:
            return render(request, 'userpage/noticeform.html', {'noticeForm': notice_form})

    notice_form = NoticeForm()

    context = {
        'noticeForm': notice_form
    }
    return render(request, "userpage/noticeform.html", context)


def notice(request):
    context = {
        'notice' : Notice.objects.all()
    }
    return render(request,"userpage/notice.html",context)