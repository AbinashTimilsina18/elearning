from django.shortcuts import render,get_object_or_404,redirect
from django.contrib.auth.decorators import login_required
from .forms import *
from django.contrib import messages
from .models import *
from elearning.models import *
from django.db.models import Q


from django.core.mail import send_mail
from django.conf import settings


from django.core.mail import send_mail
from django.conf import settings

from django.views import View
from django.urls import reverse
from django.http import Http404
import stripe


# Create your views here.

def index(request):
    context = {
        'course' : Courses.objects.filter(Q(trending=True) | Q(is_paid__isnull=False))[:4],
        'trend': Trend.objects.filter(trend=True)[:4]
    }
    return render(request, 'userpage/index.html', context)


def Aboutus(request):
    return render(request, 'userpage/aboutus.html', )


def contact_us(request):
    if request.method == 'POST':
        form = ContactForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, "Your message has been sent successfully!")
            return redirect('contactus')
        else:
            messages.error(request, "Please correct the errors in the form.")
    else:
        form = ContactForm()

    context = {
        'form': form,
    }
    return render(request, 'userpage/contactus.html', context)



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

    if request.user.is_staff:
        if selected_course:
            assignments = Assignment.objects.filter(courses__name=selected_course, pdf_file__isnull=False)
        else:
            assignments = Assignment.objects.filter(pdf_file__isnull=False)
    else:
        if selected_course:
            assignments = Assignment.objects.filter(
                courses__name=selected_course,
                courses__users=request.user,
                pdf_file__isnull=False
            )
        else:
            assignments = Assignment.objects.filter(
                courses__users=request.user,
                pdf_file__isnull=False
            )

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


def delete_submission(request, id):
    if not request.user.is_authenticated or not request.user.is_staff:
        return redirect('some_default_view')

    submission = get_object_or_404(Submission, id=id)
    submission.delete()

    return redirect('viewassignment')


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


import uuid

stripe.api_key = "sk_test_BQokikJOvBiI2HlWgH4olfQ2"

def transactionForm(request, course_id):
    user = request.user
    course = get_object_or_404(Courses, id=course_id)

    if request.method == "POST":
        transactionForm = TransactionForm(request.POST)
        if transactionForm.is_valid():
            price = course.price
            total_price = price
            phone_no = request.POST.get('phone_no')
            address = request.POST.get('address')
            payment_method = request.POST.get('payment_method')
            payment_status = 'pending'

            transaction_id = str(uuid.uuid4())

            transaction = Transaction.objects.create(
                user=user,
                course=course,
                transaction_id=transaction_id,
                amount=total_price,
                payment_method=payment_method,
                payment_status=payment_status,
                phone_no=phone_no,
                address=address,
            )

            if transaction.payment_method == 'esewa':
                return redirect(reverse("esewaform") + "?t_id=" + str(transaction.id) + "&c_id=" + str(course.id))

            elif transaction.payment_method == 'stripe':
                session = stripe.checkout.Session.create(
                    payment_method_types=['card'],
                    line_items=[{
                        'price_data': {
                            'currency': 'usd',
                            'product_data': {
                                'name': course.name,
                            },
                            'unit_amount': int(total_price * 100),
                        },
                        'quantity': 1,
                    }],
                    mode='payment',
                    success_url=request.build_absolute_uri(reverse('payment_success', args=[transaction.id])),
                    cancel_url=request.build_absolute_uri(reverse('payment_cancel', args=[transaction.id])),
                )

                return redirect(session.url, code=303)

            else:
                messages.error(request, "Invalid payment method.")
                return redirect('allcourses')

    else:
        transactionForm = TransactionForm()

    context = {
        'transactionForm': transactionForm,
        'course': course
    }

    return render(request, 'userpage/transactionform.html', context)


def payment_success(request, transaction_id):
    transaction = Transaction.objects.get(id=transaction_id)
    transaction.payment_status = 'completed'
    transaction.save()

    messages.success(request, "Payment successful! Your order has been placed.")
    return redirect('view_pdf_video', course_id=transaction.course.id)

def payment_cancel(request, transaction_id):
    transaction = Transaction.objects.get(id=transaction_id)
    messages.error(request, "Payment canceled.")
    return redirect('allcourses')


import hmac
import hashlib
import base64

class Esewaverify(View):
    def get(self, request, *args, **kwargs):
        t_id = request.GET.get('t_id')
        c_id = request.GET.get('c_id')

        if not t_id or not c_id:
            raise Http404("Transaction or Course ID is missing")

        try:
            course = Courses.objects.get(id=c_id)
        except Courses.DoesNotExist:
            raise Http404("Course not found")

        try:
            transaction = Transaction.objects.get(id=t_id)
        except Transaction.DoesNotExist:
            raise Http404("Transaction not found")

        uuid_val = uuid.uuid4()

        def genSha256(key, message):
            key = key.encode('utf-8')
            message = message.encode('utf-8')
            hmac_sha256 = hmac.new(key, message, hashlib.sha256)
            digest = hmac_sha256.digest()
            signature = base64.b64encode(digest).decode('utf-8')
            return signature

        secret_key = "8gBm/:&EnhH.1/q"
        data_to_sign = f"total_amount={transaction.amount},transaction_uuid={uuid_val},product_code=EPAYTEST"

        result = genSha256(secret_key, data_to_sign)
        data = {
            'amount': transaction.amount,
            "total_price": transaction.amount,
            "transaction_uuid": uuid_val,
            "product_code": "EPAYTEST",
            "signature": result
        }

        context = {
            'transaction': transaction,
            'data': data,
            'course': course
        }

        return render(request, 'userpage/esewa.html', context)

import json

@login_required
def esewaverify(request, transaction_id, course_id):
    if request.method == "GET":
        data = request.GET.get('data')
        decoded_data = base64.b64decode(data).decode('utf-8')
        map_data = json.loads(decoded_data)

        transaction = get_object_or_404(Transaction, id=transaction_id)

        if map_data.get('status') == 'COMPLETE':
            transaction.payment_status = 'completed'
            transaction.save()

            messages.success(request, 'Payment successful. Cart deleted.')
            return redirect('view_pdf_video', course_id=course_id)
        else:
            messages.error(request, 'Payment failed.')
            return redirect('allcourses')