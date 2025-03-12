from django.db import models
from django.contrib.auth.models import User

# Create your models here.

class Category(models.Model):
    name = models.CharField(max_length=200, blank=False, null=False)
    description = models.TextField(max_length=2000, blank=False, null=False)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name

class Courses(models.Model):
    category = models.ForeignKey(Category,on_delete=models.CASCADE,null=True)
    users = models.ManyToManyField(User, related_name='courses')
    image = models.FileField(upload_to='static/uploads', null=True)
    name = models.CharField(max_length=200, blank=False, null=False)
    description = models.TextField(max_length=2000, blank=False, null=False)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name
    

