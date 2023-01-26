## 闭包
1、闭包的定义：在一些语言中，在函数中可以（嵌套）定义另一个函数时，如果内部的函数引用了外部的函数的变量，则可能产生闭包。闭包可以用来在一个函数与一组“私有”变量之间创建关联关系。在给定函数被多次调用的过程中，这些私有变量能够保持其持久性。—— 维基百科

2、闭包的作用：闭包可以用来在一个函数与一组“私有”变量之间创建关联关系。在给定函数被多次调用的过程中，这些私有变量能够保持其持久性（保存运行环境与变量状态）

3、闭包的特征：
（1）必须要有函数的嵌套。而且外层函数必须返回内层函数，但是内层函数可以不返回至，也可以返回值；外层函数给内层函数提供了一个“包装起来的运行环境”，在这个“包装的”运行环境里面，内层函数可以完全自己做主。这也是为什么称之为闭包的原因了。

（2）内层函数一定要用到外层函数中定义的变量。如果只满足了特征（1），也不算是闭包，一定要用到外层“包装函数”的变量，这些变量称之为“自由变量”。

闭包例子：
```
def decorator(c):  # 外层函数，产生包装环境——即闭包
    d=200           # c d 都是包装环境中的局部变量——即自由变量
    def wrapper(a,b):  # 内层函数
        return (a+b)*c/d
    return wrapper

wrapper=decorator(150)
print(wrapper(100,300)
```
我们可以通过内层函数的一个属性__closure__查看。
```
print(wrapper.__closure__)
print(wrapper.__closure__[0].cell_contents)
print(wrapper.__closure__[1].cell_contents)

返回如下结果：
(, )  # __closure__属性返回一个元组
150   #对应第一个自由变量c
200   #对应第二个自由变量d
```

总结：内层函数的__closure__属性返回一个元组；
通过wrapper.__closure__[i].cell_contents 查看第几个自由变量的值
注意：如果闭包函数没有返回wrapper，即外层函数没有返回内层函数，内层函数是没有__closure__属性的。

## 装饰器
1、什么是装饰器？   —— 两个层面

在Python里面有两层定义：

第一：从设计模式的层面上
装饰器是一个很著名的设计模式，经常被用于有切面需求的场景，较为经典的应用有插入日志、增加计时逻辑来检测性能、加入事务处理等。装饰器是解决这类问题的绝佳设计，有了装饰器，我们就可以抽离出大量函数中与函数功能本身无关的雷同代码并继续重用。概括的讲，装饰器的作用就是为已经存在的对象添加额外的功能。

第二：从Python的语法层面上（其实第二种本质上也是第一种，只不过在语法上进行了规范化）
简言之，python装饰器就是用于拓展原来函数功能的一种函数，这个函数的特殊之处在于它的返回值也是一个函数，使用python装饰器的好处就是在不用更改原函数的代码前提下给函数增加新的功能。 如此一来，我们要想拓展原来函数代码，就不需要再在函数里面修改源代码了。

2、装饰器的作用——两方面
（1）抽离雷同代码，加以重用

（2）为函数添加额外的功能
（“添加额外功能”是一种抽象的表述，不是说一定要添加什么东西，对被装饰的对象（函数、类）进行某种约束、处理、添加、删减等额外操作统称为添加额外功能。）

3、装饰器的使用场景
（1）缓存装饰器
（2）权限验证装饰器
（3）计时装饰器
（4）日志装饰器
（5）路由装饰器
（6）异常处理装饰器
（7）错误重试装饰器

### 函数装饰器
#### 函数装饰函数
```
def decorator(function):
    '''
    第一层函数为装饰器名称
    function：参数，即需要装饰的函数
    return：返回值wrapper，为了保持与原函数参数一致
    '''
    def wrapper(*arg,**args):
        '''
        内层函数，这个函数实现“添加额外功能”的任务
        *arg,**args：参数保持与需要装饰的函数参数一致，这里用*arg和**args代替
        '''
        # 这里就是额外功能代码
        function()   # 执行原函数
        # 这里就是额外功能代码
        return wrapper

@decorator
def function():
    print("hello, decorator")
```

#### 函数装饰实例方法
```
def decorator(function):
    '''
    第一层函数为装饰器名称
    function：参数，即需要装饰的函数
    return：返回值wrapper，为了保持与原函数参数一致
    '''

    def wrapper(self, *arg, **args):
        '''
        内层函数，这个函数实现“添加额外功能”的任务
        *arg,**args：参数保持与需要装饰的函数参数一致，这里用*arg和**args代替
        '''
        print('---')
        # 这里就是额外功能代码
        return function(self)   # 执行原函数
        # 这里就是额外功能代码
    return wrapper


class out():
    @decorator
    def inner(self):
        print('inner')


dec = out()
dec.inner()

# # ---
# inner
```
与函数装饰函数差别不大，但是由于实例方法的特殊参数`self`，所以需要传递

#### 函数装饰类
```
def decorator(function):
    '''
    第一层函数为装饰器名称
    function：参数，即需要装饰的函数
    return：返回值wrapper，为了保持与原函数参数一致
    '''

    def wrapper(*arg, **args):
        '''
        内层函数，这个函数实现“添加额外功能”的任务
        *arg,**args：参数保持与需要装饰的函数参数一致，这里用*arg和**args代替
        '''
        print('---')
        # 这里就是额外功能代码
        return   function()   # 执行原函数
        # 这里就是额外功能代码
    return wrapper


@decorator
class out():
    def __init__(self):
        print('+++')

    def inner(self):
        print('inner')

a=out()
a.inner()
# ---
# +++
# inner
```
和函数装饰函数类似

#### 带参数的函数装饰器
装饰器还有更大的灵活性，例如带参数的装饰器：在上面的装饰器调用中，比如@use_logging，该装饰器唯一的参数就是执行业务的函数。装饰器的语法允许我们在调用时，提供其它参数，比如@decorator(a)。这样，就为装饰器的编写和使用提供了更大的灵活性。

```
def use_logging(level):
    def decorator(func):
        def wrapper(*args, **kwargs):
            if level == "warn":
                logging.warn("%s is running" % func.__name__)
            return func(*args)
        return wrapper
    return decorator

@use_logging(level="warn")
def foo(name='foo'):
    print("i am %s" % name)
```
带参数的函数装饰器装饰器与不带参数的大同小异

### 类装饰器
#### 类的装饰器（不带参数）
基于类装饰器的实现，必须实现 __call__ 和 __init__两个内置函数。
__init__ ：接收被装饰函数
__call__ ：实现装饰逻辑。

```
class Hint(object):
    def __init__(self, func):
        self.func = func

    def __call__(self, *args, **kwargs):
        print('{} is running'.format(self.func.__name__))
        return self.func(*args, **kwargs)
```

### 类的装饰器（带参数）
带参数和不带参数的类装饰器有很大的不同。
__init__ ：不再接收被装饰函数，而是接收传入参数。
__call__ ：接收被装饰函数，实现装饰逻辑。
```
class Hint(object):
    def __init__(self, coder=None):
        self.coder = coder

    def __call__(self, func):
        def wrapper(*args, **kwargs):
            print('{} is running'.format(func.__name__))
            print('Coder: {}'.format(self.coder))
            return func(*args, **kwargs)     # 正式调用主要处理函数
        return wrapper
```

### 创建装饰器时保留函数元信息
你写了一个装饰器作用在某个函数上，但是这个函数的重要的元信息比如名字、文档字符串、注解和参数签名都丢失了。

解决方案:任何时候你定义装饰器的时候，都应该使用 functools 库中的 @wraps 装饰器来注解底层包装函数。

例如：
```
import time
from functools import wraps
def timethis(func):
    '''
        Decorator that reports the execution time.
    '''
    @wraps(func)
    def wrapper(*args, **kwargs):
        start = time.time()
        result = func(*args, **kwargs)
        end = time.time()
        print(func.__name__, end-start)
        return result
    return wrapper
 
# 下面我们使用这个被包装后的函数并检查它的元信息：

@timethis
def countdown(n):
    '''
    Counts down
    '''
    while n > 0:
        n -= 1

countdown(100000)         #  countdown 0.008917808532714844
countdown.__name__        #  'countdown'
countdown.__doc__         #  '\n\tCounts down\n\t'
countdown.__annotations__ #  {'n': <class 'int'>}
```

### 使用偏函数与类实现装饰器
```
import time
import functools

class DelayFunc:
    def __init__(self, duration, func):
        self.duration = duration
        self.func = func

    def __call__(self, *args, **kwargs):
        print('Wait for {duration} seconds...'.format(duration=self.duration))
        time.sleep(self.duration)
        return self.func(*args, **kwargs)

    def eager_call(self, *args, **kwargs):
        print('Call without delay')
        return self.func(*args, **kwargs)

def delay(duration):
    """
    装饰器：推迟某个函数的执行。
    同时提供 .eager_call方法立即执行
    """
    # 此处为了避免定义额外函数，直接调用functools.partial帮助构造
    return functools.partial(DelayFunc, duration)

@delay(duration=2)
def add(a, b):
    return a + b
```

### 使用wrapt模块实现装饰器
```
import random
def provide_number(min_num, max_num):
    """装饰器：随机生成一个在 [min_num, max_num] 范围的整数，追加为函数的第一个位置参数
    """
    def wrapper(func):
        def decorated(*args, **kwargs):
            num = random.randint(min_num, max_num)
            # 将 num 作为第一个参数追加后调用函数
            return func(num, *args, **kwargs)
        return decorated
    return wrapper
@provide_number(1, 100)
def print_random_number(num):
    print(num)

print_random_number()
```

上面的装饰器可以正常运行，但假如使用在类上不增加self参数会怎样呢
```
import random

def provide_number(min_num, max_num):
    """装饰器：随机生成一个在 [min_num, max_num] 范围的整数，追加为函数的第一个位置参数
    """
    def wrapper(func):
        def decorated(*args, **kwargs):
            num = random.randint(min_num, max_num)
            # 将 num 作为第一个参数追加后调用函数
            return func(num, *args, **kwargs)
        return decorated
    return wrapper


class Foo:
    @provide_number(1, 100)
    def print_random_number(self, num):
        print(num)

a=Foo()
a.print_random_number()
# <__main__.Foo object at 0x7fc4b005b0a0>
```
直接输出了类实例 self 
>之所以会出现这个结果，是因为类方法（method）和函数（function）二者在工作机制上有着细微不同。如果要修复这个问题，provider_number 装饰器在修改类方法的位置参数时，必须聪明的跳过藏在 *args 里面的类实例 self 变量，才能正确的将 num 作为第一个参数注入。

现在使用wrapt来创建这个装饰器看看
```
import wrapt
def provide_number(min_num, max_num):
    @wrapt.decorator
    def wrapper(wrapped, instance, args, kwargs):
        # 参数含义：
        #
        # - wrapped：被装饰的函数或类方法
        # - instance：
        #   - 如果被装饰者为普通类方法，该值为类实例
        #   - 如果被装饰者为 classmethod 类方法，该值为类
        #   - 如果被装饰者为类/函数/静态方法，该值为 None
        #
        # - args：调用时的位置参数（注意没有 * 符号）
        # - kwargs：调用时的关键字参数（注意没有 ** 符号）
        #
        num = random.randint(min_num, max_num)
        # 无需关注 wrapped 是类方法或普通函数，直接在头部追加参数
        args = (num,) + args
        return wrapped(*args, **kwargs)
    return wrapper

class Foo:
    @provide_number(1, 100)
    def print_random_number(self, num):
        print(num)

a=Foo()
a.print_random_number()
```

使用 wrapt 模块编写的装饰器，相比原来拥有下面这些优势：

• 嵌套层级少：使用 @wrapt.decorator 可以将两层嵌套减少为一层

• 更简单：处理位置与关键字参数时，可以忽略类实例等特殊情况

• 更灵活：针对 instance 值进行条件判断后，更容易让装饰器变得通用

### 装饰器的嵌套
```
@decorator1
@decorator2
@decorator3
def func():
    pass
```
对于多层装饰器，作用顺序为decorator3、decorator2、decorator1

## 装饰器的缺点
装饰器的缺点总结：
（1）被函数装饰器所装饰的对象（函数、类）已经不再是它本身了，虽然从形式上看没有变化，本质上是函数装饰器的内部wrapper；

（2）被类装饰器所装饰的对象（函数、类）也不再是它本身了，虽然从形式上看没有变化，本质上是类装饰器的一个对象。

## 闭包和装饰器的比较
装饰器（decorator）    闭包（lexical closure）
相同点
（1）都是函数的嵌套，分为外层函数和内层函数，而且外层函数要返回内层函数

（2）代码的实现逻辑大同小异

（3）二者都可以实现增加额外功能的目的——比如上面的“加法加密运算”

不同点
（1）外层函数不同，装饰器的外层函数称之为decorator，闭包的外层函数称之为闭包函数closure

（2）外层函数的目的不同，装饰器的外层函数主要是提供函数形参function，闭包的形参主要目的是提供自由变量。

（3）二者的特征不一样。装饰器的外层函数可以不提供自由变量，但是闭包的的外层函数一定要提供自由变量，因为如果不提供自由变量，闭包的存在就毫无意义了，即内层函数所依赖的变量却在闭包中根本没有，那还要闭包干什么？

（4）二者的主要目的不同。
 装饰器的目的：代码重用+额外功能
 闭包的主要目的：保存函数的运行环境 + 保存闭包的局部变量。虽然二者可以有一些交集。

## 推荐
里面有很多装饰器，可以取学习学习
https://wiki.python.org/moin/PythonDecorators

https://github.com/piglei/one-python-craftsman/blob/master/zh_CN/8-tips-on-decorators.md
https://python3-cookbook.readthedocs.io/zh_CN/latest/c09/p02_preserve_function_metadata_when_write_decorators.html
https://so.csdn.net/so/search?q=%E8%A3%85%E9%A5%B0%E5%99%A8&t=blog&u=qq_27825451
https://www.yisu.com/zixun/641780.html

