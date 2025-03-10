from django.forms import ModelForm
from .models import *

class CategoryForm(ModelForm):
    class Meta:
        model = Category
        fields = "__all__"

class CoursesForm(ModelForm):
    class Meta:
        model = Courses
        fields = "__all__"

