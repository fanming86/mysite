# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin

# Register your models here.


from .models import Post, Category, Tag, photos, oneDay


class PostAdmin(admin.ModelAdmin):
    list_display = ['title', 'created_time', 'modified_time', 'category', 'author', 'views']

admin.site.register(Post, PostAdmin)
admin.site.register(Category)
admin.site.register(Tag)


class photoAdmin(admin.ModelAdmin):
    list_display = ['date', 'name', 'url']


admin.site.register(photos, photoAdmin)

admin.site.register(oneDay)
