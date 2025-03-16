from django import forms
from django.contrib.auth.models import User
from .models import *

class ProfileForm(forms.ModelForm):
    first_name = forms.CharField(max_length=30, required=False)
    last_name = forms.CharField(max_length=30, required=False)

    class Meta:
        model = User
        fields = ['username', 'email', 'first_name', 'last_name']


class PdfForm(forms.ModelForm):
    class Meta:
        model = Pdf
        fields = "__all__"

class VideoForm(forms.ModelForm):
    class Meta:
        model = Video
        fields = "__all__"

class NoticeForm(forms.ModelForm):
    class Meta:
        model = Notice
        fields ="__all__"


class AssignmentForm(forms.ModelForm):
    class Meta:
        model = Assignment
        fields = ['title', 'description', 'pdf_file', 'due_date', 'courses']
        widgets = {
            'due_date': forms.DateTimeInput(attrs={'type': 'datetime-local'}),
        }


class SubmissionForm(forms.ModelForm):
    class Meta:
        model = Submission
        fields = ['assignment', 'pdf_file']

    assignment = forms.ModelChoiceField(queryset=Assignment.objects.all())
    pdf_file = forms.FileField()

