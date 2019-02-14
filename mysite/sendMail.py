#coding:utf-8
# 2018.12.07
#sendMail.py

from django.core.mail import send_mail
from django.conf import settings


def sendMail(name, mail, title, content):
    # 邮件主题
    subject = 'FanMing个人博客的信息~~~'
    # 邮件内容
    content = '''
    用户：{} 
    邮箱地址：{}
    对文章 {} 作出了评论：
        ---
        {} 
        ---
    '''.format(name, mail, title, content)
    # 收件人
    to_user = 'fanming04@qq.com'

    return send_mail(subject,  # 邮件主题
                     content,  # 邮件内容
                     settings.EMAIL_FROM,  # 发件人
                     [to_user],  # 收件人
                     fail_silently=False)


def res_mail(comment, title, res_content):
    subject = 'FanMing个人博客的信息~~~'
    to_user = comment.email
    content = '''
    您在 FanMing 的个人博客（https://www.ifanm.com） 中，
    对文章 {} 的评论
        ---
        {}
        ---
    有了新的回复内容：
        ---
        {}
        ---
        
    赶快去看看吧！！！  点击下方地址可快速跳转
    https://www.ifanm.com/post/{}
    
    '''.format(title, comment.content, res_content, comment.article_id)

    return send_mail(subject,  # 邮件主题
                     content,  # 邮件内容
                     settings.EMAIL_FROM,  # 发件人
                     [to_user],  # 收件人
                     fail_silently=False)
