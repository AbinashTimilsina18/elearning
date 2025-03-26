# Generated by Django 5.1.6 on 2025-03-24 14:06

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('userpages', '0059_alter_transaction_payment_method'),
    ]

    operations = [
        migrations.AlterField(
            model_name='transaction',
            name='payment_method',
            field=models.CharField(choices=[('esewa', 'Esewa'), ('stripe', 'Stripe')], max_length=10),
        ),
    ]
