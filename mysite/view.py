# -*- coding: utf-8 -*-

from django.http import HttpResponse
from django.shortcuts import render

def hello(request):
	context = {}
	context['hello'] = 'hello word !'
	return render(request, 'detail.html', context)