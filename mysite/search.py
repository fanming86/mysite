#coding:utf-8

#search.py

from django.http import HttpResponse
from django.shortcuts import render_to_response


#表单
def search(request):
	request.encoding='utf-8'
	if 'q' in request.GET:
		message = u'内容：' + request.GET['q']
	else:
		message = 'None'
	return HttpResponse(message)

def search_form(request):
	return render_to_response('search_form.html')