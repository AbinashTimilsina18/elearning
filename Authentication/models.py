from django.db import models
from django.contrib.auth.models import User

class UserProfile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    profile_picture = models.FileField(upload_to='static/profile_pictures/', null=True, blank=True)

    def __str__(self):
        return self.user.username
