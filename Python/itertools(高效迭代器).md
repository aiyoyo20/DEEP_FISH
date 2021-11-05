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
https://docs.python.org/zh-tw/3/library/itertools.html#itertools.repeat
http://www.cppcns.com/jiaoben/python/242169.html
