# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render,get_object_or_404,HttpResponse

# Create your views here.

from .models import Article,Post,Category,Tag
import markdown


def __int__(request):
    request.session['username'] = 'zhangsan'



def index(request):
    articles = Post.objects.all().order_by('-id')
    Tags = Tag.objects.all()
    # return HttpResponse(articles)

    return render(request,'index.html',context={
        'article':articles,
        'tag':Tags
    })


#关于我·
def about(request):
    request.session['username'] = 'zhangsan'
    return render(request,'about.html')


#文章分类
def category(request):
    categorys = Category.objects.all()

    return render(request,'category.html',context={"categorys":categorys})


def tag(request):
    tags = Tag.objects.all()

    return render(request,'tags.html',context={'tags':tags})


###########使用markdown
def detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    post.body = markdown.markdown(post.body,
                                  extensions=[
                                      'markdown.extensions.extra',
                                      'markdown.extensions.codehilite',
                                      'markdown.extensions.toc',
                                  ])
    return render(request, 'detail.html', context={'post': post})