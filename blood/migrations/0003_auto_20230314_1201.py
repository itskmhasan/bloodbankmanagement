# Generated by Django 3.0.5 on 2023-03-14 06:01

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blood', '0002_auto_20230314_1157'),
    ]

    operations = [
        migrations.AlterField(
            model_name='bloodrequest',
            name='bloodgroup',
            field=models.CharField(choices=[('A+', 'A+'), ('A-', 'A-'), ('B+', 'B+'), ('B-', 'B-'), ('AB+', 'AB+'), ('AB-', 'AB-'), ('O+', 'O+'), ('O-', 'O-')], max_length=10),
        ),
    ]
