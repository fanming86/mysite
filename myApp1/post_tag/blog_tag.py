from django import template
from django.db.models.aggregates import Count
from ..models import Tag,Post,Category

import requests
import json
import time

register = template.Library()


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
    url = 'http://sentence.iciba.com/index.php?callback=jQuery19003480623426505034_%s&c=dailysentence&m=getTodaySentence&_=1525013686688' % int(time.time()*1000)
    res = requests.get(url,headers=headers)
    aaa = res.text[41:-1]
    rrrr = json.loads(aaa)
    return rrrr['note']