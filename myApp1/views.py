# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render,get_object_or_404,HttpResponse
from django.db.models.aggregates import Count

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
        'title':'最新文章',
    })


#关于我·
def about(request):
    request.session['username'] = 'zhangsan'
    return render(request,'index.html',context={'title':'关于我'})


#文章分类
def category(request):
    cate = Category.objects.all()
    return render(request,'category.html',context={'categorys': cate})
def CategoryView(request,pk):
    cate = get_object_or_404(Category, pk=pk)
    post_list = Post.objects.filter(category=cate)
    return render(request, 'index.html', context={'article': post_list,'title':'文章分类'})

#归档
def ArchivesView(request, year, month):
    articles = Post.objects.filter(created_time__year=year,
                                    created_time__month=month
                                    )
    return render(request, 'index.html', context={'article': articles,'title':'归档'})

#标签
def tag(request):
    # tags = Tag.objects.all()
    tags = Tag.objects.annotate(num_posts=Count('post')).filter(num_posts__gt=0)
    tags_num = Tag.objects.annotate(num_posts=Count('post')).filter(num_posts__gt=0).count()
    # return HttpResponse(tags_num)
    return render(request,'tags.html',context={'article':tags,'num':tags_num})
def TagView(request,pk):
    ttt = get_object_or_404(Tag, pk=pk)
    TagList = Post.objects.filter(tags=ttt)
    return render(request,'index.html',context={'article':TagList,'title':'标签'})

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