from django.shortcuts import render
from django.template.loader import render_to_string
from django.http import JsonResponse, HttpResponse
from .models import comForm
from .models import com
import time
import json
from django.core import serializers


# Create your views here.


def submit_comment(request):
    from1 = comForm(data=request.POST)
    up_load = com()
    if from1.is_valid():
        up_load.article_id = from1.cleaned_data['article_id']
        up_load.name = from1.cleaned_data['name']
        up_load.email = from1.cleaned_data['email']
        up_load.parent = from1.cleaned_data['parent']
        up_load.content = from1.cleaned_data['content']
        up_load.save()
        print(from1.cleaned_data['parent'])
        return JsonResponse({'msg': 'success!'})
    else:
        print('error')
        return JsonResponse({'msg': 'error'})

    # print(from1)


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
