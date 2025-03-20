from django.shortcuts import render,redirect, get_object_or_404
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
            return redirect('coursetable')
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
            return redirect('coursetable')
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

def CourseDetails(request,course_id):
    course = Courses.objects.get(id=course_id)
    context = {
        'course' : course
    }
    return render(request,'course_details.html',context)

def CourseTable(request):
    context = {
        'coursetable' : Courses.objects.all()
    }
    return render(request,'coursetable.html',context)

def delete_course(request, id):
    course = get_object_or_404(Courses, id=id)
    course.delete()
    return redirect('coursetable')


@login_required
def PDFVideo(request, course_id):
    course = get_object_or_404(Courses, id=course_id)
    
    pdfs = Pdf.objects.filter(courses=course)
    videos = Video.objects.filter(courses=course)

    selected_category = request.GET.get('category')

    if selected_category:
        pdfs = pdfs.filter(category__name=selected_category)
        videos = videos.filter(category__name=selected_category)

    categories = Category.objects.all()

    context = {
        'pdf': pdfs,
        'video': videos,
        'categories': categories,
        'course': course,
        'selected_category': selected_category,
    }

    return render(request, 'view_pdf_video.html', context)

def PDFVideoTable(request):
    category_filter = request.GET.get('category', '')

    pdftable = Pdf.objects.all()
    videotable = Video.objects.all()

    if category_filter:
        pdftable = pdftable.filter(category__name__icontains=category_filter)
        videotable = videotable.filter(category__name__icontains=category_filter)

    context = {
        'pdftable': pdftable,
        'videotable': videotable,
        'category_filter': category_filter,
    }

    return render(request, 'pdfvideotable.html', context)

def delete_pdf(request, id):
    pdf = get_object_or_404(Pdf, id=id)
    pdf.delete()
    return redirect('pdfvideotable')

def delete_video(request, id):
    video = get_object_or_404(Video, id=id)
    video.delete()
    return redirect('pdfvideotable')






