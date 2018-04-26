#coding:utf-8


from django.http import HttpResponse

from myApp1.models import test


#数据库操作
#插入数据
def testdb(request):
	test1 = test(name = 'runoob')
	test1.save()
	return HttpResponse("<p>数据添加成功！</p>")

#查询数据

def getdb(request):
    # 初始化
    response = ""
    response1 = ""
    
    
    # 通过objects这个模型管理器的all()获得所有数据行，相当于SQL中的SELECT * FROM
    list = test.objects.all()
        
    # filter相当于SQL中的WHERE，可设置条件过滤结果
    response2 = test.objects.filter(id=1) 
    
    # 获取单个对象
    response3 = test.objects.get(id=1) 
    
    # 限制返回的数据 相当于 SQL 中的 OFFSET 0 LIMIT 2;
    test.objects.order_by('name')[0:2]
    
    #数据排序
    test.objects.order_by("id")
    
    # 上面的方法可以连锁使用
    test.objects.filter(name="runoob").order_by("id")
    
    # 输出所有数据
    for var in list:
        response1 += var.name + " "
    response = response1
    return HttpResponse("<p>" + response + "</p>")
