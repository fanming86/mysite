from django.urls import path
from comment import views

app_name = 'easy_comment'
urlpatterns = [

    path('submit_comment', views.submit_comment, name='submit_comment'),
    path('get_comment/<int:i>', views.get_comment, name='get_comment'),

]
