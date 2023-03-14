from django.shortcuts import render, redirect
from . import models
from .models import Stock, BloodRequest


def home_view(request):
    x = models.Stock.objects.all()
    print(x)
    if len(x) == 0:
        blood1 = models.Stock()
        blood1.bloodgroup = "A+"
        blood1.save()

        blood2 = models.Stock()
        blood2.bloodgroup = "A-"
        blood2.save()

        blood3 = models.Stock()
        blood3.bloodgroup = "B+"
        blood3.save()

        blood4 = models.Stock()
        blood4.bloodgroup = "B-"
        blood4.save()

        blood5 = models.Stock()
        blood5.bloodgroup = "AB+"
        blood5.save()

        blood6 = models.Stock()
        blood6.bloodgroup = "AB-"
        blood6.save()

        blood7 = models.Stock()
        blood7.bloodgroup = "O+"
        blood7.save()

        blood8 = models.Stock()
        blood8.bloodgroup = "O-"
        blood8.save()
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
    }

    return render(request, 'blood/index.html', dict)


def is_donor(user):
    return user.groups.filter(name='DONOR').exists()


def afterlogin_view(request):
    if is_donor(request.user):
        return redirect('donor/donor-dashboard')
    else:
        return redirect('/admin-dashboard/')
