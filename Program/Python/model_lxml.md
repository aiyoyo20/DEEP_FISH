# 基本使用
## 1、读取文本解析节点
```
from lxml import etree

text='''
<div>
    <ul>
         <li class="item-0"><a href="link1.html">第一个</a></li>
         <li class="item-1"><a href="link2.html">second item</a></li>
         <li class="item-0"><a href="link5.html">a属性</a>
     </ul>
 </div>
'''
html=etree.HTML(text)  # 初始化生成一个XPath解析对象
result=etree.tostring(html,encoding='utf-8')   # 解析对象输出代码
data = html.xpath('//li[@class="item-0"]')  # 根据xpaath查找节点
print(data)
print(etree.tostring(data[0]))  # 将找到的对象转为字符串
```

## 2、解析
### 使用
```
from lxml import etree

text='''
<div>
    <ul>
         <li class="item-0"><a href="link1.html">第一个</a></li>
         <li class="item-1"><a href="link2.html">second item</a></li>
         <li class="item-0"><a href="link5.html">a属性</a>
     </ul>
 </div>
'''
html=etree.HTML(text)  # 初始化生成一个XPath解析对象
data = html.xpath('//li[@class="item-0"]')  # 根据xpaath查找节点，熟练使用xpath，可提取，子节点、子孙节点、兄弟节点、父节点等
print(data)

```


### 属性多值匹配
如果某个属性的值有多个时，我们可以使用contains()函数来获取

```
from lxml import etree

text1='''
<div>
    <ul>
         <li class="aaa item-0"><a href="link1.html">第一个</a></li>
         <li class="bbb item-1"><a href="link2.html">second item</a></li>
     </ul>
 </div>
'''

html=etree.HTML(text1,etree.HTMLParser())
result=html.xpath('//li[@class="aaa"]/a/text()')
result1=html.xpath('//li[contains(@class,"aaa")]/a/text()')

print(result)
print(result1)

通过第一种方法没有取到值，通过contains（）就能精确匹配到节点了
```

## 多属性匹配
另外我们还可能遇到一种情况，那就是根据多个属性确定一个节点，这时就需要同时匹配多个属性，此时可用运用and运算符来连接使用：

```
from lxml import etree

text1='''
<div>
    <ul>
         <li class="aaa" name="item"><a href="link1.html">第一个</a></li>
         <li class="aaa" name="fore"><a href="link2.html">second item</a></li>
     </ul>
 </div>
'''

html=etree.HTML(text1,etree.HTMLParser())
result=html.xpath('//li[@class="aaa" and @name="fore"]/a/text()')
result1=html.xpath('//li[contains(@class,"aaa") and @name="fore"]/a/text()')


print(result)
print(result1)
```