#coding:utf-8

"""mysite URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url,include
from django.urls import path
from django.contrib import admin
from myApp1 import views as app1View

from django.conf.urls.static import static
from django.conf import settings

app_name = 'myApp1'
urlpatterns = [
	url(r'^', include('myApp1.urls')),
	url(r'^comments/', include('django_comments.urls')),	#添加评论系统
	url(r'^admin/', admin.site.urls),	#添加后台管理页面
	url(r'^$', app1View.index,name='index'),
	path('about', app1View.about),
	path('category', app1View.category),
	path('tags', app1View.tag),
                  path('messageB', app1View.messageB),
                  path('', include('comment.urls')),  # 评论
                  path('timeLine', app1View.timeLine, name='timeLine'),

				  path('weixin', include('weixin.urls')),  # 微信公众号

              ] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
