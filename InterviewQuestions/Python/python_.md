## 第二章 Python3 高级 
### 一、元类
#### 1.Python 中类方法、类实例方法、静态方法有何区别？
>类方法：是类对象的方法，在定义时需要在上方使用 @classmethod 进行装饰，形参为 cls，  
表示类对象，类对象和实例对象都可调用；  
类实例方法：是类实例化对象的方法，只有实例对象可以调用，形参为 self，指代对象本身；  
静态方法：是一个任意函数，在其上方使用 @staticmethod 进行装饰，可以用对象直接调用，  
静态方法实际上跟该类没有太大关系。

#### 2.Python 中如何动态获取和设置对象的属性？
```
if hasattr(Parent, 'x'):
    print(getattr(Parent, 'x'))
setattr(Parent, 'x', 3)
print(getattr(Parent, 'x'))
```

### 二、内存管理与垃圾回收机制
#### 1. Python 的内存管理机制及调优手段？
>内存管理机制：`引用计数`、`垃圾回收`、`内存池`。

#### 引用计数：
>引用计数是一种非常高效的内存管理手段， 当一个 Python 对象被引用时其引用计数增加 1， 当其不再被一个变量引用时则计数减 1. 当引用计数等于 0 时对象被删除。

#### 垃圾回收：
1. 引用计数
>引用计数也是一种垃圾收集机制，而且也是一种最直观，最简单的垃圾收集技术。当 Python 的某个对象的引用计数降为 0 时，说明没有任何引用指向该对象，该对象就成为要被回收的垃圾了。比如某个新建对象，它被分配给某个引用，对象的引用计数变为 1。如果引用被删除，对象的引用计数为 0，那么该对象就可以被垃圾回收。不过如果出现循环引用的话，引用计数机制就不再起有效的作用了

2. 标记清除
>如果两个对象的引用计数都为 1，但是仅仅存在他们之间的循环引用，那么这两个对象都是需要被回收的，也就是说，它们的引用计数虽然表现为非 0，但实际上有效的引用计数为 0。所以先将循环引用摘掉，就会得出这两个对象的有效计数。

3. 分代回收
>从前面标记 - 清除这样的垃圾收集机制来看，这种垃圾收集机制所带来的额外操作实际上与系统中总的内存块的数量是相关的，当需要回收的内存块越多时，垃圾检测带来的额外操作就越多，而垃圾回收带来的额外操作就越少；反之，当需回收的内存块越少时，垃圾检测就将比垃圾回收带来更少的额外操作。

>举个例子：
>当某些内存块 M 经过了 3 次垃圾收集的清洗之后还存活时，我们就将内存块 M 划到一个集合 A 中去，而新分配的内存都划分到集合 B 中去。
>当垃圾收集开始工作时，大多数情况都只对集合 B 进行垃圾回收，而对集合 A 进行垃圾回收要隔相当长一段时间后才进行，这就使得垃圾收集机制需要处理的内存少了，效率自然就提高了。
>在这个过程中，集合 B 中的某些内存块由于存活时间长而会被转移到集合 A 中，当然，集合 A 中实际上也存在一些垃圾，这些垃圾的回收会因为这种分代的机制而被延迟。

#### 内存池：
>1.Python 的内存机制呈现金字塔形状，-1，-2 层主要有操作系统进行操作；
>2.第 0 层是 C 中的 malloc，free 等内存分配和释放函数进行操作；
>3.第 1 层和第 2 层是内存池，有 Python 的接口函数 PyMem_Malloc 函数实现，当对象小于 256K 时有该层直接分配内存；
>4.第 3 层是最上层，也就是我们对 Python 对象的直接操作；

>Python 在运行期间会大量地执行 malloc 和 free 的操作，频繁地在用户态和核心态之间进行切换，这将严重影响 Python 的执行效率。为了加速 Python 的执行效率，Python 引入了一个内存池机制，用于管理对小块内存的申请和释放。
>Python 内部默认的小块内存与大块内存的分界点定在 256 个字节，当申请的内存小于 256 字节时，PyObject_Malloc 会在内存池中申请内存；当申请的内存大于 256 字节时，PyObject_Malloc 的行为将蜕化为 malloc 的行为。当然，通过修改 Python 源代码，我们可以改变这个默认值，从而改变 Python 的默认内存管理行为。

#### 调优手段（了解）
>1. 手动垃圾回收
>2. 调高垃圾回收阈值
>3. 避免循环引用（手动解循环引用和使用弱引用）

#### 2. 内存泄露是什么？如何避免？
>指由于疏忽或错误造成程序未能释放已经不再使用的内存的情况。内存泄漏并非指内存在物理上的消失，而是应用程序分配某段内存后，由于设计错误，失去了对该段内存的控制，因而造成了内存的浪费。
>导致程序运行速度减慢甚至系统崩溃等严重后果。
>有 `del()` 函数的对象间的循环引用是导致内存泄漏的主凶。>不使用一个对象时使用:`del object` 来删除一个对象的引用计数就可以有效防止内存泄漏问题。
>通过 Python 扩展模块 gc 来查看不能回收的对象的详细信息。
>可以通过 `sys.getrefcount(obj)` 来获取对象的引用计数，并根据返回值是否为 `0` 来判断是否内存泄漏。

### 三、函数
###1. 函数参数
#### 1.0 谈谈你对闭包的理解？
```
闭包(closure) 是函数式编程的重要的语法结构。闭包也是一种组织代码的结构，它同样提高了代码的可重复使用性。
当一个内嵌函数引用其外部作作用域的变量，我们就会得到一个闭包。总结一下，创建一个闭包必须满足以下几点:
    必须有一个内嵌函数
    内嵌函数必须引用外部函数中的变量
    外部函数的返回值必须是内嵌函数

重点是函数运行后并不会被撤销，就像 16 题的 instance 字典一样，当函数运行完后，instance 并不被销毁，而是继续留在内存空间里。这个功能类似类里的类变量，只不过迁移到了函数上.
闭包就像个空心球一样，你知道外面和里面，但你不知道中间是什么样.
```

#### 1.1 Python 函数调用的时候参数的传递方式是值传递还是引用传递？

>Python 的参数传递有：位置参数、默认参数、可变参数、关键字参数。
>
>函数的传值到底是值传递还是引用传递，要分情况：
>
>`不可变参数用值传递`：
>像整数和字符串这样的不可变对象，是通过拷贝进行传递的，因为你无论如何都不可能在原处改变不可变对象
>
>`可变参数是引用传递的`：
>比如像列表，字典这样的对象是通过引用传递、和 C 语言里面的用指针传递数组很相似，可变对象能在函数内部改变。

#### 1.2 对缺省参数的理解？
>缺省参数指在调用函数的时候没有传入参数的情况下，调用默认的参数，在调用函数的同时赋值时，所传入的参数会替代默认参数。
>`*args` 是不定长参数，他可以表示输入参数是不确定的，可以是任意多个。
>`**kwargs` 是关键字参数，赋值的时候是以键 = 值的方式，参数是可以任意多对在定义函数的时候
>不确定会有多少参数会传入时，就可以使用两个参数。

#### 1.3 为什么函数名字可以当做参数用？
>Python 中一切皆对象，函数名是函数在内存中的空间，也是一个对象。

#### 1.4 Python 中 pass 语句的作用是什么？
>在编写代码时只写框架思路，具体实现还未编写就可以用 pass 进行占位，使程序不报错，不会进行任何操作。

#### 1.5 有这样一段代码，print(c) 会输出什么，为什么？
```
a = 10
b = 20
c = [a]
a = 15
```
` 答 `：10 对于字符串、数字，传递是相应的值。

#### 1.6 交换两个变量的值？
`a,b = b,a`

###2. 内建函数
#### 2.1 map 函数和 reduce 函数？
>`①从参数方面来讲`：
>`map()` 包含两个参数，第一个参数是一个函数，第二个是序列（列表或元组）。其中，函数（即 map 的第一个参数位置的函数）可以接收一个或多个参数。>`reduce()` 第一个参数是函数，第二个是序列（列表或元组）。但是，其函数必须接收两个参数。
>`②从对传进去的数值作用来讲`：
>`map()` 是将传入的函数依次作用到序列的每个元素，每个元素都是独自被函数作用一次。>`reduce()` 是将传人的函数作用在序列的第一个元素得到结果后，把这个结果继续与下一个元素作用（累积计算）。

#### 2.2 递归函数停止的条件？
>递归的终止条件一般定义在递归函数内部，在递归调用前要做一个条件判断，根据判断的结果选择是继续调用自身，还是 `return;` 返回终止递归。

>`终止的条件`：
>1.判断递归的次数是否达到某一限定值
>2.判断运算的结果是否达到某个范围等，根据设计的目的来选择

#### 2.3 回调函数，如何通信的？
>回调函数是把函数的指针(地址) 作为参数传递给另一个函数，将整个函数当作一个对象，赋值给调用的函数。

#### 2.4 Python 主要的内置数据类型都有哪些？ print(dir('a')) 的输出？
>内建类型：布尔类型、数字、字符串、列表、元组、字典、集合；  
>输出字符串 'a' 的内建方法；

#### 2.5 print(list(map(lambda x: x * x, [y for y in range(3)]))) 的输出？
`[0， 1， 4]`

#### 2.6 hasattr()、getattr()、setattr() 函数使用详解？
hasattr(object, name) 函数：
>判断一个对象里面是否有 name 属性或者 name 方法，返回 bool 值，有 name 属性(方法) 返回 True，否则返回 False。
>注意：name 要使用引号括起来。

```
class function_demo(object):
    name = 'demo'

    def run(self):
        return "hello function"

functiondemo = function_demo()
res = hasattr(functiondemo, 'name')  # 判断对象是否有 name 属性，True
res = hasattr(functiondemo, "run")   # 判断对象是否有 run 方法，True
res = hasattr(functiondemo, "age")   # 判断对象是否有 age 属性，Falsw
print(res)
```

getattr(object, name [,default]) 函数：
>获取对象 object 的属性或者方法，如果存在则打印出来，如果不存在，打印默认值，默认值可选。
>注意：如果返回的是对象的方法，则打印结果是：方法的内存地址，如果需要运行这个方法，可以在后面添加括号 `()`。

```
functiondemo = function_demo()
getattr(functiondemo, 'name')  # 获取 name 属性，存在就打印出来 --- demo
getattr(functiondemo,"run")  # 获取 run 方法，存在打印出方法的内存地址 ---<bound method function_demo.run of< main .function_demo object at 0x10244f320>>
getattr(functiondemo, "age")  # 获取不存在的属性，报错如下：

# Traceback(most recent call last):
# File "/Users/liuhuiling/Desktop/MT_code/OpAPIDemo/conf/OPCommUtil.py", line 39, in <module>
# res = getattr(functiondemo, "age")
# AttributeError: 'function_demo' object has no attribute 'age'

getattr(functiondemo, "age", 18)  # 获取不存在的属性，返回一个默认值
```

setattr(object,name,values) 函数：`给对象的属性赋值，若属性不存在，先创建再赋值`
```
class function_demo(object):
    name = 'demo'

    def run(self):
        return "hello function"

functiondemo = function_demo()
res = hasattr(functiondemo, 'age')  # 判断 age 属性是否存在，False
print(res)
setattr(functiondemo, 'age', 18)  # 对 age 属性进行赋值，无返回值
res1 = hasattr(functiondemo, 'age')  # 再次判断属性是否存在，True
```

` 综合使用 `：
```
class function_demo(object):
    name = 'demo'

    def run(self):
        return "hello function"

functiondemo = function_demo()

res = hasattr(functiondemo, 'addr')  # 先判断是否存在
if res:
    addr = getattr(functiondemo, 'addr')
    print(addr)
else:
    addr = getattr(functiondemo, 'addr', setattr(functiondemo, 'addr', ' 北京首都 '))
    # addr = getattr(functiondemo, 'addr', ' 美国纽约 ')
    print(addr)
    # 北京首都
```
#### 2.7 一句话解决阶乘函数？
>在 Python2 中：
```
reduce(lambda x,y: x*y, range(1,n+1))
```

>Python3 中:
```
from functools import reduce
print(reduce(lambda x,y: x*y, range(1,n+1)))
```

###3. Lambda
#### 3.1 什么是 lambda 函数？ 有什么好处？
>lambda 函数是一个可以接收任意多个参数(包括可选参数) 并且返回单个表达式值的函数
>1、lambda 函数比较轻便，即用即仍，很适合需要完成一项功能，但是此功能只在此一处使用，连名字都很随意的情况下；
>2、匿名函数，一般用来给 filter， map 这样的函数式编程服务；
>3、作为回调函数，传递给某些应用，比如消息处理

#### 3.2 下面这段代码的输出结果将是什么？请解释。
```
def multipliers():
    return [lambda x: i*x for i in range(4)]

print([m(2) for m in multipliers()])
# [6, 6, 6, 6]
```
>上面代码输出的结果是`[6， 6， 6， 6]`(不是我们想的`[0， 2， 4， 6]`)。你如何修改上面的 multipliers 的定义产生想要的结果？
>上述问题产生的原因是 `Python 闭包的延迟绑定`。这意味着内部函数被调用时，参数的值在闭包内进行查找。
>因此，当任何由 multipliers() 返回的函数被调用时，`i` 的值将在附近的范围进行查找。>那时，不管返回的函数是否被调用，`for` 循环已经完成，`i` 被赋予了最终的值 `3`。
>因此，每次返回的函数乘以传递过来的值 3，因为上段代码传过来的值是 2，它们最终返回的都是 6。
>(`3*2`) 碰巧的是，《The Hitchhiker's Guide to Python》也指出，在与 lambdas 函数相关也有一个被广泛被误解的知识点，不过跟这个 case 不一样。由 lambda 表达式创造的函数没有什么特殊的地方，它其实是和 def 创造的函数式一样的。
>
>下面是解决这一问题的一些方法。
>一种解决方法就是用`Python 生成器`。
```
def multipliers():
    for i in range(4): yield lambda x : i * x

print([m(2) for m in multipliers()])
# [0, 2, 4, 6]
```
>另外一个解决方案就是创造一个 `闭包`，利用默认函数立即绑定 。
```
def multipliers():
    return [lambda x, i=i: i * x for i in range(4)]

print([m(2) for m in multipliers()])
# [0, 2, 4, 6]
```

#### 3.3 什么是 lambda 函数？它有什么好处？写一个匿名函数求两个数的和？
>lambda 函数是匿名函数；
>使用 lambda 函数能创建小型匿名函数。
>这种函数得名于省略了用 def 声明函数的标准步骤；
```
f = lambda x, y: x + y
print(f(2017, 2018))
# 4035
```

>关于`lambda` 相关信息，参考 https://www.python87.com/pythonbasic/chapter14/lambda.html

### 四、设计模式
###1. 单例
#### 1.1 请手写一个单例
```
class A(object):
    __instance = None

    def __new__(cls, *args, **kwargs):
        if cls.instance is None:
            cls.instance = object.__new__(cls)
            return cls.instance
        else:
            return cls.instance
```

#### 1.2 单例模式的应用场景有哪些？
>单例模式应用的场景一般发现在以下条件下：
>（1） 资源共享的情况下，避免由于资源操作时导致的性能或损耗等。如日志文件，应用配置。
>
>（2） 控制资源的情况下，方便资源之间的互相通信。如线程池等。
>1. 网站的计数器
>2. 应用配置
>3. 多线程池
>4. 数据库配置，数据库连接池
>5. 应用程序的日志应用….

### 2. 工厂

### 3. 装饰器
#### 3.1 对装饰器的理解，并写出一个计时器记录方法执行性能的装饰器？
>装饰器本质上是一个 Python 函数，它可以让其他函数在不需要做任何代码变动的前提下增加额外功能，装饰器的返回值也是一个函数对象。
```
import time

def timeit(func):
    def wrapper(*args,**kwargs):
        start = time.time()
        func()
        end = time.time()
        print('used:', end - start)
    return wrapper

@timeit
def foo():
    print('in foo()')

foo()
# in foo()
# used: 2.8848648071289062e-05
```

#### 3.2 解释一下什么是闭包？
>在函数内部再定义一个函数，并且这个函数用到了外边函数的变量，那么将这个函数以及用到的一些变量称之为闭包。

#### 3.3 函数装饰器有什么作用？
>装饰器本质上是一个 Python 函数，它可以在让其他函数在不需要做任何代码的变动的前提下增加额外的功能。
>装饰器的返回值也是一个函数的对象，它经常用于有切面需求的场景。比如：插入日志、性能测试、事务处理、缓存、权限的校验等场景有了装饰器就可以抽离出大量的与函数功能本身无关的雷同代码并发并继续使用。

###4. 生成器
#### 4.1 生成器、迭代器的区别？
>`迭代器` 是一个更抽象的概念，任何对象，如果它的类有 next 方法和 iter 方法返回自己本身，对于 string、list、dict、tuple 等这类容器对象，使用 for 循环遍历是很方便的。在后台 for 语句对容器对象调用 iter() 函数，iter() 是 python 的内置函数。iter() 会返回一个定义了 next() 方法的迭代器对象，它在容器中逐个访问容器内元素，next() 也是 python 的内置函数。在没有后续元素时，next() 会抛出一个 StopIteration 异常。
>`生成器（Generator）` 是创建迭代器的简单而强大的工具。它们写起来就像是正规的函数，只是在需要返回数据的时候使用 yield 语句。每次 next() 被调用时，生成器会返回它脱离的位置（它记忆语句最后一次执行的位置和所有的数据值）>`区别`：生成器能做到迭代器能做的所有事，而且因为自动创建了 iter() 和 next() 方法，生成器显得特别简洁，而且生成器也是高效的，使用生成器表达式取代列表解析可以同时节省内存。除了创建和保存程序状态的自动方法，当发生器终结时，还会自动抛出 StopIteration 异常。

`生成器` 相关信息，参考 https://www.python87.com/pythonbasic/chapter13/

#### 4.2 X 是什么类型？
```
X = (i for i in range(10))
# <generator object <genexpr> at 0x7fd1a2e84270>
```

#### 4.3 请尝试用一行代码实现将 1-N 的整数列表以 3 为单位分组，比如 1-100 分组后为？
```
print([[x for x in range(1,100)][i:i+3] for i in range(0,len(list_a),3)])
```

#### 4.4 Python 中 yield 的用法？
>yield 就是保存当前程序执行状态。你用 for 循环的时候，每次取一个元素的时候就会计算一次。用 yield 的函数叫 generator，和 iterator 一样，它的好处是不用一次计算所有元素，而是用一次算一次，可以节省很多空间。generator 每次计算需要上一次计算结果，所以用 yield，否则一 return，上次计算结果就没了。

```
def createGenerator():
    mylist = range(3)

    for i in mylist:
        yield i * i

mygenerator = createGenerator()  # create a generator

print(mygenerator)  # mygenerator is an object!
# <generator object createGenerator at 0x000001FBAA4996C8>

for i in mygenerator:
    print(i)

'''
>yield 相关参考：https://www.python87.com/pythonbasic/chapter12/

5. 试题  
1 一行代码实现 1–100 之和
```
sum(range(0, 101))
```

2 如何在一个函数内部修改全局变量  
利用 global 修改全局变量
```
a = 20
def foo():
    global a
    a = 47
foo()
print(a)  # 4
```

3 列出 5 个 python 标准库  
os：提供了不少与操作系统相关联的函数  
sys: 通常用于命令行参数  
re: 正则匹配  
math: 数学运算  
datetime: 处理日期时间

4 字典如何删除键和合并两个字典  
del 和 update 方法
```
dic = {'name': 'kermit', 'age': 18}
del dic ['name']  # 删除键
print(dic)  # {'age': 18}

dic2 = {'name': 'jack'}
dic.update(dic2)
print(dic)  # {'age': 18, 'name': 'jack'}
```

5、谈下 python 的 GIL
```
GIL 是 python 的全局解释器锁，同一进程中假如有多个线程运行，一个线程在运行 python 程序的时候会霸占 python 解释器（加了一把锁即 GIL），
使该进程内的其他线程无法运行，等该线程运行完后其他线程才能运行。如果线程运行过程中遇到耗时操作，则解释器锁解开，使其他线程运行。
所以在多线程中，线程的运行仍是有先后顺序的，并不是同时进行。
多进程中因为每个进程都能被系统分配资源，相当于每个进程有了一个 python 解释器，所以多进程可以实现多个进程的同时运行，缺点是进程系统
资源开销大
```

### 五、面向对象
### 1. 类
### 2. 对象
#### 2.1 Python 中的可变对象和不可变对象？
>`不可变对象`，该对象所指向的内存中的值不能被改变。当改变某个变量时候，由于其所指的值不能被改变，相当于把原来的值复制一份后再改变，这会开辟一个新的地址，变量再指向这个新的地址。
>`可变对象`，该对象所指向的内存中的值可以被改变。变量（准确的说是引用）改变后，实际上是其所指的值直接发生改变，并没有发生复制行为，也没有开辟新的出地址，通俗点说就是原地改变。
>Python 中，数值类型（int 和 float）、字符串 str、元组 tuple 都是不可变类型。而列表 list、字典 dict、集合 set 是可变类型。

#### 2.2 Python 中 is 和 == 的区别？
>`is` 判断的是 a 对象是否就是 b 对象，是通过 id 来判断的。
>`==` 判断的是 a 对象的值是否和 b 对象的值相等，是通过 value 来判断的。

#### 2.3 Python 的魔法方法
>魔法方法就是可以给你的类增加魔力的特殊方法，如果你的对象实现（重载）了这些方法中的某一个，那么这个方法就会在特殊的情况下被 Python 所调用，你可以定义自己想要的行为，而这一切都是自动发生的。
>它们经常是两个下划线包围来命名的（比如 __init__ ， __lt__ ），Python 的魔法方法是非常强大的，所以了解其使用方法也变得尤为重要！

| 方法 | 说明 |
| --- | --- |
| `__init__` | 构造器，当一个实例被创建的时候初始化的方法。但是它并不是实例化调用的第一个方法。 |
| `__new__` | 才是实例化对象调用的第一个方法，它只取下 cls 参数，并把其他参数传给 `__init__` 。`__new__` 很少使用，但是也有它适合的场景，尤其是当类继承自一个像元组或者字符串这样不经常改变的类型的时候。 |
| `__call__` | 允许一个类的实例像函数一样被调用。 |
| `__getitem__` | 定义获取容器中指定元素的行为，相当于 `self [key]` 。 |
| `__getattr__` | 定义当用户试图访问一个不存在属性的时候的行为。 |
| `__setattr__` | 定义当一个属性被设置的时候的行为。 |
| `__getattribute__` | 定义当一个属性被访问的时候的行为。 |

#### 2.4 面向对象中怎么实现只读属性？
1、将对象私有化，通过共有方法提供一个读取数据的接口。
```
class person:
    def __init__(self, x):
        self._age = 10

    def age(self):
        return self._age

t = person(22)
# t._age = 100

print(t._age)
# 10

# class person:
#     def __init__(self, x):
#         self._age = 10
# 
#     def age(self):
#         return self._age
# 
# t = person(22)
# print(t.age())
```

2、最好的方法 
```
class MyCls(object):
    __weight = 50

    @property  # 以访问属性的方式来访问 weight 方法
    def weight(self):
        return self.__weight

if __name__ == '__main__':
    obj = MyCls()
    print(obj.weight)
    obj.weight = 12
```

#### 2.5 谈谈你对面向对象的理解？
>面向对象是相对于面向过程而言的。面向过程语言是一种基于功能分析的、以算法为中心的程序设计方法；而面向对象是一种基于结构分析的、以数据为中心的程序设计思想。
>在面向对象语言中有一个有很重要东西，叫做 `类`。
>面向对象有三大特性：`封装`、`继承`、`多态`。

### 六、正则表达式
#### 1. Python 里 match 与 search 的区别？
>`match()` 函数只检测 RE 是不是在 string 的开始位置匹配，
>`search()` 会扫描整个 string 查找匹配；
>也就是说 match() 只有在 0 位置匹配成功的话才有返回，
>如果不是开始位置匹配成功的话，match() 就返回 none。

#### 2. Python 字符串查找和替换？
```
re.findall(r'目的字符串'，'原有字符串') #查询
re.findall(r'cast'，'itcast.cn')[0]
re.sub(r‘要替换原字符'，'要替换新字符'，'原始字符串')
re.sub(r'cast'，'heima'，'itcast.cn')
```

#### 3. 用 Python 匹配 HTML g tag 的时候，<._\>和 <._?>有什么区别？
`<.*>` 是 `贪婪匹配`，会从第一个 <开始匹配，直到最后一个>中间所有的字符都会匹配到，中间可能会包含 `<>`。
`<.*?>` 是 `非贪婪匹配`，从第一个 <开始往后，遇到第一个>结束匹配，这中间的字符串都会匹配到，但是 `不` 会有 `<>`。

#### 4. 请写出下列正则关键字的含义？
| 语法说明 | 表达式 | 实例 | 完整匹配的字符串 |
| --- | --- | --- | --- |
| 字符 |  |  |  |
| 一般字符 | 匹配自身 | abc | abc |
| . | 匹配任意除换行符”\\n” 外的字符。在 DOTALL 模式中也能匹配换行符。 | a.c | abc |
| \ | 转义字符，使后一个字符改变原来的意思。如果字符串中有字符需要匹配，可以使用 \ 或者字符集 [*] | a.c a\c | a.c a\c|
| […] | 字符集(字符类)。对应的位置可以是字符集中任意字符。字符集中的字符可以逐个列出，也可以给出范围，如 [abc] 或 [a-c]。第一个字符如果是 ^ 则表示取反，如 [^abc] 表示不是 abc 的其他字符。所有的特殊字符在字符集中都失去其原有的特殊含义。在字符集中如果要使用]、- 或 ^, 可以在前面加上反斜杠，或把]、- 放在第一个字符，把 ^ 放在非第 — 个字符。 | a [bcd] e | abe ace ade |
| 预定义字符集(可以写在字符集 […] 中) |  |  |  |
| \\d | 数字:[0-9] | a\\dc | a1c |
| \\D | 非数字:[^\\d] | a\\Dc | abc |
| \\s | 空白字符:[<空格>\\ t\\r\\n\\f\\v] | a\\sc | ac |
| \\S | 非空白字符:[^\\s] | a\\Sc | abc |
| \\w | 单词字符:[A-Za-z0-9_] | a\\wc | abc |
| \\W | 非单词字符:[^\\W] | a\\Wc | ac |
| 数量词(用在字符或(…) 之后) |  |  |  |
| * | 匹配前一个字符 0 或无限次 | abc* | ab  abccc |
| + | 匹配前一个字符 1 次或无限次 | abc+ | abc  abccc |
| ? | 匹配前一个字符 0 次或 1 次 | abc? | Ab  abc |
| {m} | 匹配前一个字符 m 次 | ab {2} c | abbc |

### 七、系统编程
#### 1. 进程总结
>`进程`：程序运行在操作系统上的一个实例，就称之为进程。
>进程需要相应的系统资源：`内存`、`时间片`、`pid`。

`创建进程`：
1. 首先要导入 multiprocessing 中的 Process；
2. 创建一个 Process 对象；
3. 创建 Process 对象时，可以传递参数；
```
p = Process(target=XXX, args=(元组，) , kwargs={key:value})
# target = XXX 指定的任务函数，不用加()
# args=(元组，) , kwargs={key:value} 给任务函数传递的参数
```
4. 使用 start() 启动进程；
5. 结束进程。

#### Process 语法结构:
```
Process([group [, target [, name [, args [, kwargs]]]]])
```

| 参数 | 解释 |
| --- | --- |
| target | 如果传递了函数的引用，可以让这个子进程就执行函数中的代码 |
| args | 给 target 指定的函数传递的参数，以元组的形式进行传递 |
| kwargs | 给 target 指定的函数传递参数，以字典的形式进行传递 |
| name | 给进程设定一个名字，可以省略 |
| group | 指定进程组，大多数情况下用不到 |

#### Process 创建的实例对象的常用方法有：

| 常用方法 | 解释 |
| --- | --- |
| start() | 启动子进程实例(创建子进程) |
| is_alive() | 判断进程子进程是否还在活着 |
| join(timeout) | 是否等待子进程执行结束，或者等待多少秒 |
| terminate() | 不管任务是否完成，立即终止子进程 |

#### Process 创建的实例对象的常用属性：

| 常用属性 | 解释 |
| --- | --- |
| name | 当前进程的别名，默认为 Process-N,N 为从 1 开始递增的整数 |
| pid | 当前进程的 pid(进程号) |

#### 给子进程指定函数传递参数 Demo：

```
import os
from multiprocessing import Process
import time

def pro_func(name, age, **kwargs):
    for i in range(5):
        print("子进程正在运行中，name=% s, age=% d, pid=% d" % (name, age, os.getpid()))
        print(kwargs)
        time.sleep(2)

if __name__ == '__main__':
    # 创建 Process 对象
    p = Process(target=pro_func, args=(' 小明 ', 18), kwargs={'m': 20})
    # 启动进程
    p.start()
    time.sleep(1) # 1 秒钟之后，立刻结束子进程
    p.terminate()
    p.join()
# ` 运行结果 `：
# 子进程正在运行中，name = 小明，age=18, pid=22096
# {'m': 20}
# 子进程正在运行中，name = 小明，age=18, pid=22096
# {'m': 20}
# 子进程正在运行中，name = 小明，age=18, pid=22096
# {'m': 20}
# 子进程正在运行中，name = 小明，age=18, pid=22096
# {'m': 20}
```

注意：进程间不共享全局变量。

#### 进程之间的通信 - Queue

>在初始化 Queue() 对象时，(例如 q=Queue()，若在括号中没有指定最大可接受的消息数量，或数  
量为负值时，那么就代表可接受的消息数量没有上限 - 直到内存的尽头)

>`Queue.qsize()`：返回当前队列包含的消息数量。
>`Queue.empty()`：如果队列为空，返回 True, 反之 False。
>`Queue.full()`：如果队列满了，返回 True，反之 False。
>`Queue.get([block [,timeout]])`：获取队列中的一条消息，然后将其从队列中移除，block 默认值为 True。
>如果 block 使用默认值，且没有设置 timeout（单位秒），消息列队如果为空，此时程序将被阻塞（停在读取状态），直到从消息列队读到消息为止，如果设置了 timeout，则会等待 timeout 秒，若还没读取到任何消息，则抛出 Queue.Empty 异常；
>如果 block 值为 False，消息列队如果为空，则会立刻抛出 Queue.Empty 异常；
>`Queue.get_nowait()`：相当 Queue.get(False)；
>`Queue.put(item,[block [, timeout]])`：将 item 消息写入队列，block 默认值为 True；  如果 block 使用默认值，且没有设置 timeout（单位秒），消息列队如果已经没有空间可写入，此时程序将被阻塞（停在写入状态），直到从消息列队腾出空间为止，如果设置了 timeout，则会等待 timeout 秒，若还没空间，则抛出 Queue.Full 异常；
>如果 block 值为 False，消息列队如果没有空间可写入，则会立刻抛出 Queue.Full 异常；
>`Queue.put_nowait(item)`：相当 Queue.put(item, False)；

#### 进程间通信 Demo：
```
from multiprocessing import Process, Queue
import os, time, random

# 写数据进程执行的代码:def write(q):
for value in ['A', 'B', 'C']:
    print('Put % s to queue...' % value)
    q.put(value)
    time.sleep(random.random())
# 读数据进程执行的代码:def read(q):
while True:
    if not q.empty():
        value = q.get(True)
        print('Get % s from queue.' % value)
        time.sleep(random.random())
    else:
        break

if __name__ == '__main__':
    # 父进程创建 Queue，并传给各个子进程：
    q = Queue()
    pw = Process(target=write, args=(q,))
    pr = Process(target=read, args=(q,))
    # 启动子进程 pw，写入:
    pw.start()
    # 等待 pw 结束:
    pw.join()
    # 启动子进程 pr，读取:
    pr.start()
    pr.join()
    # pr 进程里是死循环，无法等待其结束，只能强行终止:
    print('')
    print(' 所有数据都写入并且读完 ')
```

#### 进程池 Pool
```
# -*- coding:utf-8 -*-
from multiprocessing import Pool
import os, time, random

def worker(msg):
    t_start = time.time()
    print("% s 开始执行，进程号为 % d" % (msg,os.getpid()))
    # random.random() 随机生成 0~1 之间的浮点数
    time.sleep(random.random()*2)
    t_stop = time.time()
    print(msg,"执行完毕，耗时 %2f" % (t_stop-t_start))

po = Pool(3) # 定义一个进程池，最大进程数 3

for i in range(0,10):
    # Pool().apply_async(要调用的目标，(传递给目标的参数元祖，))
    # 每次循环将会用空闲出来的子进程去调用目标
    po.apply_async(worker,(i,))

print("----start-----")
po.close() # 关闭进程池，关闭后 po 不再接收新的请求 
po.join()
# 等待 po 中所有子进程执行完成，必须放在 close 语句之后 
print("-----end---------------------------")
```

#### multiprocessing.Pool 常用函数解析：
`apply_async(func [, args [, kwds]])`：使用非阻塞方式调用 func（并行执行，堵塞方式必须等待上一个进程退出才能执行下一个进程），args 为传递给 func 的参数列表，kwds 为传递给 func 的关键字参数列表；
`close()`：关闭 Pool，使其不再接受新的任务；
`terminate()`：不管任务是否完成，立即终止；
`join()`：主进程阻塞，等待子进程的退出， 必须在 close 或 terminate 之后使用；

#### 进程池中使用 Queue
>如果要使用 Pool 创建进程，就需要使用 multiprocessing.Manager() 中的 Queue()，而不是  
multiprocessing.Queue()，否则会得到一条如下的错误信息：

```
RuntimeError: Queue objects should only be shared between processes through inheritance.
```

```
from multiprocessing import Manager,Pool
import os,time,random

def reader(q):
    print("reader 启动(% s), 父进程为(% s)" % (os.getpid(), os.getppid()))
    for i in range(q.qsize()):
        print("reader 从 Queue 获取到消息：% s" % q.get(True))

def writer(q):
    print("writer 启动(% s), 父进程为(% s)" % (os.getpid(), os.getppid()))
    for i in "itcast":
        q.put(i)

if __name__ == '__main__':
    print("(% s) start" % os.getpid())
    q = Manager().Queue() # 使用 Manager 中的 Queue
    po = Pool()
    po.apply_async(writer, (q,))

    time.sleep(1) # 先让上面的任务向 Queue 存入数据，然后再让下面的任务开始从中取数据
    po.apply_async(reader, (q,))
    po.close()
    po.join()
    print("(% s) End" % os.getpid())
```

#### 2. 谈谈你对多进程，多线程，以及协程的理解，项目是否用？
>这个问题被问的概率相当之大，其实多线程，多进程，在实际开发中用到的很少，除非是那些对项目性能要求特别高的，有的开发工作几年了，也确实没用过，你可以这么回答，给他扯扯什么是进程，线程（`cpython 中是伪多线程`）的概念就行，实在不行你就说你之前写过下载文件时，用过多线程技术，或者业余时间用过多线程写爬虫，提升效率。
>`进程`：一个运行的程序（代码）就是一个进程，没有运行的代码叫程序，进程是系统资源分配的最小单位，进程拥有自己独立的内存空间，所以进程间数据不共享，开销大。
>`线程`： 调度执行的最小单位，也叫执行路径，不能独立存在，依赖进程存在一个进程至少有一个线程，叫主线程，而多个线程共享内存(数据共享，共享全局变量)，从而极大地提高了程序的运行效率。
>`协程`：是一种用户态的轻量级线程，协程的调度完全由用户控制。协程拥有自己的寄存器上下文和栈。协程调度切换时，将寄存器上下文和栈保存到其他地方，在切回来的时候，恢复先前保存的寄存器上下文和栈，直接操作栈则基本没有内核切换的开销，可以不加锁的访问全局变量，所以上下文的切换非常快。

#### 3. 什么是多线程竞争？
>线程是非独立的，同一个进程里线程是数据共享的，当各个线程访问数据资源时会出现竞争状态即：`数据几乎同步会被多个线程占用，造成数据混乱，即所谓的线程不安全`
>
>那么怎么解决多线程竞争问题？– `锁`。
>`锁的好处`：
>确保了某段关键代码(共享数据资源) 只能由一个线程从头到尾完整地执行能解决多线程资源竞争下的原子操作问题。
>
>`锁的坏处`：
>阻止了多线程并发执行，包含锁的某段代码实际上只能以单线程模式执行，效率就大大地下降了  
锁的致命问题：死锁。

#### 4. 解释一下什么是锁，有哪几种锁？
>锁(Lock) 是 Python 提供的对线程控制的对象。有互斥锁、可重入锁、死锁。

#### 5. 什么是死锁呢？
>若干子线程在系统资源竞争时，都在等待对方对某部分资源解除占用状态，结果是谁也不愿先解锁，互相干等着，程序无法执行下去，这就是死锁。
>GIL 锁（有时候，面试官不问，你自己要主动说，增加 b 格，尽量别一问一答的尬聊，不然最后等到的一句话就是：你还有什么想问的么？）
>GIL 锁全局解释器锁（只在 cpython 里才有）
>作用：限制多线程同时执行，保证同一时间只有一个线程执行，所以 cpython 里的多线程其实是伪多线程！>所以 Python 里常常使用协程技术来代替多线程，协程是一种更轻量级的线程，进程和线程的切换时由系统决定，而协程由我们程序员自己决定，而模块 gevent 下切换是遇到了耗时操作才会切换。
>`三者的关系：进程里有线程，线程里有协程。`

#### 6. 什么是线程安全，什么是互斥锁？
>每个对象都对应于一个可称为 互斥锁 的标记，这个标记用来保证在任一时刻，只能有一个线程访问该对象。
>同一个进程中的多线程之间是共享系统资源的，多个线程同时对一个对象进行操作，一个线程操作尚未结束，另一个线程已经对其进行操作，导致最终结果出现错误，此时需要对被操作对象添加互斥锁， 保证每个线程对该对象的操作都得到正确的结果。

#### 7. 说说下面几个概念：同步，异步，阻塞，非阻塞？
>`同步`：多个任务之间有先后顺序执行，一个执行完下个才能执行。
>`异步`：多个任务之间没有先后顺序，可以同时执行有时候一个任务可能要在必要的时候获取另一个同时执行的任务的结果，这个就叫回调！
>`阻塞`：如果卡住了调用者，调用者不能继续往下执行，就是说调用者阻塞了。
>`非阻塞`：如果不会卡住，可以继续执行，就是说非阻塞的。
>同步异步相对于多任务而言，阻塞非阻塞相对于代码执行而言。

#### 8. 什么是僵尸进程和孤儿进程？怎么避免僵尸进程？
>`孤儿进程`：父进程退出，子进程还在运行的这些子进程都是孤儿进程，孤儿进程将被 init 进程(进程号为 1) 所收养，并由 init 进程对它们完成状态收集工作。
>`僵尸进程`：进程使用 fork 创建子进程，如果子进程退出，而父进程并没有调用 wait 或 waitpid 获取子进程的状态信息，那么子进程的进程描述符仍然保存在系统中的这些进程是僵尸进程。

#### 避免僵尸进程的方法：
1.fork 两次用孙子进程去完成子进程的任务；
2. 用 wait() 函数使父进程阻塞；
3. 使用信号量，在 signal handler 中调用 waitpid，这样父进程不用阻塞。

#### 9. Python 中的进程与线程的使用场景？
>多进程适合在 CPU 密集型操作(cpu 操作指令比较多，如位数多的浮点运算)。
>多线程适合在 IO 密集型操作(读写数据操作较多的，比如爬虫)。

#### 10. 线程是并发还是并行，进程是并发还是并行？
>线程是并发，进程是并行；
>进程之间相互独立，是系统分配资源的最小单位，同一个线程中的所有线程共享资源。

#### 11. 并行（parallel）和并发（concurrency）？
>并行：同一时刻多个任务同时在运行。
>并发：在同一时间间隔内多个任务都在运行，但是并不会在同一时刻同时运行，存在交替执行的情况。
>实现并行的库有：`multiprocessing`
>实现并发的库有：`threading`
>程序需要执行较多的读写、请求和回复任务的需要大量的 IO 操作，IO 密集型操作使用并发更好。
>CPU 运算量大的程序程序，使用并行会更好。

#### 12.IO 密集型和 CPU 密集型区别？
>IO 密集型：系统运作，大部分的状况是 CPU 在等 I/O(硬盘 / 内存) 的读 / 写。
>CPU 密集型：大部份时间用来做计算、逻辑判断等 CPU 动作的程序称之 CPU 密集型。

### 八、网络编程
#### 1.UDP 总结
##### 使用 udp 发送 / 接收数据步骤：
1. 创建客户端套接字  
2. 发送 / 接收数据  
3. 关闭套接字

```
import socket
def main():
    # 1、创建 udp 套接字
    # socket.AF_INET  表示 IPv4 协议  AF_INET6 表示 IPv6 协议
    # socket.SOCK_DGRAM  数据报套接字，只要用于 udp 协议
    udp_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    # 2、准备接收方的地址
    # 元组类型  ip 是字符串类型   端口号是整型
    dest_addr = ('111111', 8888)
    # 要发送的数据
    send_data = "我是要发送的数据"
    # 3、发送数据
    udp_socket.sendto(send_data.encode("utf-8"), dest_addr)
    # 4、等待接收方发送的数据  如果没有收到数据则会阻塞等待，直到收到数据
    # 接收到的数据是一个元组   (接收到的数据，发送方的 ip 和端口)
    # 1024  表示本次接收的最大字节数
    recv_data, addr = udp_socket.recvfrom(1024)
    # 5、关闭套接字
    udp_socket.close()
if __name__ == '__main__': 22．    main() 编码的转换
    str -->bytes: encode 编码
    bytes-->str: decode() 解码
```

##### UDP 绑定端口号：
1. 创建 socket 套接字  
2. 绑定端口号  
3. 接收 / 发送数据  
4. 关闭套接字

```
import socket
def main():
    # 1、创建 udp 套接字
    # socket.AF_INET  表示 IPv4 协议  AF_INET6 表示 IPv6 协议
    # socket.SOCK_DGRAM  数据报套接字，只要用于 udp 协议
    udp_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    # 2、绑定端口
    # 元组类型  ip 一般不写 表示本机的任何的一个 ip
    local_addr = ('', 7777)
    udp_socket.bind(local_addr)
    # 3、准备接收方的地址
    # 元组类型  ip 是字符串类型   端口号是整型
    dest_addr = ('111111', 8888)
    # 要发送的数据
    send_data = "我是要发送的数据"
    # 4、发送数据
    udp_socket.sendto(send_data.encode("utf-8"), dest_addr)
    # 5、等待接收方发送的数据  如果没有收到数据则会阻塞等待，直到收到数据
    # 接收到的数据是一个元组   (接收到的数据，发送方的 ip 和端口)
    # 1024  表示本次接收的最大字节数
    recv_data, addr = udp_socket.recvfrom(1024)
    # 6、关闭套接字
    udp_socket.close()
if __name__ == '__main__':
    main() 注意点：绑定端口要在发送数据之前进行绑定。
```

#### 2. TCP 总结
##### TCP 客户端的创建流程：
1. 创建 TCP 的 socket 套接字  
2. 连接服务器  
3. 发送数据给服务器端  
4. 接收服务器端发送来的消息  
5. 关闭套接字

```
import socket
def main():
    # 1、创建客户端的 socket
    # socket.AF_INET  表示 IPv4 协议  AF_INET6 表示 IPv6 协议
    # socket.SOCK_STREAM  流式套接字，只要用于 TCP 协议
    client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    # 2、构建目标地址
    server_ip = input("请输入服务器端的 IP 地址：")
    server_port = int(input("请输入服务器端的端口号："))
    # 3、连接服务器
    # 参数：元组类型   ip 是字符串类型   端口号是整型
    client_socket.connect((server_ip, server_port))
    # 要发送给服务器端的数据
    send_data = "我是要发送给服务器端的数据"
    # 4、发送数据
    client_socket.send(send_data.encode("gbk"))
    # 5、接收服务器端恢复的消息， 没有消息会阻塞
    # 1024 表示接收的最大字节数
    recv_date= client_socket.recv(1024)
    print("接收到的数据是：", recv_date.decode('gbk'))
    # 6、关闭套接字
    client_socket.close()
if __name__ == '__main__':
    main()
```

##### TCP 服务器端的创建流程
1. 创建 TCP 服务端的 socket  
2.bing 绑定 ip 地址和端口号  
3.listen 使套接字变为被动套接字  
4.accept 取出一个客户端连接，用于服务  
5.recv/send 接收和发送消息  
6. 关闭套接字

```
import socket
def main():
    # 1、创建 tcp 服务端的 socket
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    # 2、绑定
    server_socket.bind(('', 8888))
    # 3、listen 使套接字变为被动套接字
    server_socket.listen(128)
    # 4、如果有新的客户端来链接服务器，那么就产生一个新的套接字专门为这个客户端服务
    # client_socket 用来为这个客户端服务
    # tcp_server_socket 就可以省下来专门等待其他新客户端的链接
    client_socket, client_addr = server_socket.accept()
    # 5、接收客户端发来的消息
    recv_data = client_socket.recv(1024)
    print("接收到客户端 % s 的数据：% s" % (str(client_addr), recv_data.decode('gbk')))
    # 6、回复数据给客户端
    client_socket.send("收到消息".encode('gbk'))
    # 7、关闭套接字
    client_socket.close()
    server_socket.close()
if __name__ == '__main__':
    main()
```

##### 4. TCP 是面向连接的通讯协议，通过三次握手建立连接，通讯完成时四次挥手
```
优点：TCP 在数据传递时，有确认、窗口、重传、阻塞等控制机制，能保证数据正确性，较为可靠。
缺点：TCP 相对于 UDP 速度慢一点，要求系统资源较多。
```

##### 5. 简述浏览器通过 WSGI 请求动态资源的过程？
```
发送 http 请求动态资源给 web 服务器
web 服务器收到请求后通过 WSGI 调用一个属性给应用程序框架
应用程序框架通过引用 WSGI 调用 web 服务器的方法，设置返回的状态和头信息。
调用后返回，此时 web 服务器保存了刚刚设置的信息
应用程序框架查询数据库，生成动态页面的 body 的信息
把生成的 body 信息返回给 web 服务器
web 服务器吧数据返回给浏览器
```

##### 6. 描述用浏览器访问 www.baidu.com 的过程
```
先要解析出 baidu.com 对应的 ip 地址
- 要先使用 arp 获取默认网关的 mac 地址
- 组织数据发送给默认网关(ip 还是 dns 服务器的 ip，但是 mac 地址是默认网关的 mac 地址)
- 默认网关拥有转发数据的能力，把数据转发给路由器
- 路由器根据自己的路由协议，来选择一个合适的较快的路径转发数据给目的网关
- 目的网关(dns 服务器所在的网关)，把数据转发给 dns 服务器
- dns 服务器查询解析出 baidu.com 对应的 ip 地址，并原路返回请求这个域名的 client
得到了 baidu.com 对应的 ip 地址之后，会发送 tcp 的 3 次握手，进行连接
使用 http 协议发送请求数据给 web 服务器
- web 服务器收到数据请求之后，通过查询自己的服务器得到相应的结果，原路返回给浏览器。
- 浏览器接收到数据之后通过浏览器自己的渲染功能来显示这个网页。
- 浏览器关闭 tcp 连接，即 4 次挥手结束，完成整个访问过程
```

##### 7. Post 和 Get 请求的区别？>GET 请求：
```
请求的数据会附加在 URL 之后，以？分割 URL 和传输数据，多个参数用 & 连接。URL 的
编码格式采用的是 ASCII 编码，而不是 uniclde，即是说所有的非 ASCII 字符都要编码之后再传输。
```

>POST 请求：
```
POST 请求会把请求的数据放置在 HTTP 请求包的包体中。上面的 item=bandsaw 就是实际的传输数据。因此，GET 请求的数据会暴露在地址栏中，而 POST 请求则不会。
传输数据的大小：
- 在 HTTP 规范中，没有对 URL 的长度和传输的数据大小进行限制。但是在实际开发过程中，对于 GET，特定的浏览器和服务器对 URL 的长度有限制。因此，在使用 GET 请求时，传输数据会受到 URL 长度的限制。
- 对于 POST，由于不是 URL 传值，理论上是不会受限制的，但是实际上各个服务器会规定对 POST提交数据大小进行限制，Apache、IIS 都有各自的配置。
安全性：
- POST 的安全性比 GET 的高。这里的安全是指真正的安全，而不同于上面 GET 提到的安全方法中的安全，上面提到的安全仅仅是不修改服务器的数据。比如，在进行登录操作，通过 GET 请求，用户名和密码都会暴露再 URL 上，因为登录页面有可能被浏览器缓存以及其他人查看浏览器的历史记录的原因，此时的用户名和密码就很容易被他人拿到了。除此之外，GET 请求提交的数据还可能会造成 Cross-site request frogery 攻击。
```

>效率：GET 比 POST 效率高。
```
POST 请求的过程：
  浏览器请求 tcp 连接（第一次握手）
  服务器答应进行 tcp 连接（第二次握手）
  浏览器确认，并发送 post 请求头（第三次握手，这个报文比较小，所以 http 会在此时进行第一次数据发送）
  服务器返回 100 continue 响应
  浏览器开始发送数据
  服务器返回 200 ok 响应
GET 请求的过程：
    浏览器请求 tcp 连接（第一次握手）
    服务器答应进行 tcp 连接（第二次握手）
    浏览器确认，并发送 get 请求头和数据（第三次握手，这个报文比较小，所以 http 会在此时进行第一次数据发送）
    服务器返回 200 OK 响应
```

##### 8. cookie 和 session 的区别？
```
1、cookie 数据存放在客户的浏览器上，session 数据放在服务器上。
2、cookie 不是很安全，别人可以分析存放在本地的 cookie 并进行 cookie 欺骗考虑到安全应当使用 session。
3、session 会在一定时间内保存在服务器上。当访问增多，会比较占用服务器的性能考虑到减轻服务器性能方面，应当使用 cookie。
4、单个 cookie 保存的数据不能超过 4K，很多浏览器都限制一个站点最多保存 20 个 cookie。
5、建议： 将登陆信息等重要信息存放为 SESSION 其他信息如果需要保留，可以放在 cookie 中
```

##### 9. HTTP 协议状态码有什么用，列出你知道的 HTTP 协议的状态码，然后讲出他们都表示什么意思？
```
通过状态码告诉客户端服务器的执行状态，以判断下一步该执行什么操作。
常见的状态机器码有：
100-199：表示服务器成功接收部分请求，要求客户端继续提交其余请求才能完成整个处理过程。
200-299：表示服务器成功接收请求并已完成处理过程，常用 200（OK 请求成功）。
300-399：为完成请求，客户需要进一步细化请求。302（所有请求页面已经临时转移到新的 url）。304、307（使用缓存资源）。
400-499：客户端请求有错误，常用 404（服务器无法找到被请求页面），403（服务器拒绝访问，权限不够）。
500-599：服务器端出现错误，常用 500（请求未完成，服务器遇到不可预知的情况）。
```

##### 10. 请简单说一下三次握手和四次挥手？
>三次握手过程：
```
1 首先客户端向服务端发送一个带有 SYN 标志，以及随机生成的序号 100(0 字节) 的报文
2 服务端收到报文后返回一个报文(SYN200(0 字节)，ACk1001(字节 + 1)) 给客户端
3 客户端再次发送带有 ACk 标志 201(字节 +) 序号的报文给服务端至此三次握手过程结束，客户端开始向服务端发送数据。
1 客户端向服务端发起请求：我想给你通信，你准备好了么？
2 服务端收到请求后回应客户端：I'ok，你准备好了么
3 客户端礼貌的再次回一下客户端：准备就绪，咱们开始通信吧！
整个过程跟打电话的过程一模一样：1 喂，你在吗 2 在，我说的你听得到不 3 恩，听得到(接下来请开始你的表演)
补充：SYN：请求询问，ACk：回复，回应。
```

>四次挥手过程：
```
由于 TCP 连接是可以双向通信的（全双工），因此每个方向都必须单独进行关闭（这句话才是精辟，后面四个挥手过程都是其具体实现的语言描述）四次挥手过程，客户端和服务端都可以先开始断开连接
1 客户端发送带有 fin 标识的报文给服务端，请求通信关闭
2 服务端收到信息后，回复 ACK 答应关闭客户端通信(连接) 请求
3 服务端发送带有 fin 标识的报文给客户端，也请求关闭通信
4 客户端回应 ack 给服务端，答应关闭服务端的通信(连接) 请求
```

##### 11. 说一下什么是 tcp 的 2MSL？
```
主动发送 fin 关闭的一方，在 4 次挥手最后一次要等待一段时间我们称这段时间为 2MSL
TIME_WAIT 状态的存在有两个理由：
让 4 次挥手关闭流程更加可靠
防止丢包后对后续新建的正常连接的传输造成破坏。
```

##### 12. 为什么客户端在 TIME-WAIT 状态必须等待 2MSL 的时间？
```
1、为了保证客户端发送的最后一个 ACK 报文段能够达到服务器。 这个 ACK 报文段可能丢失，因而使处在 LAST-ACK 状态的服务器收不到确认。服务器会超时重传 FIN+ACK 报文段，客户端就能在 2MSL 时间内收到这个重传的 FIN+ACK 报文段，接着客户端重传一次确认，重启计时器。最好，客户端和服务器都正常进入到 CLOSED 状态。如果客户端在 TIME-WAIT 状态不等待一段时间，而是再发送完 ACK 报文后立即释放连接，那么就无法收到服务器重传的 FIN+ACK 报文段，因而也不会再发送一次确认报文。这样，服务器就无法按照正常步骤进入 CLOSED 状态。
2、防止已失效的连接请求报文段出现在本连接中。客户端在发送完最后一个 ACK 确认报文段后，再经过时间 2MSL，就可以使本连接持续的时间内所产生的所有报文段都从网络中消失。这样就可以使下一个新的连接中不会出现这种旧的连接请求报文段。
```

##### 13. 说说 HTTP 和 HTTPS 区别？
```
HTTP 协议传输的数据都是未加密的，也就是明文的，因此使用 HTTP 协议传输隐私信息非常不安全，为了保证这些隐私数据能加密传输，于是网景公司设计了 SSL（Secure Sockets Layer）协议用于对 HTTP 协议传输的数据进行加密，从而就诞生了 HTTPS。简单来说，HTTPS 协议是由 SSL+HTTP 协议构建的可进行加密传输、身份认证的网络协议，要比 http 协议安全。
HTTPS 和 HTTP 的区别主要如下：
1、https 协议需要到 ca 申请证书，一般免费证书较少，因而需要一定费用。
2、http 是超文本传输协议，信息是明文传输，https 则是具有安全性的 ssl 加密传输协议。
3、http 和 https 使用的是完全不同的连接方式，用的端口也不一样，前者是 80，后者是 443。
4、http 的连接很简单，是无状态的；HTTPS 协议是由 SSL+HTTP 协议构建的可进行加密传输、
身份认证的网络协议，比 http 协议安全。
```

##### 14. 谈一下 HTTP 协议以及协议头部中表示数据类型的字段？
```
HTTP 协议是 Hyper Text Transfer Protocol（超文本传输协议）的缩写，是用于从万维网WWW:World Wide Web）服务器传输超文本到本地浏览器的传送协议。
HTTP 是一个基于 TCP/IP 通信协议来传递数据（HTML 文件， 图片文件， 查询结果等）。
HTTP 是一个属于应用层的面向对象的协议，由于其简捷、快速的方式，适用于分布式超媒体信息系统。它于 1990 年提出，经过几年的使用与发展，得到不断地完善和扩展。目前在 WWW 中使用的是 HTTP/0 的第六版，HTTP/1 的规范化工作正在进行之中，而且 HTTP-NG(NextGeneration of HTTP) 的建议已经提出。
HTTP 协议工作于客户端 - 服务端架构为上。浏览器作为 HTTP 客户端通过 URL 向 HTTP 服务端即 WEB 服务器发送所有请求。Web 服务器根据接收到的请求后，向客户端发送响应信息。
表示数据类型字段： Content-Type
```

##### 15. HTTP 请求方法都有什么？
```
根据 HTTP 标准，HTTP 请求可以使用多种请求方法。
HTTP0 定义了三种请求方法： GET， POST 和 HEAD 方法。
HTTP1 新增了五种请求方法：OPTIONS， PUT， DELETE， TRACE 和 CONNECT 方法。
1、 GET 请求指定的页面信息，并返回实体主体。
2、HEAD 类似于 get 请求，只不过返回的响应中没有具体的内容，用于获取报头
3、POST 向指定资源提交数据进行处理请求（例如提交表单或者上传文件）。数据被包含在请求体中。POST 请求可能会导致新的资源的建立和 / 或已有资源的修改。
4、PUT 从客户端向服务器传送的数据取代指定的文档的内容。
5、DELETE 请求服务器删除指定的页面。
6、CONNECT HTTP/1 协议中预留给能够将连接改为管道方式的代理服务器。
7、OPTIONS 允许客户端查看服务器的性能。
8、TRACE 回显服务器收到的请求，主要用于测试或诊断。
```

##### 16. 使用 Socket 套接字需要传入哪些参数 ？
```
Address Family 和 Type，分别表示套接字应用场景和类型。
family 的值可以是 AF_UNIX(Unix 域，用于同一台机器上的进程间通讯)，也可以是 AF_INET（对于 IPV4 协议的 TCP 和 UDP），至于 type 参数，SOCK_STREAM（流套接字）或者SOCK_DGRAM（数据报文套接字）,SOCK_RAW（raw 套接字）。
```

##### 17. HTTP 常见请求头？
```
Host(主机和端口号)
Connection(链接类型)
Upgrade-Insecure-Requests(升级为 HTTPS 请求)
User-Agent(浏览器名称)
Accept(传输文件类型)
Referer(页面跳转处)
Accept-Encoding（文件编解码格式）
Cookie （Cookie）
x-requested-with :XMLHttpRequest  (是 Ajax 异步请求)
```

##### 18. 七层模型？ IP ，TCP/UDP ，HTTP ，RTSP ，FTP 分别在哪层？
```
IP： 网络层 TCP/UDP： 传输层 HTTP、RTSP、FTP： 应用层协议
```

##### 19. url 的形式？
```
形式： scheme://host [:port#]/path/…/[?query-string][#anchor]
scheme：协议(例如：http， https， ftp)
host：服务器的 IP 地址或者域名
port：服务器的端口（如果是走协议默认端口，80 or 443）
path：访问资源的路径
query-string：参数，发送给 http 服务器的数据
anchor：锚（跳转到网页的指定锚点位置）
http://localhost:8000/file/part01/html
```

##### 20. 幂等 Idempotence
```
HTTP 方法的幂等性是指一次和多次请求某一个资源应该具有同样的副作用。(注意是副作用)
GET http://www.bank.com/account/123456，不会改变资源的状态，不论调用一次还是 N 次都没有副作用。请注意，这里强调的是一次和 N 次具有相同的副作用，而不是每次 GET 的结果相同。GET http://www.news.com/latest-news 这个 HTTP 请求可能会每次得到不同的结果，但它本身并没有产生任何副作用，因而是满足幂等性的。
DELETE 方法用于删除资源，有副作用，但它应该满足幂等性。比如：DELETE http://www.forum.com/article/4231，调用一次和 N 次对系统产生的副作用是相同的，即删掉 id 为 4231 的帖子；因此，调用者可以多次调用或刷新页面而不必担心引起错误。
POST 所对应的 URI 并非创建的资源本身，而是资源的接收者。比如：POST http://www.forum.com/articles 的语义是在 http://www.forum.com/articles 下创建一篇帖子，HTTP 响应中应包含帖子的创建状态以及帖子的 URI。两次相同的 POST 请求会在服务器端创建两份资源，它们具有不同的 URI；所以，POST 方法不具备幂等性。
PUT 所对应的 URI 是要创建或更新的资源本身。比如：PUT http://www.forum/articles/4231 的语义是创建或更新 ID 为 4231 的帖子。对同一 URI 进行多次 PUT 的副作用和一次 PUT 是相同的；因此，PUT 方法具有幂等性。
```

##### 21. SOAP
```
SOAP（原为 Simple Object Access Protocol 的首字母缩写，即简单对象访问协议）是交换数据的一种协议规范，使用在计算机网络 Web 服务（web service）中，交换带结构信息。SOAP 为了简化网页服务器（Web Server）从 XML 数据库中提取数据时，节省去格式化页面时间，以及不同应用程序之间按照 HTTP 通信协议，遵从 XML 格式执行资料互换，使其抽象于语言实现、平台和硬件。
```

##### 22. RPC
```
RPC（Remote Procedure Call Protocol）—— 远程过程调用协议，它是一种通过网络从远程计算机程序上请求服务，而不需要了解底层网络技术的协议。RPC 协议假定某些传输协议的存在，如 TCP 或 UDP，为通信程序之间携带信息数据。在 OSI 网络通信模型中，RPC 跨越了传输层和应用层。RPC 使得开发包括网络分布式多程序在内的应用程序更加容易。
总结：服务提供的两大流派。传统意义以方法调用为导向通称 RPC。为了企业 SOA, 若干厂商联合推出 webservice, 制定了 wsdl 接口定义，传输 soap. 当互联网时代，臃肿 SOA 被简化为 http+xml/json. 但是简化出现各种混乱。以资源为导向，任何操作无非是对资源的增删改查，于是统一的 REST 出现了.
进化的顺序: RPC ->SOAP ->RESTful
```