itertools 标准化了一个快速、高效利用内存的核心工具集，这些工具本身或组合都很有用。它们一起形成了“迭代器代数”，这使得在纯 Python 中有可能创建简洁又高效的专用工具。

# 无穷迭代器：
## count()
itertools.count(start=0, step=1)
可以设置两个参数，第一个参数为起始点，且包含在内，第二个参数为步长，如果不设置第二个参数则默认步长为1

创建一个迭代器，它从 start 值开始，返回均匀间隔的值。常用于 map() 中的实参来生成连续的数据点。此外，还用于 zip() 来添加序列号。
```
# count(10) --> 10 11 12 13 14 ...
# count(2.5, 0.5) -> 2.5 3.0 3.5 ...
```
## cycle()
itertools.cycle(iterable)
可以设置一个参数，且只接受可以迭代的参数，如列表，元组，字符串。。。，该函数会对可迭代的所有元素进行循环

创建一个迭代器，返回 iterable 中所有元素并保存一个副本。当取完 iterable 中所有元素，返回副本中的所有元素。无限重复。
```
# cycle('ABCD') --> A B C D A B C D A B C D ...
```
## repeat()
[深入了解 repeat 的妙用](./itertools.repeat.md)
itertools.repeat(object[, times])
可以设置两个参数，其中第一个参数要求可迭代，第二个参数为重复次数，第二个参数如不设置则无限循环，一般来说使用时都会设置第二个参数，用来满足预期重复次数后终止：
创建一个迭代器，不断重复 object 。除非设定参数 times ，否则将无限重复。可用于 map() 函数中的参数，被调用函数可得到一个不变参数。也可用于 zip() 的参数以在元组记录中创建一个不变的部分。

提供与map或zip一起使用的恒定值流
```
>>> list(map(pow, range(10), repeat(2)))
[0, 1, 4, 9, 16, 25, 36, 49, 64, 81]
``` 

# 根据最短输入序列长度停止的迭代器
## islice() ：迭代器切片
函数 itertools.islice() 正好适用于在迭代器和生成器上做切片操作。
```
import itertools

def count(n):
    while True:
        yield n
        n += 1

c = count(0)
for x in itertools.islice(c, 10, 13):
    print(x)

# 10
# 11
# 12
```

## dropwhile() ：

# TODO 
太多了，日后补上


[python3-cookbook](https://python3-cookbook.readthedocs.io/)
[Documentation » Python 标准库 » 函数式编程模块 ](https://docs.python.org/zh-cn/3.8/library/itertools.html)


https://docs.python.org/zh-tw/3/library/itertools.html#itertools.repeat
http://www.cppcns.com/jiaoben/python/242169.html
一个网上看到的讨论，解释的非常好，收藏一下。

## 问题：
```
>>> [i for i in itertools.repeat('example', 5)]
['example', 'example', 'example', 'example', 'example']
>>> ['example'] * 5
['example', 'example', 'example', 'example', 'example']

>>> list(map(str.upper, itertools.repeat('example', 5)))
['EXAMPLE', 'EXAMPLE', 'EXAMPLE', 'EXAMPLE', 'EXAMPLE']
>>> ['example'.upper()] * 5
['EXAMPLE', 'EXAMPLE', 'EXAMPLE', 'EXAMPLE', 'EXAMPLE']
```

大意是不使用 itertools.repeat() 也可以得到相类似的结果，那么使用 itertools.repeat() 是必要的吗？itertools.repeat() 实现会更好吗？为什么？

## 解答：
### one
itertools.repeat的主要目的是提供与map或zip一起使用的恒定值流：
```
>>> list(map(pow, range(10), repeat(2)))     # list of squares
[0, 1, 4, 9, 16, 25, 36, 49, 64, 81]
```

第二个目的是，它提供了一种非常快速的循环方式，循环次数固定如下：
```
for _ in itertools.repeat(None, 10000):
    do_something()
```
```
for i in range(10000):
    do_something()
```
两者相比，前者更好，因为它只需要更新现有 None 对象的引用计数。后者则需要 range() 制造 10000 个不同的整数对象。

注意，Guido自己在timeit()模块中使用了快速循环技术。请参阅https://hg.python.org/cpython/file/2.7/Lib/timeit.py#l195上的源代码：

    if itertools:
        it = itertools.repeat(None, number)
    else:
        it = [None] * number
    gcold = gc.isenabled()
    gc.disable()
    try:
        timing = self.inner(it, self.timer)

### two
itertools.repeat函数是惰性的；它只使用一个项所需的内存。另一方面，(a,) * n和[a] * n习惯用法在内存中创建对象的n个副本。对于五个项目，乘法习惯用法可能更好，但是如果必须重复某些内容（比如说，一百万次），您可能会注意到资源问题。

然而，很难想象许多静态用于itertools.repeat。然而，事实上itertools.repeat是一个函数允许您在许多函数应用程序中使用它。例如，您可能有一些库函数func，它对一个iterable输入进行操作。有时，您可能已经预先构建了各种项的列表。其他时候，你可能只想在统一的名单上做手术。如果列表很大，itertools.repeat将为您节省内存。

最后，repeat使itertools文档中描述的所谓“迭代器代数”成为可能。甚至itertools模块本身也使用repeat函数。例如，下面的代码是作为itertools.izip_longest的等价实现给出的（即使真正的代码可能是用C编写的）。请注意下面使用的repeat七行：

```
class ZipExhausted(Exception):
    pass

def izip_longest(*args, **kwds):
    # izip_longest('ABCD', 'xy', fillvalue='-') --> Ax By C- D-
    fillvalue = kwds.get('fillvalue')
    counter = [len(args) - 1]
    def sentinel():
        if not counter[0]:
            raise ZipExhausted
        counter[0] -= 1
        yield fillvalue
    fillers = repeat(fillvalue)
    iterators = [chain(it, sentinel(), fillers) for it in args]
    try:
        while iterators:
            yield tuple(map(next, iterators))
    except ZipExhausted:
        pass
```

### three
你的例子foo * 5表面上看起来与itertools.repeat(foo, 5)很相似，但实际上却完全不同。

如果你写foo * 100000，解释器必须创建100000份foo，然后才能给你答案。因此，这是一个非常昂贵且不利于记忆的操作。

但是，如果您编写itertools.repeat(foo, 100000)，解释器可以返回一个为同一个函数服务的迭代器，并且在您需要结果之前不需要计算结果——例如，通过在一个函数中使用它来知道序列中的每个结果。

这是迭代器的主要优点：它们可以将列表的一部分（或全部）的计算推迟到您真正需要答案的时候。

[Python的itertools.repeat的目的是什么？](https://www.cnpython.com/qa/60172)