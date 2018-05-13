# -*- coding: utf-8 -*-

import django.http
from django.shortcuts import render

def hello(request):
	context = {}
	context['hello'] = 'hello word !'
	return render(request, 'detail.html', context)