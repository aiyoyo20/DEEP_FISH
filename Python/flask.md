## 路由
### 简单路由
```
@app.route('/hello/')
def hello():
    return 'Hello'

```
### 带参数的路由
#### （1）
```
@app.route('/hello/<name>')
def hello(name):
    return 'Hello %s' % name

```
#### （2） ?key=value形式传参
上面我们接受参数使用的是path形式，下面我们来使用查询字符串的形式，即?key=value

如果有多个参数，则用&来拼接： ?key1=value1&key2=value2

```
from flask import Flask, request


@app.route('/d/')
def d():
    wd = request.args.get('wd')
    return '您传递的参数是: {}'.format(wd)
```
#### 参数类型限制
```
@app.route('/user/<int:user_id>')
def get_user(user_id):
    return 'User ID: %d' % user_id
```
可以对参数限定数据类型,这样当我们传递的参数类型符合要求的时候才能正常访问，其他类型都会返回404

类型可以设置提下几种：

　　string: 默认的数据类型，接收没有任何斜杠"\   /"的文本

　　int: 整数形

　　float: 浮点型

　　path: 和string类似，但是接受斜杠

　　uuid: 只接受uuid字符串

　　any: 可以指定多种路径，比如以下例子
```
@app.route('/<any(article,blog):url_path>/<id>/')
def item(url_path, id):
    if url_path == 'article':
        return '文章详情：{}'.format(id)
    else:
        return '博客详情：{}'.format(id)
```

##### 自定义参数规则/自定义路由参数转换器 （也叫正则匹配路由参数）
具体实现步骤为：

- 导入转换器基类：在 Flask 中，所有的路由的匹配规则都是使用转换器对象进行记录
- 自定义转换器：自定义类继承于转换器基类
- 添加转换器到默认的转换器字典中
- 使用自定义转换器实现自定义匹配规则

##### to_python
这个方法的返回值，将会传递到view函数中作为参数
```
class ListConveter(BaseConverter):
    def to_python(self, value):     #这个value就是我们url的参数
        return value.split("+")         #这个返回值,就是我们视图函数接收到的参数

app.url_map.converters['list'] = ListConveter

@app.route('/posts/<list:boards>')
def posts(boards):   #这里的borads已经被list处理了，变成了列表
    return str(borads)
```

##### to_url
这个方法的返回值，将会在调用url_for函数的时候生成符合要求的url形式
```
class ListConveter(BaseConverter):
    def to_python(self, value):
        return value.split("+")

    def to_url(self, value):
        return '+'.join(value)

app.url_map.converters['list'] = ListConveter

@app.route('/')
def hello_world():
    return url_for('posts', boards=['a', 'b'])

@app.route('/posts/<list:boards>')
def posts(boards):
    return str(boards)
```

### 多url的路由
```
@app.route('/')
@app.route('/hello')
@app.route('/hello/<name>')
def hello(name=None):
    if name is None:
        name = 'World'
    return 'Hello %s' % name
```

### HTTP请求方法设置
编号	方法	描述
1	GET	将数据以未加密的形式发送到服务器，这最常用的方法。
2	HEAD	与GET相同，但没有响应主体
3	POST	用于将HTML表单数据发送到服务器。通过POST方法接收的数据不会被服务器缓存。
4	PUT	用上传的内容替换目标资源的所有当前表示。
5	DELETE	删除由URL给出的所有目标资源的所有表示默认情况下，Flask路由响应GET请求。 但是，可以通过为route()装饰器提供方法参数来更改此首选项。

```
@app.route('/login',methods = ['POST', 'GET'])
def login():
    if request.method == 'POST':
        user = request.form['name']
        return redirect(url_for('success',name = user))
    else:
        user = request.args.get('name')
        return redirect(url_for('success',name = user))

```

### url_for
url_for()函数对于动态构建特定函数的URL非常有用。 该函数接受函数的名称作为第一个参数，并接受一个或多个关键字参数，每个参数对应于URL的变量部分。

我们之前是通过url来找到对应的视图函数

　　/     =>    hello_world

那么url_for则是通过视图函数找到url

　　hello world  =>  /

```
from flask import url_for

@app.route('/')
def hello_world():
    return url_for('my_list')
    # /list/

@app.route('/list/')
def my_list():
    return 'list page'
```
```
from flask import url_for

@app.route('/')
def hello_world():
    return url_for('my_list', page_id=1)
    # /list/1/


@app.route('/list/<page_id>/')
def my_list(page_id):
    return 'list page'
```
```
# 如果url只配置了一个参数，而url_for设置了多个
from flask import url_for

@app.route('/')
def hello_world():
    return url_for('my_list', page_id=1, count=2)
    # /list/1/?count=2


@app.route('/list/<page_id>/')
def my_list(page_id):
    return 'list page'
```

#### 为什么要使用url_for呢？
当我们视图函数确定了，以后我们的url不管怎么变，只要通过url_for都能够正确地得到url，因为改变url的频率一般大于视图函数。

url_for会自动处理特殊的字符

### 页面跳转和重定向 
永久重定向301
http的状态码是301，多用于旧网址被废弃了要转到一个新的网址确保用户的访问，比如京东的网站，你输入www.jingdong.com的时候，会被重定向到www.jd.com，因为jingdong.com这个网址已经被废弃了，被改成了jd.com，所以这种情况下应该使用永久重定向

临时重定向302
http的状态码是302，表示页面的临时性跳转。比如访问一个需要权限的网址，如果用户没有登录，应该重定向到登录页面，这种情况下，应该用临时重定向

location表示需要重定向到的URL,应该配合url_for()函数来使用

code表示采用哪种重定向，默认是302（临时重定向），也可以改成301来实现永久重定向

```
重定向到非本模块的路由地址

@app.route("/")
def index()
retrun redirect(“www.baidu.om”)
```
```
重定向到自身模块的路由地址(被跳转的视图函数不携带参数)
@app.route("/")
def index()
retrun redirect(“www.baidu.om”)
@app.route("/temp")
def index()
retrun redirect(url_for(“index”))
```

```
重定向到自身模块的路由地址(被跳转的视图函数携带参数)
@app.route("/index/int:user_id")
def.index(user_id)
retrun “用户的id是%s”%user_id

@app.route("/temp")
def.index(user_id)
return redirect(url_for(“index”,user_id=999))
```

## 模板
### 使用模板
```
from flask import Flask
from flask import render_template

app = Flask(__name__)

@app.route('/hello')
@app.route('/hello/<name>')
def hello(name=None):
    return render_template('hello.html', name=name)

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)
```
调用了render_template()方法来渲染模板。方法的第一个参数hello.html指向你想渲染的模板名称，第二个参数name是你要传到模板去的变量，变量可以传多个。

### 模板继承
一般我们的网站虽然页面多，但是很多部分是重用的，比如页首，页脚，导航栏之类的。对于每个页面，都要写这些代码，很麻烦。Flask的Jinja2模板支持模板继承功能，省去了这些重复代码。让我们基于上面的例子，在”templates”目录下，创建一个名为”layout.html”的模板：

<!doctype html>
<title>Hello Sample</title>
<link rel="stylesheet" type="text/css" href="{{ url_for('static', filename='style.css') }}">
<div class="page">
    {% block body %}
    {% endblock %}
</div>
再修改之前的”hello.html”，把原来的代码定义在{% block body %}中，并在代码一开始”继承”上面的”layout.html”：

{% extends "layout.html" %}
{% block body %}
{% if name %}
    <h1>Hello {{ name }}!</h1>
{% else %}
    <h1>Hello World!</h1>
{% endif %}
{% endblock %}



## 请求、响应及会话
## 错误处理及消息闪现
## 数据库集成
