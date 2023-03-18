from django.shortcuts import render, redirect
from . import models
from .models import Stock, BloodRequest


def home_view(request):
    dict = {
        'A1': Stock.objects.get(bloodgroup="A+"),
        'A2': Stock.objects.get(bloodgroup="A-"),
        'B1': Stock.objects.get(bloodgroup="B+"),
        'B2': Stock.objects.get(bloodgroup="B-"),
        'AB1': Stock.objects.get(bloodgroup="AB+"),
        'AB2': Stock.objects.get(bloodgroup="AB-"),
        'O1': Stock.objects.get(bloodgroup="O+"),
        'O2': Stock.objects.get(bloodgroup="O-"),
        'requests': BloodRequest.objects.all().filter(status='Pending'),
        # 'requests': BloodRequest.objects.raw('SELECT * FROM blood_bloodrequest WHERE STATUS = "Pending"'),
    }

    return render(request, 'blood/index.html', dict)


def is_donor(user):
    return user.groups.filter(name='DONOR').exists()


def afterlogin_view(request):
    if is_donor(request.user):
        return redirect('donor/donor-dashboard')
    else:
        return redirect('/admin-dashboard/')
