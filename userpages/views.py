from django.shortcuts import render,get_object_or_404,redirect
from django.contrib.auth.decorators import login_required
from .forms import *
from django.contrib import messages
from .models import *
from elearning.models import *
from django.db.models import Q

# Create your views here.

def index(request):
    context = {
        'course' : Courses.objects.filter(Q(trending=True) | Q(price__isnull=False))[:4],
        'trend': Trend.objects.filter(trend=True)[:4]

    }
    return render(request, 'userpage/index.html', context)

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
    if not request.user.is_superuser:
        return redirect('login')

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


def create_assignment(request):
    if request.method == 'POST':
        form = AssignmentForm(request.POST, request.FILES)
        if form.is_valid():
            assignment = form.save(commit=False)
            assignment.assigned_by = request.user
            assignment.save()
            return redirect('viewassignment')
    else:
        form = AssignmentForm()
    
    courses = Courses.objects.all()
    selected_course = request.GET.get('course', '')

    return render(
        request,
        'userpage/assignment_form.html',
        {'form': form, 'courses': courses, 'selected_course': selected_course}
    )

def view_assignment(request):
    courses = Courses.objects.all()
    selected_course = request.GET.get('course')

    if selected_course:
        assignments = Assignment.objects.filter(courses__name=selected_course, pdf_file__isnull=False)
    else:
        assignments = Assignment.objects.filter(pdf_file__isnull=False)

    context = {
        'assign': assignments,
        'courses': courses,
        'selected_course': selected_course,
    }
    return render(request, 'userpage/view_assignment.html', context)



def delete_assignment(request, pk):
    assignment = get_object_or_404(Assignment, pk=pk)
    assignment.delete()
    return redirect('createassignment')


@login_required
def submit_assignment(request, assignment_id):
  
    user_courses = Courses.objects.filter(users=request.user)

  
    assignment = get_object_or_404(Assignment, id=assignment_id)

    if assignment.courses not in user_courses:
        return redirect('/') 

    if request.method == "POST":
        form = SubmissionForm(request.POST, request.FILES)
        if form.is_valid():
            submission = form.save(commit=False)
            submission.user = request.user
            submission.assignment = assignment
            submission.save()
            return redirect('submission_success') 
    else:
        form = SubmissionForm()

    assignments = Assignment.objects.all()  
    return render(request, 'userpage/submit_assignment.html', {
        'form': form,
        'assignments': assignments,
        'assignment': assignment, 
    })



def submission_success(request):
    return render(request, 'userpage/submission_success.html')


@login_required
def assignment_submit(request):
    courses = Courses.objects.all()
    selected_course = request.GET.get('course', '')

    user = request.user
    if selected_course:
        assignments = Assignment.objects.filter(courses__name=selected_course)
    else:
        assignments = Assignment.objects.all()

    if user.is_staff:
        submissions = Submission.objects.filter(assignment__in=assignments)
    else:
        submissions = Submission.objects.filter(assignment__in=assignments, user=user)

    context = {
        'courses': courses,
        'submissions': submissions,
        'selected_course': selected_course,
    }

    return render(request, 'userpage/assignment_submit.html', context)

def NoticeTable(request):
    context = {
        'noticetable' : Notice.objects.all
    }
    return render(request, 'userpage/noticetable.html', context)

def delete_notice(request, pk):
    notice = get_object_or_404(Notice, pk=pk)
    notice.delete()
    return redirect('noticetable')