from django.conf.urls import url
from weixin import views

app_name = 'wechat'
urlpatterns = [
    # url(r'^$', views.index,name='index'),
    url(r'^$', views.weixin_main, name='weixin_main'),
]
