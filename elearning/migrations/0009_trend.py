# Generated by Django 5.1.6 on 2025-03-19 07:07

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('elearning', '0008_courses_trending'),
    ]

    operations = [
        migrations.CreateModel(
            name='Trend',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image', models.FileField(null=True, upload_to='static/uploads')),
                ('description', models.TextField(max_length=200)),
                ('price', models.IntegerField()),
                ('picture', models.FileField(null=True, upload_to='static/uploads')),
                ('name', models.CharField(max_length=200)),
            ],
        ),
    ]
