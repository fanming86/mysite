from django.shortcuts import render
from django.template.loader import render_to_string
from django.http import JsonResponse
from .models import comForm
from .models import com
import time
from myApp1.models import Post
from django.core import serializers

from mysite import sendMail
# Create your views here.


def submit_comment(request):
    from1 = comForm(data=request.POST)
    if from1.is_valid():
        article_id = from1.cleaned_data['article_id']
        name = from1.cleaned_data['name']
        email = from1.cleaned_data['email']
        parent = from1.cleaned_data['parent']
        content = from1.cleaned_data['content']
        from1.save()
        msg = 'success!'
        # 邮件通知18.12.07
        # 第一部分为通知管理员，有了新的留言
        # 根据文章id找到文章标题

        # 先判断此评论是第一次评论，还是回复别人的评论。再确定该评论是属于文章的还是留言的
        if article_id != 0:  # #如果article_id 为0 则该条评论是留言，若不为0 则是文章，返回文章的标题
            title = Post.objects.get(pk=article_id).title
            # print('$$$$$$$$',title)
        else:
            title = '留言'

        if parent:
            # 则为回复
            comment = com.objects.get(id=parent.id)  # 根据回复的留言的id来获取父级信息
            sendMail.res_mail(comment, name, title, content)
            print('回复')
        else:
            print('第一次评论')

        sendMail.sendMail(name, email, title, content)

        return JsonResponse({'msg': msg})
    else:
        # print('error')
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
    # 将内容转成字典
    context1 = {'data': data, 'htmlModel': htmlM, 'article_id': i}
    return JsonResponse(context1, safe=False)
    # return JsonResponse(context)
