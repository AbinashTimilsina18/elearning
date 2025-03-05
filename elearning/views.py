from django.shortcuts import render,redirect
from .forms import *

# Create your views here.

def AddCategory(request):
    if request.method == 'POST':
        categoryForm = CategoryForm(request.POST, request.FILES)
        if categoryForm.is_valid():
            categoryForm.save()
            return redirect('allcategory')
        else:
            return render(request,'add_category.html',{'catForm' : categoryForm})
            
    categoryForm = CategoryForm()
    context = {
        'catForm' : categoryForm
    }
    return render(request,'add_category.html',context)

def AllCategory(request):
    context = {
        'category' : Category.objects.all()
    }
    return render(request,'all_category.html',context)

def CourseDetails(request,course_id):
    course = Category.objects.get(id=course_id)
    context = {
        'course' : course
    }
    return render(request,'course_details.html',context)
