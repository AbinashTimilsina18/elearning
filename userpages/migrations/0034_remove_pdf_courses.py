# Generated by Django 5.1.6 on 2025-03-20 02:42

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('userpages', '0033_staff'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='pdf',
            name='courses',
        ),
    ]
