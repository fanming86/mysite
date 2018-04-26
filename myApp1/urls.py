from django.conf.urls import url,include
from django.contrib import admin
from . import views as app1View

app_name = 'myApp1'
urlpatterns = [
	url(r'^$', app1View.index,name='index'),
	url(r'^(?P<pk>[0-9]+)/$', app1View.detail, name='detail'),
 	]