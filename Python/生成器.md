# yield 关键字初识
先看一个简单例子：
```
def yie():
    n = 1
    yield n
    print(n)
    n += 1
    yield n
    print(n)
    n += 1
    yield n
    print(n)


a = yie()
one = next(a)
print(f'one  {one}')
two = next(a)
print(f'two  {two}')
thr = next(a)
print(f'thr  {thr}')

# one  1
# 1
# two  2
# 2
# thr  3
```

当调用时，遇到 yield 关键字时函数和遇到 return 用类似的结果，返回一个值，但不同的是并没有退出函数，当下一次运行时，继续函数里后面的代码。
同时我们取值的方式比较特殊，通过 next() 去取对象的值，而这应该是属于迭代器的方法。

# 生成器函数（generator function）
如果函数包含至少一个 yield语句 (它可能包含其他 yield 或 return 语句)，那么它将成为一个生成器函数。

生成器函数与正常函数的差异下面列出的是生成器函数与正常函数的区别 ：
    当被调用时，它返回一个对象(迭代器)，但不会立即开始执行。
    __iter__() 和 __next__() 之类的方法将自动实现。所以可以使用 next() 迭代项目。
    一旦函数遇到 yield，该函数将被暂停，并将该控制权交给调用者。局部变量及其状态在连续调用之间被记住。
    最后，当函数终止时，StopIteration会在进一步的调用时自动引发。

上面例子中定义的 yie() 函数便是一个生成器函数。

# 生成器（generator）
而生成器即是生成器函数被调用后产生的对象。
如例子中的 a 便是一个生成器。
在每个调用之间函数会保持住变量n的值。与正常函数不同，当函数产生时，局部变量不会被销毁。 此外，生成器对象只能重复一次。
要重新启动该过程，需要使用类似于 a = yie() 的方法创建另一个生成器对象。

并且支持 for 循环遍历。

# 生成器推导式
使用生成器表达式，可以轻松创建简单的生成器。 它使构建生成器变得容易。
与 lambda 函数一样创建一个匿名函数，生成器表达式创建一个匿名生成函数。生成器表达式的语法与 Python 中的列表解析类似。 但方圆 [] 替换为圆括号 ()。
列表推导和生成器表达式之间的主要区别是：列表推导产生整个列表，生成器表达式一次生成一个项目。
它们是处理方式是懒惰的，只有在被要求时才能生产项目。 因此，生成器表达式的存储器效率高于等效列表的值。

```
ge = (i for i in range(10))
print(type(ge))

# <class 'generator'>
```

# yield from
语法：
    yield from generator



yield from 后面可以跟的可以是“ 生成器 、元组、 列表、range（）函数产生的序列等可迭代对象”
简单地说，yield from  generator 。实际上就是返回另外一个生成器。而yield只是返回一个元素。从这个层面来说，有下面的等价关系：yield from iterable本质上等于 for item in iterable: yield item 。

## TODO
深入的看着有点晕，暂时放放吧，留两个链接
https://blog.csdn.net/qq_27825451/article/details/85244237
https://www.cnblogs.com/wongbingming/p/9085268.html


# 生成器专属方法 send、throw、close
## send 方法详解
generator.send(value)

作用：向生成器发送一个值，随后恢复执行。
value 参数是 send 方法向生成器发送的值，这个值会作为当前所在的 yield 表达式的结果。
随后生成器恢复执行，直到下一个 yield，把它后面的值作为 send 方法的结果返回。

如果恢复执行后再也没有 yield 语句，生成器退出，并抛出 StopIteration 异常。

如果一开始使用 send 启动生成器，必须使用 None 作为参数，因为一开始没有可以接收值的 yield 表达式。
```
def gen():
    for i in range(2):
        x = yield i
        print('x:', x)

a = gen()
for _ in a:
    print(_)

# 0
# x: None
# 1
# x: None
```
不同于 return，yield 的值是可以进行赋值操作的，但是由于其特性，赋值在正常i情况下都为空。
如上面的例子，`x = yield i` 等式是从右向左的，当遇到 yield 时就抛出值，而下一次调用时才进行赋值，这时值已经不存在的，便为 None 了。

```
def gen():
    for i in range(2):
        x = yield i
        print('x:', x)

a = gen()
print(a.send(None)) # a.send(None) 等同于 next(a)
print(a.send(3))

# 0
# x: 3
# 1
```
这便是 send() 的用法，能够在使用生成器的使用根据需要传递值进去。

## throw 方法详解
generator.throw(type[, value[, traceback]])

作用：在生成器暂停的地方抛出类型为 type 的异常，并返回下一个 yield 的返回值。
如果生成器函数没有捕获并处理传入的异常，或者说抛出了另一个异常，那么该异常会被传递给调用方。
如果生成器退出时还没有 yield 新值，则会抛出 StopIteration 异常。

### （第一种情况：捕获并处理传入的异常，得到下一个 yield 的返回值。
```
def gen():
    n = 0
    while True:
        try:
            yield n
            n += 1
        except ZeroDivisionError:
            print('捕获到了 ZeroDivisionError')
            print('此时的 n 为：%s' % n)

g = gen()
ret = next(g)
print('第一次 yield 的返回值：%s' % ret)
ret = g.throw(ZeroDivisionError)
print(ret)

# 第一次 yield 的返回值：0
# 捕获到了 ZeroDivisionError
# 此时的 n 为：0
# 0

```
第一次调用时遇到 yield ,抛出值，第二次调用时接受到了异常，跳过了 n + 1，所以n保持为 0。
如果通过 throw 传入的异常被捕获的话，生成器能够恢复执行直到下一个 yield。


（1 如果捕获不准确的话
```
def gen():
    for i in range(5):
        try:
            yield i
        except Exception as e:
            print(e)

a = gen()
b = next(a) # a.send(None) 等同于 next(a)
print(b)
c = a.throw(ZeroDivisionError)
print(c)
d = next(a) # a.send(None) 等同于 next(a)
print(d)

# 0
#   (这样是捕获不到异常的，所以为空)
# 1
# 2
```
后面的可以继续执行，捕获不到异常应该是throw的异常没有继承 excaption。

（2 甚至于不做捕获
```
def gen():
    for i in range(5):
        try:
            print('try')
            yield i
        except:
            print('error')

a = gen()
b = next(a) # a.send(None) 等同于 next(a)
print(b)
c = a.throw(ZeroDivisionError)
print(c)
d = next(a) # a.send(None) 等同于 next(a)
print(d)

# try
# 0
# error
# try
# 1
# try
# 2
# error
# try
# Exception ignored in: <generator object gen at 0x7fb5827ec2e0>
# RuntimeError: generator ignored GeneratorExit
```
后续的依旧能执行，但每次执行完如果后续没有继续取值会多执行一次抛出生成器退出异常。

### （第二种情况：没有捕获并处理 throw 传入的异常，异常会回传给调用方
```
import sys

def gen():
    n = 0
    while True:
        yield n
        n += 1

g = gen()
ret1 = next(g)
print('第一次 yield 的返回值：%s' % ret1)
try:
    ret2 = g.throw(ZeroDivisionError)  # ret2 并没有收到任何值
except ZeroDivisionError:
    print('调用方捕获到 ZeroDivisionError 异常')
    print(sys.exc_info())

# 第一次 yield 的返回值：0
# 调用方捕获到 ZeroDivisionError 异常
# (<class 'ZeroDivisionError'>, ZeroDivisionError(), <traceback object at 0x7fd771bcf5c0>)
```
这个比较容易理解，类似于将 异常 yield 回来了
而对于已经通过抛出异常而退出的生成器再使用 next(g) 会持续抛出 StopIteration 异常。

### （第三种情况：生成器退出时没有 yield 新值，会抛出 StopIteration 异常。
```
def gen():
    try:
        # 注意是在当前暂停的 yield 处抛出异常
        # 所以要在这里捕获
        yield 1
    except Exception as e:
        print(f'在生成器内部捕获了异常{e.args}')
        # print(e.args)

    # yield 2

g = gen()
print(next(g))
g.throw(TypeError, '类型错误')

# 1
# 在生成器内部捕获了异常('类型错误',)
# Traceback (most recent call last):
#   File "/home/fiki/Documents/PycharmProjects/thread_yy.py", line 54, in <module>
#     g.throw(TypeError, '类型错误')
# StopIteration
```
内部捕获到了异常，但是由于没有可迭代的了，又抛出 StopIteration 给显式覆盖了。

## 生成器的 close 方法
generator.close()

作用：在生成器函数暂停的地方抛出一个 GeneratorExit 异常。
这并不等价于 generator.throw(GeneratorExit)，后面会说原因。
如果生成器抛出 StopIteration 异常（不管是由于正常退出还是因为该生成器已经关闭），或者抛出 GeneratorExit 异常（不捕获该异常即可），close 方法不传递该异常，直接返回到调用方。而生成器抛出的其他异常会传递给调用方。
GeneratorExit 异常的产生意味着生成器对象的生命周期已经结束，因此生成器方法后续语句中不能再有 yield，否则会产生 RuntimeError。（而 throw 方法是期待一个 yield 返回值的，如果没有，则会抛出 StopIteration 异常。）
对于已经正常退出或者因为异常退出的生成器对象，close 方法不会进行任何操作

### （第一种情况：
不捕获 GeneratorExit 异常，close 方法返回调用方，不传递该异常。
```
def gen():
    yield 1
    yield 2

g = gen()
print(next(g))
g.close()
print(next(g))

# 1
# Traceback (most recent call last):
#   File "/home/fiki/Documents/PycharmProjects/thread_yy.py", line 50, in <module>
#     print(next(g))
# StopIteration
```
注意：对已经关闭的生成器对象使用 next 会抛出 StopIteration 异常。

### （第二种情况：
生成器自然退出抛出 StopIteration 异常，该异常不会传递给调用方，close 方法正常返回。

```
def gen():
    try:
        yield 1
    except GeneratorExit:
        print('捕获到GeneratorExit')
    print('生成器函数结束了')

g = gen()
print(next(g))
g.close()

# 1
# 捕获到GeneratorExit
# 生成器函数结束了
```

### （第三种情况：
在 GeneratorExit 抛出后还有 yield 语句，会产生 RuntimeError。另外生成器对象被垃圾回收时，解释器会自动调用该对象的 close 方法（PEP 342），这意味着最好不要在相应的 except 和 finally 中写 yield 语句，否则不知道什么时候就会抛出 RuntimeError 异常。
```
def gen():
    try:
        yield 1
    except GeneratorExit:
        print('捕获到 GeneratorExit')
        print('尝试在 GeneratorExit 产生后 yield 一个值')
        yield 2

    print('生成器结束')


g = gen()
next(g)
g.close()
"""
捕获到 GeneratorExit
尝试在 GeneratorExit 产生后 yield 一个值
Traceback (most recent call last):
  File "test.py", line 14, in <module>
    g.close()
RuntimeError: generator ignored GeneratorExit
"""

```

一种防止抛出 RuntimeError 的安全生成器写法：设置一个布尔标识。
```
def safegen():
    yield 'so far so good'
    closed = False
    try:
        yield 'yay'
    except GeneratorExit:
        closed = True
        raise
    finally:
        if not closed:
            yield 'boo'
```

### （第四种情况：
对已经关闭的生成器对象调用 close() 方法，不会进行任何操作。
```
def gen():
    yield 1
    print('我不会被执行')
    print('因为在 yield 1 就抛出了 GeneratorExit 异常')
    print('未经捕获的 GeneratorExit 异常不会传递')
    print('返回执行权给 close 的调用方')

g = gen()
g.close()
g.close()
g.close()  # 多次调用 close，什么效果都没有
```

补充：GeneratorExit 异常只有在生成器对象被激活后，才有可能产生。

# 生成器优点
## 1. 容易实现
与其迭代器类相比，发生器可以以清晰简洁的方式实现。 
以下是使用迭代器类来实现2的幂次序的例子。
```
class PowTwo:
    def __init__(self, max = 0):
        self.max = max

    def __iter__(self):
        self.n = 0
        return self

    def __next__(self):
        if self.n > self.max:
            raise StopIteration

        result = 2 ** self.n
        self.n += 1
        return result
```

上面代码有点长，可以使用一个生成器函数实现同样的功能。
```
def PowTwoGen(max = 0):
    n = 0
    while n < max:
        yield 2 ** n
        n += 1
```
因为，生成器自动跟踪的细节，它更简洁，更干净。

## 2.内存高效
返回序列的正常函数将在返回结果之前会在内存中的创建整个序列。如果序列中的项目数量非常大，这可是要消耗内存的。
序列的生成器实现是内存友好的，并且是推荐使用的，因为它一次仅产生一个项目。

## 3. 表示无限流
生成器是表示无限数据流的绝佳媒介。 无限流不能存储在内存中，由于生成器一次只能生成一个项目，因此可以表示无限数据流。
以下示例可以生成所有偶数(至少在理论上)。
```
def all_even():
    n = 0
    while True:
        yield n
        n += 2
```

## 4.管道生成器
生成器可用于管理一系列操作，下面使用一个例子说明。
假设我们有一个快餐连锁店的日志文件。 日志文件有一列(第4列)，用于跟踪每小时销售的比萨饼数量，我们想算出在5年内销售的总萨饼数量。
假设一切都是字符串，不可用的数字标记为“N / A”。 这样做的生成器实现可以如下。
```
with open('sells.log') as file:
    pizza_col = (line[3] for line in file)
    per_hour = (int(x) for x in pizza_col if x != 'N/A')
    print("Total pizzas sold = ",sum(per_hour))
```
这种管道的方式是更高效和易于阅读的。

# 判断生成器、生成器函数
我们可以用inspect类里的isgeneratorfunction类方法判断是否是一个生成器函数，以及使用 isgenerator类方法判断是否是一个生成器。

```
from inspect import isgeneratorfunction, isgenerator

print(f'fibonacci is a generator function: {isgeneratorfunction(fibonacci)}')  
print(f'fib is a generator: {isgenerator(fib)}')
```
# 应用生成器的场景与好处
生成器可用于产生数据流，而且并不立刻产生返回值，而是等到被需要的时候才会产生返回值，相当于一个主动拉取的过程(pull)，比如现在有一个日志文件，每行产生一条记录，对于每一条记录，不同部门的人可能处理方式不同，但是我们可以提供一个公用的、按需生成的数据流。
还有做爬虫的时候，爬取大量数据的时候如果使用生成器每次需要的时候执行输出也可以大大降低资源的消耗。
使用生成器的好处当然不仅限于此，让我们来看一下下面的例子，我们打算读取小说《三国演义》的所有文字内容，如果直接对文件对象调用 read() 方法，会导致不可预测的内存占用。好的方法是利用固定长度的缓冲区来不断读取文件内容。而且同时通过 yield来执行每次输出，就可以轻松实现文件读取。

```
from pathlib import Path

file = Path('三国演义.txt')

def read_file(fpath):  
   BLOCK_SIZE = 1024 
   with file.open(encoding='GB18030') as f: 
       while True: 
           block_content = f.read(BLOCK_SIZE) 
           if block_content: 
               yield block_content 
           else: 
               return

for c in read_file(file):  
    print(c)
```


[Python生成器](https://www.yiibai.com/python/generator.html#article-start)
[python协程系列（三）——yield from原理详解](https://blog.csdn.net/qq_27825451/article/details/85244237)
[Python 生成器与它的 send，throw，close 方法](https://juejin.cn/post/6992917747973750821)
[用yield关键字创建生成器](http://anders.wang/python-yield/)