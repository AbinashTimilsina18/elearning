# Generated by Django 5.1.6 on 2025-03-12 02:20

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('userpages', '0022_remove_submission_student'),
    ]

    operations = [
        migrations.DeleteModel(
            name='Submission',
        ),
    ]
