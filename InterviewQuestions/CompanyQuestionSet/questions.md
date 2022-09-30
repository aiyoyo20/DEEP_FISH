## 第十一章 企业真题实战 
### 一、360 面试题
#### 1. 请拿出 B 表中的 accd，(A 表中和 B 表中的一样的数据)？
```select * from B inner join on B.name = A.name```

#### 2. a = 'abbbccc'，用正则匹配为 abccc, 不管有多少 b，就出现一次？
```
思路：不管有多少个 b 替换成一个 
re.sub(r'b+', 'b', a)
```

#### 3. xpath 使用的什么库？
lxml

####5. Redis 里面 list 内容的长度？
len(key_name)

#### 6. 多线程交互，访问数据，如果访问到了就不访问了，怎么避免重读？
创建一个已访问数据列表，用于存储已经访问过的数据，并加上互斥锁，在多线程访问数据的时候先查看数据是否已经在已访问的列表中，若已存在就直接跳过。

#### 7. Mysql 怎么限制 IP 访问？
`grant all privileges on . to 数据库中用户名'@'ip 地址' identified by 数据库密码';`

#### 8. 带参数的装饰器？
带定长参数的装饰器。
```
def new_func(func): 
def wrappedfun(username,passwd): 
if username == 'root' and passwd == '123456789': 
print(' 通过认证！') 
print(' 开始执行附加功能 ') 
return func() 
else: 
print(' 用户名或密码错误 ') 
return 
return wrappedfun 

@new_func 
def orign(): 
print(' 开始执行函数 ') 
orign('root','123456789')
```

带不定长参数的装饰器。
```
def new_func(func): 
def wrappedfun(*parts): 
if parts: 
counts = len(parts) 
print(' 本系统包含 ', end='') 
for part in parts: 
print(part, ' ', end='') 
print(' 等 ', counts, ' 部分 ') 
return func() 
else: 
print(' 用户名或密码错误 ') 
return func() 
return wrappedfun 

@new_func 
def orign(): 
print(' 开始执行函数 ') 
 orign(' 硬件 ', ' 软件 ', ' 用户数据 ')
```

同时带不定长、关键字参数的装饰器。
```
def new_func(func): 
def wrappedfun(*args,**kwargs): 
if args: 
counts = len(args) 
print(' 本系统包含 ',end='') 
for arg in args: 
print(arg,' ',end='') 
print(' 等 ',counts,' 部分 ') 
if kwargs: 
for k in kwargs: 
v= kwargs [k] 
print(k,' 为：',v) 
return func() 
else: 
if kwargs: 
for kwarg in kwargs: 
print(kwarg) 
k,v = kwarg 
print(k,' 为：',v) 
return func() 
return wrappedfun 

@new_func 
def orign(): 
print(' 开始执行函数 ') 
orign(' 硬件 ',' 软件 ',' 用户数据 ', 总用户数 = 5, 系统版本 ='CentOS 4')
```

### 二、妙计旅行面试题
#### 1. Python 主要的内置数据类型有哪些？
Python 主要的内置数据类型有：str，int，float，tuple，list，dict，set。

#### 2. print(dir(‘a')) 输出的是什么？
会打印出字符型的所有的内置方法。
```
['__add__', '__class__', '__contains__', '__delattr__', '__doc__', '__eq__', '__format__', '__ge__', '__getattribute__', '__getitem__', '__getnewargs__', '__getslice__', '__gt__', '__hash__', '__init__', '__le__', '__len__', '__lt__', '__mod__', '__mul__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__rmod__', '__rmul__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '_formatter_field_name_split', '_formatter_parser', 'capitalize', 'center', 'count', 'decode', 'encode', 'endswith', 'expandtabs', 'find', 'format', 'index', 'isalnum', 'isalpha', 'isdigit', 'islower', 'isspace', 'istitle', 'isupper', 'join', 'ljust', 'lower', 'lstrip', 'partition', 'replace', 'rfind', 'rindex', 'rjust', 'rpartition', 'rsplit', 'rstrip', 'split', 'splitlines', 'startswith', 'strip', 'swapcase', 'title', 'translate', 'upper', 'zfill']
```

#### 3. 给定两个 list，A 和 B，找出相同元素和不同元素？
A、B 中相同元素：print(set(A)&set(B))
A、B 中不同元素：print(set(A)^set(B))

#### 4. 请反转字符串？
`new_str = old_str [::-1]`

#### 5. 交换变量 a,b 的值？
`a,b = b,a`

#### 6. 用 select 语句输出每个城市中心距离市中心大于 20km 酒店数？
`select count（hotel）i from hotel_table where distance >20 group by city`

#### 7. 给定一个有序列表，请输出要插入值 k 所在的索引位置？
```
def index(list, key): 
if key <list [0]: 
position = 0 
elif key > list [-1]: 
position = len(list) 
else: 
for i in range(len(list)): 
if key>list [i] and list [i+1]>key: 
position = i+1 
 return position
```

#### 8. 正则表达式贪婪与非贪婪模式的区别？
在形式上非贪婪模式有一个？作为该部分的结束标志。 在功能上贪婪模式是尽可能多的匹配当前正则表达式，可能会包含好几个满足正则表达式的字符串，非贪婪模式，在满足所有正则表达式的情况下尽可能少的匹配当前正则表达式。

#### 9. 写出开头匹配字母和下划线，末尾是数字的正则表达式？
`^[A-Za-z]|_.*\d$`

#### 10. 请说明 HTTP 状态码的用途，请说明常见的状态码机器意义？
通过状态码告诉客户端服务器的执行状态，以判断下一步该执行什么操作。
常见的状态机器码有:
100-199：表示服务器成功接收部分请求，要求客户端继续提交其余请求才能完成整个处理过程。
200-299：表示服务器成功接收请求并已完成处理过程，常用 200（OK 请求成功）。
300-399：为完成请求，客户需要进一步细化请求。302（所有请求页面已经临时转移到新的 url），
304、307（使用缓存资源）。
400-499：客户端请求有错误，常用 404（服务器无法找到被请求页面），403（服务器拒绝访问，权限不够）。
500-599：服务器端出现错误，常用 500（请求未完成，服务器遇到不可预知的情况）。

#### 11. 当输入 http://www.itheima.com 时，返回页面的过程中发生了什么？
1) 浏览器向 DNS 服务器发送 itheima.com 域名解析请求；
2) DNS 服务器返回解析后的 ip 给客户端浏览器，浏览器想该 ip 发送页面请求；
3) DNS 服务器接收到请求后，查询该页面，并将页面发送给客户端浏览器；
4) 客户端浏览器接收到页面后，解析页面中的引用，并再次向服务器发送引用资源请求；
5) 服务器接收到资源请求后，查找并返回资源给客户端；
6) 客户端浏览器接收到资源后，渲染，输出页面展现给用户。

#### 12. 有一个多层嵌套列表 A=[1,2,[3.4 ['434',[…]]]] 请写一段代码遍历 A 中的每一个 元素并打印出来。
思路：就是有几个嵌套链表就用几个 for 循环进行迭代，然后对最后一个结果进行打印。
```
a= ["a","b",["1","3",["4","haha"]]] 
for b in a : 
for c in b : 
 for d in c : 
 print(d)
```

#### 13. 关系型数据库中，表和表之间有左连接，内连接，外连接，分别解释下他们的 含义和区别？
内连接查询：查询的结果为两个表匹配到的数据。
右接查询：查询的结果为两个表匹配到的数据，右表特有的数据，对于左表中不存在的数据使用 null 填充。
左连接查询：查询的结果为两个表匹配到的数据，左表特有的数据，对于右表中不存在的数据使用 null 填充。

#### 14. 如何定时启动你的爬虫项目：
1.最简单的方法：直接使用 Timer 类
```
import time 
import os 
while True: 
os.system("scrapy crawl News") 
time.sleep(86400)#每隔一天运行一次 24*60*60=86400s
```

2.使用 sched
```
import sched 
# 初始化 sched 模块的 scheduler 类 
# 第一个参数是一个可以返回时间戳的函数，第二个参数可以在定时未到达之前阻塞。 
schedule = sched.scheduler(time.time, time.sleep) 
# 被周期性调度触发的函数 
def func(): 
os.system("scrapy crawl News") 
def perform1(inc): 
schedule.enter(inc,0,perform1,(inc,)) 
func()# 需要周期执行的函数 
def mymain(): 
schedule.enter(0,0,perform1,(86400,)) 
if __name__=="__main__": 
mymain() 
schedule.run()# 开始运行，直到计划时间队列变成空为止
```

#### 15. 什么是 scrapy-redis 中的指纹，是如何去重的？
指纹：通过 sha1 加密，把请求体，请求方式，请求 url 放在一起。然后进行 16 进制的转义符字符串生成指纹。生成一个字符串，放到数据库中作为唯一标示。 
去重：urll 中按照 url 去重：
1. 按照 url 去重，有一个列表，发送请求之前从数据表中看一下这个 url 有没有请求过，请求过了就不用看了 
2，内容判断，从数据库中查数据的表示，如果请求过了就在不在请求了。

#### 16. 代码优化从哪些方面考虑？有什么想法？
1. 优化算法时间复杂度。
2. 减少冗余数据。
3. 合理使用 copy 与 deepcopy。
4. 使用 dict 或 set 查找元素。
5. 合理使用生成器（generator）和 yield。
6. 优化循环。
7. 优化包含多个判断表达式的顺序。
8. 使用 join 合并迭代器中的字符串。
9. 选择合适的格式化字符方式。
10 不借助中间变量交换两个变量的值。
11. 使用 if is。
12. 使用级联比较 x < y < z。
13.while 1 比 while True 更快。
14. 使用 ** 而不是 pow。
15. 使用 cProfile, cStringIO 和 cPickle 等用 c 实现相同功能（分别对应 profile, StringIO, pickle）的包。
16. 使用最佳的反序列化方式。
17. 使用 C 扩展(Extension)。
18. 并行编程。
19. 终级大杀器：PyPy。
20. 使用性能分析工具。

#### 17. Django 项目的优化（web 通用）
1.优化数据库查询
 1.1 一次提供所有数据
 1.2 仅提供相关的数据
2.代码优化
 2.1 简化代码
 2.2 更新或替代第三方软件包
 2.3 重构代码

### 三、智慧星光面试题
这家公司主要做舆情分析，问题主要集中在页面解析和 Selenium+Phantom JS 解析复杂页面，ajax 页面请求等，图片识别，机器学习。
#### 1. 定义 A=('a', 'b', 'c', 'd'), 执行 del A[2] 后的结果为： D
A: (a, c, d)
B: (a, b, c)
C: (a, b, d)
D: 异常

`TypeError: 'tuple' object doesn't support item deletion`

#### 2. String = '{1},{0}'; string = string.format('Hello', 'Python'), 请问将 string 打印出来为（C）
A: Hello Python
B: {1},{0}
C:Python,Hello
D:Hello,Hello

#### 3. 定义 A=[1,2,3,4], 使用列表生成式 [i*i for i in A] 生成列表为：B
A: [1, 2, 3, 4]
B: [1, 4, 9, 16]
C: [1, 4, 6, 8]
D: [1, 4, 9, 12]

#### 4. 请对 Python 数据结构 Tuple,List,Dict 进行操作
1.如何让元祖内部可变（叙述或简单定义）?
元祖变成列表，比如：
```
A =(1,2,3,4) 
A = list(A)
```
2. 如何将 L1 = [1,2,3,4,5],L2 = [6,7,8,9]; 使用列表内置函数变成 L1=[1,2,3,4,5,6,7,8,9]?
L1.extend(L2)。 

3. 如何将字典 D={'Adam': 95, 'Lisa': 85, 'Bart': 59} 中的值'Adam'删除？
del D['Adam']。

4. 请按照如下格式 K：V 打印出字典？
```
for k,v in D.items(): 
print(k,":",v)
```

#### 5. 请用 Python 内置函数处理以下问题？
1. 请判断一个字符串是否以 er 结尾？
使用 endswith 函数，比如：
```
Str1 ="nihaoer"print(Strendswith("er"))
```

2. 请将 #teacher# 两侧的 #去掉
```
str ="#tea#"
b = str.replace("#","").strip()
```

3. 请使用 map 函数将 [1,2,3,4] 处理成 [1,0,1,0]
```
def f(x): 
if x%2 == 0: 
return 0 
else: 
return 1 
b = map(f,[1,2,3,4]) 
print(list(b))
```

4. 请使用 filter 函数将 [1,2,3,4] 处理成 [2,4]?
```
def f(x): 
if x%2 == 0: 
return x 
b = filter(f,[1,2,3,4]) 
print(list(b))
```

#### 5. 请使用 reduce 函数计算 100 的阶乘？> reduce() 函数在库 functools 里，如果要使用它，要从这个库里导入。reduce 函数与 map 函数有不一样地方，map 操作是并行操作，reduce 函数是把多个参数合并的操作，也就是从多个条件简化的结果，在计算机的算法里，大多数情况下，就是为了简单化。比如识别图像是否是一只猫，那么就是从众多的像素里提炼出来一个判断：是或否。可能是几百万个像素，就只出来一个结果。在 google 大规模集群里，就是利用这个思想，把前面并行处理的操作叫做 map，并行处理之后的结果，就需要简化，归类，把这个简化和归类的过程就叫做 reduce。由于 reduce 只能在一台主机上操作，并不能分布式地处理，但是 reduce 处理的是 map 结果，那么意味着这些结果已经非常简单，数据量大大减小，处理起来就非常快。因此可以把 mapreduce 过程叫做分析归纳的过程。
```
from functools import reduce 
sum=reduce(lambda x,y:x*y,range(1,101)) 
print(sum)
```

####6. 现在需要从一个简单的登陆网站获取信息，请使用 Python 写出简要的登陆函数的具体实现？（登录信息只包含用户名，密码）
```
session = requests.session() 
response = session.get(url,headers)
```
#### 7. 正则表达式操作
1. 匹配手机号
分析：
 （1）手机号位数为 11 位；
 （2）开头为 1，第二位为 3 或 4 或 5 或 7 或 8;
表达式为：/1 [3,4,5,7,8][0-9]{9}$/; 。

2. 请匹配出变量 A = json({Adam:95,Lisa:85,Bart:59}) 中的 json 字符串。
```
A = 'json({"Adam":95,"Lisa":85,"Bart":59})' 
b = re.search(r'json.*?({.*?}).*',A,re.S) 
print(b.group(1))
```

3. 怎么过滤评论中的表情？
```
co = re.compile(u'[\uD800-\uDBFF][\uDC00-\uDFFF]')
co.sub('',text)
```

### 四、壹讯面试题
#### 1. Python 中 pass 语句的作用是什么？
在编写代码时只写框架思路，具体实现还未编写就可以用 pass 进行占位，使程序不报错，不会进行任何操作。

#### 2. 生成一个斐波那契数列？
```
# [] 列表实现 
def fibonacci(num): 
fibs = [0, 1] 
for i in range(num - 2): 
fibs.append(fibs [-2] + fibs [-1])# 倒数第二个 + 倒数第一个数的结果，追加到列表 
print(fibs) 

# yield 实现 
def fab_demo4(max): 
a,n,b = 0,0,1 
while n < max: 
yieldb 
#print b 
a,b = b,a+b 
n+=1 

print(next(fab_demo4(5))) 
for i in fab_demo4(8): 
print(i)
```
#### 3. 说明一下 os.path 和 sys.path 分别代表什么？
os.path 主要是用于用户对系统路径文件的操作。
sys.path 主要用户对 Python 解释器的系统环境参数的操作。

#### 4. 什么是 lambda 函数？ 有什么好处？
lambda 函数是一个可以接收任意多个参数(包括可选参数) 并且返回单个表达式值的函数。
1、lambda 函数比较轻便，即用即仍，很适合需要完成一项功能，但是此功能只在此一处使用，连名字都很随意的情况下；
2、匿名函数，一般用来给 filter， map 这样的函数式编程服务；3、作为回调函数，传递给某些应用，比如消息处理。

### 五、H3C 面试题
#### 1. 下列哪个语句在 Python 中是非法的？(B)
> A、x=y=z=1
B、x=(y=z+1)
C、x,y=y,x
D、x +=y

#### 2. 关于 Python 内存管理，下列说法错误的是(B)
A、变量不必事先声明 
B、变量无须先创建和赋值而直接使用
C、变量无须指定类型 
D、可以使用 del 释放资源

#### 3. 下面哪个不是 Python 合法的标识符(b)
A、int32
B、40XL
C、self
D、name

`第一个字符必须是字母或是下划线`

#### 4. 下列哪种说法是错误的（A）
A、除字典类型外，所有标准对象均可以用于布尔测试
B、空字符串的布尔值是 False
C、空列表对象的布尔值是 Fale
D、值为 0 的任何数字对象的布尔值是 False

#### 5. 下列表达式的值为 True 的是（C）
A、5+4j>2-3j
B、3>2>2
C、(3,2)<('a','b')
D、'abc'>xyz

备注：在 Python3 中 整数和字符不可以使用运算符做比较，在 Python2 中可以。

#### 6. Python 不支持的数据类型有(A)
A、char B、int C、 float D、list

#### 7. 关于 Python 中的复数，下列说法错误的是 C
A、表示复数的语法是 real+ image j 
B、实部和虚部都是浮点数
C、虚部必须后缀 j, 且必须是小写 
D、方法 conjugate 返回复数的共轭

### 六、通联数据
#### 1. 说一下你对多线程的看法？> 答案详见第三章→七。系统编程。
#### 2. 多线程和多线程有什么区别？> 答案详见第三章→七。系统编程。
#### 3. 进程间的数据共享和线程间数据共享？
进程间数据共享：
多进程中，每个进程都是独立的，各自持有一份数据，无法共享。
Queue：
```
from multiprocessing import queues 
import multiprocessing 

def func(i, q): 
q.put(i) 
print("--->", i, q.qsize()) 

q = queues.Queue(9, ctx=multiprocessing) 

for i in range(5): 
p = multiprocessing.Process(target=func, args=(i, q,)) 
p.start() 
p.join()
```
Queue 是多进程安全的队列，可以使用 Queue 实现多进程之间的数据传递。put 方法用以插入数据到队列中，put 方法还有两个可选参数：blocked 和 timeout。如果 blocked 为 True（默认值），并且 timeout 为正值，该方法会阻塞 timeout 指定的时间，直到该队列有剩余的空间。如果超时，会抛出 Queue.Full 异常。如果 blocked 为 False，但该 Queue 已满，会立即抛出 Queue.Full 异常。 get 方法可以从队列读取并且删除一个元素。同样，get 方法有两个可选参数：blocked 和 timeout。如果 blocked 为 True（默认值），并且 timeout 为正值，那么在等待时间内没有取到任何元素，会抛出 Queue.Empty 异常。如果 blocked 为 False，有两种情况存在，如果 Queue 有一个值可用，则立即返回该值，否则，如果队列为空，则立即抛出 Queue.Empty 异常。
```
import multiprocessing 

def func(i, q): 
q.put(i) 
print("--->", i, q.qsize()) 

q = multiprocessing.Queue() 

for i in range(5): 
p = multiprocessing.Process(target=func, args=(i, q,)) 
p.start() 
p.join()
```

#### 4. Redis 数据库结构有那些？
String（字符串），Hash（哈希），List（列表），Set（集合）及 zset(sortedset：有序集合

#### 5. MonggoDB 中存入了 100 万条数据，如何提高查询速度？
索引在很多数据库中是提高性能的标志优化手段，所以在大数据量的情况下索引可以提高数据的查询速度，如果没有索引 MongoDB 会扫描全部数据，才能获取满足条件的内容，在关系数据库中可以使用强制索引方式查询数据库，确保更准确快速的查询到满足条件的数据。
语法：
1、ensureIndex() 基本语法 1 创建升序索引 -1 创建降序索引
2、mongodb 默认所以字段 _id , 创建文档，会自动创建，此索引不能删除由 mongodb 自己维护相关参数：
unique 创建唯一索引，默认 false ，true 必须唯一索引，否则报错
实例：1、创建升序索引
```
db.user.ensureIndex({age:1});
db.user.find({age:{$gte:20}});
```

#### 6. 如何提高并发性能？
我们常规处理并发的解决方案：
1. 动态页面静态化。
2. 制作数据库散列表，即分库分表。
3. 增加缓存。
4. 增加镜像。
5. 部署集群。
6. 负载均衡。
7. 异步读取，异步编程。
8. 创建线程池和自定义连接池，将数据持久化。
9. 把一件事，拆成若干件小事，启用线程，为每个线程分配一定的事做，多个线程同时进行把该事件搞定再合并。

#### 7. 归并排序的时间复杂度？
合并排序是比较复杂的排序，特别是对于不了解分治法基本思想的同学来说可能难以理解。总时间 = 分解时间 + 解决问题时间 + 合并时间。分解时间就是把一个待排序序列分解成两序列，时间为一常数，时间复杂度 o(1). 解决问题时间是两个递归式，把一个规模为 n 的问题分成两个规模分别为 n/2 的子问题，时间为 2T(n/2). 合并时间复杂度为 o（n）。总时间 T(n)=2T(n/2)+o(n). 这个递归式可以用递归树来解，其解是 o(nlogn). 此外在最坏、最佳、平均情况下归并排序时间复杂度均为 o(nlogn). 从合并过程中可以看出合并排序稳定。
用递归树的方法解递归式 T(n)=2T(n/2)+o(n): 假设解决最后的子问题用时为常数 c，则对于 n 个待排序记录来说整个问题的规模为 cn。
从这个递归树可以看出，第一层时间代价为 cn，第二层时间代价为 cn/2+cn/2=cn…… 每一层代价都是 cn，总共有 logn+1 层。所以总的时间代价为 cn*(logn+1). 时间复杂度是 o(nlogn)。

### 七、北京号外科技爬虫面试题
#### 1. 单引号、双引号、三引号的区别？
这几个符号都是可以表示字符串的，如果是表示一行，则用单引号或者双引号表示，它们的区别是如果内容里有 " 符号，并且你用双引号表示的话则需要转义字符，而单引号则不需要。 三单引号和三双引号也是表示字符串，并且可以表示多行，遵循的是所见即所得的原则。 另外，三双引号和三单引号可以作为多行注释来用，单行注释用 #号。

#### 2. 如何在一个 function 里面设置一个全局变量？
Global 声明。

#### 3. 描述 yield 使用场景？
生成器。 当有多个返回值时，用 return 全部一起返回了，需要单个逐一返回时可以用 yield。

#### 4. 生成 1~10 之间的整数？
for i in range(1,11)
生成器：(i for i in range(1,10))

#### 5. Python 如何生成缩略图？
```
import os 
import glob 
from PIL import Image 
def thumbnail_pic(path): 
a=glob.glob(r'./*.jpg') 
for x in a: 
name=os.path.join(path,x) 
im=Image.open(name) 
im.thumbnail((80,80)) 
print(im.format,im.size,im.mode) 
im.save(name,'JPEG') 
print('Done!') 
if __name__=='__main__': 
path='.' 
thumbnail_pic(path）
```

#### 6. 列出比较熟悉的爬虫框架，并简要说明？
(1) Scrapy 框架：很强大的爬虫框架，可以满足简单的页面爬取（比如可以明确获知 url pattern 的情况）。用这个框架可以轻松爬下来如亚马逊商品信息之类的数据。但是对于稍微复杂一点的页面，如 weibo 的页面信息，这个框架就满足不了需求了。
(2) Crawley: 高速爬取对应网站的内容，支持关系和非关系数据库，数据可以导出为 JSON、XML 等
(3) Portia: 可视化爬取网页内容
(4) newspaper: 提取新闻、文章以及内容分析
(5) python-goose:java 写的文章提取工具
(6) Beautiful Soup: 名气大，整合了一些常用爬虫需求。缺点：不能加载 JS。
(7) mechanize: 优点：可以加载 JS。缺点：文档严重缺失。不过通过官方的 example 以及人肉尝试的方法，还是勉强能用的。
(8) selenium: 这是一个调用浏览器的 driver，通过这个库你可以直接调用浏览器完成某些操作，比如输入验证码。
(9) cola: 一个分布式爬虫框架。项目整体设计有点糟，模块间耦合度较高。

#### 7. 列举常见的反爬技术，并给出应对方案？
`1. Headers：`
从用户的 headers 进行反爬是最常见的反爬虫策略。Headers（上一讲中已经提及） 是一种区分浏览器行为和机器行为中最简单的方法，还有一些网站会对 Referer （上级链接）进行检测（机器行为不太可能通过链接跳转实现）从而实现爬虫。
解决措施：通过审查元素或者开发者工具获取相应的 headers 然后把相应的 headers 传输给 python 的 requests，这样就能很好地绕过。

`2. IP 限制`
一些网站会根据你的 IP 地址访问的频率，次数进行反爬。也就是说如果你用单一的 IP 地址访问频率过高，那么服务器会在短时间内禁止这个 IP 访问。
解决措施：构造自己的 IP 代理池，然后每次访问时随机选择代理（但一些 IP 地址不是非常稳定，需要经常检查更新）。

`3. UA 限制`
UA 是用户访问网站时候的浏览器标识，其反爬机制与 ip 限制类似。
解决措施：构造自己的 UA 池，每次 python 做 requests 访问时随机挂上 UA 标识，更好地模拟浏览器行为。当然如果反爬对时间还有限制的话，可以在 requests 设置 timeout（最好是随机休眠，这样会更安全稳定，time.sleep()）。

`4. 验证码反爬虫或者模拟登陆`
验证码：这个办法也是相当古老并且相当的有效果，如果一个爬虫要解释一个验证码中的内容，这在以前通过简单的图像识别是可以完成的，但是就现在来讲，验证码的干扰线，噪点都很多，甚至还出现了人类都难以认识的验证码。
解决措施：验证码识别的基本方法：截图，二值化、中值滤波去噪、分割、紧缩重排（让高矮统一）、字库特征匹配识别。（python 的 PIL 库或者其他） 模拟登陆（例如知乎等）：用好 python requests 中的 session(下面几行代码实现了最简单的 163 邮箱的登陆，其实原理是类似的～）。
```
import requests 
s =requests.session() 
login_data={"account":"","password":""} 
res=s.post("http://mail.1com/",login_data)
```

`5.Ajax 动态加载 `
网页的不希望被爬虫拿到的数据使用 Ajax 动态加载，这样就为爬虫造成了绝大的麻烦，如果一个爬虫不具备 js 引擎，或者具备 js 引擎，但是没有处理 js 返回的方案，或者是具备了 js 引擎，但是没办法让站点显示启用脚本设置。基于这些情况，ajax 动态加载反制爬虫还是相当有效的。 Ajax 动态加载的工作原理是：从网页的 url 加载网页的源代码之后，会在浏览器里执行 JavaScript 程序。这些程序会加载出更多的内容，并把这些内容传输到网页中。这就是为什么有些网页直接爬它的 URL 时却没有数据的原因。 处理方法：若使用审查元素分析请求对应的链接(方法：右键→审查元素→Network→清空，点击加载更多，出现对应的 GET 链接寻找 Type 为 text/html 的，点击，查看 get 参数或者复制 Request URL)，循环过程。如果请求之前有页面，依据上一步的网址进行分析推导第 1 页。以此类推，抓取抓 Ajax 地址的数据。对返回的 json 使用 requests 中的 json 进行解析，使用 eval（）转成字典处理（上一讲中的 fiddler 可以格式化输出 json 数据。

`6.cookie 限制`
一次打开网页会生成一个随机 cookie，如果再次打开网页这个 cookie 不存在，那么再次设置，第三次打开仍然不存在，这就非常有可能是爬虫在工作了。
解决措施：在 headers 挂上相应的 cookie 或者根据其方法进行构造（例如从中选取几个字母进行构造）。如果过于复杂，可以考虑使用 selenium 模块（可以完全模拟浏览器行为）。

#### 8. 网络协议 http 和 https 区别？
HTTP：是互联网上应用最为广泛的一种网络协议，是一个客户端和服务器端请求和应答的标准（TCP），用于从 WWW 服务器传输超文本到本地浏览器的传输协议，它可以使浏览器更加高效，使网络传输减少。
HTTPS：是以安全为目标的 HTTP 通道，简单讲是 HTTP 的安全版，即 HTTP 下加入 SSL 层，HTTPS 的安全基础是 SSL，因此加密的详细内容就需要 SSL。
HTTPS 协议的主要作用可以分为两种：一种是建立一个信息安全通道，来保证数据传输的安全；另一种就是确认网站的真实性。

#### 9. 什么是 cookie，session 有什么区别？
1、cookie 数据存放在客户的浏览器上，session 数据放在服务器上。
2、cookie 不是很安全，别人可以分析存放在本地的 cookie 并进行 cookie 欺骗，考虑到安全应当使用 session。
3、session 会在一定时间内保存在服务器上。当访问增多，会比较占用你服务器的性能，考虑到减轻服务器性能方面，应当使用 cookie。
4、单个 cookie 保存的数据不能超过 4K，很多浏览器都限制一个站点最多保存 20 个 cookie。
5、可以考虑将登陆信息等重要信息存放为 session，其他信息如果需要保留，可以放在 cookie 中。

#### 10. Mysql 中 myisam 与 innodb 的区别？
1、 存储结构
MyISAM：每个 MyISAM 在磁盘上存储成三个文件。第一个文件的名字以表的名字开始，扩展名指出文件类型。.frm 文件存储表定义。数据文件的扩展名为.MYD(MYData)。索引文件的扩展名是.MYI(MYIndex)。
InnoDB：所有的表都保存在同一个数据文件中（也可能是多个文件，或者是独立的表空间文件），InnoDB 表的大小只受限于操作系统文件的大小，一般为 2GB。

2、 存储空间
MyISAM：可被压缩，存储空间较小。支持三种不同的存储格式：静态表(默认，但是注意数据末尾不能有空格，会被去掉)、动态表、压缩表。
InnoDB：需要更多的内存和存储，它会在主内存中建立其专用的缓冲池用于高速缓冲数据和索引。

3、 事务支持
MyISAM：强调的是性能，每次查询具有原子性，其执行数度比 InnoDB 类型更快，但是不提供事务支持。
InnoDB：提供事务支持事务，外部键等高级数据库功能。 具有事务(commit)、回滚(rollback) 和崩溃修复能力(crash recovery capabilities) 的事务安全(transaction-safe(ACID compliant)) 型表。

4、 CURD 操作
MyISAM：如果执行大量的 SELECT，MyISAM 是更好的选择。(因为没有支持行级锁)，在增删的时候需要锁定整个表格，效率会低一些。相关的是 innodb 支持行级锁，删除插入的时候只需要锁定改行就行，效率较高
InnoDB：如果你的数据执行大量的 INSERT 或 UPDATE，出于性能方面的考虑，应该使用 InnoDB 表。DELETE 从性能上 InnoDB 更优，但 DELETE FROM table 时，InnoDB 不会重新建立表，而是一行一行的删除，在 innodb 上如果要清空保存有大量数据的表，最好使用 truncate table 这个命令。

5、 外键
MyISAM：不支持
InnoDB：支持

### 八、首信 Python 研发面试
#### 1. Python 中 list、tuple、dict、set 有什么区别，主要应用在什么样的场景？并用 for 语句遍历？
区别：
1、list、tuple 是有序列表；dict、set 是无序列表；
2、list 元素可变、tuple 元素不可变；
3、dict 和 set 的 key 值不可变，唯一性；
4、set 只有 key 没有 value；
5、set 的用途：去重、并集、交集等；
6、list、tuple：+、*、索引、切片、检查成员等；
7、dict 查询效率高，但是消耗内存多；list、tuple 查询效率低、但是消耗内存少;

应用场景：
list,：简单的数据集合，可以使用索引；
tuple：把一些数据当做一个整体去使用，不能修改；
dict：使用键值和值进行关联的数据；
set：数据只出现一次，只关心数据是否出现，不关心其位置；列表遍历：
```
a_list = [1, 2, 3, 4, 5] 
for num in a_list: 
print(num,end=' ') 

a_turple = (1, 2, 3, 4, 5) 
for num in a_turple: 
print(num,end=" ") 
 
a_dict = {'name':'xiaoming','sex':'man'} 
for key in a_dict.key():
print(key)
for value in dict.value(): 
print(value)
for item in dict.items() 
print(key,value) 

s = set(['Adam', 'Lisa', 'Bart']) 
for name in s: 
print(name)
```

#### 2. 用 Python 语言写一个函数，输入一个字符串，返回倒序结果？
```
def test() 
strA = raw_input("请输入需要翻转的字符串：") 
order = []
for i in strA: 
order.append(i) 
order.reverse() #将列表反转 
print(''.join(order))# 将 list 转换成字符串
test()
```

#### 3. 介绍一下 Python 的异常处理机制和自己开发过程中的体会？
1. 默认的异常处理器 代码如下:
```
s = 'Hello girl!'
print(s[100] )
print('continue')
```
如果我们没有对异常进行任何预防，那么在程序执行的过程中发生异常，就会中断程序，调用 python 默认的异常处理器，并在终端输出异常信息。这种情况下，第 3 行代码不会执行。

2. try…except
代码如下:
```
s = 'Hello girl!' 
try: 
 print(s[100]) 
except IndexError: 
 print('error...') 
print('continue')
```
程序执行到第 2 句时发现 try 语句，进入 try 语句块执行，发生异常，回到 try 语句层，寻找后面是否有 except 语句。找到 except 语句后，会调用这个自定义的异常处理器。except 将异常处理完毕后，程序继续往下执行。这种情况下，最后两个 print 语句都会执行。
except 后面也可以为空，表示捕获任何类型的异常。

3. try…finally
代码如下:
```
s = 'Hello girl!' 
try: 
print(s[100])
finally: 
print('error...' )
print('continue finally' )
```
语句表示，无论异常发生与否，finally 中的语句都要执行。但是，由于没有 except 处理器，finally 执行完毕后程序便中断。这种情况下，倒第 2 个 print 会执行，到第 1 个不会执行。如果 try 语句中没有异常，三个 print 都会执行。

4. assert
代码如下:
```
assert False,'error..' 
print('continue')
```
这个语句，先判断 assert 后面紧跟的语句是 True 还是 False, 如果是 True 则继续执行 print, 如果是 False 则中断程序，调用默认的异常处理器，同时输出 assert 语句逗号后面的提示信息。本例情况下，程序中断，提示 error, 后面的 print 不执行。

5. with…as`
代码如下:
```
with open('nothing.txt','r') as f: 
f.read() 
print(2/0) 
print('continue')
```
我们平时在使用类似文件的流对象时，使用完毕后要调用 close 方法关闭，很麻烦。这里 with…as 语句提供了一个非常方便的替代方法:open 打开文件后将返回的文件流对象赋值给 f, 然后在 with 语句块中使用。with 语句块完毕之后，会隐藏地自动关闭文件。 如果 with 语句或语句块中发生异常，会调用默认的异常处理器处理，但文件还是会正常关闭。 这种情况下，会抛出异常，最后的 print 不执行。

#### 4. jQuery 库中 $() 是什么？网上有 5 个元素，如何使用 jQuery 来选择它们？
() 函 数 是 J Q u e r y 函 数 的 别 称 ， () 函数是 JQuery 函数的别称， () 函数是 JQuery 函数的别称，() 函数用于将任何对象包裹成 jQuery 对象，接着就可以被允许调用定义在 jQuery 对象上的多个不同方法。甚至可以将一个选择器字符串传入 $() 函数，它会返回一个包含所有匹配的 DOM 元素数组的 jQuery 对象。可以用 each() 方法进行遍历里面的对象。 选择元素：这个问题是 jQuery 基于选择器的。jQuery 支持不同类型的选择器，有 ID 选择器、class 选择器、标签选择器。这个问题的答案是使用标签选择器来选择所有的 div 元素。
jQuery 代码：
$('div').
其返回值是一个包含 5 个 div 标签的 jQuery 对象。

#### 5. 写一个 Bash Shell 脚本来得到当前的日期、时间、用户名和当前工作目录？
输出用户名，当前日期和时间，以及当前工作目录的命令就是 logname，date，who i am 和 pwd。

#### 6. Django 中使用 memcached 作为缓存的具体方法？有缺点说明？
memcached 是一种缓存技术，基于 c/s 模式，他可以把你的数据放入内存，从而通过内存访问提速，因为内存最快的。

### 九、微影时代
#### 1. HTTP 头有什么字段？
每个 HTTP 请求和响应都会带有相应的头部信息。默认情况下，在发送 XHR 请求的同时，还会发送下列头部信息：
Accept: 浏览器能够处理的内容类型
Accept-Charset: 浏览器能够显示的字符集
Accept-Encoding：浏览器能够处理的压缩编码
Accept-Language：浏览器当前设置的语言
Connection：浏览器与服务器之间连接的类型
Cookie：当前页面设置的任何 Cookie
Host：发出请求的页面所在的域
Referer：发出请求的页面的 URL
User-Agent：浏览器的用户代理字符串
HTTP 响应头部信息:
Date：表示消息发送的时间，时间的描述格式由 rfc822 定义
server: 服务器名字。
Connection：浏览器与服务器之间连接的类型
content-type: 表示后面的文档属于什么 MIME 类型
Cache-Control：控制 HTTP 缓存

#### 2. POST 登录数据方式？
HTTP 协议是以 ASCII 码传输，建立在 TCP/IP 协议之上的应用层规范。规范把 HTTP 请求分为三个部分：状态行、请求头、消息主体。协议规定 POST 提交的数据必须放在消息主体（entity-body）中，但协议并没有规定数据必须使用什么编码方式。

### 十、斯沃创智
#### 1. 简述 Python 中 is 和 = = 的区别
Python 中的对象包含三要素：id、type、value。
其中 id 用来唯一标识一个对象，type 标识对象的类型，value 是对象的值。is 判断的是 a 对象是否就是 b 对象，是通过 id 来判断的。== 判断的是 a 对象的值是否和 b 对象的值相等，是通过 value 来判断的。

#### 2. 简述 read,readline 和 readlines 的区别
1.read() 每次读取整个文件，它通常将读取到底文件内容放到一个字符串变量中，也就是说 .read() 生成文件内容是一个字符串类型；
2.readline() 每只读取文件的一行，通常也是读取到的一行内容放到一个字符串变量中，返回 str 类型；
3.readlines() 每次按行读取整个文件内容，将读取到的内容放到一个列表中，返回 list 类型；

#### 3. 举例说明创建字典的至少两种方法
1.用 {} 创建字典
2.用内置函数 dict()

#### 4. 简述 Python 里面 search 和 match 的区别
match() 函数只检测 RE 是不是在 string 的开始位置匹配，search() 会扫描整个 string 查找匹配；也就是说 match() 只有在 0 位置匹配成功的话才有返回，如果不是开始位置匹配成功的话，match() 就返回 none；
例如：print(re.match(super', superstition').span()) 会返回(0, 5)
而 print(re.match(super', insuperable')) 则返回 None

search() 会扫描整个字符串并返回第一个成功的匹配：
例如：print(re.search(super', superstition').span()) 返回(0, 5)
print(re.search(super', insuperable').span()) 返回(2, 7)
其中 span 函数定义如下，返回位置信息：
span([group]):返回(start(group), end(group))。

#### 5. Python 代码实现：删除一个 list 里面的重复元素
方法一：是利用 map 的 fromkeys 来自动过滤重复值，map 是基于 hash 的，大数组的时候应该会比排序快点。
方法二：是用 set(),set 是定义集合的，无序，非重复。
方法三：是排序后，倒着扫描，遇到已有的元素删之。
```
#!/usr/bin/python 
#coding=utf-8 
''' 
Created on 2012-2-22 
Q: 给定一个列表，去掉其重复的元素，并输出 
''' 
def distFunc1(): 
a=[1,2,4,2,4,5,6,5,7,8,9,0] 
b={} 
b=b.fromkeys(a) 
print b 
#print b.keys() 
a=list(b.keys()) 
print a 
def distFunc2(): 
a=[1,2,4,2,4,5,7,10,5,5,7,8,9,0,3] 
a=list(set(a)) # set 是非重复的，无序集合。可以用 list 来的排队对 set 进行排序，list() 转换为列表，a.sort 来排序 
print a 
def distFunc3(): 
#可以先把 list 重新排序，然后从 list 的最后开始扫描，代码如下： 
List=[1,2,4,2,4,5,7,10,5,5,7,8,9,0,3] 
if List: 
List.sort() 
#print List 
last = List [-1] 
#print last 
for i in range(len(List)-2, -1, -1): 
if last==List [i]:
del List [i] 
else: last=List [i] 
if __name__ == '__main__': 
distFunc1() 
distFunc2() 
distFunc3()
```

#### 6. Python 代码中(*args, **kwargs) 是什么意思
`*args` 表示任何多个无名参数，它是一个 tuple。
`**kwargs` 表示关键字参数，它是一个 dict。

### 十一、天广汇通
#### 1. 说明 os.path 和 sys.path 分别代表什么？
sys.path 是喜闻乐见的 PATH 环境变量，os.path 是一个 module，提供 split、join、basename 等处理目录、文件名的工具。

#### 2. 解释一下并行（parallel）和并发（concurrency）的区别
并行（parallel）是指同一时刻，两个或两个以上时间同时发生。
并发（parallel）是指同一时间间隔（同一段时间），两个或两个以上时间同时发生。

#### 3. 在 Python 中可以实现并发的库有哪些？
1）线程 
2）进程 
3）协程 
4）threading。

#### 4. 如果一个程序需要进行大量的 IO 操作，应当使用并行还是并发？
并发。

### 十二、信德数据
#### 1. 网络七层协议是哪几层？HTTP 协议输入是第几层？
7 层从上到下分别是
应用层
表示层
会话层
传输层
网络层
数据链路层
物理层
 
其中高层（即 7、6、5、4 层）定义了应用程序的功能，下面 3 层（即 3、2、1 层）主要面向通过网络的端到端的数据流。
HTTP 属于应用层。

#### 2. 什么是 HTTP 协议？HTTP 请求有哪几种？
HTTP 是 hypertext transfer protocol（超文本传输协议）的简写，它是 TCP/IP 协议的一个应用层协议，用于定义 WEB 浏览器与 WEB 服务器之间交换数据的过程。客户端连上 web 服务器后，若想获得 web 服务器中的某个 web 资源，需遵守一定的通讯格式，HTTP 协议用于定义客户端与 web 服务器通迅的格式。
HTTP 请求有 8 种:
OPTIONS / HEAD / GET / POST / PUT / DELETE / TRACE / CONNECT 。

#### 3. 什么是 HTTP 代理？作用是什么？
代理服务器英文全称是 Proxy Server，其功能就是代理网络用户去取得网络信息。形象的说：它是网络信息的中转站。 代理服务器可以实现各种时髦且有用的功能。它们可以改善安全性，提高性能，节省费用。

#### 4. 什么是反向代理？作用是什么？
代理可以假扮 Web 服务器。这些被称为替换物(surrogate) 或反向代理(reverse proxy) 的代理接收发送给 Web 服务器的真实请求，但与 Web 服务器不同的是，它们可以发起与其他服务器的通信，以便按需定位所请求的内容。 可以用这些反向代理来提高访问慢速 Web 服务器上公共内容的性能。在这种配置中，通常将这些反向代理称为服务器加速器(server accelerator)。还可以将替换物与内容路由功能配合使用，以创建按需复制内容的分布式网络。

#### 5. HTTPS 和 HTTP 的区别
1）https 协议需要到 ca 申请证书，一般免费证书很少，需要交费。
2）http 是超文本传输协议，信息是明文传输，https 则是具有安全性的 ssl 加密传输协议。
3）http 和 https 使用的是完全不同的连接方式，用的端口也不一样，前者是 80，后者是 443。
4）http 的连接很简单，是无状态的；HTTPS 协议是由 SSL+HTTP 协议构建的可进行加密传输、身份认证的网络协议，比 http 协议安全。

### 十三、成安
#### 1. Python 的 logging 模块常用的几个等级？
critical > error > warning > info > debug,notset
级别越高打印的日志越少，反之亦然，即
Debug : 打印全部的日志(notset 等同于 debug)
info : 打印 info,warning,error,critical 级别的日志
warning : 打印 warning,error,critical 级别的日志
error : 打印 error,critical 级别的日志
critical : 打印 critical 级

#### 2. 在 HTTP1.1 中常见的状态码有哪些，如何设置状态码？
1XX Informational 信息性状态码，表示接受的请求正在处理
2XX Success 成功状态码，表示请求正常处理完毕
3XX Redirection 重定向状态码，表示需要客户端需要进行附加操作
4XX Client Error 客户端错误状态码，表示服务器无法处理请求
5XX Server Error 服务器错误状态码，表示服务器处理请求出错

#### 3. Python 如何处理上传文件？
Python 中使用 GET 方法实现上传文件，下面就是用 Get 上传文件的例子，client 用来发 Get 请求，server 用来收请求。

```
请求端代码：
import requests #需要安装 requests 
with open('test.txt', 'rb') as f: 
requests.get('http:// 服务器 IP 地址：端口 ', data=f) 

服务端代码： 
var http = require('http'); 
var fs = require('fs'); 
var server = http.createServer(function(req, res){//console.log(req); 
var recData = ""; 
req.on('data', function(data){recData += data;}) 
req.on('end', function(data){ 
recData += data; 
fs.writeFile('recData.txt', recData, function(err){console.log('file received'); 
}) 
}) 
res.end('hello'); 
}) 
server.listen(端口);
```

### 十四、博派通达
1.请列举你使用过的 Python 代码检测工具
2.移动应用自动化测试 Appium
3.OpenStack 集成测试 Tempest
4.自动化测试框架 STAF
5.自动化测试平台 TestMaker
6.JavaScript 内存泄露检测工具 Leak Finder
7.Python 的 Web 应用验收测试 Splinter
8.即插即用设备调试工具 UPnP-Inspector

#### 1. 简述 Python 垃圾回收机制和如何解决循环引用
引用计数：是一种垃圾收集机制，而且也是一种最直观，最简单的垃圾收集技术，当一个对象的引用被创建或者复制时，对象的引用计数加 1；当一个对象的引用被销毁时，对象的引用计数减 1；当对象的引用计数减少为 0 时，就意味着对象已经没有被任何人使用了，可以将其所占用的内存释放了。虽然引用计数必须在每次分配和释放内存的时候加入管理引用计数的动作，然而与其他主流的垃圾收集技术相比，引用计数有一个最大的有点，即实时性，任何内存，一旦没有指向它的引用，就会立即被回收。而其他的垃圾收集计数必须在某种特殊条件下（比如内存分配失败）才能进行无效内存的回收。

引用计数机制执行效率问题：引用计数机制所带来的维护引用计数的额外操作与 Python 运行中所进行的内存分配和释放，引用赋值的次数是成正比的。而这点相比其他主流的垃圾回收机制，比如标记 - 清除，停止 - 复制，是一个弱点，因为这些技术所带来的额外操作基本上只是与待回收的内存数量有关。 如果说执行效率还仅仅是引用计数机制的一个软肋的话，那么很不幸，引用计数机制还存在着一个致命的弱点，正是由于这个弱点，使得侠义的垃圾收集从来没有将引用计数包含在内，能引发出这个致命的弱点就是循环引用（也称交叉引用）。

问题说明：
循环引用可以使一组对象的引用计数不为 0，然而这些对象实际上并没有被任何外部对象所引用，它们之间只是相互引用。这意味着不会再有人使用这组对象，应该回收这组对象所占用的内存空间，然后由于相互引用的存在，每一个对象的引用计数都不为 0，因此这些对象所占用的内存永远不会被释放。
比如：这一点是致命的，这与手动进行内存管理所产生的内存泄露毫无区别。 要解决这个问题，Python 引入了其他的垃圾收集机制来弥补引用计数的缺陷：标记 - 清除，分代回收两种收集技术。
标记 - 清除：标记 - 清除是为了解决循环引用的问题。可以包含其他对象引用的容器对象（比如：list，set，dict，class，instance）都可能产生循环引用。
我们必须承认一个事实，如果两个对象的引用计数都为 1，但是仅仅存在他们之间的循环引用，那么这两个对象都是需要被回收的，也就是说，它们的引用计数虽然表现为非 0，但实际上有效的引用计数为 0。我们必须先将循环引用摘掉，那么这两个对象的有效计数就现身了。假设两个对象为 A、B，我们从 A 出发，因为它有一个对 B 的引用，则将 B 的引用计数减 1；然后顺着引用达到 B，因为 B 有一个对 A 的引用，同样将 A 的引用减 1，这样，就完成了循环引用对象间环摘除。
但是这样就有一个问题，假设对象 A 有一个对象引用 C，而 C 没有引用 A，如果将 C 计数引用减 1，而最后 A 并没有被回收，显然，我们错误的将 C 的引用计数减 1，这将导致在未来的某个时刻出现一个对 C 的悬空引用。这就要求我们必须在 A 没有被删除的情况下复原 C 的引用计数，如果采用这样的方案，那么维护引用计数的复杂度将成倍增加。
原理：标记 - 清除采用了更好的做法，我们并不改动真实的引用计数，而是将集合中对象的引用计数复制一份副本，改动该对象引用的副本。对于副本做任何的改动，都不会影响到对象生命走起的维护。
这个计数副本的唯一作用是寻找 root object 集合（该集合中的对象是不能被回收的）。当成功寻找到 root object 集合之后，首先将现在的内存链表一分为二，一条链表中维护 root object 集合，成为 root 链表，而另外一条链表中维护剩下的对象，成为 unreachable 链表。之所以要剖成两个链表，是基于这样的一种考虑：现在的 unreachable 可能存在被 root 链表中的对象，直接或间接引用的对象，这些对象是不能被回收的，一旦在标记的过程中，发现这样的对象，就将其从 unreachable 链表中移到 root 链表中；当完成标后，unreachable 链表中剩下的所有对象就是名副其实的垃圾对象了，接下来的垃圾回收只需限制在 unreachable 链表中即可。
分代回收 背景：分代的垃圾收集技术是在上个世纪 80 年代初发展起来的一种垃圾收集机制，一系列的研究表明：无论使用何种语言开发，无论开发的是何种类型，何种规模的程序，都存在这样一点相同之处。即：一定比例的内存块的生存周期都比较短，通常是几百万条机器指令的时间，而剩下的内存块，起生存周期比较长，甚至会从程序开始一直持续到程序结束。 从前面标记 - 清除这样的垃圾收集机制来看，这种垃圾收集机制所带来的额外操作实际上与系统中总的内存块的数量是相关的，当需要回收的内存块越多时，垃圾检测带来的额外操作就越多，而垃圾回收带来的额外操作就越少；反之，当需回收的内存块越少时，垃圾检测就将比垃圾回收带来更少的额外操作。为了提高垃圾收集的效率，采用空间换时间的策略。
原理：将系统中的所有内存块根据其存活时间划分为不同的集合，每一个集合就成为一个代，垃圾收集的频率随着代的存活时间的增大而减小。也就是说，活得越长的对象，就越不可能是垃圾，就应该减少对它的垃圾收集频率。那么如何来衡量这个存活时间：通常是利用几次垃圾收集动作来衡量，如果一个对象经过的垃圾收集次数越多，可以得出：该对象存活时间就越长。

#### 2. 请简述如何编写清晰可读的的代码
一、写 pythonic 代码
二、理解 Python 和 C 语言的不同之处
三、在代码中适当添加注释
Python 中有三种形式的代码注释：块注释、行注释以及文档注释。
使用块注释或者行注释的时候仅仅注释那些复杂的操作、算法，或者难以理解，不能一目了然的代码给外部可访问的函数和方法（无论简单与否）添加文档注释。注释要清楚的描述方法的功能，并对参数、返回值以及可能发生的异常进行说明，使得外部调用它的人员仅仅看文档注释就能正确使用。较为复杂的内部方法也需要进行注释。
四、通过适当添加空行使代码布局更为优雅、合理。
五、编写函数的 4 个原则
1）函数设计要尽量短小
2）函数声明要做到合理、简单、易于使用
3）函数参数设计应该考虑向下兼容
4）一个函数只做一件事情，尽量保证函数语句粒度的一致性
六、将常量集中到一个文件 在 Python 中如何使用常量呢，一般来说有一下两种方式：
1）通过命名风格来提醒使用者该变量代表的意义为常量。如 TOTAL，MAX_OVERFLOW，然而这种方式并没有实现真正的常量，其对应的值仍然可以改变，这只是一种约定俗成的风格。
2）通过自定义的类实现常量功能，这要求符合命名全部为大写和值一旦绑定便不可再修改这两个条件。

#### 5. 请列出 MySQL 数据库查询的技巧
1. 对查询进行优化，应尽量避免全表扫描，首先应考虑在 where 及 order by 涉及的列上建立索引。
2. 应尽量避免在 where 子句中对字段进行 null 值判断，否则将导致引擎放弃使用索引而进行全表扫描，如：select id from t where num is null 可以在 num 上设置默认值 0，确保表中 num 列没有 null 值，然后这样查询：select id from t where num=0。
3. 应尽量避免在 where 子句中使用！= 或 <> 操作符，否则引擎将放弃使用索引而进行全表扫描。
4. 应尽量避免在 where 子句中使用 or 来连接条件，否则将导致引擎放弃使用索引而进行全表扫描，
如：select id from t where num=10 or num=20 可以这样查询：select id from t where num=10 union all select id from t where num=20。
5.in 和 not in 也要慎用，否则会导致全表扫描，如：select id from t where num in(1,2,3) 对于连续的数值，能用 between 就不要用 in 了：select id from t where num between 1 and 3。
6. 下面的查询也将导致全表扫描：select id from t where name like % 李 %'若要提高效率，可以考虑全文检索。
7. 如果在 where 子句中使用参数，也会导致全表扫描。因为 SQL 只有在运行时才会解析局部变量，但优化程序不能将访问计划的选择推迟到运行时；它必须在编译时进行选择。然 而，如果在编译时建立访问计划，变量的值还是未知的，因而无法作为索引选择的输入项。如下面语句将进行全表扫描：
select id from t where num=@num 可以改为强制查询使用索引：select id from t with(index(索引名)) where num=@num。
8. 应尽量避免在 where 子句中对字段进行表达式操作，这将导致引擎放弃使用索引而进行全表扫描。
如：select id from t where num/2=100 应改为:select id from t where num=100_2。
9. 应尽量避免在 where 子句中对字段进行函数操作，这将导致引擎放弃使用索引而进行全表扫描。
如：select id from t where substring(name,1,3)='abc' ，name 以 abc 开头的 id 应改为:select id from t where name like abc%'。
10. 不要在 where 子句中的 = 左边进行函数、算术运算或其他表达式运算，否则系统将可能无法正确使用索引。
11. 在使用索引字段作为条件时，如果该索引是复合索引，那么必须使用到该索引中的第一个字段作为条件时才能保证系统使用该索引，否则该索引将不会被使用，并且应尽可能的让字段顺序与索引顺序相一致。
12. 不要写一些没有意义的查询，如需要生成一个空表结构：
select col1,col2 into #t from t where 1=0；
这类代码不会返回任何结果集，但是会消耗系统资源的，应改成这样：create table #t(…)。
13. 很多时候用 exists 代替 in 是一个好的选择：
select num from a where num in(select num from b)；
用下面的语句替换：select num from a where exists(select 1 from b where num=a.num)
14. 并不是所有索引对查询都有效，SQL 是根据表中数据来进行查询优化的，当索引列有大量数据重复时，SQL 查询可能不会去利用索引，如一表中有字段 sex，male、female 几乎各一半，那么即使在 sex 上建了索引也对查询效率起不了作用。
15. 索引并不是越多越好，索引固然可 以提高相应的 select 的效率，但同时也降低了 insert 及 update 的效率，因为 insert 或 update 时有可能会重建索引，所以怎样建索引需要慎重考虑，视具体情况而定。一个表的索引数最好不要超过 6 个，若太多则应考虑一些不常使用到的列上建的索引是否有 必要。
16. 应尽可能的避免更新 clustered 索引数据列，因为 clustered 索引数据列的顺序就是表记录的物理存储顺序，一旦该列值改变将导致整个表记录的顺序的调整，会耗费相当大的资源。若应用系统需要频繁更新 clustered 索引数据列，那么需要考虑是否应将该索引建为 clustered 索引。
17. 尽量使用数字型字段，若只含数值信息的字段尽量不要设计为字符型，这会降低查询和连接的性能，并会增加存储开销。这是因为引擎在处理查询和连接时会逐个比较字符串中每一个字符，而对于数字型而言只需要比较一次就够了。
18. 尽可能的使用 varchar/nvarchar 代替 char/nchar ，因为首先变长字段存储空间小，可以节省存储空间，其次对于查询来说，在一个相对较小的字段内搜索效率显然要高些。
19. 任何地方都不要使用 select * from t ，用具体的字段列表代替_，不要返回用不到的任何字段。
20. 尽量使用表变量来代替临时表。如果表变量包含大量数据，请注意索引非常有限（只有主键索引）。
21. 避免频繁创建和删除临时表，以减少系统表资源的消耗。
22. 临时表并不是不可使用，适当地使用它们可以使某些例程更有效，例如，当需要重复引用大型表或常用表中的某个数据集时。但是，对于一次性事件，最好使用导出表。
23. 在新建临时表时，如果一次性插入数据量很大，那么可以使用 select into 代替 create table，避免造成大量 log ，以提高速度；如果数据量不大，为了缓和系统表的资源，应先 create table，然后 insert。
24. 如果使用到了临时表，在存储过程的最后务必将所有的临时表显式删除，先 truncate table ，然后 drop table ，这样可以避免系统表的较长时间锁定。
25. 尽量避免使用游标，因为游标的效率较差，如果游标操作的数据超过 1 万行，那么就应该考虑改写。
26. 使用基于游标的方法或临时表方法之前，应先寻找基于集的解决方案来解决问题，基于集的方法通常更有效。
27. 与临时表一样，游标并不是不可使 用。对小型数据集使用 FAST_FORWARD 游标通常要优于其他逐行处理方法，尤其是在必须引用几个表才能获得所需的数据时。在结果集中包括合计的例程通常要比使用游标执行的速度快。如果开发时 间允许，基于游标的方法和基于集的方法都可以尝试一下，看哪一种方法的效果更好。
28. 在所有的存储过程和触发器的开始处设置 SET NOCOUNT ON ，在结束时设置 SET NOCOUNT OFF 。无需在执行存储过程和触发器的每个语句后向客户端发送 DONE_IN_PROC 消息。
29. 尽量避免大事务操作，提高系统并发能力。
30. 尽量避免向客户端返回大数据量，若数据量过大，应该考虑相应需求是否合理。

#### 8. 请列出常见的 HTTP 头及其作用
http 请求中的常用头（请求头）的含义：
Accept：告诉服务器，客户端支持的数据类型。
Accept-Charset：告诉服务器，客户端采用的编码。
Accept-Encoding：告诉服务器，客户机支持的数据压缩格式。
Accept-Language：告诉服务器，客户机的语言环境。
Host：客户机通过这个头告诉服务器，想访问的主机名。
If-Modified-Since: 客户机通过这个头告诉服务器，资源的缓存时间。
Referer: 客户机通过这个头告诉服务器，它是从哪个资源来访问服务器的。（一般用于防盗链）
User-Agent: 客户机通过这个头告诉服务器，客户机的软件环境。
Cookie：客户机通过这个头告诉服务器，可以向服务器带数据。
cookie 是临时文件的意思，保存你浏览网页的痕迹，使得再次上同一页面的时候提高网速，判断你是否登录过这个网站，有些可以帮你自动登录的。
Cookie 就是服务器暂存放在你的电脑里的资料（.txt 格式的文本文件），通过在 HTTP 传输中的状态好让服务器用来辨认你的计算机。当你在浏览网站的时候，Web 服务器会先送一小小资料放在你的计算机上，Cookie 会帮你在网站上所打的文字或是一些选择都记录下来。当下次你再访问同一个网站，Web
服务器会先看看有没有它上次留下的 Cookie 资料，有的话，就会依据 Cookie 里的内容来判断使用者，送出特定的网页内容给你。
http 请求是指从客户端到服务器端的请求消息。包括：消息首行中，对资源的请求方法、资源的标识符及使用的协议。
Connection：客户机通过这个头告诉服务器，请求完后是关闭还是保持链接。
Date：客户机通过这个头告诉服务器，客户机当前请求时间。 http 请求中常用的响应头的含义：
Location: 这个头配合 302 状态码使用，告诉用户端找谁。
Server: 服务器通过这个头，告诉浏览器服务器的类型
Content-Encoding: 服务器通过这个头，告诉浏览器数据采用的压缩格式。
Content-Length: 服务器通过这个头，告诉浏览器回送数据的长度。
Content-Language：服务器通过这个头，告诉服务器的语言环境。
Content-Type: 服务器通过这个头，回送数据的类型
Last-Modified: 服务器通过这个头，告诉浏览器当前资源的缓存时间。
Refresh: 服务器通过这个头，告诉浏览器隔多长时间刷新一次。
Content-Disposition: 服务器通过这个头，告诉浏览器以下载的方式打开数据。
Transfer-Encoding: 服务器通过这个头，告诉浏览器数据的传送格式。
ETag: 与缓存相关的头。
Expires: 服务器通过这个头，告诉浏览器把回送的数据缓存多长时间。-1 或 0 不缓存。
Cache-Control 和 Pragma：服务器通过这个头，也可以控制浏览器不缓存数据。
Connection: 服务器通过这个头，响应完是保持链接还是关闭链接。
Date: 告诉客户机，返回响应的时间。

#### 9. 请列举常见的 HTTP 状态码及其意义
成功 2×× 成功处理了请求的状态码。
200 服务器已成功处理了请求并提供了请求的网页。
204 服务器成功处理了请求，但没有返回任何容。 

重定向 3×× 每次请求中使用重定向不要超过 5 次。
301 请求的网页已永久移动到新位置。当 URLs 发生变化时，使用 301 代码。搜索引擎索引中保存新的 URL。
302 请求的网页临时移动到新位置。搜索引擎索引中保存原来的 URL。
304 如果网页自请求者上次请求后没有更新，则用 304 代码告诉搜索引擎机器人，
可节省带宽和开销。 客户端错误 4×× 表示请求可能出错，妨碍了服务器的处理。
400 服务器不理解请求的语法。
403 服务器拒绝请求。
404 服务器找不到请求的网页。服务器上不存在的网页经常会返回此代码。
410 请求的资源永久删除后，服务器返回此响应。该代码与 404（未找到）代码相似，但在资源以前存在而现在不存在的情况下，有时用来替代 404 代码。如果资源已永久删除，应当使用 301 指定资源的新位置。 

服务器错误 5×× 表示服务器在处理请求时发生内部错误。这些错误可能是服务器本身的错误，而不是请求出错。
500 服务器遇到错误，无法完成请求。
503 服务器目前无法使用（由于超载或停机维护）。通常，这只是暂时状态。

#### 10. 请简述 RESTfulAPI 设计规范的理解
一、域名
将 api 部署在专用域名下：http://api.example.com。
或者将 api 放在主域名下：http://www.example.com/api/。 

二、版本
将 API 的版本号放在 url 中。http://www.example.com/app/1.0/info。

三、路径
路径表示 API 的具体网址。每个网址代表一种资源。 资源作为网址，网址中不能有动词只能有名词，
一般名词要与数据库的表名对应。而且名词要使用复数。
错误示例：http://www.example.com/getGoods
http://www.example.com/listOrders
正确示例：
获取单个商品
http://www.example.com/app/goods/1
获取所有商品
http://www.example.com/app/goods

四、使用标准的 HTTP 方法：
对于资源的具体操作类型，由 HTTP 动词表示。 常用的 HTTP 动词有四个。
GET SELECT ：从服务器获取资源。
POST CREATE ：在服务器新建资源。
PUT UPDATE ：在服务器更新资源。
DELETE DELETE ：从服务器删除资源。
示例：
获取指定商品的信息
GET http://www.example.com/goods/ID
新建商品的信息
POST http://www.example.com/goods
更新指定商品的信息
PUT http://www.example.com/goods/ID
删除指定商品的信息
DELETE http://www.example.com/goods/ID 

五、过滤信息
如果资源数据较多，服务器不能将所有数据一次全部返回给客户端。API 应该提供参数，过滤返回结果。
实例：
指定返回数据的数量
http://www.example.com/goods?limit=10
指定返回数据的开始位置
http://www.example.com/goods?offset=10
指定第几页，以及每页数据的数量
http://www.example.com/goods?page=2&per_page=20 

六、状态码
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

七、错误信息
一般来说，服务器返回的错误信息，以键值对的形式返回。
{error:Invalid API KEY'}

八、响应结果：
针对不同结果，服务器向客户端返回的结果应符合以下规范。
返回商品列表
GET http://www.example.com/goods
返回单个商品
GET http://www.example.com/goods/cup
返回新生成的商品
POST http://www.example.com/goods
返回一个空文档
DELETE http://www.example.com/goods
九、使用链接关联相关的资源

在返回响应结果时提供链接其他 API 的方法，使客户端很方便的获取相关联的信息。

十、其他
服务器返回的数据格式，应该尽量使用 JSON，避免使用 XML。

#### 11. 请简述标准库中 functools.wraps 的作用
Python 中使用装饰器对在运行期对函数进行一些外部功能的扩展。但是在使用过程中，由于装饰器的加入导致解释器认为函数本身发生了改变，在某些情况下 —— 比如测试时 —— 会导致一些问题。Python 通过 functool.wraps 为我们解决了这个问题：在编写装饰器时，在实现前加入 @functools.wraps(func) 可以保证装饰器不会对被装饰函数造成影响。

### 十五、乐飞天下
#### 1. 如何判断一个 python 对象的类型
type()
isinstance()

#### 2. Python 里面如何生成随机数
Python 中的 random 函数，可以生成随机浮点数、整数、字符串，甚至帮助你随机选择列表序列中的一个元素，打乱一组数据等。

#### 3. 请写出匹配 ip 的 Python 正则表达式
iPv4 的 ip 地址都是（1255）.（0255）.（0255）.（0255）的格式。
下面给出相对应的正则表达式：
^(1\\d {2}|2 [0-4]\\d|25 [0-5]|[1-9]\\d|[1-9])\.
+"(1\\d {2}|2 [0-4]\\d|25 [0-5]|[1-9]\\d|\\d)\."
+"(1\\d {2}|2 [0-4]\\d|25 [0-5]|[1-9]\\d|\\d)\."
+"(1\\d {2}|2 [0-4]\\d|25 [0-5]|[1-9]\\d|\\d)$"
简单的讲解一下：
\\d 表示 0~9 的任何一个数字
{2} 表示正好出现两次
[0-4] 表示 0~4 的任何一个数字
| 的意思是或者() 上面的括号不能少，是为了提取匹配的字符串，表达式中有几个() 就表示有几个相应的匹配字符串
1\\d {2} 的意思就是 100~199 之间的任意一个数字
2 [0-4]\\d 的意思是 200~249 之间的任意一个数字
25 [0-5] 的意思是 250~255 之间的任意一个数字
[1-9]\\d 的意思是 10~99 之间的任意一个数字
[1-9]) 的意思是 1~9 之间的任意一个数字
\. 的意思是。点要转义（特殊字符类似，@都要加 \\ 转义）

#### 5. 全局变量和局部变量的区别，如何在 function 里面给一个全局变量赋值
一、局部变量：在函数内部定义的变量，叫局部变量。
当这个函数被调用的时候，这个变量存在，当这个函数执行完成之后，因为函数都已经结束了，所有函数里面定义的变量也就结束了。 在一个函数中定义的局部变量，只能在这个函数中使用，不能再其他的函数中使用。

二、全局变量：子函数外边定的变量，叫做全局变量。
所有的函数都可以使用它的值，如果函数需要修改全局变量的值，那么需要在这个函数中，使用 global xxx 进行说明。

#### 6. Tuple 和 list 的区别，有两个 list b1 = [1,2,3] b2=[2,3,4] 写出合并代码
list：
Python 内置的一种数据类型是列表 list。list 是一种有序的集合，可以随时添加和删除其中的元素。用 len() 函数可以获得 list 元素的个数，用索引来访问 list 中每一个位置的元素下标从 0 开始，要删除 list 末尾的元素，用 pop() 方法 要删除指定位置的元素，用 pop(i) 方法，其中 i 是索引位置，要把某个元素替换成别的元素，可以直接赋值给对应的索引位置，ist 里面的元素的数据类型也可以不同，list 元素也可以是另一个 list。

tuple
另一种有序列表叫元组：tuple。tuple 和 list 非常类似，但是 tuple 一旦初始化就不能修改现在，classmates 这个 tuple 不能变了，它也没有 append()，insert() 这样的方法。其他获取元素的方法和 list 是一样的，你可以正常地使用 classmates [0]，classmates [-1]，但不能赋值成另外的元素。 不可变的 tuple 有什么意义？因为 tuple 不可变，所以代码更安全。如果可能，能用 tuple 代替 list 就尽量用 tuple。
tuple 的陷阱：当你定义一个 tuple 时，在定义的时候，tuple 的元素就必须被确定下来。
```
b1 = [1,2,3] 
 b2=[2,3,4] 
bextend(b2) 
print(b1)
```

#### 7. 请写出一段代码删除一个 list 里面的重复元素 l =[1,1,2,3,4,5,4]
```
l = [1, 1, 2, 3, 4, 5, 4] 
l2=set(l) 
l = list(l2) 
print(l)
```

#### 8. 写出 list 的交集与差集的代码 b1 =[1,2,3] b2=[2,3,4]
```
b1 =[1,2,3] 
b2=[2,3,4] 
b3 = [] 
b4 =[] 
# 方法一 
for val in b2 : 
ifval in b1: 
bappend(val) 
print(b3) 
for val in b2 : 
if val not in b1: 
bappend(val) 
forval2 in b1: 
if val2 not in b2: 
bappend(val2) 
print(b4) 
# 方法二 
t1 = set(b1) 
t2 = set(b2) 
print(t1&t2) 
list1 = list(t1-t2) 
listextend(list(t2-t1)) 
print(list1)
```

#### 9. 写一段 Python 代码实现 list 里排 a=[1,2,4,2,45,7,10,5,5,7,8,9,0,3]
```
a=[1,2,4,2,4,5,7,10,5,5,7,8,9,0,3] 
print(sorted(a,reverse=False))# 返回新的列表 
print(a) 
a.sort()# 注意 sort 没有返回值在原列表上修改 
print(a)
```

#### 10. D= [i**2 for i in range(1,10)] 请写出 D 的输出结果
[1, 4, 9, 16, 25, 36, 49, 64, 81]。

#### 11. 什么时 lambda 函数，下面这段代码的输出是什么
```
nums = range(2,20) 
for i in nums: 
nums = filter(lambda x :x == i or x % i,nums) 
print(nums)
```
nums 为 2 到 19 的数字。注解 filter 函数为用于过滤序列函数。Python3 中 nums 是一个可迭代对象 迭代后的结果是 2 到 19 的数字。

#### 13. 谈一下对于对线程的理解，对于 cpu 密集性 IO 密集性怎样使用线程，说说线程池， 线程锁的用法，有么有用过 multiprocessing 或者 concurrrent.futures?
线程：可以理解成程序中的一个可以执行的分支，它是 cup 调度 0 的基本单元，python 的 thread 模块是比较底层的模块，python 的 threading 模块是对 thread 做了一些包装的，可以更加方便的被使用。
线程池用法：
1）安装:pip installthreadpool
2）使用
（1）引入 threadpool 模块
（2）定义线程函数
（3）创建线程 池 threadpool.ThreadPool()
（4）创建需要线程池处理的任务即 threadpool.makeRequests()
（5）将创建的多个任务 put 到线程池中，threadpool.putRequest
（6）等到所有任务处理完毕 theadpool.pool()

> 锁的使用：
threading 模块中定义了 Lock 类，可以方便的处理锁定：
-- 创建锁
> mutex = threading.Lock()
-- 锁定
> mutex.acquire()
-- 释放
> mutex.release()

### 十六、莉莉丝广告开发工程师初始题目
#### 1. 用递归实现快速排序 quik_sort(A)
```
def sub_sort(array,low,high): 
pivotkey=array [low] 
while low<high : 
while low<high and array [high]>=pivotkey: 
high -= 1 
array [low]=array [high] 
while low<high and array [low]<=pivotkey: 
low += 1 
array [high]=array [low] 
array [low]=pivotkey 
return low 

def quick_sort(array,low,high): 
if low < high : 
pivoloc=sub_sort(array,low,high) 
quick_sort(array,low,pivoloc-1) 
quick_sort(array,pivoloc+1,high) 

if __name__=="__main__":
array=[49,38,65,97,76,13,27] 
print array 
quick_sort(array,0,len(array)-1) 
print array
```

#### 2. 简述 Python 在异常处理中，else 和 finally 的作用分别是什么？
如果一个 Try - exception 中，没有发生异常，即 exception 没有执行，那么将会执行 else 语句的内容。反之，如果触发了 Try - exception（异常在 exception 中被定义），那么将会执行 exception 中的内容，而不执行 else 中的内容。如果 try 中的异常没有在 exception 中被指出，那么系统将会抛出 Traceback(默认错误代码） , 并且终止程序，接下来的所有代码都不会被执行，但如果有 Finally 关键字，则会在程序抛出 Traceback 之前（程序最后一口气的时候），执行 finally 中的语句。这个方法在某些必须要结束的操作中颇为有用，如释放文件句柄，或释放内存空间等。

#### 3. 简述 Python GIL 的概念，以及它对 Python 多线程的影响。如何实现一个抓取网页 的程序，使用多线程是否比单线程有性能提升，并解释原因
GIL 锁 全局解释器锁（只在 cpython 里才有）
作用：限制多线程同时执行，保证同一时间只有一个线程执行，所以 cpython 里的多线程其实是伪多线程！所以 Python 里常常使用协程技术来代替多线程，协程是一种更轻量级的线程， 进程和线程的切换时由系统决定，而协程由我们程序员自己决定，而模块 gevent 下切换是遇到了耗时操作才会切换。 会有所提升，因为下载完图片之后进行存储就是 IO 密集性的操作，线程对 IO 密集性的操作有所提升。

### 十七、罗格数据
#### 1. 滑动验证码如何解决
1.selenium 控制鼠标实现，速度太机械化，成功率比较低
2. 计算缺口的偏移量，推荐博客：http://blog.csdn.net/paololiu/article/details/52514504?>
3. 极验滑动验证码需要具体网站具体分析，一般牵扯算法乃至深度学习相关知识。

#### 2. ajax 请求页面如何加载
ajax 可以实现局部刷新，也叫做无刷新，无刷新指的是整个页面不刷新，只是局部刷新，ajax 可以自己发送 http 请求，不用通过浏览器的地址栏，所以页面整体不会刷新，ajax 获取到后台数据，更新页面显示数据的部分，就做到了页面局部刷新。

#### 6. HTTPS 网站如何爬取
1. 在使用 requests 前加入：requests.packages.urllib3.disable_warnings()。
2. 为 requests 添加 verify=False 参数，比如：
r =requests.get(https://blog.bbzhh.com',verify=False)。

### 十八、牧游科技
#### 1. 函数参数传递，下面程序运行的结果是？
```
defadd(a,s_list=[]): 
 s_list.append(a) 
return s_list 
 print(add(1)) 
 Print(add(2)) 
 print(add(3)) 结果是 [1],[1,2],[1,2,3]。
```

#### 2. Python 中类方法，静态方法的区别及调用
类方法：是类对象的方法，在定义时需要在上方使用 @classmethod 进行装饰，形参为 cls，表示类对象，类对象和实例对象都可调用。
静态方法：是一个任意函数，在其上方使用 @staticmethod 进行装饰，可以用对象直接调用，静态方法实际上跟该类没有太大关系。

#### 3. 类变量，实例变量
```
class Person: 
name ="aaa" 
pl =Person() 
p2 = Person() 
pl.name= "bbb" 
print(pl.name,pname) 
print(Person.name) 结果 bbb aaaaaa
```

#### 4. 函数式编程与内置函数```
a = [1,2,3,4,5,6,7] 
b =filter(lambda x:x>5,a) 
for i in b : 
print(i) 
a = map(lambda x:x*2,[1,2,3]) 
print(list(a))
```
> 第一个 print 返回的是一个可迭代对象 6,7 第二个返回的是 2,4,6。

### 十九、上海金台灯
#### 1. 什么是 lambda 函数，它有什么好处
lambad 表达式就是一个函数，可以赋值给一个变量，既然是表达式，可以参与运算。lambda x: x *2 这个匿名函数的形参是 x，表达式 x * 2 的值就是这个函数的返回值。
好处：
1.lambda 只是一个表达式，函数体比 def 简单很多。
2.lambda 的主体是一个表达式，而不是一个代码块。仅仅能在 lambda 表达式中封装有限的逻辑进去。
3.lambda 表达式是起到一个函数速写的作用。允许在代码内嵌入一个函数的定义。

#### 2. 什么是 Python 的 list and dict comprehensions, 写一段代码
List 是 Python 的列表
```
a = list() 
a.append("2")
```
dict comprehensions 是 Python 的字典的推导式
```
mcase = {'a': 10, 'b': 34} 
mcase_frequency = {v: k for k, v in mcase.items()}
```

#### 3. Python 里面如何实现 tuple 和 list 的转换
```
list2 =["2","3","4"] 
t = type(list2)
```

#### 4. Python 里面如何拷贝一个对象
```
list2 =["2","3","4"] 
q=listcopy() 
print(q)
```

#### 5. 写一段 except 的函数
```
a=10 
b=0 
try: 
c=a/b 
print(c) 
except Exception as e: 
print(e) 
print("done")
```

#### 6. Pyhon 里面 pass 语句的作用是什么？
Python pass 是空语句，是为了保持程序结构的完整性。pass 不做任何事情，一般用做占位语句。

#### 7. 如何知道 Python 对象的类型？
isinstance(变量名，类型)；
type()；

#### 8. Python 中 range() 函数的用法
range 函数大多数时常出如今 for 循环中。在 for 循环中可做为索引使用。事实上它也能够出如今不论什么须要整数列表的环境中，在 python 3.0 中 range 函数是一个迭代器。

#### 9. Python re 模块匹配 HTML tag 的的时候，<.*> 和 <.?> 有什么区别(2018-5-2-xhq)
<.*> 匹配前一个字符 0 或多次
<.?> 匹配一个字符 0 次或 1 次

#### 10. Python 里面如何生成随机数
```
importrandom 
random.randint()
```

#### 11. 如何在 function 里面设置一个全局变量
```
globals()
globals()返回包含当前作用域全局变量的字典。 
global 变量 设置使用全局变量
```

#### 13. Python 的传参是传值还是传址
Python 是传对象引用。

#### 14. with 语句的作用，写一段代码
with 语句适用于对资源进行访问的场合，确保不管使用过程中是否发生异常都会执行必要的清理操作，释放资源，比如文件使用后自动关闭、线程中锁的自动获取和释放等。
```
with open("a.book","w") as f :
```

### 二十、钱方好近
#### 1. 求字符串' 是一个 test 字符串' 的字符个数字符编码为 utf8
```
a=' 是一个 test 字符串 ' 
print(len(a))
```

#### 2. 一个 list 对象 a = [1,2,4,3,2,2,3,4] 需要去掉里面重复的的值
```
a = [1,2,4,3,2,2,3,4] 
t =set(a) 
print(list(t))
```

#### 3. 有一个文件 test.txt 里面有数据
1 test 100 2012-04-18
2 aaa 12 2012-04-19
3 bbb 333 2012-04-18
4 ccc 211 2012-04-17
5 ddd 334 2012-04-16
一共有 5 行 4 列数据，最后一列为日期，按日期大小进行排序。
```
a=["2012-04-18","2012-04-19","2012-04-18","2012-04-17","2012-04-16"] 
import datetime 
def date_sort3(x): 
ls=list(x) 
 #用了冒泡排序来排序，其他方法效果一样 
for j in range(len(ls)-1): 
 for i in range(len(ls)-j-1): 
 lower=datetime.datetime.strptime(ls [i], '% Y-% m-% d') 
 upper=datetime.datetime.strptime(ls [i+1], '% Y-% m-% d') 
 if lower>upper: 
 ls [i],ls [i+1]=ls [i+1],ls [i] 
return tuple(ls) 
print(date_sort3(a))
```

### 二十一、西北莜面村
#### 1. 列举出一些常用的设计模式？
创建型：
1.Factory Method（工厂方法）
2.Abstract Factory（抽象工厂）
3.Builder（建造者）
4.Prototype（原型）
5.Singleton（单例）

结构型：
6.Adapter Class/Object（适配器）
7.Bridge（桥接）
8.Composite（组合）
9.Decorator（装饰）
10.Facade（外观）
11.Flyweight（享元）
12.Proxy（代理）

行为型：
13.Interpreter（解释器）
14.Template Method（模板方法）
15.Chain of Responsibility（责任链）
16.Command（命令）
17.Iterator（迭代器）
18.Mediator（中介者）
19.Memento（备忘录）
20.Observer（观察者）
21.State（状态）
22.Strategy（策略）
23.Visitor（访问者）

#### 2. Python 关键字 yield 的用法？
yield 就是保存当前程序执行状态。你用 for 循环的时候，每次取一个元素的时候就会计算一次。用 yield 的函数叫 generator，和 iterator 一样，它的好处是不用一次计算所有元素，而是用一次算一次，可以节省很多空间 
generator 每次计算需要上一次计算结果，所以用 yield，否则一 return，上次计算结果就没了。

#### 3. 深拷贝，浅拷贝的区别？
在 Python 中对象的赋值其实就是对象的引用。当创建一个对象，把它赋值给另一个变量的时候，python 并没有拷贝这个对象，只是拷贝了这个对象的引用而已。
浅拷贝：拷贝了最外围的对象本身，内部的元素都只是拷贝了一个引用而已。也就是，把对象复制一遍，但是该对象中引用的其他对象我不复制
深拷贝：外围和内部元素都进行了拷贝对象本身，而不是引用。也就是，把对象复制一遍，并且该对象中引用的其他对象我也复制。

#### 4. 简化代码？
```
l = [] 
for i in range(10): 
l.append(i**2) 
print(l)
```
> 简化后的来：
```
print([x**2 for x in range(10)])
```

#### 6. 这两个参数什么意思 *args **kwargs，我们为什么要使用他们？
缺省参数指在调用函数的时候没有传入参数的情况下，调用默认的参数，在调用函数的同时赋值时，所传入的参数会替代默认参数。
*args 是不定长参数，他可以表示输入参数是不确定的，可以是任意多个。
**kwargs 是关键字参数，赋值的时候是以键 = 值的方式，参数是可以任意多对在定义函数的时候不确定会有多少参数会传入时，就可以使用两个参数。

#### 7. 数据库连表查询？
```
内连接：inner join on ； 
左连接：left join on ； 
右连接：right join on ;
```

### 二十二、浙江从泰
#### 2. 反爬虫措施？
通过 Headers 反爬虫：
从用户请求的 Headers 反爬虫是最常见的反爬虫策略。很多网站都会对 Headers 的 User-Agent 进行检测，还有一部分网站会对 Referer 进行检测（一些资源网站的防盗链就是检测 Referer）。如果遇到了这类反爬虫机制，可以直接在爬虫中添加 Headers，将浏览器的 User-Agent 复制到爬虫的 Headers 中；或者将 Referer 值修改为目标网站域名。对于检测 Headers 的反爬虫，在爬虫中修改或者添加 Headers 就能很好的绕过。

基于用户行为反爬虫：
还有一部分网站是通过检测用户行为，例如同一 IP 短时间内多次访问同一页面，或者同一账户短时间内多次进行相同操作。
大多数网站都是前一种情况，对于这种情况，使用 IP 代理就可以解决。可以专门写一个爬虫，爬取网上公开的代理 ip，检测后全部保存起来。这样的代理 ip 爬虫经常会用到，最好自己准备一个。有了大量代理 ip 后可以每请求几次更换一个 ip，这在 requests 或者 urllib2 中很容易做到，这样就能很容易的绕过第一种反爬虫。
对于第二种情况，可以在每次请求后随机间隔几秒再进行下一次请求。有些有逻辑漏洞的网站，可以通过请求几次，退出登录，重新登录，继续请求来绕过同一账号短时间内不能多次进行相同请求的限制。

动态页面的反爬虫：
上述的几种情况大多都是出现在静态页面，还有一部分网站，我们需要爬取的数据是通过 ajax 请求得到，或者通过 JavaScript 生成的。首先用 Fiddler 对网络请求进行分析。如果能够找到 ajax 请求，也能分析出具体的参数和响应的具体含义，我们就能采用上面的方法，直接利用 requests 或者 urllib2 模拟 ajax 请求，对响应的 json 进行分析得到需要的数据。 能够直接模拟 ajax 请求获取数据固然是极好的，但是有些网站把 ajax 请求的所有参数全部加密了。我们根本没办法构造自己所需要的数据的请求。这种情况下就用 selenium+phantomJS，调用浏览器内核，并利用 phantomJS 执行 js 来模拟人为操作以及触发页面中的 js 脚本。从填写表单到点击按钮再到滚动页面，全部都可以模拟，不考虑具体的请求和响应过程，只是完完整整的把人浏览页面获取数据的过程模拟一遍。
用这套框架几乎能绕过大多数的反爬虫，因为它不是在伪装成浏览器来获取数据（上述的通过添加 Headers 一定程度上就是为了伪装成浏览器），它本身就是浏览器，phantomJS 就是一个没有界面的浏览器，只是操控这个浏览器的不是人。利 selenium+phantomJS 能干很多事情，例如识别点触式（12306）或者滑动式的验证码，对页面表单进行暴力破解等。

#### 3. 分布式爬虫原理？
scrapy-redis 实现分布式，其实从原理上来说很简单，这里为描述方便，我们把自己的核心服务器称为 master，而把用于跑爬虫程序的机器称为 slave。
我们知道，采用 scrapy 框架抓取网页，我们需要首先给定它一些 start_urls，爬虫首先访问 start_urls 里面的 url，再根据我们的具体逻辑，对里面的元素、或者是其他的二级、三级页面进行抓取。而要实现分布式，我们只需要在这个 starts_urls 里面做文章就行了。
我们在 master 上搭建一个 redis 数据库（注意这个数据库只用作 url 的存储，不关心爬取的具体数据，不要和后面的 mongodb 或者 mysql 混淆），并对每一个需要爬取的网站类型，都开辟一个单独的列表字段。通过设置 slave 上 scrapy-redis 获取 url 的地址为 master 地址。这样的结果就是，尽管有多个 slave，然而大家获取 url 的地方只有一个，那就是服务器 master 上的 redis 数据库。 并且，由于 scrapy-redis 自身的队列机制，slave 获取的链接不会相互冲突。这样各个 slave 在完成抓取任务之后，再把获取的结果汇总到服务器上（这时的数据存储不再在是 redis，而是 mongodb 或者 mysql 等存放具体内容的数据库了）
这种方法的还有好处就是程序移植性强，只要处理好路径问题，把 slave 上的程序移植到另一台机器上运行，基本上就是复制粘贴的事情。

### 二十三、tataUFO
#### 1. 将字符串：'k:1|k1:2|k2:3|k3:4'，处理成 Python 字典：{k:1， k1:2， …} # 字典 里的 K 作为字符串处理
```
str1 ="k:1|k1:2|k2:3|k3:4" 
def str2dict(str1): 
dict1 = {} 
for iterms in strsplit('|'): 
key，value = iterms.split(':') 
dict1 [key] = value 
return dict1
```

#### 2. 现有字典 d={‘a':24，'g':52，'l':12，'k':33} 请按字典中的 value 值进 行排序？
`
sorted(d.items()，key = lambda x:x [1])
`

#### 3. 写一个装饰器？
装饰器经常被用于有切面需求的场景，较为经典的有插入日志、性能测试、事务处理等。装饰器是解决这类问题的绝佳设计。
有了装饰器，我们就可以抽离出大量函数中与函数功能本身无关的雷同代码并继续重用。概括的讲，装饰器的作用就是为已经存在的对象添加额外的功能。
```
#! coding=utf-8
import time
def timeit(func):
def wrapper(a):
start = time.clock()
func(1,2)
end =time.clock()
prin('used:', end - start)
print(a)
return wrapper
# foo = timeit(foo) 完全等价，# 使用之后，foo 函数就变了，相当于是 wrapper 了 

@timeit 
def foo(a,b):
pass 

# 不带参数的装饰器
# wraper 将 fn 进行装饰，return wraper , 返回的 wraper 就是装饰之后的 fn
def test(func):
def wraper():
print "test start" 
func()
print "end start" 
return wraper

@test 
def foo():
print "in foo" 
```

#### 4. Python 中可变类型和不可变类型有哪些？
可变不可变指的是内存中的值是否可以被改变，不可变类型指的是对象所在内存块里面的值不可以改变，有数值、字符串、元组；可变类型则是可以改变，主要有列表、字典。

### 二十四、全品教育
#### 1. Tuple 和 list 区别
Python 内置的一种数据类型是列表：list。list 是一种有序的集合，可以随时添加和删除其中的元素。
另一种有序列表叫元组：tuple。tuple 和 list 非常类似，但是 tuple 一旦初始化就不能修改

#### 2. 这两个参数 * args **kwargs 是什么意思
缺省参数指在调用函数的时候没有传入参数的情况下，调用默认的参数，在调用函数的同时赋值时，
所传入的参数会替代默认参数。
*args 是不定长参数，他可以表示输入参数是不确定的，可以是任意多个。
**kwargs 是关键字参数，赋值的时候是以键 = 值的方式，参数是可以任意多对在定义函数的时候不确定会有多少参数会传入时，就可以使用两个参数。

#### 3. Python 里面如何实现 tuple 和 list 的转换
```
t =(1,5,8) 
l = list(t)
```

#### 4. Python 里面 range 和 xrange 的区别
xrange 和 range 的参数和用法是相同的。只是 xrange() 返回的不再是一个数列，而是一个 xrange对象。这个对象可以按需生成参数指定范围内的数字（即元素）。由于 xrange 对象是按需生成单个的元素，而不像 range 那样，首先创建整个 list。所以，在相同的范围内，xrange 占用的内存空间将更小，xrange 也会更快。实际上，xrange 由于是在循环内被调用时才会生成元素，因此无论循环多少次，只有当前一个元素占用了内存空间，且每次循环占用的都是相同的单个元素空间。我们可以粗略的认为，相同 n 个元素的话，range 占用的空间是 xrange 的 n 倍。因此，在循环很大情况下，xrange 的高效率和快速将表现的很明显。
注意：Python3 中已经没有 xrange 了。

#### 5. Python 里面 classmethod 和 staticmethod 的区别
如果在 @staticmethod 中要调用到这个类的一些属性方法，只能直接类名。属性名或类名。方法名。
而 @classmethod 因为持有 cls 参数，可以来调用类的属性，类的方法，实例化对象等。

#### 6. 如何反向输出序列比如 [2,6,5,3], 输出为 [3,5,6,2]
```
l =[2,6,5,3] 
l.reverse() 
print(l)
```

#### 7. Python 里面实现删除重复的元素```
lis=[1,1,2,3,1,2,1,3,2,4,5,5,4] 
t = set(lis) 
print(t)
```

#### 8. Python 里面 copy 和 deepcopy 的区别
deepcopy（深复制），即将被复制对象完全再复制一遍作为独立的新个体单独存在。所以改变原有被复制对象不会对已经复制出来的新对象产生影响。 而等于（=）赋值，并不会产生一个独立的对象单独存在，他只是将原有的数据块打上一个新标签，所以当其中一个标签被改变的时候，数据块就会发生变化，另一个标签也会随之改变。 而 copy（浅复制）要分两种情况进行讨论：
1）当浅复制的值是不可变对象（数值，字符串，元组）时和等于赋值的情况一样，对象的 id 值与浅复制原来的值相同。
2）当浅复制的值是可变对象（列表和元组）时会产生一个不是那么独立的对象存在。有两种情况：
第一种情况：复制的 对象中无 复杂 子对象，原来值的改变并不会影响浅复制的值，同时浅复制的值改变也并不会影响原来的值。原来值的 id 值与浅复制原来的值不同。
第二种情况：复制的对象中有 复杂 子对象 （例如列表中的一个子元素是一个列表），如果不改变其中复杂子对象，浅复制的值改变并不会影响原来的值。 但是改变原来的值 中的复杂子对象的值 会影响浅复制的值。 对于简单的 object，例如不可变对象（数值，字符串，元组），用 shallow copy 和 deep copy 没区别。复杂的 object， 如 list 中套着 list 的情况，shallow copy 中的 子 list，并未从原 object 真的「独立」出来。也就是说，如果你改变原 object 的子 list 中的一个元素，你的 copy 就会跟着一起变。这跟我们直觉上对「复制」的理解不同。

#### 9. Python 里面的 search 和 match 的区别
match（）函数只检测 RE 是不是在 string 的开始位置匹配， search() 会扫描整个 string 查找匹配，也就是说 match（）只有在 0 位置匹配成功的话才有返回，如果不是开始位置匹配成功的话，match() 就返回 none。

#### 10. 输出下列代码的结果
```
class Parent(object): 
    x=1 
class Child1(Parent): 
    pass 
class Child2(Parent): 
    pass 
print(Parent.x,Childx,Childx) 
Childx=2 
print(Parent.x,Childx,Childx)
Parent.x=3 
print(Parent.x,Childx,Childx) 结果1 1 1，1 2 1，3 2 3
```

#### 11. Python 代码如何得到列表的交集和差集？
```
b1 =[1,2,3] 
b2 =[2,3,4] 
t1 = set(b1) 
t2 =set(b2) 
t3 =t1&t2 
t4 = t1-t2 
t5 = t2-t1 
print(list(t3)) 
print(list(t4)) 
print(list(t5))
```

#### 12. 请写出一段代码求出 1 到 100 的和？
```
i =1 
su=0 
while i <=100: 
    su =su+i 
    i+=1 
print(su)
```

#### 13. Python 中正则表达式提取出字符串中的数字
```
s ='12j33jk12ksdjfkj23jk4h1k23h' 
import re 
b=re.findall("\d",s) 
b="".join(b) 
print(b)
```

#### 14. 补全下列代码
```
def deco(func): 
    pass '补全代码' 

@deco 
def myfunc(a,b): 
    print("myfunc(% s,% s) called" %(a,b)) 
    return a+b
```
> 补充后：
```
def deco(func): 
    def inner(a,b): 
        return func(a,b) 
    return inner 

@deco 
def myfunc(a,b): 
    print("myfunc(% s,% s) called" %(a,b)) 
    return a+b
```

### 二十五、名企片爬虫面试题
#### 1. 简述一次完整的 http 的通信过程、常用的响应状态码、http 的无状态性、Cookies 等这些概念
 `一、http 过程`
HTTP 通信机制是在一次完整的 HTTP 通信过程中，Web 浏览器与 Web 服务器之间将完成下列 7 个步骤：
`1. 建立 TCP 连接`
在 HTTP 工作开始之前，Web 浏览器首先要通过网络与 Web 服务器建立连接，该连接是通过 TCP 来完成的，该协议与 IP 协议共同构建 Internet，即著名的 TCP/IP 协议族，因此 Internet 又被称作是 TCP/IP 网络。HTTP 是比 TCP 更高层次的应用层协议，根据规则，只有低层协议建立之后才能进行更高层协议的连接，因此，首先要建立 TCP 连接，一般 TCP 连接的端口号是 80。
`2. Web 浏览器向 Web 服务器发送请求命令`
一旦建立了 TCP 连接，Web 浏览器就会向 Web 服务器发送请求命令。例如：GET/sample/hello.jsp HTTP/1.1。
`3. Web 浏览器发送请求头信息`
浏览器发送其请求命令之后，还要以头信息的形式向 Web 服务器发送一些别的信息，之后浏览器发送了一空白行来通知服务器，它已经结束了该头信息的发送。
`4. Web 服务器应答`
客户机向服务器发出请求后，服务器会客户机回送应答， HTTP/1.1 200 OK ，应答的第一部分是协议的版本号和应答状态码。
`5. Web 服务器发送应答头信息`
正如客户端会随同请求发送关于自身的信息一样，服务器也会随同应答向用户发送关于它自己的数据及被请求的文档。
`6. Web 服务器向浏览器发送数据`
Web 服务器向浏览器发送头信息后，它会发送一个空白行来表示头信息的发送到此为结束，接着，它就以 Content-Type 应答头信息所描述的格式发送用户所请求的实际数据。
`7. Web 服务器关闭 TCP 连接`
一般情况下，一旦 Web 服务器向浏览器发送了请求数据，它就要关闭 TCP 连接，然后如果浏览器或者服务器在其头信息加入了这行代码：Connection:keep-alive
TCP 连接在发送后将仍然保持打开状态，于是，浏览器可以继续通过相同的连接发送请求。保持连接节省了为每个请求建立新连接所需的时间，还节约了网络带宽。

#### 二、常见的响应状态码
1．200 301 302 404 500。

#### 三、无状态
无状态是指协议对于事务处理没有记忆能力，服务器不知道客户端是什么状态。即我们给服务器发送 HTTP 请求之后，服务器根据请求，会给我们发送数据过来，但是，发送完，不会记录任何信息。

#### 四、Cookie
Cookie 是由 HTTP 服务器设置的，保存在浏览器中，但 HTTP 协议是一种无状态协议，在数据交换完毕后，服务器端和客户端的链接就会关闭，每次交换数据都需要建立新的链接。就像我们去超市买东西，没有积分卡的情况下，我们买完东西之后，超市没有我们的任何消费信息，但我们办了积分卡之后，超市就有了我们的消费信息。cookie 就像是积分卡，可以保存积分，商品就是我
们的信息，超市的系统就像服务器后台，http 协议就是交易的过程。

#### 2. 说说进程和线程和锁之间的关系
`一、进程`
首先进程是指在系统中正在运行的一个应用程序；程序一旦运行就是进程，或者更专业化来说：进程是指程序执行时的一个实例，即它是程序已经执行到课中程度的数据结构的汇集。从内核的观点看，进程的目的就是担当分配系统资源（CPU 时间、内存等）的基本单位，进程有五方面的特点：
第一：动态性：进程的实质是程序的一次执行过程，进程是动态产生，动态消亡的。
第二： 并发性：任何进程都可以同其他进程一起并发执行
第三：独立性：进程是一个能独立运行的基本单位，同时也是系统分配资源和调度的独立单位；第四：异步性：由于进程间的相互制约，使进程具有执行的间断性，即进程按各自独立的、不可预知的速度向前推进
第五：结构特征：进程由程序、数据和进程控制块三部分组成。进程可以使用 fork（）函数来创建子进程也可以使用 vfork（）来实现进程，使用的时候注意不要产生僵尸进程和孤儿进程。
`二、线程`
线程是系统分配处理器时间资源的基本单元，或者说进程之内独立执行的一个单元执行流，线程有四方面特点：第一，线程有独立的堆栈段，共享地址空间，开销较小，切换速度较快。第二，线程间的通信机制比较方便。第三，因为操作系统会保证当线程数不大于 CPU 数目时，不同的线程运行于不同的 CPU 上。线程使 CPU 系统更加有效。第四，线程改善了程序结构，避免了一些嵌套循环。使用 pthread_create() 函数来创建线程，使用线程的时候有两点注意事项：第一，当多线程访问同一全局变量的时候，一定要加互斥量，也就是上锁。当然最后不要忘记了解锁。第二：正确处理线程结束的问题：因为一个线程的终止，线程的资源不会随线程的终止释放，我们需要调用 pthread_join() 来获得另一个线程的终止状态并且释放该线程所占的资源。
一个程序至少有一个进程，一个进程至少有一个线程。线程不能够独立执行，必须依存在进程中。
`三、锁`
当多线程访问同一全局变量的时候，一定要加互斥量，也就是上锁。

#### 3. MySQL 操作：为 person 表的 name 创建普通的索引
```CREATE INDEX name ON table_name(person)```

#### 4. *args and **kwargs 的区别
在函数定义中使用 * args 和 kwargs 传递可变长参数. *args 用作传递非命名键值可变长参数列表（位置参数）; kwargs 用作传递键值可变长参数列表，并且，*args 必须位于 **kwargs 之前，因为 positional arguments 必须位于 keyword arguments 之前。

#### 5. 写一个匹配 Email 地址的正则表达式
```
只允许英文字母、数字、下划线、英文句号、以及中划线组成 
^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$ 
名称允许汉字、字母、数字，域名只允许英文域名 
^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$
```

#### 6. 常见的反爬虫措施有哪些？一般怎么克服
1）通过 Headers 反爬虫
从用户请求的 Headers 反爬虫是最常见的反爬虫策略。很多网站都会对 Headers 的 User-Agent 进行检测，还有一部分网站会对 Referer 进行检测（一些资源网站的防盗链就是检测 Referer）。如果遇到了这类反爬虫机制，可以直接在爬虫中添加 Headers，将浏览器的 User-Agent 复制到爬虫的 Headers 中；或者将 Referer 值修改为目标网站域名。对于检测 Headers 的反爬虫，在爬虫中修改或者添加 Headers 就能很好的绕过。
2）基于用户行为反爬虫
还有一部分网站是通过检测用户行为，例如同一 IP 短时间内多次访问同一页面，或者同一账户短时间内多次进行相同操作。 大多数网站都是前一种情况，对于这种情况，使用 IP 代理就可以解决。可以专门写一个爬虫，爬取网上公开的代理 ip，检测后全部保存起来。这样的代理 ip 爬虫经常会用到，最好自己准备一个。有了大量代理 ip 后可以每请求几次更换一个 ip，这在 requests 或者 urllib2 中很容易做到，这样就能很容易的绕过第一种反爬虫。 对于第二种情况，可以在每次请求后随机间隔几秒再进行下一次请求。有些有逻辑漏洞的网站，可以通过请求几次，退出登录，重新登录，继续请求来绕过同一账号短时间内不能多次进行相同请求的限制。
3）动态页面的反爬虫
上述的几种情况大多都是出现在静态页面，还有一部分网站，我们需要爬取的数据是通过 ajax 请求得到，或者通过 JavaScript 生成的。首先用 Firebug 或者 HttpFox 对网络请求进行分析。如果能够找到 ajax 请求，也能分析出具体的参数和响应的具体含义，我们就能采用上面的方法，直接利用 requests 或者 urllib2 模拟 ajax 请求，对响应的 json 进行分析得到需要的数据。 能够直接模拟 ajax 请求获取数据固然是极好的，但是有些网站把 ajax 请求的所有参数全部加密了。我们根本没办法构造自己所需要的数据的请求。我这几天爬的那个网站就是这样，除了加密 ajax 参数，它还把一些基本的功能都封装了，全部都是在调用自己的接口，而接口参数都是加密的。遇到这样的网站，我们就不能用上面的方法了，我用的是 selenium+phantomJS 框架，调用浏览器内核，并利用 phantomJS 执行 js 来模拟人为操作以及触发页面中的 js 脚本。从填写表单到点击按钮再到滚动页面，全部都可以模拟，不考虑具体的请求和响应过程，只是完完整整的把人浏览页面获取数据的过程模拟一遍。
用这套框架几乎能绕过大多数的反爬虫，因为它不是在伪装成浏览器来获取数据（上述的通过添加 Headers 一定程度上就是为了伪装成浏览器），它本身就是浏览器，phantomJS 就是一个没有界面的浏览器，只是操控这个浏览器的不是人。利用 selenium+phantomJS 能干很多事情，例如识别点触式（12306）或者滑动式的验证码，对页面表单进行暴力破解等等。

#### 7. 编写爬虫的常用模块或者框架有哪些？请说明一个爬虫的行为步骤
爬虫的行为步骤：
1、获取网页
2、提取数据
3、高效抓取数据
4、持续抓取数据（增量式爬虫）
5. 爬虫和反爬虫和反反爬虫

#### 8. 排序算法有哪些用 Python 写一种排序算法


### 二十六、欧特咨询
#### 1. 对 Cookie 的理解，遇到没有 Cookie 登陆的问题
Cookie 是由 HTTP 服务器设置的，保存在浏览器中，但 HTTP 协议是一种无状态协议，在数据交换完毕后，服务器端和客户端的链接就会关闭，每次交换数据都需要建立新的链接。就像我们去超市买东西，没有积分卡的情况下，我们买完东西之后，超市没有我们的任何消费信息，但我们办了积分卡之后，超市就有了我们的消费信息。Cookie 就像是积分卡，可以保存积分，商品就是我们的信息，超市的系统就像服务器后台，http 协议就是交易的过程。
如果遇到没有 Cookie 的话可以借助 phantomjs selenium 进行登陆。

#### 2. 如何解决验证码的问题，用什么模块，听过哪些人工打码平台
PIL、pytesser、tesseract。
平台的话有：云打码、答题吧打码平台、挣码、斐斐打码、若快打码。

#### 3. 对于 scrapy_redis 的理解
scrapy-redis 是一个基于 redis 的 scrapy 组件，通过它可以快速实现简单分布式爬虫程序，该组件本质上提供了三大功能：
scheduler - 调度器
dupefilter - URL 去重规则（被调度器使用）
pipeline - 数据持久化
> 一、scrapy-redis 组件
1.URL 去重 去重规则通过 redis 的集合完成，去重规则中将 url 转换成唯一标示，然后在 redis 中检查是否已经在集合中存在
2.调度器 调度器，调度器使用 PriorityQueue（有序集合）、FifoQueue（列表）、LifoQueue（列表）进行保存请求，并且使用 RFPDupeFilter 对 URL 去重
3.数据持久化
 定义持久化，爬虫 yield Item 对象时执行 RedisPipeline 将 item 持久化到 redis 时，指定 key 和序列化函数
 REDIS_ITEMS_KEY = ‘%(spider) s:items'
 REDIS_ITEMS_SERIALIZER = ‘json.dumps'
 使用列表保存 item 数据
4.起始 URL 相关
 获取起始 URL 时，去集合中获取还是去列表中获取？True，集合；False，列表 REDIS_START_URLS_AS_SET = False # 获取起始 URL 时，如果为 True，则使用 self.server.spop；如果为 False，则使用 self.server.lpop。 编写爬虫时，起始 URL 从 redis 的 Key 中获取。

#### 4. ip 被封了怎么解决，自己做过 ip 池么？> 关于 ip 可以通过 ip 代理池来解决问题 ip 代理池相关的可以在 github 上搜索 ip proxy 自己选一个
去说 https://github.com/awolfly9/IPProxyTool 提供大体思路：
1.获取器 通过 requests 的爬虫爬取免费的 IP 代理网址获取 IP。
2.过滤器通过获取器获取的代理请求网页数据有数据返回的保存进 Redis。
3.定时检测器定时拿出一部分 Proxy 重新的用过滤器进行检测剔除不能用的代理。
4.利用 Flask web 服务器提供 API 方便提取 IP

### 二十七、多来点
#### 1. 请阐述 Python 的特点
1）面向对象
2）免费
3）开源
4）可移植
5）功能强大
6）可混合
7）简单易用

### 二十八、傲盾
#### 1. Python 线程和进程的区别？
1) 调度：线程作为调度和分配的基本单位，进程作为拥有资源的基本单位。
2) 并发性：不仅进程之间可以并发执行，同一个进程的多个线程之间也可并发执行。
3）拥有资源：进程是拥有资源的一个独立单位，线程不拥有系统资源，但可以访问隶属于进程的资源.
4）系统开销：在创建或撤消进程时，由于系统都要为之分配和回收资源，导致系统的开销明显大于创建或撤消线程时的开销。

#### 2. 如何保证线程安全？
> 通常加锁也有 2 种不同的粒度的锁：
1.fine-grained(细粒度)，程序员需要自行加 / 解锁来保证线程安全
2.coarse-grained(粗粒度)，语言层面本身维护着一个全局的锁机制用来保证线程安全 前一种方式比较典型的是 Java, Jython 等，后一种方式比较典型的是 CPython(即 Python)。

#### 3. 编程实现 list 转 dict
```
# 方法一，使用 zip 函数 
a = ['hello', 'world', '1', '2'] 
b = dict(zip(a[0::2], a[1::2])) 
print(b) 

# 方法二，利用循环 
b = {} 
for i in range(0, len(a), 2): 
    b[a [i]] = a[i+1] 
print(b) 

# 使用 enumerate 函数生成 index 实现 
my_dict = {} 
for index, item in enumerate(a): 
    if index % 2 == 0: 
    my_dict[item] = a[index+1] 
print(b)
```

### 二十九、汉迪
#### 1. 在 Python 中，list，tuple，dict，set 有什么区别，主要应用在什么场景？
区别：
list：链表，有序的数据结构，通过索引进行查找，使用方括号 [];
tuple：元组，元组将多样的对象集合到一起，不能修改，通过索引进行查找，使用括号();
dict：字典，字典是一组键(key) 和值(value) 的组合，通过键(key) 进行查找，没有顺序，使用大括号{};
set：集合，无序，元素只出现一次，自动去重，使用 set([])

应用场景:
list：简单的数据集合，可以使用索引；
tuple：把一些数据当做一个整体去使用，不能修改；
dict：使用键值和值进行关联的数据；
set：数据只出现一次，只关心数据是否出现，不关心其位置。

#### 2. 说明 Session 和 Cookie 的联系
Session 对 Cookie 的依赖：Cookie 采用客户端存储，Session 采用的服务端存储的机制。Session 是针对每个用户（浏览器端）的，Session 值保存在服务器上，通过 SessionId 来区分哪个用户的 Session。因此 SessionId 需要被绑定在浏览器端。SessionId 通常会默认通过 Cookie 在浏览器端绑定，当浏览器端禁用 cookie 时，可通过 Url 重写（可以在地址栏看到 sessionid=KWJHUG6JJM65HS2K6 之类的字符串）或者表单隐藏字段的方式将 SessionId 传回给服务器，以便服务通过 SessionId 获取客户端对应的 Session。
具体一次的请求流程：当程序需要为客户端创建一个 Session 的时候，服务器首先检测这个客户端请求里面是否已经包含了 Session 的表示（SessionId）, 如果已经包含，则说明已经为客户端创建过一个 Session，服务端根据 SessionId 检索出来 Sesion 并使用。如果客户端请求不包含 SessionId，则为客户端创建一个 Session，并生成一个 SessionId 返回给客户端保存。

#### 3. 说明 Session 和 Cookie 的区别
1、Cookie 数据存放在客户的浏览器上，session 数据放在服务器上。
2、Cookie 不是很安全，别人可以分析存放在本地的 cookie 并进行 cookie 欺骗，考虑到安全应当使用 Session。
3、Session 会在一定时间内保存在服务器上。当访问增多，会比较占用你服务器的性能，考虑到减轻服务器性能方面，应当使用 Cookie。
4、单个 Cookie 保存的数据不能超过 4K，很多浏览器都限制一个站点最多保存 20 个 Cookie。
5、可以考虑将登陆信息等重要信息存放为 Session，其他信息如果需要保留，可以放在 Cookie 中。

### 三十、大会信统 Python 工程师
#### 1. 请写出一段 python 代码实现删除一个 list 里面的重复元素
方法一： 利用 Set 集合去重实现。
```
l1 = ['b','c','d','b','c','a','a']
l2 = list(set(l1))
lsort(key=lindex)
print(l2)
```

方法二：使用字典函数。
```
a=[1,2,4,2,4,5,6,5,7,8,9,0] 
b={} 
b=b.fromkeys(a) 
c=list(b.keys()) 
print(' 去重后的 list 为：',c)
```

方法三：用 append 方法实现。
```
def delList(L): 
    L1 = [] 
    for i in L:
        if i not in L1: 
            L1.append(i) 
    return L1 
print(delList([1,2,2,3,3,4,5])) 
print(delList([1,8,8,3,9,3,3,3,3,3,6,3]))
```

换成列表推导式更简单：
```
l1 = ['b','c','d','b','c','a','a'] 
l2 = [] 
[l2.append(i) for i in l1 if not i in l2] 
print(l2)
```

方法四：先对元素进行排序，然后从列表的最后开始扫描。
```
List=[1,2,4,2,4,5,7,10,5,5,7,8,9,0,3] 
if List: 
    List.sort() 
last = List[-1] 
for i in range(len(List)-2, -1, -1): 
    if last==List [i]:
        del List[i] 
    else:
        last=List[i] 
print(List)
```

#### 2. 编程用 sort 进行排序，然后从最后一个元素开始判断
```
a=[1,2,4,2,4,5,7,10,5,5,7,8,9,0,3] 
a.sort() 
last=a[-1] 
for i in range(len(a)-2,-1,-1): 
    if last==a[i]: 
        del a[i] 
    else: 
        last=a[i] 
print(a)
```

#### 3. Python 里面如何拷贝一个对象？（赋值，浅拷贝，深拷贝的区别）
1）赋值（=），就是创建了对象的一个新的引用，修改其中任意一个变量都会影响到另一个。
2）浅拷贝：创建一个新的对象，但它包含的是对原始对象中包含项的引用（如果用引用的方式修改其中一个对象，另外一个也会修改改变）{1, 完全切片方法；2，工厂函数，如 list()；3，copy 模块的 copy() 函数}。
3）深拷贝：创建一个新的对象，并且递归的复制它所包含的对象（修改其中一个，另外一个不会改变）{copy 模块的 copy.deepcopy() 函数}。

#### 4. Python 里面 match() 和 search() 的区别？
re 模块中 match(pattern,string [,flags]), 检查 string 的开头是否与 pattern 匹配。
re 模块中 research(pattern,string [,flags]), 在 string 搜索 pattern 的第一个匹配值。
```
>>>print(re.match(‘super', ‘superstition').span()) 
(0, 5) 
>>>print(re.match(‘super', ‘insuperable')) 
None 
>>>print(re.search(‘super', ‘superstition').span()) 
(0, 5) 
>>>print(re.search(‘super', ‘insuperable').span()) 
(2, 7)
```

#### 5. 用 Python 匹配 HTML tag 的时候，<._\> 和 <._?> 有什么区别？
术语叫贪婪匹配(<.*> ) 和非贪婪匹配(<.*?> )。
例如：test<.*> : test<.*?>：
<.*> 是贪婪匹配，会从第一个 <开始匹配，直到最后一个> 中间所有的字符都会匹配到，中间可能会包含 <>。
<.*?> 是非贪婪匹配，从第一个 <开始往后，遇到第一个> 结束匹配，这中间的字符串都会匹配到，但是不会有 <>。

#### 6. Python 里面如何生成随机数？
使用 random 模块。
1）随机整数：random.randint(a,b)：返回随机整数 x,a<=x<=b
random.randrange(start,stop,[,step])：返回一个范围在(start,stop,step) 之间的随机整数，不包括结束值。
2）随机实数：random.random( ): 返回 0 到 1 之间的浮点数
random.uniform(a,b): 返回指定范围内的浮点数。

### 三十一、倍通供应链 信息 & 数据中心工程师 笔试题
#### 1. OOP 编程三大特点是什么，多态应用的基础是什么？
1）封装 ：就是将一个类的使用和实现分开，只保留部分接口和方法与外部联系。
2）继承：子类自动继承其父级类中的属性和方法，并可以添加新的属性和方法或者对部分属性和方法进行重写。继承增加了代码的可重用性。
3）多态：多个子类中虽然都具有同一个方法，但是这些子类实例化的对象调用这些相同的方法后却可以获得完全不同的结果，多态性增强了软件的灵活性。（多态的概念依赖于继承）。

#### 2. 请描述抽象类和接口类的区别和联系？
1）抽象类：规定了一系列的方法，并规定了必须由继承类实现的方法。由于有抽象方法的存在，所以抽象类不能实例化。可以将抽象类理解为毛坯房，门窗、墙面的样式由你自己来定，所以抽象类与作为基类的普通类的区别在于约束性更强。
2）接口类：与抽象类很相似，表现在接口中定义的方法，必须由引用类实现，但他与抽象类的根本区别在于用途：与不同个体间沟通的规则（方法），你要进宿舍需要有钥匙，这个钥匙就是你与宿舍的接口，你的同室也有这个接口，所以他也能进入宿舍，你用手机通话，那么手机就是你与他人交流的接口。
3）区别和关联：
    1. 接口是抽象类的变体，接口中所有的方法都是抽象的。而抽象类中可以有非抽象方法。抽象类是声明方法的存在而不去实现它的类。
    2. 接口可以继承，抽象类不行。
    3. 接口定义方法，没有实现的代码，而抽象类可以实现部分方法。
    4. 接口中基本数据类型为 static 而抽类象不是。
    5. 接口可以继承，抽象类不行。
    6. 可以在一个类中同时实现多个接口。
    7. 接口的使用方式通过 implements 关键字进行，抽象类则是通过继承 extends 关键字进行。

#### 3. 请描述方法重载与方法重写？
1）方法重载：是在一个类里面，方法名字相同，而参数不同。返回类型呢？可以相同也可以不同。重载是让类以统一的方式处理不同类型数据的一种手段。
2）方法重写：子类不想原封不动地继承父类的方法，而是想作一定的修改，这就需要采用方法的重写。方法重写又称方法覆盖。

#### 4. 请用代码实现一个冒泡排序？
```
def bubbleSort(nums): 
    for i in range(len(nums)-1):# 这个循环负责设置冒泡排序进行的次数 
        for j in range(len(nums)-i-1):# ｊ为列表下标 
            if nums[j] > nums[j+1]: 
                nums[j], nums[j+1] = nums[j+1], nums[j] 
    return nums 
nums = [5,2,45,6,8,2,1] 
print（bubbleSort(nums)
```

#### 5. 请用代码实现输出：1，2，3，5，8，13，21，34，55，89…… 这道题考的是斐波那契数列的实现。
用生成器实现：
```
def fib(n): 
 ....: current = 0 
 ....: num1, num2 = 0, 1 
 ....: while current < n: 
     ....: num = num1 
     ....: num1, num2 = num2, num1+num2 
     ....: current += 1 
 ....:     yield num 
 ....: return 'done'
```

迭代器实现：
```
class FibIterator(object):
    def __init__(self, n):
    """ 
        :param n: int, 指明生成数列的前 n 个数 
    """ 
        self.n = n 
        # current 用来保存当前生成到数列中的第几个数了 
        self.current = 0 
        # num1 用来保存前前一个数，初始值为数列中的第一个数 0 
        self.num1 = 0 
        # num2 用来保存前一个数，初始值为数列中的第二个数 1 
        self.num2 = 1 

    def __next__(self): 
    """被 next() 函数调用来获取下一个数""" 
        if self.current < self.n: 
            num = self.num1 
            self.num1, self.num2 = self.num2, self.num1+self.num2 
            self.current += 1 
            return num 
        else: 
            raise StopIteration 

    def __iter__(self): 
    """迭代器的__iter__返回自身即可""" 
        return self
```


#### 6. 请解释下 TCP/IP 协议和 HTTP 协议？
HTTP 协议：
HTTP 协议即超文本传送协议(Hypertext Transfer Protocol)，是 Web 联网的基础，也是手机联网常用的协议之一，HTTP 协议是建立在 TCP 协议之上的一种应用。HTTP 连接最显著的特点是客户端发送的每次请求都需要服务器回送响应，在请求结束后，会主动释放连接。从建立连接到关闭连接的过程称为一次连接。
TCP/IP 协议：
TCP/IP（Transmission Control Protocol/Internet Protocol）协议是传输层协议，主要解决数据如何在网络中传输。HTTP 是应用层协议，主要解决如何包装数据。IP 协议对应于网络层。 详细了解可以看 第三章 Python 高级→八。网路编程

#### 7. Python 里面如何实现 tuple 和 list 的转换？
list 转换成 tuple：t=tuple(l)。
tuple 转换成 list：l=list(t)。

#### 8. 请写出以下 Linux 的 SHELL 命令？
显示所有文件包括隐藏文件 ls -a
切换到当前目录下的 dir 目录 cd dir
删除某一个文件 rm test
创建一个空文件 touch test
切换到 xiaoming 用户 su xiaoming
设置系统时间为 20:30:30 date -s 20:30:30

### 三十二、上海行知道教育 Python 程序员笔试题
#### 1. Python 如何实现单例模式？请写出两种实现方法？
在 Python 中，我们可以用多种方法来实现单例模式：
`1. 使用模块；` 
`2. 使用__new__；` 
`3. 使用装饰器；` 
`4. 使用元类（metaclass）。`

**1）使用模块：** 其实，Python 的模块就是天然的单例模式，因为模块在第一次导入时，会生成.pyc 文件，当第二次导入时，就会直接加载.pyc 文件，而不会再次执行模块代码。因此我们只需把相关的函数和数据定义在一个模块中，就可以获得一个单例对象了。
```
# mysingle.py 
class MySingle: 
    def foo(self): 
        pass 
sinleton = MySingle() 
将上面的代码保存在文件 mysingle.py 中，然后这样使用： 
from mysingle import sinleton 
singleton.foo()
```

**2）使用__new__：** 为了使类只能出现一个实例，我们可以使用__new__来控制实例的创建过程，
```
class Singleton(object): 
    def __new__(cls): 
    # 关键在于这，每一次实例化的时候，我们都只会返回这同一个 instance 对象 
        if not hasattr(cls, 'instance'): 
            cls.instance = super(Singleton, cls).__new__(cls) 
            return cls.instance 
obj1 = Singleton() 
obj2 = Singleton() 
objattr1 = 'value1' 
print(objattr1, objattr1 )
print(obj1 is obj2)
# 输出结果： 
# value1value1
```

**3）使用装饰器：** 装饰器可以动态的修改一个类或函数的功能。这里，我们也可以使用装饰器来装饰某个类，使其只能生成一个实例
```
def singleton(cls): 
    instances = {} 
    def getinstance(*args,**kwargs): 
        if cls not in instances: 
        instances [cls] = cls(*args,**kwargs) 
        return instances [cls] 
    return getinstance 

@singleton 
class MyClass: 
    a = 1 

c1 = MyClass() 
c2 = MyClass() 
print(c1 == c2) # True 
在上面，我们定义了一个装饰器 singleton，它返回了一个内部函数 getinstance， 该函数会判断某个类是否在字典 instances 中，如果不存在，则会将 cls 作为 key，cls(*args, **kw) 作为 value 存到 instances 中，否则，直接返回 instances [cls]。
```

**4）使用 metaclass（元类）：** 元类可以控制类的创建过程，它主要做三件事：
拦截类的创建
修改类的定义
返回修改后的类
```
class Singleton2(type): 
    def __init__(self, *args, **kwargs): 
        self.__instance = None 
        super(Singleton2,self).__init__(*args, **kwargs) 

    def __call__(self, *args, **kwargs): 
        if self.__instance is None: 
            self.__instance = super(Singleton2,self).__call__(*args, **kwargs) 
        return self.__instance 

class Foo(object): 
    __metaclass__ = Singleton2 
    # 在代码执行到这里的时候，元类中的__new__方法和__init__方法其实已经被执行了，而不 是在 Foo 实例化的时候执行。且仅会执行一次。 
foo1 = Foo() 
foo2 = Foo() 
print(Foo.__dict__)
# _Singleton__instance': <__main__.Foo object at 0x100c52f10> 存在一个私有属性来保存属性，而不会污染 Foo 类（其实还是会污染，只是无法直接通过__instance 属性访问） 
print(foo1 is foo2)# True
```

#### 2. 什么是 lambda 函数？请举例说明？
 匿名函数 lambda：是指一类无需定义标识符（函数名）的函数或子程序。lambda 函数可以接收任意多个参数(包括可选参数) 并且返回单个表达式的值。
例 1:传入多个参数的 lambda 函数
```
def sum(x,y): 
    return x+y
```
用 lambda 来实现：
```
p = lambda x,y:x+y 
print(4,6)
```
例 2： 传入一个参数的 lambda 函数
```
a=lambda x:x*x 
print(a(3))
# 注意：这里直接 a(3) 可以执行，但没有输出的，前面的 print 不能少
```

例 3： 多个参数的 lambda 形式：
```
a = lambda x,y,z:(x+8)*y-z 
print(a(5,6,8))
```

#### 3. 如何反序地迭代一个序列？
在列表中，如果我们要将列表反向迭代通常使用 reverse()。但这个方法有个缺陷就是会改变列表。因此，我们推荐使用 reversed()，它会返回一个迭代器。这里，我们可以实现__reversed__() 解决反向迭代问题。
```
class FloatRange: 
    def __init__(self, start, end, step): 
    self.start = start 
    self.end = end 
    self.step = step 

    # 正向迭代 
    def __iter__(self): 
        t = self.start 
        while round(t, 2) <= round(self.end, 2): 
            yield t 
            t += self.step 
    # 反向迭代 
    def __reversed__(self): 
        t = self.end 
        while round(t, 2) >= round(self.start, 2): 
            yield t 
            t -= self.step 

if __name__ == "__main__": 
    for x in FloatRange(0, 0, 2): 
        print(x)
    for x in reversed(FloatRange(0, 0, 2)): 
        print(x)
```
