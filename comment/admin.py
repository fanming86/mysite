from django.contrib import admin
from .models import com


# Register your models here.
class comAdmin(admin.ModelAdmin):
    list_display = ['name', 'email', 'content', 'article_id', 'parent', 'createDate']


admin.site.register(com, comAdmin)
