from django.db import models
from django.contrib.auth.models import User

# Create your models here.

class Category(models.Model):
    image = models.FileField(upload_to='static/uploads')
    name = models.CharField(max_length=200, blank=False, null=False)
    description = models.TextField(max_length=2000, blank=False, null=False)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name
    
class Vid(models.Model):
    title = models.CharField(max_length=500)
    pdf = models.FileField(upload_to='static/pdffile')
    video = models.FileField(upload_to='static/video')

    def __str__(self):
        return self.title
    

    