# Generated by Django 3.0.5 on 2023-03-14 15:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('donor', '0002_auto_20230314_1201'),
    ]

    operations = [
        migrations.AddField(
            model_name='blooddonate',
            name='mobile',
            field=models.CharField(max_length=20, null=True),
        ),
    ]