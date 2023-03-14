from django.contrib import admin

from blood.models import *


class StockAdmin(admin.ModelAdmin):
    list_display = ['bloodgroup', 'unit']


# Register your models here.
admin.site.register(Stock, StockAdmin)


class BloodRequestAdmin(admin.ModelAdmin):
    list_display = ['request_by_donor', 'reason', 'bloodgroup', 'unit', 'mobile']


# Register your models here.
admin.site.register(BloodRequest, BloodRequestAdmin)
