### 一、基础语法

#### 1. 输入与输出

#### 1.1 代码中要修改不可变数据会出现什么问题？抛出什么异常？

`代码不会正常运行，抛出 TypeError 异常。`

#### 1.2 `a=1,b=2`, 不用中间变量交换 a 和 b 的值？

方法一：

    a = a + b
    b = a - b
    a = a - b

方法二：

    a = a ^ b
    b = b ^ a
    a = a ^ b

方法三：
`a,b = b,a`

可参考: https://www.python87.com/pythonbasic/chapter01/1\_04.html

#### 1.3 `print` 调用 Python 中底层的什么方法？

print 方法默认调用 sys.stdout.write 方法，即往控制台打印字符串。

#### 1.4 下面这段代码的输出结果将是什么？请解释？

    class Parent(object):
        x = 1
    class Child1(Parent):
        pass
    class Child2(Parent):
        pass

    print(Parent.x, Child1.x, Child2.x)
    Child1.x = 2
    print(Parent.x, Child1.x, Child2.x)
    Parent.x = 3
    print(Parent.x, Child1.x, Child2.x)

结果为：

    1 1 1 # 继承自父类的类属性 x，所以都一样，指向同一块内存地址。
    1 2 1 # 更改 Child1，Child1 的 x 指向了新的内存地址。
    3 2 3 # 更改 Parent，Parent 的 x 指向了新的内存地址。

#### 1.5 简述你对`input()`函数的理解？

> 在 Python3 中，`input()` 获取用户输入，不论用户输入的是什么，获取到的都是字符串类型的。
> 在 Python2 中有 `raw_input()` 和 `input()`, `raw_input()` 和 Python3 中的 `input()` 作用是一样的，`input()` 输入的是什么数据类型的，获取到的就是什么数据类型的。

#### 2. 条件与循环

#### 2.1 阅读下面的代码，写出 A0，A1 至 An 的最终值。

```python
A0 = dict(zip(('a', 'b', 'c', 'd', 'e'),(1, 2, 3, 4, 5)))
A1 = range(0, 10)
A2 = [i for i in A1 if i in A0]
A3 = [A0[s] for s in A0]
A4 = [i for i in A1 if i in A3]
A5 = {i: i*i for i in A1}
A6 = [[i, i*i] for i in A1]
```

答：

    {'a': 1, 'b': 2, 'c': 3, 'd': 4, 'e': 5}
    range(0, 10)
    []
    [1, 2, 3, 4, 5]
    [1, 2, 3, 4, 5]
    {0: 0, 1: 1, 2: 4, 3: 9, 4: 16, 5: 25, 6: 36, 7: 49, 8: 64, 9: 81}
    [[0, 0], [1, 1], [2, 4], [3, 9], [4, 16], [5, 25], [6, 36], [7, 49], [8, 64], [9, 81]]

#### 2.2`range`和`xrange`的区别？

xrange 在 python3 中已经没有了

两者用法相同，不同的是 range 返回的结果是一个列表，而 xrange 的结果是一个生成器，前者是直接开辟一块内存空间来保存列表，后者是边循环边使用，只有使用时才会开辟内存空间，所以当列表很长时，使用 xrange 性能要比 range 好。

总结，python3 弃用了 xrange，但 python3 的 range 功能和 python2 的 xrange 一样，都是一个生成器。

参考文章：https://www.python87.com/p/946.html

#### 2.3 考虑以下 Python 代码，如果运行结束，命令行中的运行结果是什么？

    l = []
    for i in range(10):
        l.append({'num':i})
        print(l)

在考虑以下代码，运行结束后的结果是什么？

    l = []
    a = {'num':0}
    for i in range(10):
        a['num'] = i
        l.append(a)
    print(l)
    print(a)

以上两段代码的运行结果是否相同，如果不相同，原因是什么？

> 上方代码的结果：

    [{'num':0}，{'num':1}，{'num':2}，{'num':3}，{'num':4}，{'num':5}，{'num':6}，{'num':7}，{'num':8}，
    {'num':9}]

> 下方代码结果：

    [{'num':9}，{'num':9}，{'num':9}，{'num':9}，{'num':9}，{'num':9}，{'num':9}，{'num':9}，{'num':9}，
    {'num':9}]

> `原因是 `：
> 字典是可变对象，在下方的`l.append(a)`的操作中是把字典`a`的引用传到列表`l`中，当后续操作修改`a[num']`的值的时候，`l`中的值也会跟着改变，相当于`浅拷贝`。

#### 2.4 以下 Python 程序的输出？

    for i in range(5, 0, -1):
        print(i)

> 答：5 4 3 2 1

#### 3. 文件操作

#### 3.1 4G 内存怎么读取一个 5G 的数据？

> `方法一`：
> 可以通过生成器，分多次读取，每次读取数量相对少的数据（比如 500MB）进行处理，处理结束后在读取后面的 500MB 的数据。

> `方法二`：
> 可以通过 linux 命令 split 切割成小文件，然后再对数据进行处理，此方法效率比较高。可以按照行数切割，可以按照文件大小切割。

`参考文章`：https://www.python87.com/p/947.html

#### 3.2 现在考虑有一个 jsonline 格式的文件 file.txt 大小约为 10K，之前处理文件的

代码如下所示：

    from multiprocessing import Process

    def get_lines():
        l = []
        with open('file.txt', 'rb') as f:
            for eachline in f:
                l.append(eachline)
        return l

    if __name__ == '__main__':
        for e in get_lines():
            Process(e)  # 处理每一行数据

> 现在要处理一个大小为 10G 的文件，但是内存只有 4G，如果在只修改 get\_lines 函数而其他代码保持不变的情况下，应该如何实现？需要考虑的问题都有哪些？

    def get_lines():
        l = []
        with open('file.txt', 'rb') as f:
            data = f.readlines(60000)
        l.append(data)
        yield l

> ` 要考虑到的问题有：`
> 内存只有 4G 无法一次性读入 10G 的文件，需要分批读入。分批读入数据要记录每次读入数据的位置。分批每次读入数据的大小，太小就会在读取操作上花费过多时间。

#### 3.3 read、readline 和 readlines 的区别？

> `read`: 读取整个文件。
> `readline`： 读取下一行， 使用生成器方法。
> `readlines`：读取整个文件到一个迭代器以供我们遍历。

#### 3.4. 补充缺失的代码？

    def print_directory_contents(sPath):
        """
        这个函数接收文件夹的名称作为输入参数
        返回该文件夹中文件的路径
        以及其包含文件夹中文件的路径
        """
        # 补充代码
        # ------------ 代码如下 --------------------
        import os
        for sChild in os.listdir(sPath):
            sChildPath = os.path.join(sPath, sChild)
            if os.path.isdir(sChildPath):
                print_directory_contents(sChildPath)
            else:
                print(sChildPath)

#### 4. 异常

#### 4.1 在 except 中 return 后还会不会执行 finally 中的代码？怎么抛出自定义异常？

> 会继续处理 `finally` 中的代码；用 `raise` 方法可以抛出自定义异常。

#### 4.2 介绍一下 except 的作用和用法？

    except: #捕获所有异常
    except: <异常名>: #捕获指定异常
    except: <异常名 1, 异常名 2> : #捕获异常 1 或者异常 2
    except: <异常名>,<数据>: #捕获指定异常及其附加的数据
    except: <异常名 1, 异常名 2>:<数据>: #捕获异常名 1 或者异常名 2, 及附加的数据

#### 5. 模块与包

#### 5.1 常用的 Python 标准库都有哪些？

> os 操作系统，time 时间，random 随机，pymysql 连接数据库，threading 线程，multiprocessing 进程，queue 队列。
> `第三方库`：
> django 和 flask 也是第三方库，requests，virtualenv，selenium，scrapy，xadmin，celery，re，hashlib，md5。
> 常用的科学计算库（如 Numpy，Scipy，Pandas)。

#### 5.2 赋值、浅拷贝和深拷贝的区别？

##### 一、赋值

> 在 Python 中，对象的赋值就是简单的对象引用，这点和 C++ 不同，如下所示：

    a = [1,2,"hello",['python', 'C++']]
    b = a

> 在上述情况下，a 和 b 是一样的，他们指向同一片内存，b 不过是 a 的别名，是引用。
> 我们可以使用 b is a 去判断，返回 True，表明他们地址相同，内容相同，也可以使用 id() 函数来查看两个列表的地址是否相同。
> 赋值操作(包括对象作为参数、返回值) 不会开辟新的内存空间，它只是复制了对象的引用。也就是说除了 b 这个名字之外，没有其他的内存开销。修改了 a，也就影响了 b，同理，修改了 b，也就影响了 a。

##### 二、浅拷贝(shallow copy)

> 浅拷贝会创建新对象，其内容非原对象本身的引用，而是原对象内第一层对象的引用。
> 浅拷贝有三种形式：切片操作、工厂函数、copy 模块中的 copy 函数。

> 比如上述的列表 a；
> `切片操作`：b = a \[:] 或者 b = \[x for x in a]；
> `工厂函数`：b = list(a)；
> `copy 函数`：b = copy.copy(a)；

> 浅拷贝产生的列表 b 不再是列表 a 了，使用 is 判断可以发现他们不是同一个对象，使用 id 查看，他们也不指向同一片内存空间。但是当我们使用 `id(x) for x in a` 和 `id(x) for x in b` 来查看 a 和 b 中元
> 素的地址时，可以看到二者包含的元素的地址是相同的。
> 在这种情况下，列表 a 和 b 是不同的对象，修改列表 b 理论上不会影响到列表 a。
> 但是要注意的是，浅拷贝之所以称之为浅拷贝，是它仅仅只拷贝了一层，在列表 a 中有一个嵌套的 list，如果我们修改了它，情况就不一样了。
> 比如：`a[3].append(java)`。查看列表 b，会发现列表 b 也发生了变化，这是因为，我们修改了嵌套的 list，修改外层元素，会修改它的引用，让它们指向别的位置，修改嵌套列表中的元素，列表的地址并未发生变化，指向的都是用一个位置。

##### 三、深拷贝(deep copy)

> 深拷贝只有一种形式，copy 模块中的 `deepcopy()` 函数。
> 深拷贝和浅拷贝对应，深拷贝拷贝了对象的所有元素，包括多层嵌套的元素。因此，它的时间和空间开销要高。

> 同样的对列表 a，如果使用 `b = copy.deepcopy(a)`，再修改列表 b 将不会影响到列表 a，即使嵌套的列表具有更深的层次，也不会产生任何影响，因为深拷贝拷贝出来的对象根本就是一个全新的对象， 不再与原来的对象有任何的关联。

##### 四、拷贝的注意点？

> 对于非容器类型，如数字、字符，以及其他的原子类型，没有拷贝一说，产生的都是原对象的引用。
> 如果元组变量值包含原子类型对象，即使采用了深拷贝，也只能得到浅拷贝。

#### 5.3 `__init__` 和 `__new__` 的区别？

> init 在对象创建后，对对象进行初始化。
> new 是在对象创建之前创建一个对象，并将该对象返回给 init。

#### 5.4 Python 里面如何生成随机数？

    在 Python 中用于生成随机数的模块是 random，在使用前需要 import. 如下例子可以酌情列举：
    random.random()：生成一个 0-1 之间的随机浮点数；
    random.uniform(a, b)：生成 [a,b] 之间的浮点数；
    random.randint(a, b)：生成 [a,b] 之间的整数；
    random.randrange(a, b, step)：在指定的集合 [a,b) 中，以 step 为基数随机取一个数；
    random.choice(sequence)：从特定序列中随机取一个元素，这里的序列可以是字符串，列表，元组等。

#### 5.5 输入某年某月某日，判断这一天是这一年的第几天？(可以用 Python 标准库)

    import datetime

    def dayofyear():
        year = input("请输入年份：")
        month = input("请输入月份：")
        day = input("请输入天：")
        date1 = datetime.date(year=int(year), month=int(month), day=int(day))
        date2 = datetime.date(year=int(year), month=1, day=1)
        return(date1 - date2 + 1).days

#### 5.6 打乱一个排好序的 list 对象 alist？

    import random
    random.shuffle(alist)

#### 5.7 说明一下 os.path 和 sys.path 分别代表什么？

> os.path 主要是用于对系统路径文件的操作。
> sys.path 主要是对 Python 解释器的系统环境参数的操作（动态的改变 Python 解释器搜索路径）。

#### 5.8 Python 中的 os 模块常见方法？

    os.remove() 删除文件
    os.rename() 重命名文件
    os.walk() 生成目录树下的所有文件名
    os.chdir() 改变目录
    os.mkdir/makedirs 创建目录 / 多层目录
    os.rmdir/removedirs 删除目录 / 多层目录
    os.listdir() 列出指定目录的文件
    os.getcwd() 取得当前工作目录
    os.chmod() 改变目录权限
    os.path.basename() 去掉目录路径，返回文件名
    os.path.dirname() 去掉文件名，返回目录路径
    os.path.join() 将分离的各部分组合成一个路径名
    os.path.split() 返回（dirname(),basename()) 元组
    os.path.splitext()(返回 filename,extension) 元组
    os.path.getatime\\ctime\\mtime 分别返回最近访问、创建、修改时间
    os.path.getsize() 返回文件大小
    .path.exists() 是否存在
    os.path.isabs() 是否为绝对路径
    os.path.isdir() 是否为目录
    os.path.isfile() 是否为文件

#### 5.9 Python 的 sys 模块常用方法？

    sys.argv 命令行参数 List，第一个元素是程序本身路径
    sys.modules.keys() 返回所有已经导入的模块列表
    sys.exc_info() 获取当前正在处理的异常类，exc_type、exc_value、exc_traceback 当前处理的异常详细信息>
    sys.exit(n) 退出程序，正常退出时 exit(0)
    sys.hexversion 获取 Python 解释程序的版本值，16 进制格式如：0x020403F0
    sys.version 获取 Python 解释程序的版本信息
    sys.maxint 最大的 Int 值
    sys.maxunicode 最大的 Unicode 值
    sys.modules 返回系统导入的模块字段，key 是模块名，value 是模块
    sys.path 返回模块的搜索路径，初始化时使用 PYTHONPATH 环境变量的值
    sys.platform 返回操作系统平台名称
    sys.stdout 标准输出
    sys.stdin 标准输入
    sys.stderr 错误输出
    sys.exc_clear() 用来清除当前线程所出现的当前的或最近的错误信息
    sys.exec_prefix 返回平台独立的 python 文件安装的位置
    sys.byteorder 本地字节规则的指示器，big-endian 平台的值是'big',little-endian 平台的值是 'little'
    sys.copyright 记录 python 版权相关的东西
    sys.api_version 解释器的 C 的 API 版本
    sys.version_info 元组则提供一个更简单的方法来使你的程序具备 Python 版本要求功能

#### 5.10 unittest 是什么？

> 在 Python 中，unittest 是 Python 中的单元测试框架。它拥有支持共享搭建、自动测试、在测试
> 中暂停代码、将不同测试迭代成一组，等的功能。

#### 5.11 模块和包是什么？

> 在 Python 中，模块是搭建程序的一种方式。每一个 Python 代码文件都是一个模块，并可以引用
> 其他的模块，比如对象和属性。
> 一个包含许多 Python 代码的文件夹是一个包。一个包可以包含模块和子文件夹。

#### 6. Python 特性

#### 6.1 Python 是强语言类型还是弱语言类型？

> Python 是强类型的动态脚本语言。
> 强类型：不允许不同类型相加。
> 动态：不使用显示数据类型声明，且确定一个变量的类型是在第一次给它赋值的时候。
> 脚本语言：一般也是解释型语言，运行代码只需要一个解释器，不需要编译。

#### 6.2 谈一下什么是解释性语言，什么是编译性语言？

> 计算机不能直接理解高级语言，只能直接理解机器语言，所以必须要把高级语言翻译成机器语言，  计算机才能执行高级语言编写的程序。
> 解释性语言在运行程序的时候才会进行翻译。
> 编译型语言写的程序在执行之前，需要一个专门的编译过程，把程序编译成机器语言（可执行文件）。

#### 6.3 Python 中有日志吗？怎么使用？

> 有日志。
> Python 自带 logging 模块，调用 logging.basicConfig() 方法，配置需要的日志等级和相应的参数，
> Python 解释器会按照配置的参数生成相应的日志。

#### 6.4 Python 是如何进行类型转换的？

> 内建函数封装了各种转换函数，可以使用目标类型关键字强制类型转换，进制之间的转换可以用 int(str'，base='n') 将特定进制的字符串转换为十进制，再用相应的进制转换函数将十进制转换为目标进制。

> 可以使用内置函数直接转换的有：

    list---->tuple tuple(list)
    tuple---->list list(tuple)

#### 6.5 Python2 与 Python3 的区别？

##### 1) 核心类差异

1.Python3 对 Unicode 字符的原生支持。

> Python2 中使用 ASCII 码作为默认编码方式

支持 unicode 的 string。Python2 和 Python3 字节和字符对应关系为：
| Python2 | Python3 | 表现 | 转换 | 作用 |
| --- | --- | --- | --- | --- |
| str | bytes | 字节 | encode | 存储 |
| unicode | str | 字节 | encode | 显示 |

2.Python3 采用的是绝对路径的方式进行 import。

#### 1. 字典

dict: 字典，字典是一组键(key) 和值(value) 的组合，通过键(key) 进行查找，没有顺序， 使用大括号”{}”;

应用场景：dict，使用键和值进行关联的数据；

##### 1.1 现有字典 d={'a':24，'g':52，'i':12，'k':33} 请按字典中的 value 值进行排序？

    sorted(d.items()，key = lambda x:x[1]) 。

##### 1.2 说一下字典和 json 的区别？

> 字典是一种数据结构，json 是一种数据的表现形式，字典的 key 值只要是能 hash 的就行，json 的必须是字符串。

##### 1.3 什么是可变、不可变类型？

> 可变不可变指的是内存中的值是否可以被改变
> 不可变类型指的是对象所在内存块里面的值不可以改变，有数值、字符串、元组；
> 可变类型则是可以改变，主要有列表、字典。

##### 1.4 存入字典里的数据有没有先后排序？

> 存入的数据不会自动排序，可以使用 `sort 函数` 对字典进行排序。

##### 1.5 字典推导式？

    # 变量 = {key,value for key,value in 可迭代对象 if 条件}
    # 变量 = {key:value for key,value in 可迭代对象 if 条件}

    d = {key: value for(key, value) in iterable}

##### 1.6 现有字典 d={'a':24，'g':52，'l':12，'k':33} 请按字典中的 value 值进行排序？

    sorted(d.items(), key=lambda x: x [1])

#### 2、字符串

str: 字符串是 Python 中最常用的数据类型。我们可以使用引号(' 或") 来创建字符串。

##### 2.1 如何理解 Python 中字符串中的 \ 字符？

> 有三种不同的含义：
> 1、转义字符
> 2、路径名中用来连接路径名
> 3、编写太长代码手动软换行。

##### 2.2 请反转字符串 “aStr”?

`print('aStr'[::-1])`

##### 2.3 将字符串”k:1|k1:2|k2:3|k3:4”，处理成 Python 字典：{k:1， k1:2， …} # 字典里的 K 作为字符串处理

    str1 ="k:1|k1:2|k2:3|k3:4"

    def str2dict(str1):
        dict1 = {}
        for iterms in strsplit('|'):
            key, value = iterms.split(':')
            dict1[key] = value
        return dict1

##### 2.4 请按 alist 中元素的 age 由大到小排序

    alist = [{'name': 'a', 'age': 20}, {'name': 'b', 'age': 30}, {'name': 'c', 'age': 25}]

    def sort_by_age(list1):
        return sorted(alist, key=lambda x: x['age'], reverse=True)

    if __name__ == '__main__':
        print sort_by_age(alist))

    # [{'name': 'b', 'age': 30}, {'name': 'c', 'age': 25}, {'name': 'a', 'age': 20}]

#### 3、列表

`list`: 是 Python 中使用 `最频繁的数据类型`，在其他语言中通常叫做 `数组`，通过索引进行查找，使用方括号 `[]`,> `列表是有序的集合。`
`应用场景`：定义列表使用 `[]` 定义，数据之间使用 `，` 分割。> > 列表的索引从 0 开始：索引就是数据在列表中的位置编号，索引又可以被称为下标。
`【注意】`: 从列表中取值时，如果超出索引范围，程序会产生异常。`IndexError: list index out of range`

##### 3.2 写一个列表生成式，产生一个公差为 11 的等差数列

    print([x*11 for x in range(10)])
    # [0, 11, 22, 33, 44, 55, 66, 77, 88, 99]

##### 3.3 给定两个列表，怎么找出他们相同的元素和不同的元素？

    list1 = [1, 2, 3]
    list2 = [3, 4, 5]
    set1 = set(list1)
    set2 = set(list2)
    print(set1 & set2)  # {3}
    print(set1 ^ set2)  # {1, 2, 4, 5}

##### 3.4 请写出一段 Python 代码实现删除一个 list 里面的重复元素？

使用用内置的 set：

    l1 = ['b', 'c', 'd', 'b', 'c', 'a', 'a']
    l2 = list(set(l1))
    print(l2)  # ['b', 'd', 'c', 'a']

如果想要保持他们原来的排序 ：用 list 类的 `sort` 方法：

    l1 = ['b','c','d','b','c','a','a']
    # print(list(set(l1)))
    l2 = list(set(l1))
    l2.sort(key=l1.index)
    # 这里的l1.index 刚开始有点迷惑，以为是写错了，去用lambda 自己写了下才反映过来是差不多的
    print(l2)

    # l1 = ['b', 'c', 'd', 'b', 'c', 'a', 'a']
    # l2 = list(set(l1))
    # l2.sort(key=lambda x:l1.index(x))
    # print(l2)
    # ['b', 'c', 'd', 'a']

也可以这样写：

    l1 = ['b','c','d','b','c','a','a']
    l2 = sorted(set(l1),key=l1.index)
    print(l2)

    # l1 = ['b', 'c', 'd', 'b', 'c', 'a', 'a']
    # l2 = sorted(set(l1), key=lambda x:l1.index(x))
    # print(l2)
    # ['b', 'c', 'd', 'a']

也可以用`遍历`：

    l1 = ['b', 'c', 'd', 'b', 'c', 'a', 'a']
    l2 = []

    for i in l1:
        if not i in l2:
            lappend(i)

    print(l2)
    # ['b', 'c', 'd', 'a']

##### 3.5 给定两个 list A ,B，请用找出 A ,B 中相同的元素，A ,B 中不同的元素

    A、B 中相同元素：print(set(A)&set(B))

    A、B 中不同元素：print(set(A)^set(B))

##### 3.6 有如下数组 list = range(10) 我想取以下几个数组，应该如何切片？

    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    [0, 1, 2, 3, 4, 5, 6]
    [3, 4, 5, 6]
    [9]
    [1, 3, 5, 7, 5, 9]

答：

    [1:]
    [1:7]
    [3:7]
    [-1]
    [1::2]

##### 3.7 下面这段代码的输出结果是什么？请解释？

    def extendlist(val, list=[]):
        list.append(val)
        return list

    list1 = extendlist(10)
    list2 = extendlist(123, [])
    list3 = extendlist('a')

    print("list1 = % s" % list1)
    print("list2 = % s" % list2)
    print("list3 = % s" % list3)

输出结果：

    list1 = [10, 'a']
    list2 = [123]
    list3 = [10, 'a']

新的默认列表只在函数被定义的那一刻创建一次。当 extendList 被没有指定特定参数 list 调用时，这组 list 的值随后将被使用。这是因为带有默认参数的表达式在函数被定义的时候被计算，不是在调用的时候被计算。

##### 3.8. 将以下 3 个函数按照执行效率高低排序

    def f1(lIn):
        l1 = sorted(lIn)
        l2 = [i for i in l1 if i<0.5]
        return [i*i for i in l2]

    def f2(lIn):
        l1 = [i for i in l1 if i<0.5]
        l2 = sorted(l1)
        return [i*i for i in l2]

    def f3(lIn):
        l1 = [i*i for i in lIn]
        l2 = sorted(l1)
        return [i for i in l1 if i<(0.5*0.5)]

按执行效率从高到低排列：f2、f1 和 f3。要证明这个答案是正确的，你应该知道如何分析自己代码的性能。Python 中有一个很好的程序分析包，可以满足这个需求。

    import random
    import cProfile
    lIn = [random.random() for i in range(100000)]
    cProfile.run('f1(lIn)')
    cProfile.run('f2(lIn)')
    cProfile.run('f3(lIn)')

##### 3.9 获取 1~100 被 6 整除的偶数？

    def A():
        L=[]
        for i in range(1,100):
            if i%6==0:
                L.append(i)
        return L
    print(A())

#### 4、元祖

`tuple`: 元组，元组将多样的对象集合到一起，不能修改，通过索引进行查找，使用括号 `()`;

`应用场景`：把一些数据当做一个整体去使用，`不能修改`；

#### 5、集合

`set`:集合，在 Python 中的书写方式的 `{}`，集合与之前列表、元组类似，可以存储多个数据，但是这些数据是不重复的。

集合对象还支持 union(联合), intersection(交), difference(差) 和 sysmmetric\_difference(对称差集) 等数学运算.

##### 快速去除列表中的重复元素

    a = [11, 22, 33, 33, 44, 22, 55]

    print(set(a)) # {33, 11, 44, 22, 55}

##### 交集：共有的部分

    a = {11, 22, 33, 44, 55}
    b = {22, 44, 55, 66, 77}

    print(a & b)  # {44, 22, 55}

##### 并集：总共的部分

    a = {11, 22, 33, 44, 55}
    b = {22, 44, 55, 66, 77}

    print(a | b)  # {33, 66, 11, 44, 77, 22, 55}

##### 差集：另一个集合中没有的部分

    a = {11, 22, 33, 44, 55}
    b = {22, 44, 55, 66, 77}

    print(b - a)  # {66, 77}

##### 对称差集(在 a 或 b 中，但不会同时出现在二者中)

    a = {11, 22, 33, 44, 55}
    b = {22, 44, 55, 66, 77}

    print(a ^ b)  # {33, 66, 11, 77}
