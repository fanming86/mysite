from __future__ import unicode_literals

from django.shortcuts import render, get_object_or_404
from django.db.models.aggregates import Count
from django.http import JsonResponse

from django.core import serializers

# Create your views here.

from .models import Post, Category, Tag, photos
import markdown
import datetime

from django.core.paginator import Paginator


# 首页内容展示的文章
def index(request):
    articles = Post.objects.all().order_by('-created_time')  #改为根据时间排序
    paginator = Paginator(articles, 6)  # 每页显示六条
    page = request.GET.get('page')
    contacts = paginator.get_page(page)  # 分页器

    a3 = photos.objects.order_by('-date')[1:4]

    return render(request, 'index.html', context={'article': contacts, 'title': '全部文章', 'a3': a3})


# 关于我·
def about(request):
    request.session['username'] = 'zhangsan'
    return render(request, 'about.html')


# 文章分类
def category(request):
    cate = Post.objects.order_by('category')
    return render(request, 'category.html', context={'article': cate})


def CategoryView(request, pk):
    cate = get_object_or_404(Category, pk=pk)
    post_list = Post.objects.filter(category=cate)
    return render(request, 'category.html', context={'article': post_list, 'title': '文章分类'})


# 归档
def ArchivesView(request, year, month):
    articles = Post.objects.filter(created_time__year=year, created_time__month=month)
    return render(request, 'index.html', context={'article': articles, 'title': '归档'})


# 留言板
def messageB(request):
    p = {'pk': 0}  # 留言板的article_id 为0
    return render(request, 'messageBoard.html', {'post': p})


# 标签
def tag(request):
    # tags = Tag.objects.all()
    tags = Tag.objects.annotate(num_posts=Count('post')).filter(num_posts__gt=0)
    tags_num = Tag.objects.annotate(num_posts=Count('post')).filter(num_posts__gt=0).count()

    return render(request, 'tags.html', context={'article': tags, 'num': tags_num})


# 时间轴
def timeLine(request):
    tagss = Post.objects.all().order_by('-created_time')
    return render(request, 'timeLine.html', context={'arch': tagss})



def TagView(request, pk):
    ttt = get_object_or_404(Tag, pk=pk)
    TagList = Post.objects.filter(tags=ttt)
    data = serializers.serialize("json", TagList)
    context1 = {'data': data}
    # return render(request, 'index.html', context={'article': TagList, 'title': ttt})
    return JsonResponse(context1, safe=False)


# 使用markdown
def detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    # 阅读量 +1
    post.increase_views()
    post.body = markdown.markdown(post.body, extensions=['markdown.extensions.extra',
                                              'markdown.extensions.codehilite',
                                              'markdown.extensions.toc',
                                                         ], safe_mode=True, enable_attributes=False)
    # print(post.body)
    return render(request, 'detail.html', context={'post': post})
