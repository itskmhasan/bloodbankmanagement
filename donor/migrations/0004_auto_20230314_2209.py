# Generated by Django 3.0.5 on 2023-03-14 16:09

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('donor', '0003_blooddonate_mobile'),
    ]

    operations = [
        migrations.AlterField(
            model_name='blooddonate',
            name='status',
            field=models.CharField(choices=[('Pending', 'Pending'), ('Approved', 'Approved'), ('Rejected', 'Rejected')], default='Pending', max_length=20),
        ),
    ]
