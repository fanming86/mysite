from django import template
from django.db.models.aggregates import Count
from myApp1.models import Tag, Post, Category, photos, oneDay

import requests
import json
import time
import datetime

from . import bingPhoto
register = template.Library()


# 最新发布
@register.simple_tag
def new_article():
    articles_new = Post.objects.all().order_by('-created_time')[:10]  # 改为根据时间排序
    return articles_new

#归档
@register.simple_tag
def get_archive():
    # datetimes() 方法返回一个 python 的 datetimes 对象列表
    # 对应着每篇文章的发表时间
    # month 表示精确到月份
    datas = Post.objects.datetimes('created_time', 'month', order='DESC')
    #print(datas)
    return datas

#标签
@register.simple_tag
def get_tags():
    return Tag.objects.annotate(num_posts=Count('post')).filter(num_posts__gt=0)

#分类
@register.simple_tag
def get_category():
    return Category.objects.annotate(num_posts=Count('post')).filter(num_posts__gt=0)

#每日一句
@register.simple_tag
def one_day():
    headers = {'User-Agent':'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','Referer':'http://www.iciba.com/'}
    url = 'http://sentence.iciba.com/index.php?callback=jQuery19003480623426505034_%s&c=dailysentence&m=getTodaySentence&_=1525013686688' % int(time.time() * 1000)

    result = oneDay.objects.filter(title__gte=datetime.datetime.now().date()).first()
    if not result:
        try:
            res = requests.get(url, headers=headers)
            aaa = res.text[41:-1]
            rrrr = json.loads(aaa)
            # print(rrrr)
            oneDay.objects.create(title=rrrr['title'], content=rrrr['content'], note=rrrr['note'])
            result = rrrr
        except Exception as e:
            return None

    return result


# 首页轮播图
@register.simple_tag
def photop():
    aNew = photos.objects.filter(date__gte=datetime.datetime.now().date()).first()

    if not aNew:
        res = bingPhoto.main()

        with open('media/upload/bing/' + str(time.strftime('%Y%m%d')) + '.png', 'wb+') as f:
            f.write(res['img'])
        photos.objects.create(name=res['name'],
                              disc=res['content'],
                              picture='upload/bing/' + str(time.strftime('%Y%m%d')) + '.png',
                              url=res['url'])
        print('保存成功')

    a3 = photos.objects.order_by('-date')[1:4]
    aNew = photos.objects.filter(date__gte=datetime.datetime.now().date()).first()

    return {'aNew': aNew, 'a3': a3}
