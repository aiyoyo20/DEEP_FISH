1. Flask框架的优点
Flask框架是一个短小精悍、可扩展性强的web框架。html

2. Flask框架依赖组件
Flask依赖于werkzurg组件，实现wsgi使用的就是werkzurg。web

3. Flask蓝图的做用
实际项目中，须要进行项目目录结构的划分，蓝图就是用来帮助开发者进行目录结构的划分。redis

4. 列举使用过的Flask第三方组件
werkzurg、DBUtils、wtforms、SQLAlchemy、jinjia二、redis……sql

5. 简述Flask上下文管理流程
1. 请求到来时，将session和request封装到ctx对象中；2.对session作补充；3.将包含了request和session的ctx对象放到一个容器中（每一个请求都会根据线程/协程加一个惟一标识）；4.视图函数使用的时候须要根据当前线程或协程的惟一标识，获取ctx对象，再取ctx对象中取request和session（视图函数使用的时候，须要根据当前线程获取数据。）5.请求结束时，根据当前线程/协程的惟一标记，将这个容器上的数据移除。数据库

6. Flask中的g的做用
7. Flask中上下文管理主要涉及到了哪些相关的类，这些类的主要做用
1. LocalStack它帮助咱们在local中把一个列表维护成一个栈，方便咱们对列表中的数据进行添加和维护，有了LocalStack操做更加便捷。2. Local帮助咱们为每一个线程/协程开辟空间flask

8. 为何Flask要把Local对象中的值stack维护成一个列表
9. Flask中多app应用是怎么完成
使用Flask类建立不一样的app对象，而后借助DispatcherMiddleware类来实现。cookie

10. 在Flask中实现WebSocket须要什么组件
11. wtforms组件的做用
wtforms组件有两个做用，自动生成html标签和对用户请求数据进行校验。session

12. Flask框架默认session的处理机制
当请求刚进来时，Flask读取cookie中session对应的值，将该值解密并反序列化为字典，放入内存以便视图函数使用。 当请求结束时，Flask会读取内存中字典的值，进行序列化加密，写入到用户的cookie中。多线程

13. 解释Flask框架中的Local对象和threading.local对象的区别
Local对象是根据threading.local作的。app

14. Flask中 blinker 是什么

15. SQLAlchemy中的session和scoped_session的区别
使用的scoped_session是基于Threading.Local实现的，而session并非。

16. SQLAlchemy如何执行原生SQL
我只记住了两种SQLAlchemy能够执行原生sql的方式，第一种是经过session(会话)对象执行execute方法，第二种是经过cursor(游标)对象执行execute方法。

第一种是：
session = scoped_session(SessionFactory)
session.execute('insert users(name) values(:value)', params={'value': 'thanlon'})

第二种是：
conn = engine.raw_connection()
cursor = conn.cursor()
cursor.execute('select *from users')

17. ORM的实现原理

18. DBUtils模块的做用
DBUtils模块的做用是实现数据库链接池，是为了解决“多线程状况下请求比较多时性能下降”的问题。

19. 如下SQLAlchemy的字段是否正确，若是不正确请更正
```
# -*- coding: utf-8 -*-
from datetime import datetime
from sqlalchemy.ext.declarative
import declarative_base

from sqlalchemy import Column, Integer, String, DateTime

Base = declarative_base()

class UserInfo(Base):
    __tablename__ = 'userinfo'
    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(64), unique=True)
    ctime = Column(DateTime, default=datetime.now())
```

20. SQLAchemy中如何为表设置引擎和字符编码

21. SQLAchemy中如何设置联合惟一索引
首先在中间表(关联表)的类中加入__table_args__ 字段，而后实例化UniqueConstraint类并放入一个元组中，最后把这个元组赋值给__table_args__。用代码表示以下：

__table_args__ = (
        UniqueConstraint('student_id', 'course_id', name='uc_student_course'),  # 联合惟一索引
)

22. Flask请求相关的数据和Django的区别
Flask是直接调用request对象来请求相关的数据，而Django是经过参数传递实现的。

23. Flask和Django最大的区别
对于request，falsk是导入进来的，而Django是参数传递的；对于session，flask也导入进来的，而Django是依附request对象传递过来的。

24. Flask若是开了两个进程，有几个local对象