from django.db import models
from donor import models as dmodels


class Stock(models.Model):
    bloodgroup = models.CharField(max_length=10)
    unit = models.PositiveIntegerField(default=0)

    def __str__(self):
        return self.bloodgroup


class BloodRequest(models.Model):
    STATUS = [
        ('Pending', 'Pending'),
        ('Approved', 'Approved'),
        ('Rejected', 'Rejected')
    ]
    BLOOD_GROUP = [
        ('A+', 'A+'),
        ('A-', 'A-'),
        ('B+', 'B+'),
        ('B-', 'B-'),
        ('AB+', 'AB+'),
        ('AB-', 'AB-'),
        ('O+', 'O+'),
        ('O-', 'O-'),
    ]

    request_by_donor = models.ForeignKey(dmodels.Donor, null=True, on_delete=models.CASCADE)
    patient_name = models.CharField(max_length=30)
    patient_age = models.PositiveIntegerField()
    reason = models.CharField(max_length=500)
    bloodgroup = models.CharField(max_length=10, choices=BLOOD_GROUP)
    unit = models.PositiveIntegerField(default=0)
    status = models.CharField(max_length=20, choices=STATUS, default="Pending")
    mobile = models.CharField(max_length=20, null=True)
    date = models.DateField(auto_now=True)

    def __str__(self):
        return self.bloodgroup
