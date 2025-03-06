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

# def AddPdfVideo(request):
#     if request.method == 'POST':
#         videoForm = PdfVideoForm(request.POST, request.FILES)
#         if videoForm.is_valid():
#             videoForm.save()
#             return redirect('/')
#         else:
#             return render(request, 'userpage/add_pdf_video.html', {'pdfForm': videoForm})

#     videoForm = PdfVideoForm()
    
#     context = {
#         'pdfForm': videoForm
#     }
#     return render(request, 'userpage/add_pdf_video.html', context)

# def Django(request):
#     django = Video.objects.all()
#     context = {
#         'django' : django
#     }
#     return render(request,'component/django.html',context)

