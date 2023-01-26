#!/usr/bin/env python3
# Author: aiyoyo🍉

1、可变类型陷阱
```
l = []
a = []
for i in range(10):
    a.append(i)
    l.append(a)
print(l)
```

```
l = []
a = {'num': 0}
for i in range(10):
    a['num'] = i
    l.append(a)
print(l)
print(a)
```

都是类似的，每次新增的都是同一个对象，并在其后进行了修改，导致之前的也被修改（覆盖）。

2、lambda 陷阱
```
a = [lambda x:x+n for n in range(9)]
print(b(0) for b in a)
```

lambda 中的变量为自由变量，而不是像普通函数那样有自己的空间，
所以上面的变量x是一直在变化的，直至被最后一个覆盖

3、for else 妙用
有个需求，有两个列表，a，b，求b中的字符串的子串不包含a中字符串的元素，我看看你的实现
```
a = ["1","2","3"]
b = ["321","32","3","4","6"]

for i in b:
    flag = True
    for j in a:
        if j in i:
            flag = False
            break;  # 如果有一个子串匹配，则跳出循环，不再检查其他子串
    if flag:  # 如果flag仍然为True，则表明b中的字符串不包含a中的子串
        print(i)  # 将不包含a中子串的字符串加入到result中
```

```
for i in b:
    for j in a:
        if j in i:
            break
    else:
        print(i)
```

4、yield 与递归产生的异常分析
最初的异常代码：
```
from config import frontMatter, noteDir, ignoreFile
import os


def getFile(filePath):
    files = os.listdir(filePath)
    for fi in files:
        fi_d = os.path.join(filePath, fi)

        if os.path.isdir(fi_d):
            getFile(fi_d)
        else:
            fileName = os.path.join(filePath, fi_d)

            if ".md" in fileName:
                print(fileName)
                yield fileName
```

就是一个简单的递归输出文件的函数，如果把`yield`的语句注释，正常`print`是可以正常输出的，但是使用`yield`语句就只能得到一个输出。通过添加`print`的方式发现整个函数的流程和使用`print`是一样的，但就是没有输出。

解释之前，先来看`yield` 的几个特性。
1. `yield`可以看作加强版本的`return`，会抛出结果，但是不会退出函数。
2. 函数中只要有`yield`关键字，这个函数就成了生成器函数，调用这个函数会得到一个生成器。并且这与`yield`语句是否被执行无关，如果是增加了判断语句，但是有`yield`的分支一直未被执行，这个函数也是生成器函数。
3. 生成器需要使用`next()`函数来迭代，或者是通过循环语句来迭代。生成器函数被调用一次就是一个生成器，所以调用的是一次调用多次迭代，如果使用`next(funcName())`是创建了多个生成器，且只迭代了里面的第一个结果。
4. 抛出结果后保留函数的状态，下一次使用`next()`函数调用时或循环迭代时从保留的状态恢复继续向后执行。


上面的代码将其用另一个类似变量、代码量简化的的替换。实际这个代码有问题，假如正常执行的话，多次之后传入的参数将为空列表，但是空列表取`[1:]`是可行的，最后会超出递归限制而报错。
```
def yieldNumberList(numberList):
    yield numberList[0]
    yieldNumberList(numberList[1:])

if __name__ == '__main__':
    numberList = [1,2,3,4]

    for number in yieldNumberList(numberList):
        print(number)

# 1
```

代码的实际运行并没有像想象中那样逐个数字打印，只有第一个输出了。

实际上后续的代码也完完整整的走过一遍了的，但是在递归的时候，`yieldNumberList([1:])`该语句并不是单单纯的函数了，而是一个生成器，这里创建了一个生成器，但是没有对其进行迭代，而后续的生成器中的生成器也是同理，也就是该生成器实际是一个多重生成器，但是只迭代出了第一重。

改进
```
def yieldNumberList(numberList):
    yield numberList[0]
    yield from yieldNumberList(numberList[1:])

if __name__ == '__main__':
    numberList = [1,2,3,4]

    for number in yieldNumberList(numberList):
        print(number)

# 1
```