from django.db import models

# Create your models here.

class Category(models.Model):
    image = models.FileField(upload_to='static/uploads')
    name = models.CharField(max_length=200, blank=False, null=False)
    description = models.TextField(max_length=2000, blank=False, null=False)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name
    