## map()
map()函数语法：
map(function,iterable,...)

参数:
function--函数
iterable--一个或多个序列

返回值
Python2.x返回列表。
Python3.x返回迭代器对象。

传很多个iterable，如果有额外的iterable参数，并行的从这些参数中取元素，并调用function。如果一个iterable参数比另外的iterable参数要短，将以长度最小的为基准。

```
def add(x):
    return x+1

list1=[1,2,3]
    res=map(add,list1)
    print(list(res))

# [2,3,4]
```

```
from collections.abc importIterator

defadd(x,y,z):
    return x,y,z

list1=[1,2,3]
list2=[1,2,3,4]
list3=[1,2,3,4,5]
res=map(add,list1,list2,list3)
print(list(res))
print(isinstance(res,Iterator))

# [(1,1,1),(2,2,2),(3,3,3)]
# True
```

## filter()
语法：
filter(function,iterable)

参数：
function--判断函数。
iterable--可迭代对象。

返回值：
返回迭代器对象。

filter()函数用于过滤序列，过滤掉不符合条件的元素，返回由符合条件元素组成的新列表。

该接收两个参数，第一个为函数，第二个为序列，序列的每个元素作为参数传递给函数进行判断，然后返回True或False，最后将返回True的元素放到新列表中。

```
defis_odd(n):
    returnn%2==1

newlist=filter(is_odd,[1,2,3,4,5,6,7,8,9,10])
print(newlist)
# [1,3,5,7,9]
```

## reduce()
函数语法：
reduce(function,sequence[,initial])

参数:
function有两个参数的函数，必需参数
sequencetuple，list，dictionary，string等可迭代物，必需参数
initial初始值，可选参数

返回值：
reduce的工作过程是：在迭代sequence(tuple，list，dictionary，string等可迭代物)的过程中，首先把前两个元素传给函数参数，函数加工后，然后把得到的结果和第三个元素作为两个参数传给函数参数，函数加工后得到的结果又和第四个元素作为两个参数传给函数参数，依次类推。如果传入了initial值，那么首先传的就不是sequence的第一个和第二个元素，而是initial值和第一个元素。经过这样的累计计算之后合并序列到一个单一返回值。

```
defadd(x,y):
    return x+y

from functools import reduce
print(reduce(add,[1,2,3,4]))
# 10
```

##zip()
语法：
zip([iterable,...])

参数说明：
iterabl--一个或多个迭代对象;

返回值：
返回一个迭代器对象。

zip()函数用于将可迭代的对象作为参数，将对象中对应的元素打包成一个个元组，然后返回由这些元组组成的对象，这样做的好处是节约了不少的内存。

我们可以使用list()转换来输出列表。

如果各个迭代器的元素个数不一致，则返回列表长度与最短的对象相同，利用\*号操作符，可以将元组解压为列表。

```
a=[1,2,3]
b=[4,5,6]
c=[4,5,6,7,8]

print(list(zip(a,b,c)))
print(list(zip(a,c)))#元素个数与最短的列表一致
a1,a2=zip(*zip(a,b))#与zip相反，zip(*)可理解为解压，返回二维矩阵式
print(*zip(a,b))
print(list(a2))

# [(1,4,4),(2,5,5),(3,6,6)]
# [(1,4),(2,5),(3,6)]
# (1,4)(2,5)(3,6)
# [4,5,6]
```

## enumrate()
语法：
enumerate(sequence,[start=0])

参数：
sequence--一个序列、迭代器或其他支持迭代对象。
start--下标起始位置。

返回值：
返回enumerate(枚举)对象。为迭代器对象。

```
a=[1,2,3]
print(list(enumerate(a)))
print(list(enumerate(a,2)))

# [(0,1),(1,2),(2,3)]
# [(2,1),(3,2),(4,3)]
```

## pow()
语法：
pow(x,y[,z])
函数是计算x的y次方，如果z在存在，则再对结果进行取模，其结果等效于pow(x,y)%z

注意：pow()通过内置的方法直接调用，内置方法会把参数作为整型，而math模块则会把参数转换为float。

参数：
x--数值表达式。
y--数值表达式。
z--数值表达式。

返回值：
返回xy（x的y次方）的值。

```
print(pow(4,2))
print(pow(4,2,3))

# 16
# 1
```

## max() , min()
max和min函数的使用介绍：
对可迭代对象元素进行比较，找到最大值 max(iterable,*[,default=obj,key=func])
对传入的多个参数进行比较，找到最小值 max(arg1,arg2,*args,*[,key=func])

简单使用
```
list_a=[1,2,3,5,8]
print(max(list_a))
```

带默认参数
```
#如果设定default，当传入的对象为空时则返回default值而不会引发错误
list_a=[]
print(max(list_a,default=1))
```

带key
key应当传入一个可调用对象，一般传入的是函数。指定key之后，max函数就会根据key处理后的元素进行比较
```
# 需求1：比如下面的情况，每种水果的价格信息都是以字典的形式存放的列表中，要找到最贵的水果和最便宜的水果

fruit_shop=[
{'name':'apple','price':5.68},
{'name':'orange','price':4.22},
{'name':'banana','price':2.65},
{'name':'berries','price':10.75}]

cheap=min(fruit_shop,key=lambdas:s['price'])
expensive=max(fruit_shop,key=lambdas:s['price'])
print('最便宜的水果是:',cheap)
print('最贵的水果是:',expensive)
# 最便宜的水果是:{'name':'banana','price':2.65}
# 最贵的水果是:{'name':'berries','price':10.75}


# 需求2：找到列表中出现次数最多的元素。

lt=[2,2,3,1,2,2,1,8,5]
max(set(lt),key=lt.count)
```

## sorted
sorted(iterable,\*,key=None,reverse=False)
必需参数为一个可迭代对象
key指定带有单个参数的函数，用于从iterable的每个元素中提取用于比较的键(例如key=str.lower)。默认值为None(直接比较元素)。

reverse为一个布尔值。如果设为True，则每个列表元素将按反向顺序比较进行排序。

返回为一个列表新对象，不会改变原来的对象。

排序保证是稳定的。这意味着当多个记录具有相同的键值时，将保留其原始顺序

```
list_num=[2,4,8,1,10]
print(sorted(list_num))
# [1,2,4,8,10]
print(sorted(list_num,reverse=True))
# [10,8,4,2,1]

dict_one={2:12,1:23}
print(sorted(dict_one))
# [1,2]字典的排序默认为为键进行排序
# 可先转为元组，即可对键或值排序
print(sorted(dict_one.items(),key=lambdax:x[0]))#对键进行排序
# [(1,23),(2,12)]
print(sorted(dict_one.items(),key=lambdax:x[1]))#对值进行排序
# [(2,12),(1,23)]

## 多重排序
```
# 考虑如下情况
# [(2,12),(1,23)，(2,13),(1,33)]
# 先按照0号位的排序，有相同的再按照1号位的排序
test=[(2,12),(1,23),(2,13),(1,33)]
print(sorted(test,key=lambdax:(x[0],x[1])))
# [(1,23),(1,33),(2,12),(2,13)]
# 有多重的话也是类似的，lambda函数后的元组指定多个即可
```

## 使用Operator模块函数
```
# 例子可简化为
from operator import itemgetter
print(sorted(dict_one.items(),key=itemgetter(1)))#对值进行排序
# [(2,12),(1,23)]
print(sorted(test,key=itemgetter(0,1)))
# [(1,23),(1,33),(2,12),(2,13)]
```

## next()
`next(iterator[,default])`

iterator--可迭代对象
default--可选,如果不设置，又没有下一个元素则会触发StopIteration异常,设置后则会抛出默认值。

## iter()

iter函数有两种用法，一种是传一个参数，一种是传两个参数。返回的结果都是返回一个iterator对象。

`i1=iter(itr,'c')`,这个意思是说，返回itr的iterator，而且在之后的迭代之中，迭代到'c'就立马停止（并不会输出c）。对这个itr有什么要求呢？这个itr在这里必须是callable的，即要实现**call**函数

for循环的话就会输出c之前的数据，使用next()的话到c就会抛出StopIteration异常。

## print()
print()可以输出多种类型的数据，并且搭配特殊字符可以实现格式化输出。

seq 参数
print(1,2,3,4,5,6)#123456
print(1,2,3,4,5,6,sep=":")#1:2:3:4:5:6

end 参数
print(1,2,3,4,5,6,end=";")#123456;
print(1,2,3,4,5,6,sep=":",end=";")#1:2:3:4:5:6;

## isinstance()
isinstance 可以接收一个元组,判断是否是多个类型中的一个就非常方便
```
isinstance(1.3, (float, int))
isinstance("1.3", (float, int, str))
```
