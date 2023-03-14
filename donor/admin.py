from django.contrib import admin

from donor.models import Donor


# Register your models here.
class DonorAdmin(admin.ModelAdmin):
    list_display = ['user', 'bloodgroup','address', 'mobile']


admin.site.register(Donor, DonorAdmin)
