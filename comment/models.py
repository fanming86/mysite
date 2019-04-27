from django.db import models
from django.forms import ModelForm
from myApp1.models import Post
import django.utils.timezone as timezone

from mptt.models import MPTTModel, TreeForeignKey

from django.forms import TextInput, Textarea

# Create your models here.

class com(MPTTModel):
    article_id = models.IntegerField(default='0')  # 此id应该关联到文章的id，留言板的此id为0
    name = models.CharField(max_length=20)
    email = models.EmailField()
    content = models.TextField()
    ttt = models.CharField(max_length=10, null=True, blank=True)
    parent = TreeForeignKey('self', on_delete=models.CASCADE, null=True, blank=True, related_name='children')
    createDate = models.DateTimeField(default=timezone.now, blank=True)

    # def __str__(self):  #  在Python3中用 __str__
    #     return self.article_id  # title为表中的一个字段，将此字段设置为该条数据的名字

    class Meta:
        verbose_name_plural = '评论'

    class MPTTMeta:
        order_insertion_by = ['-createDate']


class comForm(ModelForm):
    class Meta:
        model = com  # com为要定义成表单的模型的类名
        fields = ['name', 'email', 'content', 'ttt', 'id', 'parent', 'article_id']  # 上述模型中的字段组成的列表
        widgets = {'name': TextInput(attrs={'placeholder': '输入一个昵称'}),
                   'email': TextInput(attrs={'placeholder': '给我一个可以联系你的邮箱'}),
                   'content': Textarea(attrs={'placeholder': '跟我说的点什么？？？'}),
                   }
