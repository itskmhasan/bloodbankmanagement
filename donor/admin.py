from django.contrib import admin

from donor.models import *


# Register your models here.
class DonorAdmin(admin.ModelAdmin):
    list_display = ['user', 'bloodgroup', 'address', 'mobile']


admin.site.register(Donor, DonorAdmin)


class BloodDonateAdmin(admin.ModelAdmin):
    list_display = ['donor', 'disease', 'age', 'bloodgroup', 'unit', 'status', 'date']


admin.site.register(BloodDonate, BloodDonateAdmin)
