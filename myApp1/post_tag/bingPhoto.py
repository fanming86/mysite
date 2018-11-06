# @Author: Fan Xujing
# @Date:   2018-10-13 13:38:09
# @Email:   961118830@qq.com
# @Last Modified time: 2018-10-13 21:00:07

from lxml import etree

import os
import requests


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

    dict1 = {}
    NewUrl = url + result[0]
    dict1['url'] = NewUrl
    rescon = requests.get(NewUrl, headers=headers)
    # img = requests.get(imgs[0], headers=headers)

    # print(img)
    # dict1['img']=img.content    #图片，缩略图
    con = etree.HTML(rescon.text)
    cons = con.xpath(r'//div[@class="description"]/p/text()')  # 此图片的描述
    imgBig = con.xpath(r'//div[@class="progressive"]/img/@src')
    print(imgBig)
    image = requests.get(imgBig[0], headers=headers)  # 获取图片，640x360
    dict1['img'] = image.content
    dict1['name'] = cons[0]
    dict1['content'] = cons[1]

    # print(dict1)
    return dict1


if __name__ == '__main__':
    main()
