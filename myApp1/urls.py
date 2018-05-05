from django.conf.urls import url
from . import views as app1View

app_name = 'myApp1'
urlpatterns = [
	url(r'^$', app1View.index,name='index'),
	url(r'^post/(?P<pk>[0-9]+)/$', app1View.detail, name='detail'),
    url(r'^tag/(?P<pk>[0-9]+)/$', app1View.TagView, name='tag'),
    url(r'^categorys/(?P<pk>[0-9]+)/$', app1View.CategoryView, name='categorys'),
	url(r'^archives/(?P<year>[0-9]{4})/(?P<month>[0-9]{1,2})/$', app1View.ArchivesView, name='archives'),

]