# Generated by Django 5.1.6 on 2025-03-19 07:22

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('elearning', '0009_trend'),
    ]

    operations = [
        migrations.AddField(
            model_name='trend',
            name='trend',
            field=models.BooleanField(default=False, null=True),
        ),
    ]
