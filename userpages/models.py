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

class Notice(models.Model):
    title= models.CharField(max_length=500)
    content= models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    author=models.CharField(max_length=200)

    def __str__(self):
<<<<<<< HEAD
        return self.title
    
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
    file = models.FileField(upload_to='static/submission')
    submitted_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.user.username} - {self.assignment.title}"
    




=======
        return self.title
>>>>>>> f0ef7fb847c6cef30771f2fdf3fbeedeb3dc5477
