from django import forms

class UserLogin(forms.Form):
    email = forms.EmailField(max_length=200)
    username = forms.CharField(max_length=100)
    password = forms.CharField(max_length=50,widget=forms.PasswordInput)
