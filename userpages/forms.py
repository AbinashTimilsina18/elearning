from django import forms
from django.contrib.auth.models import User
from .models import *

class ProfileForm(forms.ModelForm):
    first_name = forms.CharField(max_length=30, required=False)
    last_name = forms.CharField(max_length=30, required=False)

    class Meta:
        model = User
        fields = ['username', 'email', 'first_name', 'last_name']


# class PdfVideoForm(forms.ModelForm):
#     class Meta:
#         model = Video
#         fields = "__all__"

