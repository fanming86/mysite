#coding:utf-8

#sendMail.py

from django.core.mail import send_mail
from django.http import HttpResponse
from django.shortcuts import render

from . import settings
from app.forms import mail


def send(msg,to_user):	
	send_mail('django测试邮件',		#邮件标题
		msg,		#邮件内容
		settings.DEFAULT_FROM_EMAIL,		#发件人
	    [to_user], 		#收件人
	    fail_silently=False)		#失败静默(若发送失败，报错提示我们)
	
	return HttpResponse('ok')

def sendMail(request):
    if request.method == 'POST':# 当提交表单时
     
        form = mail(request.POST) # form 包含提交的数据
         
        if form.is_valid():# 如果提交的数据合法
            name = form.cleaned_data['name']
            email = form.cleaned_data['email']	#发送到此邮件地址
            msg = form.cleaned_data['msg']		#将输入的内容作为邮件内容发送

            if send(msg,email):
            	return HttpResponse('Send success！！！')
            else:
            	return HttpResponse('Send failed, check mailbox address for yes or no input error！！！')
     
    else:# 当正常访问时
        form = mail()
    return render(request, 'index.html', {'form': form})