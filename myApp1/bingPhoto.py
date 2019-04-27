# @Author: Fan Xujing
# @Date:   2018-10-13 13:38:09
# @Email:   961118830@qq.com
# @Last Modified time: 2018-10-13 21:00:07


from lxml import etree

import time, os
import requests

import mysite.urls  # 解决此文件不能单独运行

from django.conf import settings
from myApp1.models import photos


def main():
    headers = {}
    headers[
        "User-Agent"] = 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.167 Safari/537.36'
    headers["Content-Type"] = "application/json;charset=UTF-8"

    url = 'https://bing.ioliu.cn/'
    res = requests.get(url, headers=headers)
    res.encoding = ('utf8')
    # print(res.encoding)
    hht = etree.HTML(res.text)

    result = hht.xpath(r'//div[@class="card progressive"]/a/@href')
    imgs = hht.xpath(r'//div[@class="card progressive"]/img/@src')

    NewUrl = url + result[1]  # 查看大图地址，此地址无法下载图片
    print('newurl ::: %s ' % NewUrl)
    rescon = requests.get(NewUrl, headers=headers)
    # img = requests.get(imgs[0], headers=headers)
    # print(img)
    # dict1['img']=img.content    #图片，缩略图
    con = etree.HTML(rescon.text)
    cons = con.xpath(r'//div[@class="description"]/p/text()')  # 此图片的描述
    imgBig = con.xpath(r'//div[@class="progressive"]/img/@src')
    print(imgBig)  #图片地址

    image = requests.get(imgBig[0], headers=headers)  # 获取图片，640x360

    photoDir = os.path.join(settings.MEDIA_ROOT, 'upload/bing/') + str(time.strftime('%Y%m%d')) + '.png'

    with open(photoDir, 'wb+') as f:
        f.write(image.content)

    photos.objects.create(name=cons[0],
                          disc='xxx',
                          picture='upload/bing/' + str(time.strftime('%Y%m%d')) + '.png',
                          url=NewUrl)
    print('保存成功')


if __name__ == '__main__':
    main()
