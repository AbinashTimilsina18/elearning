# Generated by Django 5.1.6 on 2025-03-07 12:20

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('userpages', '0009_pdf_created_at'),
    ]

    operations = [
        migrations.AlterField(
            model_name='pdf',
            name='created_at',
            field=models.DateTimeField(auto_now_add=True),
        ),
    ]
