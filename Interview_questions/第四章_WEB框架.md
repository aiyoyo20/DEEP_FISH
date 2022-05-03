## 第四章 WEB 框架 
### 一、Flask
#### 1. Flask 中正则 URL 的实现？

> `@app.route(<URL>)` 中 URL 显式支持 string、int、float、path 4 种类型，隐式支持正则。

> 第一步：写正则类，继承 BaseConverter，将匹配到的值设置为 regex 的值。

```
class RegexUrl(BaseConverter):
    def init(self， url_map， *args):
        super(RegexUrl， self). init(url_map)
        self.regex = args[0]
```

> 第二步：把正则类赋值给我们定义的正则规则。
```
app.url_map.converters['re'] = RegexUrl
```

> 第三步：在 URL 中使用正则。
```
@app.route('/regex/<re("[a-z]{3}"):id>')
def regex111(id):
    return 'id:% s'% id
```

#### 2. Flask 中请求上下文和应用上下文的区别和作用？
> `current_app、g` 是应用上下文。
> `request、session` 是请求上下文。

#### 手动创建上下文的两种方法：
```
with app.app_context()
app = current_app._get_current_object()
```

##### 两者区别：
> `请求上下文`：保存了客户端和服务器交互的数据。
> `应用上下文`：flask 应用程序运行过程中，保存的一些配置信息，比如程序名、数据库连接、应用信息等。

##### 两者作用：
> `请求上下文(request context)`：
> Flask 从客户端收到请求时，要让视图函数能访问一些对象，这样才能处理请求。请求对象是一个很好的例子，它封装了客户端发送的 `HTTP` 请求。
> 要想让视图函数能够访问请求对象，一个显而易见的方式是将其作为参数传入视图函数，不过这会导致程序中的每个视图函数都增加一个参数，除了访问请求对象，如果视图函数在处理请求时还要访问其他对象，情况会变得更糟。为了避免大量可有可无的参数把视图函数弄得一团糟，Flask 使用上下文临时把某些对象变为全局可访问。

> `应用上下文(application context)`：
> 它的字面意思是应用上下文，但它不是一直存在的，它只是 `request context` 中的一个对 app 的代理(人)，所谓 `local proxy`。它的作用主要是帮助 `request` 获取当前的应用，它是伴 request 而生，随 request 而灭的。

#### 3. Flask 中数据库设置？
```
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:mysql@11:3306/test'

# 动态追踪修改设置，如未设置只会提示警告
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True

# 查询时会显示原始 SQL 语句
app.config['SQLALCHEMY_ECHO'] =True
```

>补充 ：`app.config[SQLALCHEMY_COMMIT_ON_TEARDOWN]`：可以配置请求执行完逻辑之后自动提交，而不用我们每次都手动调用 `session.commit()`；

> 监听数据库中的数据，当发生改变，就会显示一些内容：`app.config['SQLALCHEMY_TRACK_MODIFICATIONS']=True；`

> 显示打印的数据以及 sql 语句，建议不设置，默认为 False：`app.config['SQLALCHEMY_ECHO'] = True。`

#### 4. 常用的 SQLAlchemy 查询过滤器？

#### 5. 对 Flask 蓝图(Blueprint) 的理解？
蓝图的定义
> `蓝图 / Blueprint` 是 Flask 应用程序组件化的方法，可以在一个应用内或跨越多个项目共用蓝图。
> 使用蓝图可以极大地简化大型应用的开发难度，也为 Flask 扩展提供了一种在应用中注册服务的 `集中式机制`。

蓝图的应用场景
1. 把一个应用分解为一个蓝图的集合。这对大型应用是理想的。一个项目可以实例化一个应用对象，初始化几个扩展，并注册一集合的蓝图。
2. 以 URL 前缀和 / 或子域名，在应用上注册一个蓝图。URL 前缀 / 子域名中的参数即成为这个蓝图下的所有视图函数的共同的视图参数（默认情况下）。
3. 在一个应用中用不同的 URL 规则多次注册一个蓝图。
4. 通过蓝图提供模板过滤器、静态文件、模板和其它功能。一个蓝图不一定要实现应用或者视图函数。
5. 初始化一个 Flask 扩展时，在这些情况中注册一个蓝图。

#### 3) 蓝图的缺点
不能在应用创建后撤销注册一个蓝图而不销毁整个应用对象。

#### 4) 使用蓝图的三个步骤
```
# 1、创建一个蓝图对象
blue = Blueprint("blue"， name)

# 2、在这个蓝图对象上进行操作，例如注册路由、指定静态文件夹、注册模板过滤器...
@blue.route('/')
def blue_index():
    return 'Welcome  to my blueprint'

# 3、在应用对象上注册这个蓝图对象
app.register_blueprint(blue，url_prefix='/blue')
```

#### 6. Flask 中 WTF 表单数据验证？
在 Flask 中，为了处理 web 表单，我们一般使用 Flask-WTF 扩展，它封装了 WTForms，并且它有验证表单数据的功能。

#### WTForms 支持的 HTML 标准字段：

| 字段 | 对象说明 |
| --- | --- |
| StringField | 文本字段 |
| TextAreaField | 多行文本字段 |
| PasswordField | 密码文本字段 |
| HiddenField | 隐藏文件字段 |
| DateField | 文本字段，值为 datetime.date 文本格式 |
| DateTimeField | 文本字段，值为 datetime.datetime 文本格式 |
| IntegerField | 文本字段，值为整数 |
| DecimalField | 文本字段，值为 decimal.Decimal |
| FloatField | 文本字段，值为浮点数 |
| BooleanField | 复选框，值为 True 和 False |
| RadioField | 一组单选框 |
| SelectField | 下拉列表 |
| SelectMutipleField | 下拉列表，可选择多个值 |
| FileField | 文件上传字段 |
| SubmitField | 表单提交按钮 |
| FormField | 把表单作为字段嵌入另一个表单 |
| FieldList | 一组指定类型的字段 |

#### WTForms 常用验证函数

| 验证函数 | 对象说明 |
| --- | --- |
| InputRequired | 确保字段中有数据 |
| DataRequired | 确保字段中有数据并且数据为真 |
| EqualTo | 比较两个字段的值，常用于比较两次密码输入 |
| Length | 验证输入的字符串长度 |
| NumberRange | 验证输入的值在数字范围内 |
| URL | 验证 URL |
| AnyOf | 验证输入值在可选列表中 |
| NoneOf | 验证输入值不在可选列表中 |

> 使用 Flask-WTF 需要配置参数 SECRET_KEY。
> CSRF_ENABLED 是为了 CSRF（跨站请求伪造）保护。SECRET_KEY 用来生成加密令牌，当 CSRF 激活的时候，该设置会根据设置的密匙生成加密令牌。

#### 7. Flask 项目中如何实现 session 信息的写入？
> Flask 中有三个 session：

> 第一个：数据库中的 session，例如:db.session.add()
> 第二个：在 flask_session 扩展中的 session，使用：from flask_session importSession，使用第三方扩展的 session 可以把信息存储在服务器中，客户端浏览器中只存储 sessionid。
> 第三个：flask 自带的 session，是一个请求上下文， 使用：from flask import session。自带的 session 把信息加密后都存储在客户端的浏览器 cookie 中。

#### 8. 项目接口实现后路由访问不到怎么办？
可以通过 `postman` 测试工具测试，或者看 `log` 日志信息找到错误信息的大概位置。

#### 9. Flask 中 url_for 函数？
1.URL 反转：根据视图函数名称得到当前所指向的 url。
2.url_for() 函数最简单的用法是以视图函数名作为参数，返回对应的 url，还可以用作加载静态文件。

`<link rel="stylesheet"href="{{url_for('static',filename='css/index.css')}}">`该条语句就是在模版中加载 css 静态文件。

3.url_for 和 redirect 区别
url_for 是用来拼接 URL 的，可以使用程序 URL 映射中保存的信息生成 URL。url_for() 函数最简单的用法是以视图函数名作为参数， 返回对应的 URL。例如，在示例程序中 hello.py 中调用 url_for(index’) 得到的结果是 /。
redirect 是重定向函数，输入一个 URL 后，自动跳转到另一个 URL 所在的地址，例如，你在函数中写

`return redirect(https://www.baidu.com)`页面就会跳转向百度页面。

```
from flask import Flask,redirect,url_for
app = Flask(name)
@app.route('/')
def index():
    login_url = url_for('login')
    return redirect(login_url)
    return u' 这是首页 '

@app.route('/login/')
def login():
    return u' 这是登陆页面 '

@app.route('/question/<is_login>/')
def question(is_login):
    if is_login == '1':
        return u' 这是发布问答的页面 '
    else:
        return redirect(url_for('login'))

if name == ' main ':
    app.run(debug=True)
```

#### 10.Flask 中请求钩子的理解和应用？
> 请求钩子是通过 `装饰器` 的形式实现的，支持以下四种：
1，before_first_request 在处理第一个请求前运行
2，before_request: 在每次请求前运行
3，after_request: 如果没有未处理的异常抛出，在每次请求后运行
4，teardown_request: 即使有未处理的异常抛出，在每次请求后运行

`应用`：
```
# 请求钩子
@api.after_request
def after_request(response):
    """设置默认的响应报文格式为 application/json"""
    # 如果响应报文 response 的 Content-Type 是以 text 开头，则将其改为
    # 默认的 json 类型
    if response.headers.get("Content-Type").startswith("text"):
        response.headers["Content-Type"] = "application/json"
        return respon
```

#### 11. 一个变量后写多个过滤器是如何执行的？
```
{{expression | filter1 | filter2 | ...}} 即表达式(expression) 使用 filter1 过滤后再使用 filter2 过滤。
```

#### 12. 如何把整个数据库导出来，再导入指定数据库中？
导出：`mysqldump[-h 主机] -u 用户名 - p 数据库名 > 导出的数据库名.sql`

导入指定的数据库中:
第一种方法：`mysqldump[-h 主机] -u 用户名 - p 数据库名 <导出的数据库名.sql`

第二种方法：
先创建好数据库，因为导出的文件里没有创建数据库的语句，如果数据库已经建好，则不用再创建。`create database example charset=utf8;（数据库名可以不一样）`
切换数据库：`use example;`
导入指定 sql 文件：`mysql>source /path/example.sql;`

#### 13.Flask 和 Django 路由映射的区别？
在 django 中，路由是浏览器访问服务器时，先访问的项目中的 url，再由项目中的 url 找到应用中url，这些 url 是放在一个列表里，遵从从前往后匹配的规则。
在 flask 中，路由是通过装饰器给每个视 vcb图函数提供的，而且根据请求方式的不同可以一个 url 用于不同的作用。

#### 14. 跨站请求伪造和跨站请求保护的实现？
> ![](https://img.alicdn.com/imgextra/i3/296192965/O1CN01LKxyUG1Xm0yEFEkhU_!!296192965.png "null")

图中 Browse 是浏览器，WebServerA 是受信任网站 / 被攻击网站 A，WebServerB 是恶意网站 / 点击网站 B。
（1） 一开始用户打开浏览器，访问受信任网站 A，输入用户名和密码登陆请求登陆网站 A。
（2） 网站 A 验证用户信息，用户信息通过验证后，网站 A 产生 Cookie 信息并返回给浏览器。
（3） 用户登陆网站 A 成功后，可以正常请求网站 A。
（4） 用户未退出网站 A 之前，在同一浏览器中，打开一个 TAB 访问网站 B。
（5） 网站 B 看到有人方式后，他会返回一些攻击性代码。
（6） 浏览器在接受到这些攻击性代码后，促使用户不知情的情况下浏览器携带 Cookie（包括 sessionId）信息，请求网站 A。这种请求有可能更新密码，添加用户什么的操作。

从上面 `CSRF` 攻击原理可以看出，要完成一次 CSRF 攻击，需要被攻击者完成两个步骤：
1. 登陆受信任网站 A，并在本地生成 COOKIE。
2. 在不登出 A 的情况下，访问危险网站 B。

如果不满足以上两个条件中的一个，就不会受到 CSRF 的攻击，以下情况可能会导致 CSRF：
1. 登录了一个网站后，打开一个 tab 页面并访问另外的网站。
2. 关闭浏览器了后，本地的 Cookie 尚未过期，你上次的会话还没有已经结束。（事实上，关闭浏览器不能结束一个会话，但大多数人都会错误的认为关闭浏览器就等于退出登录 / 结束会话了……）

`解决办法`：就是在表单中添加 `from.csrf_token`。

#### 15.Flask(name) 中的 name 可以传入哪些值？
`可以传入的参数`：
1，字符串：hello’, 但是 abc’, 不行，因为 abc 是 python 内置的模块
2， name ，约定俗成

`不可以插入的参数`
1，python 内置的模块，re,urllib,abc 等
2，数字

### 二、Django
##### 1. Django ORM 查询中 select_related 和 prefetch_related 的区别？？
** 参考博客:** https://www.cnblogs.com/Dominic-Ji/p/9213887.html

##### 2. Django ORM 详解？
** 参考博客:** https://www.cnblogs.com/Dominic-Ji/p/9209341.html

#### 1. Django 创建项目的命令？
```
django-admin startproject 项目名称
python manage.py startapp 应用 app 名
```

#### 2. Django 创建项目后，项目文件夹下的组成部分（对 mvt 的理解）？
> 项目文件夹下的组成部分：
> manage.py 是项目运行的入口，指定配置文件路径。
> 与项目同名的目录，包含项目的配置文件。
> `__init__.py` 是一个空文件，作用是这个目录可以被当作包使用。  
`settings.py` 是项目的整体配置文件。  
`urls.py` 是项目的 URL 配置文件。  
`wsgi.py` 是项目与 WSGI 兼容的 Web 服务器。

#### 3. 对 MVC,MVT 解读的理解？
> M：Model，模型，和数据库进行交互  
V：View，视图，负责产生 Html 页面  
C：Controller，控制器，接收请求，进行处理，与 M 和 V 进行交互，返回应答。

> ![](https://img.alicdn.com/imgextra/i3/296192965/O1CN01F6qPRL1Xm0yBz09zW_!!296192965.png "null")

> 1、用户点击注按钮，将要注册的信息发送给网站服务器。  
2、Controller 控制器接收到用户的注册信息，Controller 会告诉 Model 层将用户的注册信息保存到数据库  
3、Model 层将用户的注册信息保存到数据库  
4、数据保存之后将保存的结果返回给 Model 模型，  
5、Model 层将保存的结果返回给 Controller 控制器。  
6、Controller 控制器收到保存的结果之后，或告诉 View 视图，view 视图产生一个 html 页面。  
7、View 将产生的 Html 页面的内容给了 Controller 控制器。  
8、Controller 将 Html 页面的内容返回给浏览器。  
9、浏览器接受到服务器 Controller 返回的 Html 页面进行解析展示。  
M：Model，模型，和 MVC 中的 M 功能相同，和数据库进行交互。  
V：view，视图，和 MVC 中的 C 功能相同，接收请求，进行处理，与 M 和 T 进行交互，返回应答。  
T：Template，模板，和 MVC 中的 V 功能相同，产生 Html 页面  
![](https://img.alicdn.com/imgextra/i4/296192965/O1CN01Tt6wBa1Xm0yDyZc9u_!!296192965.png "null")

> 1、用户点击注册按钮，将要注册的内容发送给网站的服务器。  
2、View 视图，接收到用户发来的注册数据，View 告诉 Model 将用户的注册信息保存进数据库。  
3、Model 层将用户的注册信息保存到数据库中。  
4、数据库将保存的结果返回给 Model  
5、Model 将保存的结果给 View 视图。  
6、View 视图告诉 Template 模板去产生一个 Html 页面。  
7、Template 生成 html 内容返回给 View 视图。  
8、View 将 html 页面内容返回给浏览器。  
9、浏览器拿到 view 返回的 html 页面内容进行解析，展示。

#### 4. Django 中 models 利用 ORM 对 Mysql 进行查表的语句（多个语句）？
> 字段查询
> all(): 返回模型类对应表格中的所有数据。> get(): 返回表格中满足条件的一条数据，如果查到多条数据，则抛异常：MultipleObjectsReturned，> 查询不到数据，则抛异常：DoesNotExist。
> filter(): 参数写查询条件，返回满足条件 QuerySet 集合数据。> 条件格式：

> `模型类属性名` 条件名 = 值  
注意：此处是模型类属性名，不是表中的字段名  
关于 filter 具体案例如下：  
判等 exact。
```
BookInfo.object.filter(id=1)
BookInfo.object.filter(id exact=1) 此处的 exact 可以省略
```

> 模糊查询 like
> 例：查询书名包含’传’的图书。contains
```contains BookInfo.objects.filter(btitle contains=’ 传’)```

> 空查询 where 字段名 isnull
```BookInfo.objects.filter(btitle isnull=False)```

> 范围查询 where id in(1，3，5)
```BookInfo.objects.filter(id in=[1，3，5])```

> 比较查询 gt lt(less than) gte(equal) lte
```BookInfo.objects.filter(id gte=3)```

> 日期查询
```
BookInfo.objects.filter(bpub_date year = 1980)
BookInfo.objects.filter(bpub_date gt = date(1980，1，1))
```> exclude: 返回不满足条件的数据。```
BookInfo.objects.exclude(id=3)
```

##### F 对象
> 作用：用于类属性之间的比较条件。
```
from django.db.models import F

例：where bread > bcomment BookInfo.objects.filter(bread gt =F(‘bcomment’))

例：BookInfo.objects.filter(bread gt=F(‘bcomment’)*2)
```

##### Q 对象
> 作用：用于查询时的逻辑条件。可以对 Q 对象进行 `& | ~` 操作。
```
from django.db.models import Q
BookInfo.objects.filter(id gt=3， bread gt=30)
BooInfo.objects.filter(Q(id gt=3) & Q(bread gt=3))

例：BookInfo.objects.filter(Q(id gt=3) | Q(bread gt=30))

例：BookInfo.objects.filter(~Q(id=3))
```

##### order_by 返回 QuerySet
> 作用：对查询结果进行排序。
```
例： BookInfo.objects.all().order_by('id')
例： BookInfo.objects.all().order_by('-id')
例： BookInfo.objects.filter(id gt=3).order_by('-bread')
```

##### 聚合函数
> 作用：对查询结果进行聚合操作。
```sum count max min avg```

> aggregate：调用这个函数来使用聚合。
```
from django.db.models import Sum，Count，Max，Min，Avg
例：BookInfo.objects.aggregate(Count('id'))
```

> {id count’: 5} 注意返回值类型及键名
```
例：BookInfo.objects.aggregate(Sum(‘bread’))
```

> {bread sum’:120} 注意返回值类型及键名  
count 函数  
作用：统计满足条件数据的数目。  
例：统计所有图书的数目。
```BookInfo.objects.all().count()```

> 例：统计 id 大于 3 的所有图书的数目。
```BookInfo.objects.filter(id gt = 3).count()```

##### 模型类关系
> 一对多关系  
例： 图书类 - 英雄类  
models.ForeignKey() 定义在多的类中。  
2）多对多关系  
例：新闻类 - 新闻类型类  
models.ManyToManyField() 定义在哪个类中都可以。  
3）一对一关系  
例：员工基本信息类 - 员工详细信息类  
models.OneToOneField() 定义在哪个类中都可以。

#### 5. django 中间件的使用？
> Django 在中间件中预置了六个方法，这六个方法的区别在于不同的阶段执行，对输入或输出进行干预，方法如下：

> 1. 初始化：无需任何参数，服务器响应第一个请求的时候调用一次，用于确定是否启用当前中间件。
```
def init():
    pass
```

> 2. 处理请求前：在每个请求上调用，返回 None 或 HttpResponse 对象。
```
def process_request(request):
    pass
```

> 3. 处理视图前：在每个请求上调用，返回 None 或 HttpResponse 对象。
```
def process_view(request, view_func, view_args, view_kwargs):
    pass
```

> 4. 处理模板响应前：在每个请求上调用，返回实现了 render 方法的响应对象。
```
def process_template_response(request, response):
    pass
```

> 5. 处理响应后：所有响应返回浏览器之前被调用，在每个请求上调用，返回 HttpResponse 对象。
```
def process_response(request, response):
    pass
```

> 6. 异常处理：当视图抛出异常时调用，在每个请求上调用，返回一个 HttpResponse 对象。
```
def process_exception(request,exception):
    pass
```

#### 6. 谈一下你对 uWSGI 和 nginx 的理解？
1.uWSGI 是一个 Web 服务器，它实现了 WSGI 协议、uwsgi、http 等协议。Nginx 中HttpUwsgiModule 的作用是与 uWSGI 服务器进行交换。WSGI 是一种 Web 服务器网关接口。它是一个 Web 服务器（如 nginx，uWSGI 等服务器）与 web 应用（如用 Flask 框架写的程序）通信的一种规范。
要注意 WSGI /uwsgi/uWSGI 这三个概念的区分。

WSGI 是一种通信协议。  
uwsgi 是一种线路协议而不是通信协议，在此常用于在 uWSGI 服务器与其他网络服务器的数据通信。  
uWSGI 是实现了 uwsgi 和 WSGI 两种协议的 Web 服务器。

2.  nginx 是一个开源的高性能的 HTTP 服务器和反向代理：
    1. 作为 web 服务器，它处理静态文件和索引文件效果非常高；  
    2. 它的设计非常注重效率，最大支持 5 万个并发连接，但只占用很少的内存空间；  
    3. 稳定性高，配置简洁；  
    4. 强大的反向代理和负载均衡功能，平衡集群中各个服务器的负载压力应用。

#### 7. 说说 nginx 和 uWISG 服务器之间如何配合工作的？
> 首先浏览器发起 http 请求到 nginx 服务器，Nginx 根据接收到请求包，进行 url 分析，判断访问的资源类型，如果是静态资源，直接读取静态资源返回给浏览器，如果请求的是动态资源就转交给 uwsgi 服务器，uwsgi 服务器根据自身的 uwsgi 和 WSGI 协议，找到对应的 Django 框架，Django 框架下的应用进行逻辑处理后，将返回值发送到 uwsgi 服务器，然后 uwsgi 服务器再返回给 nginx，最后 nginx 将返回值返回给浏览器进行渲染显示给用户。  

如果可以，画图讲解效果更佳，可以将下面的图画给面试官。  
![](https://img.alicdn.com/imgextra/i3/296192965/O1CN019iRedm1Xm0yBPGvMe_!!296192965.png "null")

#### 8. django 开发中数据库做过什么优化？
> 1. 设计表时，尽量少使用外键，因为外键约束会影响插入和删除性能；  
2. 使用缓存，减少对数据库的访问；  
3. 在 orm 框架下设置表时，能用 varchar 确定字段长度时，就别用 text；  
4. 可以给搜索频率高的字段属性，在定义时创建索引；  
5.Django orm 框架下的 Querysets 本来就有缓存的；  
6. 如果一个页面需要多次连接数据库，最好一次性取出所有需要的数据，减少对数据库的查询次数；  
7. 若页面只需要数据库里某一个两个字段时，可以用 QuerySet.values()；  
8. 在模板标签里使用 with 标签可以缓存 Qset 的查询结果。

#### 9. 验证码过期时间怎么设置？
将验证码保存到数据库或 session，设置过期时间为 1 分钟，然后页面设置一个倒计时(一般是前端 js 实现这个计时) 的展示，一分钟过后再次点击获取新的信息。

#### 10.Python 中三大框架各自的应用场景？
django：主要是用来搞快速开发的，他的亮点就是快速开发，节约成本，正常的并发量不过 10000， 如果要实现高并发的话，就要对 django 进行二次开发，比如把整个笨重的框架给拆掉，自己写 socket 实现http 的通信，底层用纯 c，c++ 写提升效率，ORM 框架给干掉，自己编写封装与数据库交互的框架，因为啥呢，ORM 虽然面向对象来操作数据库，但是它的效率很低，使用外键来联系表与表之间的查询；

flask：轻量级，主要是用来写接口的一个框架，实现前后端分离，提升开发效率，Flask 本身相当于一个内核，其他几乎所有的功能都要用到扩展（邮件扩展 Flask-Mail，用户认证 Flask-Login），都需要用第三方的扩展来实现。比如可以用 Flask-extension 加入 ORM、窗体验证工具，文件上传、身份验证等。
Flask 没有默认使用的数据库，你可以选择 MySQL，也可以用 NoSQL。

其 WSGI 工具箱采用 Werkzeug（路由模块），模板引擎则使用 Jinja2。这两个也是 Flask 框架的核心。Python 最出名的框架要数 Django，此外还有 Flask、Tornado 等框架。

虽然 Flask 不是最出名的框架，但是 Flask 应该算是最灵活的框架之一，这也是 Flask 受到广大开发者喜爱的原因。  

Tornado： Tornado 是一种 Web 服务器软件的开源版本。Tornado 和现在的主流 Web 服务器框架（包括大多数 Python 的框架）有着明显的区别：它是非阻塞式服务器，而且速度相当快。得利于其非阻塞的方式和对 epoll 的运用，Tornado 每秒可以处理数以千计的连接，因此 Tornado是实时 Web 服务的一个理想框架。

#### 11.django 如何提升性能（高并发）？
对一个后端开发程序员来说，提升性能指标主要有两个一个是并发数，另一个是响应时间网站性能的优化一般包括 web 前端性能优化，应用服务器性能优化，存储服务器优化。  

对前端的优化主要有：  
1. 减少 http 请求，减少数据库的访问量，比如使用雪碧图。  
2. 使用浏览器缓存，将一些常用的 css，js，logo 图标，这些静态资源缓存到本地浏览器，通过设置 http 头中的 cache-control 和 expires 的属性，可设定浏览器缓存，缓存时间可以自定义。  
3 对 html，css，javascript 文件进行压缩，减少网络的通信量。  

对我个人而言，我做的优化主要是以下三个方面：  
1. 合理的使用缓存技术，对一些常用到的动态数据，比如首页做一个缓存，或者某些常用的数据做个缓存，设置一定得过期时间，这样减少了对数据库的压力，提升网站性能。  
2. 使用 celery 消息队列，将耗时的操作扔到队列里，让 worker 去监听队列里的任务，实现异步操作，比如发邮件，发短信。  
3. 就是代码上的一些优化，补充：nginx 部署项目也是项目优化，可以配置合适的配置参数，提升效率，增加并发量。  
4. 如果太多考虑安全因素，服务器磁盘用固态硬盘读写，远远大于机械硬盘，这个技术现在没有普及，主要是固态硬盘技术上还不是完全成熟， 相信以后会大量普及。  
5. 另外还可以搭建服务器集群，将并发访问请求，分散到多台服务器上处理。  
6. 最后就是运维工作人员的一些性能优化技术了。

#### 12. 什么是 restful api，谈谈你的理解？> REST:Representational State Transfer 的缩写，翻译：具象状态传输。一般解释为表现层状态转换。  
REST 是设计风格而不是标准。是指客户端和服务器的交互形式。我们需要关注的重点是如何设计  
REST 风格的网络接口。  
REST 的特点：  
1. 具象的。一般指表现层，要表现的对象就是资源。比如，客户端访问服务器，获取的数据就是资源。比如文字、图片、音视频等。  
2. 表现：资源的表现形式。txt 格式、html 格式、json 格式、jpg 格式等。浏览器通过 URL 确定资源的位置，但是需要在 HTTP 请求头中，用 Accept 和 Content-Type 字段指定，这两个字段是对资源表现的描述。
3. 状态转换：客户端和服务器交互的过程。在这个过程中，一定会有数据和状态的转化，这种转化叫做状态转换。其中，GET 表示获取资源，POST 表示新建资源，PUT 表示更新资源，DELETE 表示删除资源。HTTP 协议中最常用的就是这四种操作方式。  

RESTful 架构：  
1. 每个 URL 代表一种资源；  
2. 客户端和服务器之间，传递这种资源的某种表现层；  
3. 客户端通过四个 http 动词，对服务器资源进行操作，实现表现层状态转换。  

12.1 如何设计符合 RESTful 风格的 API  
一、域名：  
将 api 部署在专用域名下：  
http://api.example.com  
或者将 api 放在主域名下：  
http://www.example.com/api/ 

二、版本：  
将 API 的版本号放在 url 中。  
http://www.example.com/app/1.0/info  
http://www.example.com/app/1.2/info  

三、路径：  
路径表示 API 的具体网址。每个网址代表一种资源。资源作为网址，网址中不能有动词只能有名词，一般名词要与数据库的表名对应。而且名词要使用复数。  

错误示例：  
http://www.example.com/getGoods  
http://www.example.com/listOrders  

正确示例：
```
http://www.example.com/app/goods/1  # 获取单个商品 

http://www.example.com/app/goods  # 获取所有商品  
```

四、使用标准的 HTTP 方法：  
对于资源的具体操作类型，由 HTTP 动词表示。常用的 HTTP 动词有四个。  
GET SELECT ：从服务器获取资源。  
POST CREATE ：在服务器新建资源。PUT  
UPDATE ：在服务器更新资源。DELETE  
DELETE ：从服务器删除资源。

示例：
```  
GET http://www.example.com/goods/ID  # 获取指定商品的信息

POST http://www.example.com/goods  # 新建商品的信息
 
PUT http://www.example.com/goods/ID  #更新指定商品的信息 
  
DELETE http://www.example.com/goods/ID  # 删除指定商品的信息
```

五、过滤信息：  
如果资源数据较多，服务器不能将所有数据一次全部返回给客户端。API 应该提供参数，过滤返回结果。

实例：
``` 
http://www.example.com/goods?limit=10  # 指定返回数据的数量 
  
http://www.example.com/goods?offset=10  # 指定返回数据的开始位置
  
http://www.example.com/goods?page=2&per_page=20  # 指定第几页，以及每页数据的数量
```

六、状态码：  
服务器向用户返回的状态码和提示信息，常用的有：  
200 OK ：服务器成功返回用户请求的数据  
201 CREATED ：用户新建或修改数据成功。  
202 Accepted：表示请求已进入后台排队。  
400 INVALID REQUEST ：用户发出的请求有错误。  
401 Unauthorized ：用户没有权限。  
403 Forbidden ：访问被禁止。  
404 NOT FOUND ：请求针对的是不存在的记录。  
406 Not Acceptable ：用户请求的的格式不正确。  
500 INTERNAL SERVER ERROR ：服务器发生错误。  

七、错误信息：一般来说，服务器返回的错误信息，以键值对的形式返回。
```
{error: 'Invalid API KEY'}
```

八、响应结果：针对不同结果，服务器向客户端返回的结果应符合以下规范。
```
GET http://www.example.com/goods  # 返回商品列表

GET http://www.example.com/goods/cup  # 返回单个商品

POST http://www.example.com/goods  # 返回新生成的商品

DELETE http://www.example.com/goods  # 返回一个空文档
```

九、使用链接关联相关的资源：  在返回响应结果时提供链接其他 API 的方法，使客户端很方便的获取相关联的信息。  

十、其他：  服务器返回的数据格式，应该尽量使用 JSON，避免使用 XML。

#### 13. 什么 csrf 攻击原理？如何解决？
> ![](https://img.alicdn.com/imgextra/i1/296192965/O1CN01x5vuEX1Xm0yFqvPuh_!!296192965.png "null")

> 简单来说就是：你访问了信任网站 A，然后 A 会用保存你的个人信息并返回给你的浏览器一个cookie，然后呢，在 cookie 的过期时间之内，你去访问了恶意网站 B，它给你返回一些恶意请求代码，要求你去访问网站 A，而你的浏览器在收到这个恶意请求之后，在你不知情的情况下，会带上保存在本地浏览器的 cookie 信息去访问网站 A，然后网站 A 误以为是用户本身的操作，导致来自恶意网站 C 的攻击代码会被执：发邮件，发消息，修改你的密码，购物，转账，偷窥你的个人信息，导致私人信息泄漏和账  户财产安全收到威胁

#### 14. 启动 Django 服务的方法？
> runserver 方法是调试 Django 时经常用到的运行方式，它使用 Django 自带的 WSGI Server 运行，主要在测试和开发中使用，并且 runserver 开启的方式也是单进程。

#### 15. 怎样测试 django 框架中的代码？
> 在单元测试方面，Django 继承 python 的 unittest.TestCase 实现了自己的django.test.TestCase，编写测试用例通常从这里开始。测试代码通常位于 app 的 tests.py 文件中(也可以在 models.py 中编写，一般不建议）。在 Django 生成的 depotapp 中，已经包含了这个文件，并且其中包含了一个测试用例的样例：
```
python manage.py test：执行所有的测试用例
python manage.py test app_name， 执行该 app 的所有测试用例
python manage.py test app_name.case_name: 执行指定的测试用例
```

> 一些测试工具：unittest 或者 pytest


1. 有过部署经验？用的什么技术？可以满足多少压力？ 有部署经验，在阿里云服务器上部署的  
2. 技术有：nginx + uwsgi 的方式来部署 Django 项目 
3. 无标准答案（例：压力测试一两千）

#### 16.Django 中哪里用到了线程？哪里用到了协程？哪里用到了进程？
> 1.Django 中耗时的任务用一个进程或者线程来执行，比如发邮件，使用 celery。  
2. 部署 django 项目的时候，配置文件中设置了进程和协程的相关配置。

#### 17.django 关闭浏览器，怎样清除 cookies 和 session？
> 设置 Cookie
```
def cookie_set(request):
    response = HttpResponse("<h1> 设置 Cookie，请查看响应报文头 </h1>")
    response.set_cookie('h1', 'hello django')
    return response
```

> 读取 Cookie
```
def cookie_get(request):
    response = HttpResponse("读取 Cookie，数据如下：<br>")

    if request.COOKIES.has_key('h1'):
        response.write('<h1>' + request.COOKIES['h1'] + '</h1>')
    return response
```

> 以键值对的格式写会话
```
request.session[' 键 ']= 值
```

> 根据键读取值。
```
request.session.get(' 键 ', 默认值)
```

> 清除所有会话，在存储中删除值部分。
```
request.session.clear()
```

> 清除会话数据，在存储中删除会话的整条数据。
```
request.session.flush()
```

> 删除会话中的指定键及值，在存储中只删除某个键及对应的值。
```
del request.session[' 键 ']
```

> 设置会话的超时时间，如果没有指定过期时间则两个星期后过期。  
如果 value 是一个整数，会话将在 value 秒没有活动后过期。  
如果 value 为 0，那么用户会话的 Cookie 将在用户的浏览器关闭时过期。

> 如果 value 为 None，那么会话永不过期。
```request.session.set_expiry(value)```

> Session 依赖于 Cookie，如果浏览器不能保存 cookie 那么 session 就失效了。因为它需要浏览器的 cookie 值去 session 里做对比。session 就是用来在服务器端保存用户的会话状态。  
cookie 可以有过期时间，这样浏览器就知道什么时候可以删除 cookie 了。如果 cookie 没有设置过期时间，当用户关闭浏览器的时候，cookie 就自动过期了。你可以改变SESSION_EXPIRE_AT_BROWSER_CLOSE 的设置来控制 session 框架的这一行为。
缺省情况下，SESSION_EXPIRE_AT_BROWSER_CLOSE 设置为 False ，这样，会话 cookie 可以在用户浏览器中保持有效达 SESSION_COOKIE_AGE 秒（缺省设置是两周，即 1，209，600 秒）如果你不想用户每次打开浏览器都必须重新登陆的话，用这个参数来帮你。如果 SESSION_EXPIRE_AT_BROWSER_CLOSE设置为 True，当浏览器关闭时，Django 会使 cookie 失效。SESSION_COOKIE_AGE：设置 cookie 在浏览器中存活的时间。

#### 18. 代码优化从哪些方面考虑？有什么想法？
1、优化算法时间  
算法的时间复杂度对程序的执行效率影响最大，在 Python 中可以通过选择合适的数据结构来优化时间复杂度，如 list 和 set 查找某一个元素的时间复杂度分别是 O(n) 和 O(1)。不同的场景有不同的优化方式，总得来说，一般有分治，分支界限，贪心，动态规划等思想。  

2、循环优化  
每种编程语言都会强调需要优化循环。当使用 Python 的时候，你可以依靠大量的技巧使得循环运行得更快。然而，开发者经常漏掉的一个方法是：避免在一个循环中使用点操作。每一次你调用方法 str.upper，Python 都会求该方法的值。然而,如果你用一个变量代替求得的值，值就变成了已知的，Python 就可以更快地执行任务。优化循环的关键，是要减少 Python 在循环内部执行的工作量，因为 Python 原生的解释器在那种情况下，真的会减缓执行的速度。（注意：优化循环的方法有很多，这只是其中的一个。例如，许多程序员都会说，列表推导是在循环中提高执行速度的最好方式。这里的关键是，优化循环是程序取得更高的执行速度的更好方式之一。）  

3、函数选择  
在循环的时候使用 xrange 而不是 range；使用 xrange 可以节省大量的系统内存，因为 xrange() 在序列中每次调用只产生一个整数元素。而 range() 將直接返回完整的元素列表，用于循环时会有不必要的开销。在 python3 中 xrange 不再存在，里面 range 提供一个可以遍历任意长度的范围的iterator。  

4、并行编程  
因为 GIL 的存在，Python 很难充分利用多核 CPU 的优势。但是，可以通过内置的模块 multiprocessing 实现下面几种并行模式：  
多进程：对于 CPU 密集型的程序，可以使用 multiprocessing 的 Process，Pool 等封装好的类，通过多进程的方式实现并行计算。但是因为进程中的通信成本比较大，对于进程之间需要大量数据交互的程序效率未必有大的提高。  
多线程：对于 IO 密集型的程序，multiprocessing.dummy 模块使用 multiprocessing 的接口封装 threading，使得多线程编程也变得非常轻松(比如可以使用 Pool 的 map 接口，简洁高效)。  
分布式：multiprocessing 中的 Managers 类提供了可以在不同进程之共享数据的方式，可以在此基础上开发出分布式的程序。  
不同的业务场景可以选择其中的一种或几种的组合实现程序性能的优化。

5、使用性能分析工具  
除了上面在 ipython 使用到的 timeit 模块，还有 cProfile。cProfile 的使用方式也非常简单：python-mcProfilefilename.py，filename.py 是要运行程序的文件名，可以在标准输出中看到每一个函数被调用的次数和运行的时间，从而找到程序的性能瓶颈，然后可以有针对性地优化。  

6、set 的用法  
set 的 union，intersection，difference 操作要比 list 的迭代要快。因此如果涉及到求 list 交集，并集或者差的问题可以转换为 set 来操作。  

7、PyPy  
PyPy 是用 RPython(CPython 的子集) 实现的 Python，根据官网的基准测试数据，它比 CPython 实现的 Python 要快 6 倍以上。快的原因是使用了 Just-in-Time(JIT) 编译器，即动态编译器，与静态编译器(如 gcc，javac 等) 不同，它是利用程序运行的过程的数据进行优化。由于历史原因，目前 pypy 中还保留着 GIL，不过正在进行的 STM 项目试图将 PyPy 变成没有 GIL 的 Python。如果 python程序中含有 C 扩展(非 cffi 的方式)，JIT 的优化效果会大打折扣，甚至比 CPython 慢（比 Numpy）。所以在 PyPy 中最好用纯 Python 或使用 cffi 扩展。

#### 19.Django 中间件是如何使用的？
> 中间件不用继承自任何类（可以继承 object），下面一个中间件大概的样子：
```
class CommonMiddleware(object):
    def process_request(self, request):
        return None

    def process_response(self, request, response):
        return response
```

> 还有 process_view， process_exception 和 process_template_response 函数。

1） 初始化：无需任何参数，服务器响应第一个请求的时候调用一次，用于确定是否启用当前中间件。
```
def init(self):
    pass
```

> 2） 处理请求前：在每个请求上，request 对象产生之后，url 匹配之前调用，返回 None 或 HttpResponse 对象。
```
def process_request(self， request):
    pass
```

> 3） 处理视图前：在每个请求上，url 匹配之后，视图函数调用之前调用，返回 None 或 HttpResponse 对象。
```
def process_view(self， request， view_func， *view_args，**view_kwargs):
    pass
```

> 4） 处理响应后：视图函数调用之后，所有响应返回浏览器之前被调用，在每个请求上调用，返回 HttpResponse 对象。
```
def process_response(self， request， response):
    pass
```

> 5） 异常处理：当视图抛出异常时调用，在每个请求上调用，返回一个 HttpResponse 对象。
```
def process_exception(self， request，exception):
    pass
```

#### 20. 有用过 Django REST framework 吗？
> Django REST framework 是一个强大而灵活的 Web API 工具。使用 RESTframework 的理由有：  
Web browsable API 对开发者有极大的好处  
包括 OAuth1a 和 OAuth2 的认证策略  
支持 ORM 和非 ORM 数据资源的序列化  
全程自定义开发 —— 如果不想使用更加强大的功能，可仅仅使用常规的 function-based views 额外的文档和强大的社区支持

#### 21.Celery 分布式任务队列？
> 情景：用户发起 request，并等待 response 返回。在本些 views 中，可能需要执行一段耗时的程  
序，那么用户就会等待很长时间，造成不好的用户体验，比如发送邮件、手机验证码等。  
使用 celery 后，情况就不一样了。解决：将耗时的程序放到 celery 中执行。  
将多个耗时的任务添加到队列 queue 中，也就是用 redis 实现 broker 中间人，然后用多个 worker 去监听队列  
里的任务去执行。

> ![](https://img.alicdn.com/imgextra/i4/296192965/O1CN01GdfgAg1Xm0yBQJZZX_!!296192965.png "null")

任务 task：就是一个 Python 函数。
队列 queue：将需要执行的任务加入到队列中。
工人 worker：在一个新进程中，负责执行队列中的任务。
代理人 broker：负责调度，在布置环境中使用 redis。

#### 23.Jieba 分词
> Jieba 分词支持三种分词模式：

> 精确模式：试图将句子最精确地切开，适合文本分析；  
全模式：把句子中所有的可以成词的词语都扫描出来， 速度非常快，但是不能解决歧义；  
搜索引擎模式：在精确模式的基础上，对长词再次切分，提高召回率，适合用于搜索引擎分词

> 功能：  
分词，添加自定义词典，关键词提取，词性标注，并行分词，Tokenize：返回词语在原文的起始位置，ChineseAnalyzer for Whoosh 搜索引擎。

#### 24.ngnix 的正向代理与反向代理？
> web 开发中，部署方式大致类似。简单来说，使用 Nginx 主要是为了实现分流、转发、负载均衡，以及分担服务器的压力。

> Nginx 部署简单，内存消耗少，成本低。

> Nginx 既可以做正向代理，也可以做反向代理。

> 正向代理：请求经过代理服务器从局域网发出，然后到达互联网上的服务器。  
特点：服务端并不知道真正的客户端是谁。  
反向代理：请求从互联网发出，先进入代理服务器，再转发给局域网内的服务器。  
特点：客户端并不知道真正的服务端是谁。  
区别：正向代理的对象是客户端。反向代理的对象是服务端。

#### 25. 简述 Django 下的（内建的）缓存机制？
> 一个动态网站的基本权衡点就是，它是动态的。每次用户请求页面，服务器会重新计算。从开销处理的角度来看，这比你读取一个现成的标准文件的代价要昂贵的多。  
这就是需要缓存的地方。  
Django 自带了一个健壮的缓存系统来保存动态页面这样避免对于每次请求都重新计算。方便起见，Django 提供了不同级别的缓存粒度：可以缓存特定视图的输出、可以仅仅缓存那些很难生产出来的部分、或者可以缓存整个网站 Django 也能很好的配合那些下游缓存， 比如 Squid 和基于浏览器的缓存。这里有一些缓存不必要直接去控制但是可以提供线索， (via HTTPheaders) 关于网站哪些部分需要缓存和如何缓存。  
设置缓存：  
缓存系统需要一些设置才能使用。也就是说，你必须告诉他你要把数据缓存在哪里 - 是数据库中，文件系统或者直接在内存中。这个决定很重要，因为它会影响你的缓存性能，是的，一些缓存类型要比其他的缓存类型更快速。  
你的缓存配置是通过 setting 文件的 CACHES 配置来实现的。这里有 CACHES 所有可配置的变量值。

> 参考文档：https://yiyibooks.cn/xx/django_182/topics/cache.html

#### 26. 请简述浏览器是如何获取一枚网页的？  
1. 在用户输入目的 URL 后，浏览器先向 DNS 服务器发起域名解析请求；  
2. 在获取了对应的 IP 后向服务器发送请求数据包；  
3. 服务器接收到请求数据后查询服务器上对应的页面，并将找到的页面代码回复给客户端；  
4. 客户端接收到页面源代码后，检查页面代码中引用的其他资源，并再次向服务器请求该资源；  
5. 在资源接收完成后，客户端浏览器按照页面代码将页面渲染输出显示在显示器上；

#### 27. 对 cookie 与 session 的了解？他们能单独用吗？
> Session 采用的是在服务器端保持状态的方案，而 Cookie 采用的是在客户端保持状态的方案。但是禁用 Cookie 就不能得到 Session。因为 Session 是用 Session ID 来确定当前对话所对应的服务器Session，而 Session ID 是通过 Cookie 来传递的，禁用 Cookie 相当于失去了 SessionID，也就得不到 Session。

#### 28.Django HTTP 请求的处理流程？Django 和其他 Web 框架的 HTTP 处理的流程大致相同，Django 处理一个 Request 的过程  
是首先通过中间件，然后再通过默认的 URL 方式进行的。我们可以在 Middleware 这个地方把所有 Request 拦截住，用我们自己的方式完成处理以后直接返回 Response。

1.  加载配置  
    Django 的配置都在 “Project/settings.py” 中定义，可以是 Django 的配置，也可以是自定义的配置，并且都通过 django.conf.settings 访问，非常方便。

2.  启动  
    最核心动作的是通过 django.core.management.commands.runfcgi 的 Command 来启动，它运行 django.core.servers.fastcgi 中的 runfastcgi，runfastcgi 使用了 flup 的 WSGIServer 来启动 fastcgi 。而 WSGIServer 中携带了 django.core.handlers.wsgi 的 WSGIHandler 类的一个实例，通过 WSGIHandler 来处理由 Web 服务器（比如 Apache，Lighttpd 等）传过来的请求，此时才是真正进入 Django 的世界。

3.  处理 Request  
    当有 HTTP 请求来时，WSGIHandler 就开始工作了，它从 BaseHandler 继承而来。WSGIHandler 为每个请求创建一个 WSGIRequest 实例，而 WSGIRequest 是从http.HttpRequest 继承而来。接下来就开始创建 Response 了。

4.  创建 Response  
    BaseHandler 的 get_response 方法就是根据 request 创建 response，而具体生成 response 的动作就是执行 urls.py 中对应的 view 函数了，这也是 Django 可以处理 “友好 URL” 的关键步骤，每个这样的函数都要返回一个 Response 实例。此时一般的做法是通过 loader 加载template 并生成页面内容，其中重要的就是通过 ORM 技术从数据库中取出数据，并渲染到Template 中，从而生成具体的页面了。

5.  处理 Response  
    Django 返回 Response 给 flup，flup 就取出 Response 的内容返回给 Web 服务器，由后者返回给浏览器。总之，Django 在 fastcgi 中主要做了两件事：处理 Request 和创建 Response，而它们对应的核心就是 “urls 分析”、“模板技术” 和 “ORM 技术”。

> ![](https://img.alicdn.com/imgextra/i2/296192965/O1CN01M8T4ev1Xm0yC0qYUi_!!296192965.png "null")

> 如图所示，一个 HTTP 请求，首先被转化成一个 HttpRequest 对象，然后该对象被传递给Request 中间件处理，如果该中间件返回了 Response，则直接传递给 Response 中间件做收尾处理。否则的话 Request 中间件将访问 URL 配置，确定哪个 view 来处理，在确定了哪个 view 要执行，但是还没有执行该 view 的时候，系统会把 request 传递给 view 中间件处理器进行处理，如果该中间件返回了 Response，那么该 Response 直接被传递给 Response 中间件进行后续处理，否则将执行确定的 view 函数处理并返回 Response，在这个过程中如果引发了异常并抛出，会被 Exception 中间件处理器进行处理。

#### 29.Django 里 QuerySet 的 get 和 filter 方法的区别？
1) 输入参数  
get 的参数只能是 model 中定义的那些字段，只支持严格匹配。  
filter 的参数可以是字段，也可以是扩展的 where 查询关键字，如 in，like 等。  

2) 返回值  
get 返回值是一个定义的 model 对象。  
filter 返回值是一个新的 QuerySet 对象，然后可以对 QuerySet 在进行查询返回新的 QuerySet 对象，支持链式操作，QuerySet 一个集合对象，可使用迭代或者遍历，切片等，但是不等于 list 类型(使用一定要注意)。  

3) 异常  
get 只有一条记录返回的时候才正常，也就说明 get 的查询字段必须是主键或者唯一约束的字段。当返回多条记录或者是没有找到记录的时候都会抛出异常  
filter 有没有匹配的记录都可以

#### 30.django 中当一个用户登录 A 应用服务器（进入登录状态），然后下次请求被 nginx 代理到 B 应用服务器会出现什么影响？
> 如果用户在 A 应用服务器登陆的 session 数据没有共享到 B 应用服务器，那么之前的登录状态就没有了。

#### 31. 跨域请求问题 django 怎么解决的（原理）
启用中间件
post 请求
验证码
表单中添加 csrf_token 标签

#### 32.Django 对数据查询结果排序怎么做，降序怎么做，查询大于某个字段怎么做？*   > 排序使用 order_by()
降序需要在排序字段名前加 `-`
查询字段大于某个值：使用 filter(字段名_gt = 值)

#### 33.Django 重定向你是如何实现的？用的什么状态码？
使用 HttpResponseRedirect
redirect 和 reverse
状态码：302,301

#### 34. 生成迁移文件和执行迁移文件的命令是什么？
```
python manage.py makemigrations
python manage.py migrate
```

#### 35. 关系型数据库的关系包括哪些类型？
ForeignKey：一对多，将字段定义在多的一端中。
ManyToManyField：多对对：将字段定义在两端中。
OneToOneField：一对一，将字段定义在任意一端中。

#### 36. 查询集返回列表的过滤器有哪些？
all() ：返回所有的数据
filter()：返回满足条件的数据
exclude()：返回满足条件之外的数据，相当于 sql 语句中 where 部分的 not 关键字
order_by()：排序

#### 37. 判断查询集正是否有数据？
> exists()：判断查询集中否有数据，如果有则返回 True，没有则返回 False。

#### 38.Django 本身提供了 runserver，为什么不能用来部署？
> runserver 方法是调试 Django 时经常用到的运行方式，它使用 Django 自带的 WSGI Server 运行，主要在测试和开发中使用，并且 runserver 开启的方式也是单进程。

> uWSGI 是一个 Web 服务器，它实现了 WSGI 协议、uwsgi、http 等协议。注意 uwsgi 是一种通信协议，而 uWSGI 是实现 uwsgi 协议和 WSGI 协议的 Web 服务器。uWSGI 具有超快的性能、低内存占用和多 app 管理等优点，并且搭配着 Nginx 就是一个生产环境了，能够将用户访问请求与应用 app 隔离开，实现真正的部署。相比来讲，支持的并发量更高，方便管理多进程，发挥多核的优势， 提升性能。

#### 39.apache 和 nginx 的区别？
> Nginx 相对 Apache 的优点：  
轻量级，同样起 web 服务，比 apache 占用更少的内存及资源；  
抗并发，nginx 处理请求是异步非阻塞的，支持更多的并发连接，而 apache 则是阻塞型的，在高并发下 nginx 能保持低资源低消耗高性能；  
配置简洁；  
高度模块化的设计，编写模块相对简单；  
社区活跃。  
Apache 相对 Nginx 的优点：  
rewrite ，比 nginx 的 rewrite 强大；  
模块超多，基本想到的都可以找到；  
少 bug ，nginx 的 bug 相对较多；  
超稳定。

#### 40.varchar 与 char 的区别？
> char 长度是固定的，不管你存储的数据是多少他都会都固定的长度。而 varchar 则处可变长度但他要在总长度上加 1 字符，这个用来存储位置。所以在处理速度上 char 要比 varchar 快速很多，但是对费存储空间，所以对存储不大，但在速度上有要求的可以使用 char 类型，反之可以用 varchar 类型。

#### 41. 查询集两大特性？惰性执行？
> 惰性执行、缓存。  
创建查询集不会访问数据库，直到调用数据时，才会访问数据库，调用数据的情况包括迭代、序列化、与 if 合用

#### 42.git 常用命令？
> git clone 克隆指定仓库  
git status 查看当前仓库状态  
git diff 比较版本的区别  
git log 查看 git 操作日志  
git reset 回溯历史版本  
git add 将文件添加到暂存区  
git commit 将文件提交到服务器  
git checkout 切换到指定分支 
git rm 删除指定文件

#### 43. 电商网站库存问题
一般团购，秒杀，特价之类的活动，这样会使访问量激增，很多人抢购一个商品，作为活动商品，库存肯定是很有限的。控制库存问题，数据库的事务功能是控制库存超卖的有效方式。  

1. 在秒杀的情况下，肯定不能如此频率的去读写数据库，严重影响性能问题，必须使用缓存，将需要秒杀的商品放入缓存中，并使用锁来处理并发情况，先将商品数量增减（加锁、解析）后在进行其他方面的处理，处理失败再将数据递增（加锁、解析）, 否则表示交易成功。  
2. 这个肯定不能直接操作数据库的，会挂的。直接读库写库对数据库压力太大了，要用到缓存。  
3. 首先，多用户并发修改同一条记录时，肯定是后提交的用户将覆盖掉前者提交的结果了。这个直接可以使用加乐观锁的机制去解决高并发的问题。

#### 44.HttpRequest 和 HttpResponse 是什么？干嘛用的？
> HttpRequest 是 django 接受用户发送多来的请求报文后，将报文封装到 HttpRequest 对象中去。  
HttpResponse 返回的是一个应答的数据报文。render 内部已经封装好了 HttpResponse 类。 视图的第一个参数必须是 HttpRequest 对象，两点原因：表面上说，他是处理 web 请求的，所以必须是请求对象，根本上说，他是基于请求的一种 web 框架，所以，必须是请求对象。  
因为 view 处理的是一个 request 对象，请求的所有属性我们都可以根据对象属性的查看方法来获取具体的信息：格式：request. 
属性  
request.path 请求页面的路径，不包含域名  
request.get_full_path 获取带参数的路径  
request.method 页面的请求方式  
request.GET GET 请求方式的数据  
request.POST POST 请求方式的数据  
request.COOKIES 获取 cookie  
request.session 获取 session  
request.FILES 上传图片（请求页面有 enctype=multipart/form-data 属性时 FILES 才有数据。  
？a=10 的键和值时怎么产生的，键是开发人员在编写代码时确定下来的，值时根据数据生成或者用户填写的，总之是不确定的。  
403 错误：表示资源不可用，服务器理解客户的请求，但是拒绝处理它，通常由于服务器上文件和目录的  
权限设置导致的 web 访问错误。如何解决：1、把中间件注释。2、在表单内部添加 {% scrf_token %}  
request.GET.get() 取值时如果一键多值情况，get 是覆盖的方式获取的。getlist（）可以获取多个值。  
在一个有键无值的情况下，该键名 c 的值返回空。有键无值：c: getlist 返回的是列表，空列表  
在无键无值也没有默认值的情况下，返回的是 None 无键无值：e:None  
HttpResponse 常见属性：  
content： 表示返回的内容  
charset: 表示 response 采用的编码字符集，默认是 utf-8  
status_code: 返回的 HTTP 响应状态码 3XX 是对请求继续进一步处理，常见的是重定向。  
常见方法：  
init: 创建 httpResponse 对象完成返回内容的初始化  
set_cookie：设置 Cookie 信息：格式：set_cookies(key’,’value’,max_age=None,expires=None)  
max_age 是一个整数，表示指定秒数后过期，expires 指定过期时间，默认两个星期后过期。  
write 向响应体中写数据  
应答对象：  
方式一：render(request,index.html) 返回一个模板  
render(request,index.html, context) 返回一个携带动态数据的页面  
方式二：render_to_response(index.html) 返回一个模板页面  
方式三：redirect(/) 重定向  
方式四：HttpResponseRdeirect(/) 实现页面跳转功能  
方式五：HttpResponse（itcast1.0) 在返回到额页面中添加字符串内容  
方式六：HttpResponseJson() 返回的页面中添加字符串内容。  
JsonResponse 创建对象时候接收字典作为参数，返回的对象是一个 json 对象。  
能接收 Json 格式数据的场景，都需要使用 view 的 JsonResponse 对象返回一个 json 格式数据  
ajax 的使用场景，页面局部刷新功能。ajax 接收 Json 格式的数据。  
在返回的应答报文中，可以看到 JsonResponse 应答的 content-Type 内容是 application/json  
ajax 实现网页局部刷新功能：ajax 的 get() 方法获取请求数据 ajax 的 each() 方法遍历输出这些数据

#### 45. 什么是反向解析
> 使用场景：模板中的超链接，视图中的重定向  
使用：在定义 url 时为 include 定义 namespace 属性，为 url 定义 name 属性

> 在模板中使用 url 标签：{% url namespace_value:name_value’%}  
在视图中使用 reverse 函数：redirect(reverse(namespce_value:name_value’))  
根据正则表达式动态生成地址，减轻后期维护成本。  
注意反向解析传参数，主要是在我们的反向解析的规则后面天界了两个参数，两个参数之间使用空格隔开：位置参数

#### 46.Django 日志管理：
> 配置好之后：
```
import logging
logger=logging.getLogger(name) # 为 loggers 中定义的名称
logger.info("some info ...)
```

> 可用函数有：logger.debug() logger.info() logger.warning() logger.error()  
Django 文件管理：对于 jdango 老说，项目中的 css，js, 图片都属于静态文件，我们一般会将静态文件放到一个单独的目录中，以方便管理，在 html 页面调用时，也需要指定静态文件的路径。静态文件可以放在项目根目录下，也可以放在应用的目录下，由于这些静态文件在项目中是通用的，所以推荐放在项目的根目录下。  
在生产中，只要和静态文件相关的，所有访问，基本上没有 django 什么事，一般都是由 nignx 软件代劳了，为什么？因为 nginx 就是干这个的。

##### .uWSGI 与 uwsgi 区别
> uWSGI 是一个 Web 服务器，它实现了 WSGI 协议、uwsgi、http 等协议。注意 uwsgi 是一种通信协议，而 uWSGI 是实现 uwsgi 协议和 WSGI 协议的 Web 服务器。uWSGI 具有超快的性能、低内存占用和多 app 管理等优点，并且搭配着 Nginx 就是一个生产环境了，能够将用户访问请求与应用 app 隔离开，实现真正的部署。相比来讲，支持的并发量更高，方便管理多进程，发挥多核的优势，提升性能。

##### . 什么是 gitlab,github 和 gitlab 的区别？
> ** 参考博客:**https://blog.csdn.net/zhang_oracle/article/details/77317717

##### . git 中 .gitignore 文件的作用？
> ** 参考博客:**https://www.cnblogs.com/kevingrace/p/5690241.html

### 三、Tornado
#### 1. Tornado 的核是什么？
Tornado 的核心是 ioloop 和 iostream 这两个模块，前者提供了一个高效的 I/O 事件循环，后者则封装了一个无阻塞的 socket 。
通过向 ioloop 中添加网络 I/O 事件，利用无阻塞的 socket，再搭配相应的回调函数，便可达到梦寐以求的高效异步执行。
