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
from django.contrib import admin
from . import view
from myApp1 import views as app1View

app_name = 'myApp1'
urlpatterns = [
	url(r'^', include('myApp1.urls')),
	url(r'^admin/', admin.site.urls),	#添加后台管理页面
	url(r'^$', app1View.index,name='index'),
	url(r'^about$', app1View.about),
	url(r'^category$', app1View.category),
	url(r'^tags$', app1View.tag),
]