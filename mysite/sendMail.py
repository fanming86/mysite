# coding:utf-8
# 2018.12.07
# sendMail.py

from django.core.mail import send_mail
from django.conf import settings

from django.core.mail import EmailMessage
from django.template.loader import render_to_string



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


def res_mail(comment, name, article_title, res_content):
    subject = 'FanMing个人博客的信息~~~'
    to_user = comment.email
    # print('###',to_user)

    if comment.article_id == 0:
        url_addr = 'http://ifanm.com/messageB'
        title = article_title
    else:
        url_addr = 'http://ifanm.com/post/%d' % comment.article_id
        title = '文章《%s》上发表的评论' % article_title

    ctx = {'to_user': comment.name,
           'post': title,
           'mesg': comment.content,
           'name1': name,
           'mesg1': res_content,
           'url_addr': url_addr}

    message = render_to_string('mail_template.html', ctx)
    msg = EmailMessage(subject, message, to=[to_user], from_email=settings.EMAIL_FROM)
    msg.content_subtype = 'html'
    msg.send()
