from django.shortcuts import render
from django.template.loader import render_to_string
from django.http import JsonResponse, HttpResponse
from .models import comForm
from .models import com
import time
from myApp1.models import Post
from django.core import serializers

from mysite import sendMail
# Create your views here.


def submit_comment(request):
    from1 = comForm(data=request.POST)
    up_load = com()
    if from1.is_valid():
        article_id = from1.cleaned_data['article_id']
        up_load.article_id = article_id
        name = from1.cleaned_data['name']
        up_load.name = name
        email = from1.cleaned_data['email']
        up_load.email = email
        parent = from1.cleaned_data['parent']
        up_load.parent = parent
        content = from1.cleaned_data['content']
        up_load.content = content
        up_load.save()
        msg = 'success!'
        # 邮件通知18.12.07
        # 第一部分为通知管理员，有了新的留言
        # 根据文章id找到文章标题
        if article_id == 0:
            title = '留言'
        else:
            title = Post.objects.get(pk=article_id).title
        print(title)
        sendMail.sendMail(name, email, title, content)
        # 第二部分，如果留言有了回复，通知被回复的用户
        # 判断此评论是否是回复
        if parent:
            print('####### ', parent.id)
            comment = com.objects.get(id=parent.id)
            title = Post.objects.get(pk=comment.article_id).title
            sendMail.res_mail(comment, title, content)

        return JsonResponse({'msg': msg})
    else:
        print('error')
        return JsonResponse({'msg': 'error'})



def get_comment(request, i):
    context = {'date': time.ctime()}
    # 根据返回的文章id号查询此篇文章的评论
    mmm = com.objects.filter(article_id=i)
    # print(mmm)
    # 将查询的结果序列化成json
    data = serializers.serialize("json", mmm)

    # 使用模板来渲染评论列表
    htmlM = render_to_string('modelss.html', {'mmm': mmm})
    # print(htmlM)

    # 将内容转成字典
    context1 = {'data': data, 'htmlModel': htmlM, 'article_id': i}

    return JsonResponse(context1, safe=False)
    # return JsonResponse(context)
