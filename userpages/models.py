from django.db import models
from elearning.models import *
from django.core.validators import *

# Create your models here.

class Pdf(models.Model):
    category = models.ForeignKey(Category,on_delete=models.CASCADE,null=True)
    courses = models.ForeignKey(Courses,on_delete=models.CASCADE,null=True)
    title = models.CharField(max_length=400)
    pdf_file = models.FileField(upload_to='static/pdfvideo', null=True, blank=True)
    django_pdf = models.BooleanField(null=True,blank=False)

class Video(models.Model):
    category = models.ForeignKey(Category, on_delete=models.CASCADE, null=True)
    courses = models.ForeignKey(Courses, on_delete=models.CASCADE, null=True)
    title = models.CharField(max_length=400)
    video_file = models.FileField(upload_to='static/pdfvideo', null=True, blank=True)
    django_video = models.BooleanField(null=True, blank=True)


class Notice(models.Model):
    title= models.CharField(max_length=500)
    content= models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    author=models.CharField(max_length=200)

    def __str__(self):
        return self.title
    
from django.utils import timezone

class Assignment(models.Model):
    title = models.CharField(max_length=255)
    description = models.TextField()
    pdf_file = models.FileField(upload_to='static/Assignment', null=True, blank=True)
    due_date = models.DateTimeField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    assigned_by = models.ForeignKey(User, on_delete=models.CASCADE, related_name='assignments_created')
    courses = models.ForeignKey(Courses, on_delete=models.CASCADE)

    def __str__(self):
        return self.title
    
class Submission(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, default=1)
    assignment = models.ForeignKey(Assignment, on_delete=models.CASCADE)
    file = models.FileField(upload_to='submission')
    submitted_at = models.DateTimeField(auto_now_add=True)
    mark = models.IntegerField(null=True, blank=True)
    
    def __str__(self):
        return f"{self.user.username} - {self.assignment.title}"
    

class Transaction(models.Model):
    TRANSACTION_STATUS = (
        ('pending', 'Pending'),
        ('completed', 'Completed'),
        ('failed', 'Failed'),
    )

    PAYMENT_METHOD = (
        ('esewa', 'Esewa'),
        ('stripe', 'Stripe'),
    )

    user = models.ForeignKey(User, on_delete=models.CASCADE)
    course = models.ForeignKey(Courses, on_delete=models.CASCADE)
    transaction_id = models.CharField(max_length=100, unique=True)
    amount = models.FloatField()
    payment_method = models.CharField(max_length=10, choices=PAYMENT_METHOD)
    payment_status = models.CharField(max_length=10, choices=TRANSACTION_STATUS, default='pending')
    phone_no = models.CharField(max_length=20, validators=[MinLengthValidator(10), MaxLengthValidator(15)])
    address = models.CharField(max_length=200)
    transaction_date = models.DateTimeField(auto_now_add=True)
    payment_details = models.TextField(null=True, blank=True)

    def __str__(self):
        return f"Transaction {self.transaction_id} - {self.user.username}"

    
class Contact(models.Model):
    name = models.CharField(max_length=100)
    email = models.EmailField()
    message = models.TextField()

    def __str__(self):
        return f"Message from {self.name} ({self.email})"

