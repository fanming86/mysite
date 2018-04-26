# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin

# Register your models here.

from myApp1.models import Article



from .models import Post, Category, Tag


class PostAdmin(admin.ModelAdmin):
    list_display = ['title', 'created_time', 'modified_time', 'category', 'author']

admin.site.register(Article)
admin.site.register(Post, PostAdmin)
admin.site.register(Category)
admin.site.register(Tag)
