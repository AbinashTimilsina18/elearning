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
