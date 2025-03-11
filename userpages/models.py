from django.db import models
from elearning.models import *

# Create your models here.

class Pdf(models.Model):
    category = models.ForeignKey(Category,on_delete=models.CASCADE,null=True)
    courses = models.ForeignKey(Courses,on_delete=models.CASCADE,null=True)
    title = models.CharField(max_length=400)
    pdf_file = models.FileField(upload_to='static/pdfvideo', null=True, blank=True)
    django_pdf = models.BooleanField(null=True,blank=False)

class Video(models.Model):
    category = models.ForeignKey(Category,on_delete=models.CASCADE,null=True)
    courses = models.ForeignKey(Courses,on_delete=models.CASCADE,null=True)
    title = models.CharField(max_length=400)
    video_file = models.FileField(upload_to='static/pdfvideo', null=True, blank=True)
    django_video = models.BooleanField(null=True,blank=True)

class Assignment(models.Model):
    title = models.CharField(max_length=200)
    description = models.TextField()
    due_date = models.DateTimeField()
    assigned_to = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.title

    class Meta:
        ordering = ['due_date']

