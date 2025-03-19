from django.shortcuts import render,redirect
from .forms import *
from .models import *
from userpages.models import *
from django.contrib.auth.decorators import login_required

# Create your views here.

def AddCategory(request):
    if request.method == 'POST':
        categoryForm = CategoryForm(request.POST, request.FILES)
        if categoryForm.is_valid():
            categoryForm.save()
            return redirect('addcategory')
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

def AddCourses(request):
    if request.method == 'POST':
        courseForm = CoursesForm(request.POST, request.FILES)
        if courseForm.is_valid():
            courseForm.save()
            return redirect('allcourses')
        else:
            return render(request,'add_courses.html',{'courForm' : courseForm})
            
    courseForm = CoursesForm()
    context = {
        'courForm' : courseForm
    }
    return render(request,'add_courses.html',context)


def AllCourses(request):
    categories = Category.objects.all()
    
    category_id = request.GET.get('category')
    if category_id:
        courses = Courses.objects.filter(category_id=category_id)
    else:
        courses = Courses.objects.all()

    context = {
        'courses': courses,
        'categories': categories,
    }
    return render(request, 'all_courses.html', context)

@login_required
def CourseDetails(request,course_id):
    course = Courses.objects.get(id=course_id)
    context = {
        'course' : course
    }
    return render(request,'course_details.html',context)


def PDFVideo(request):
    categories = Category.objects.all()
    courses = Courses.objects.all()
    
    selected_category = request.GET.get('category')
    selected_course = request.GET.get('course')

    if selected_category and selected_course:
        pdfs = Pdf.objects.filter(category__name=selected_category, courses__name=selected_course)
        videos = Video.objects.filter(category__name=selected_category, courses__name=selected_course)
    elif selected_category:
        pdfs = Pdf.objects.filter(category__name=selected_category)
        videos = Video.objects.filter(category__name=selected_category)
    elif selected_course:
        pdfs = Pdf.objects.filter(courses__name=selected_course)
        videos = Video.objects.filter(courses__name=selected_course)
    else:
        pdfs = Pdf.objects.all()
        videos = Video.objects.all()

    context = {
        'pdf': pdfs,
        'video': videos,
        'categories': categories,
        'courses': courses,
        'selected_category': selected_category,
        'selected_course': selected_course
    }
    
    return render(request, 'view_pdf_video.html', context)





