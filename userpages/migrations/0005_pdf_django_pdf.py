# Generated by Django 5.1.6 on 2025-03-07 06:52

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('userpages', '0004_video'),
    ]

    operations = [
        migrations.AddField(
            model_name='pdf',
            name='django_pdf',
            field=models.BooleanField(null=True),
        ),
    ]
