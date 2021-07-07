## 1、python的write()写入缓慢，
在尝试爬取一个网站的电子书时，写入保存的时候使用write()进展很缓慢，每个文件的大小再几十K到几百K之间，958页×25篇=23950个文件

不同于网上的问题，网上的为频繁的打开一个文件，每次都写入一些字段，发现其耗费的时间很多，在写入之间先使用其他方法，比如join后再写入速度会快很多，但是我想要的是去提高本身的写入速度

去查阅了一些资料，这与程序本身关系不大，主要取决于硬件(0^0),就很难受，写入份两步，cup对数据进行处理，这步很快，但是在写入磁盘的时候，这一步是不受程序影响的，所以会很慢，能够比较好的方法是

## 2、数据写入mysql后查看发现顺序不同于之前的
数据库里面的记录在存储时的先后次序是我们无法控制的，系统为了提高效率，可能用各种方法存储，甚至把数据的不同部分分配在不同的磁盘位置上。所以，编程者始终要记住我们无法控制存储的位置和次序，我们只有使用必要的数据记录有关重要信息。

所以哪怕使用循环去依次插入每一个数据也是无用的，因为每次插入的数据的位置都是不确定的，想要确定顺序，在写入时候插入一个自增量的数值，查询的时候以此排序就知道其顺序的先后了。

## 3、爬取网站时候的乱码问题
今天在爬取一个电子书时候，因为以前基本都是 BeautifulSoup + lxml 解析，基本都能很完美的解析出中文内容，今天一直出错，在 BeautifluSoup 解析后无论是用 encode方法指定编码还是使用 html.unescape() 都还是有乱码，要么是像 html 的实体字符，但又不完全是，要不就是纯粹的乱码，长得像带声调的拼音一样

想起以前也有这样的困扰，是请求头里面 Accept-Encoding 使用不当会造成乱码。但是那种乱码是有很大区别的(各种方框等图形那种)

最后去先给获取到的响应指定编码就可以了
```
r = requests.get(url)
#在输出结果前先设置内容编码
r.encoding = "utf-8"
```

同时了解到一个用法 `r.encoding = r.apparent_encoding`，它的作用是把修改响应头的编码为 requests 分析后认为可能性最大的编码，没有头绪可以试试
估计时开始时自己没有去先配置编码，导致 BeautifulSoup 自动解析时误判了编码，所以在走歪的路上越走越远

## 4、requests的请求超时和读取超时
在爬取一个网站的图片时候，总是会卡住但是不报错，最后很长时间之后才提示`requests.exceptions.ConnectionError: ('Connection aborted.', RemoteDisconnected('Remote end closed connection without response` 认为是不是自己 headers 头的参数没配置好导致被检测了，去认真分析了一遍发现没有问题，而且图片在浏览器是能够完全正常打开的，重复执行了好几次，每次卡住的地方都不太一样

去查阅了一些资料，并且了解到 ‘请求网页超时’ 有两个

读取超时指的就是客户端等待服务器发送请求的时间。（特定地，它指的是客户端要等待服务器发送字节之间的时间。在 99.9% 的情况下这指的是服务器发送第一个字节之前的时间）。

连接超时指的是在你的客户端实现到远端机器端口的连接时

简单的说，连接超时就是发起请求连接到连接建立之间的最大时长，读取超时就是连接成功开始到服务器返回响应之间等待的最大时长。

去设置了排错，发现真正的原因真的是读取超时
```
try:
    image_response = requests.get(image_url, headers=headers,timeout=(5, 10))
    print('success')
    image_name = '/home/fiki/Documents/PycharmProjects/Web/005_sds_comic/' + comic_name + '/' + str(
        num) + '.jpg'
    with open(image_name, 'wb') as image_file:
        image_file.write(image_response.content)
        print('第 {} 页 {} {} Write successfully！'.format(page, comic_name, num))
    num = num + 1
except requests.exceptions.RequestException as e:
    print(e)
```
正常情况下只会传入一个timeout参数

## 5、不要把数据存储到pycharm的项目文件夹里面，打开的时候预加载会消耗大量时间
## 6、selenium自动化测试时chrome浏览器为什么会自动关闭？
>书山有路勤为径，学海无涯苦作舟！
>
>代码运行结果：
>
>代码1：chrome浏览器不会自动关闭
from selenium import webdriver
dr = webdriver.Chrome()
dr.get('https://www.baidu.com/')
>
>代码2：chrome浏览器会自动关闭
>
>from selenium import webdriver
def run():
dr = webdriver.Chrome()
dr.get('https://www.baidu.com/')
if __name__ == '__main__':
run()
>
>代码3：chrome浏览器不会自动关闭
>
>from selenium import webdriver
def run():
global dr
dr = webdriver.Chrome()
dr.get('https://www.baidu.com/')
if __name__ == '__main__':
run()
>
>以上三种代码统一换成Firefox浏览器的话，均不会自动关闭浏览器。
>
>分析原因：代码2运行完之所以会关闭chrome浏览器，是因为对应chrome浏览器厂家提供的浏览器源生驱动文件（chromedriver.exe）自身逻辑设置引起的，方法运行完会自动关闭回收方法中定义的局部变量dr。如果不想让自动关闭方法中的局部变量对象dr，可以像代码3那样在变量名称前加个global声明下这是全局变量dr，或者把dr的定义像代码1那样定义到方法体的外面相当于全局变量。

