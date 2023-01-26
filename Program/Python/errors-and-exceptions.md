# 语法错误
基本由编程不规范造成的，如括号、引号的不匹配，缩进的不正确，二值比较符号写成赋值，冒号的缺少等等造成语句的编译异常。

# 异常
在语法完全正确的情况下，程序也可能出现不能正常运行的情况。这种情况称之为异常。
异常的类型很多，比如将0作为除数，尝试更改不可变类型数据，函数接收的参数的类型不对，使用了未定义或者不在该定义域中的参数等等。

# try-except
为 python 提供的最简单的异常捕获、处理的方法。
1、使用例子：
```
def func():
	print(1/1)

try:
	func()
	print('ok')
except:
	print('error')
```
解释：
try 关键字下的语句块是要执行的代码，如果func()正常运行没有引发任何一个异常，就会继续运行后续的todo1,然后跳过 except，继续后续的代码（如果有的话），没有就正常结束整个程序的运行。出现异常就会去执行 except 里的语句然后再之后的。
可以不捕获异常，而只是单纯的略过该异常，去执行下一个语句，从而达到不中断程序的运行。

2、捕获异常
```
def func():
	print(1/0)

try:
	func()
	print('ok')
except ZeroDivisionError:
	print('error')
```
和之前的例子类似，不同的是人为的制造了一个异常，并且在捕获的时候指定了该异常类型。

3、捕获多个异常
```
def func():
	print(1/1)

try:
	func()
	print('ok')
except NameError:
	print('name error')
except TypeError:
	print('type error')
except ZeroDivisionError:
	print('zero error')
except:
	print('未知异常')
```
except 语句不是唯一的，可以有多个。捕获到什么类型的异常就会执行该异常的处理语句，如果都不是，则执行最后的语句，如果没有最后的语句，则会抛出异常。

4、捕获多个异常2
```
def func():
    print(1/0)

try:
    func()
    print('ok')
except (ValueError, ArithmeticError, ZeroDivisionError):
    print('error')
except:
    print('未知异常')
```
一个 except 语句可以接受多个类型的异常，可以看作是异常 in 异常元组里。这样就可以不必为没一个类型单独写处理语句了。

# try - except .. as（访问异常信息）
>如果程序需要在 except 块中访问异常对象的相关信息，则可通过为异常对象声明变量来实现。 当 Python 解释器决定调用某个 except 块来处理该异常对象时，会将异常对象赋值给 except 块后的异常变量，程序即可通过该变量来获得异常对象的相关信息。 所有的异常对象都包含了如下几个常用属性和方法：
>
>args：该属性返回异常的错误编号和描述字符串。
errno：该属性返回异常的错误编号。
strerror：该属性返回异常的描述宇符串。
with_traceback()：通过该方法可处理异常的传播轨迹信息。


当一个 except 有多个异常类型或者不确定异常类型时，可以通过 as 得到异常，输出更准确一些的异常信息
```
def func():
    print(1/0)

try:
    func()
    print('ok')
except (ValueError, ArithmeticError, ZeroDivisionError) as e:
    print(e)
    print(type(e))
    print(str(e))  # 返回字符串类型，只给出异常信息，不包括异常信息的类型
    print(repr(e))  # 给出较全的异常信息，包括异常信息的类型
except:
    print('未知异常')

# division by zero
# <class 'ZeroDivisionError'>
# division by zero
# ZeroDivisionError('division by zero')
```

```
def func():
    print(1/0)

try:
    func()
    print('ok')
except Exception as e:
    # 大多数异常都是继承自 Exception 类，因此在不确定异常时可以以 Exception 作为异常类去做初步判断，实际应用中通常是更准确的捕获异常并处理
    print(e)
    print(type(e))
    print(str(e))  # 返回字符串类型，只给出异常信息，不包括异常信息的类型
    print(repr(e))  # 给出较全的异常信息，包括异常信息的类型
except:
    print('未知异常')

# division by zero
# <class 'ZeroDivisionError'>
# division by zero
# ZeroDivisionError('division by zero')
```

# 异常的传递
```
def func():
    print(1/0)

def func2():
    func()

func2()

# Traceback (most recent call last):
#   File "/home/fiki/Documents/PycharmProjects/thread_yy.py", line 21, in <module>
#     func2()
#   File "/home/fiki/Documents/PycharmProjects/thread_yy.py", line 19, in func2
#     func()
#   File "/home/fiki/Documents/PycharmProjects/thread_yy.py", line 16, in func
#     print(1/0)
# ZeroDivisionError: division by zero
```
异常会一层一层的传递。直到主函数才抛出异常。

# try - except - else
```
def func():                                                                                        
    print(1/1)

try:
    func()
    print('ok')
except (ValueError, ArithmeticError, ZeroDivisionError):
    print('error')
except:
    print('未知异常')
else:
    print('ok')

# 1.0
# ok
# ok
```
很明显。else 语句会在 try 正常执行后执行，重点是 else 的侧重点是什么，咋一看完全可以写在 try 里面，单独出来反而会有点混淆的感觉。
```
def func():
   return '1'/0

def func2():
    a = func()
    print('2'/a)
try:
    func2()
    print('ok')
except (ValueError, ArithmeticError, ZeroDivisionError):
    print('error')
except:
    print('未知异常')
else:
    print('ok')

# 未知异常
```
例子有点牵强，大概意思就是，由于异常的传递，当我们使用 try 语句包裹的是有多个层级的话，捕获到的异常往往不够精准，无法确定是那一个层级的异常。
```
def func():
   return '1'/0

def func2():
    a = func()

try:
    func2()
    print('ok')
except (ValueError, ArithmeticError, ZeroDivisionError):
    print('error')
except:
    print('未知异常')
else:
    print('2'/a)

# 未知异常
```
这样我们就能知道该异常是 func() 造成的了

# try - except - else - finally（资源回收）
```
def func():
   return '1'

try:
    func()
    print('ok')
except:
    print('异常')
else:
    print('else')
finally:
    print('finally')

# ok
# else
# finally
```
finally 的执行，与程序是否有异常无关，有无 else 无关，最终都会执行 finally 里面的语句。

else finally 并不是都必须。
二者可选其一，也可都不选择。

finally 的使用情况有打开文件后的关闭，连接数据库后的断开等等。

# try - return
例子1
```
def func():
   return '1'

def fucn():
    try:
        func()
        return 'ok'
    except:
        return '异常'
    else:
        return 'else'
    # finally:
    #     return 'finally'

a = fucn()
print(a)
# ok
```
例子2
```
def func():
   return '1'

def fucn():
    try:
        func()
        return 'ok'
    except:
        return '异常'
    else:
        return 'else'
    finally:
        return 'finally'

a = fucn()
print(a)
# finally
```
例子1中符合正常的，遇到 return 则跳出函数
而例子二中却貌似没有执行 try 中的 return
实则不是，可以看作是 finally 的优先级更高，显式覆盖了前一个 return

# 抛出异常
## 自定义异常类型
![异常继承树](images/异常继承树.png)
自定义异常类应该总是继承自内置的 Exception 类， 或者是继承自那些本身就是从 Exception 继承而来的类。 尽管所有类同时也继承自 BaseException ，但你不应该使用这个基类来定义新的异常。 BaseException 是为系统退出异常而保留的，比如 KeyboardInterrupt 或 SystemExit 以及其他那些会给应用发送信号而退出的异常。 因此，捕获这些异常本身没什么意义。 这样的话，假如你继承 BaseException 可能会导致你的自定义异常不会被捕获而直接发送信号退出程序运行。

在程序中引入自定义异常可以使得你的代码更具可读性，能清晰显示谁应该阅读这个代码。 还有一种设计是将自定义异常通过继承组合起来。在复杂应用程序中， 使用基类来分组各种异常类也是很有用的。它可以让用户捕获一个范围很窄的特定异常，捕获更大范围的异常

创建新的异常很简单：定义新的类，让它继承自 Exception （或者是任何一个已存在的异常类型）。

需要注意的是，如果定义的新异常重写了 __init__() 方法， 确保你使用所有参数调用 Exception.__init__()
```
class CustomError(Exception):
    def __init__(self, message, status):
        super().__init__(message, status)
        self.message = message
        self.status = status
```
## raise
raise 必需的参数指定了要被抛出的异常。它必须是一个异常的实例或者是异常的类（也就是 Exception 的子类）。大多数的异常的名字都以"Error"结尾，所以实际命名时尽量跟标准的异常命名一样。
```
class LenthExceptin(Exception):
    def __str__(self):
        print("用户名长度不合法")

def function():
    name = 'adad3qsdsdsdsd'
    if len(name)>10 or len(name)<5:
        raise LenthExceptin()
    else:
        print(1)

function()
```
[Python raise用法（超级详细，看了无师自通）](https://www.ixyread.com/read/ID1605494154VwJr/OEBPS-Text-Section0088.html)
raise 语句有如下三种常用的用法：

raise：单独一个 raise。该语句引发当前上下文中捕获的异常（比如在 except 块中），或默认引发 RuntimeError 异常。
raise 异常类：raise 后带一个异常类。该语句引发指定异常类的默认实例。
raise 异常对象：引发指定的异常对象。 上面三种用法最终都是要引发一个异常实例（即使指定的是异常类，实际上也是引发该类的默认实例），raise 语句每次只能引发一个异常实例。

## 断言（assert）
在一些情况下可以将断言用做抛出异常
语法格式如下：`assert expression`
当 expression 的结果为False 时，引发 AssertionError 异常
其等价于：
```
if not expression:
    raise AssertionError
```
```
# assert 后面也可以紧跟参数:

assert expression [, arguments]
# 等价于：

if not expression:
    raise AssertionError(arguments)
```

# 异常机制使用细则
[Python异常机制使用细则，正确使用Python异常处理机制（入门必读）](https://www.ixyread.com/read/ID1605494154VwJr/OEBPS-Text-Section0090.html)
成功的异常处理应该实现如下 4 个目标：
    使程序代码混乱最小化。
    捕获并保留诊断信息。
    通知合适的人员。
    采用合适的方式结束异常活动。 下面介绍达到这些效果的基本准则。

## 不要过度使用异常
不可否认，Python 的异常机制确实方便，但滥用异常机制也会带来一些负面影响。过度使用异常主要表现在两个方面：
    把异常和普通错误混淆在一起，不再编写任何错误处理代码，而是以简单地引发异常来代苦所有的错误处理。
    使用异常处理来代替流程控制。 熟悉了异常使用方法后，程序员可能不再愿意编写烦琐的错误处理代码，而是简单地引发异常。实际上这样做是不对的，对于完全己知的错误和普通的错误，应该编写处理这种错误的代码，增加程序的健壮性。只有对于外部的、不能确定和预知的运行时错误才使用异常。 对比前面五子棋游戏中，处理用户输入坐标点己有棋子的两种方式。如果用户试图下棋的坐标点己有棋子：
```
#如果要下棋的点不为空
if board[int(y_str) - 1) [int(x_str) - 1] !="╋" :
    inputStr = input ("您输入的坐标点己有棋子了，请重新输入\n")
    continue
```
上面这种处理方式检测到用户试图下棋的坐标点己经有棋子，立即打印一条提示语句，并重新开始下一次循环。这种处理方式简洁明了、逻辑清晰，程序的运行效率也很好程序进入 if 块后，即结束了本次循环。 如果将上面的处理机制改为如下方式：


```
#如果要下棋的点不为空
if board[int(y_str) - 1) [int(x_str) - 1) != "╋":
    #引发默认的RuntimeError 异常
    raise
```
上面这种处理方式没有提供有效的错误处理代码，当程序检测到用户试图下棋的坐标点己经有棋子时，并没有提供相应的处理，而是简单地引发一个异常。这种处理方式虽然简单，但 Python 解释器接收到这个异常后，还需要进入相应的 except 块来捕获该异常，所以运行效率要差一些。而且用户下棋重复这个错误完全是可预料的，所以程序完全可以针对该错误提供相应的处理，而不是引发异常。 必须指出，异常处理机制的初衷是将不可预期异常的处理代码和正常的业务逻辑处理代码分离，因此绝不要使用异常处理来代替正常的业务逻辑判断。 另外，异常机制的效率比正常的流程控制效率差，所以不要使用异常处理来代替正常的程序流程控制。例如，对于如下代码：

```
#定义一个字符串列表
my_list =["Hello", "Python", "Spring"]
#使用异常处理来遍历arr数组的每个元素
try:
    i = 0
    while True:
    print (my_list [i])
    i += 1
except:
    pass
```
运行上面程序确实可以实现遍历 my_list 列表的功能，但这种写法可读性较差，而且运行效率也不高。程序完全有能力避免产生 indexError 异常，程序“故意”制造这种异常，然后使用 except 块去捕获该异常，这是不应该的。将程序改为如下形式肯定要好得多：

```
i = 0
while i < len(my_list):
    print(my_list[i])
    i += 1
``` 

注意，异常只应该用于处理非正常的情况，不要使用异常处理来代替正常的流程控制。对于一些完全可预知，而且处理方式清楚的错误，程序应该提供相应的错误处理代码，而不是将其笼统地称为异常。

不要使用过于庞大的 try 块
很多初学异常机制的读者喜欢在 try 块里放置大量的代码，这看上去很“简单”，但这种“简单”只是一种假象，只是在编写程序时看上去比较简单。但因为 try 块里的代码过于庞大，业务过于复杂，就会造成 try 块中出现异常的可能性大大增加，从而导致分析异常原因的难度也大大增加。 而且当时块过于庞大时，就难免在 try 块后紧跟大量的 except 块才可以针对不同的异常提供不同的处理逻辑。在同一个 try 块后紧跟大量的 except 块则需要分析它们之间的逻辑关系，反而增加了编程复杂度。 正确的做法是，把大块的 try 块分割成多个可能出现异常的程序段落，并把它们放在单独的 try 块中，从而分别捕获并处理异常。

不要忽略捕获到的异常
不要忽略异常！既然己捕获到异常，那么 except 块理应做些有用的事情，及处理并修复异常。except 块整个为空，或者仅仅打印简单的异常信息都是不妥的！ except 块为空就是假装不知道甚至瞒天过海，这是最可怕的事情，程序出了错误，所有人都看不到任何异常，但整个应用可能已经彻底坏了。仅在 except 块里打印异常传播信息稍微好一点，但仅仅比空白多了几行异常信息。通常建议对异常采取适当措施，比如： 处理异常。对异常进行合适的修复，然后绕过异常发生的地方继续运行；或者用别的数据进行计算，以代替期望的方法返回值；或者提示用户重新操作……
总之，程序应该尽量修复异常，使程序能恢复运行。 重新引发新异常。把在当前运行环境下能做的事情尽量做完，然后进行异常转译，把异常包装成当前层的异常，重新传给上层调用者。 在合适的层处理异常。如果当前层不清楚如何处理异常，就不要在当前层使用 except 语句来捕获该异常，让上层调用者来负责处理该异常。

# 使用 traceback 模块 获取异常信息
随着学习的深入，普通的异常捕获已经不能满足于需求了，捕获输出的为错误的值，而如果想要获得更明确的异常，如异常发生的具体位置，异常的传递过程等等。
```
import traceback
import sys

def func():
    return '1'/0

def func2():
    a = func()

try:
    func2()
    print('ok')
except Exception as e:
    tb = sys.exc_info()
    print(tb)

# (<class 'TypeError'>, TypeError("unsupported operand type(s) for /: 'str' and 'int'"), <traceback object at 0x7fe6c2fa3080>)

```
sys 模块的exc_info() 方法的返回为一个元组，第一个为异常的类型，第二个为异常的值，第三个则是一个 traceback object 
```
```

[Python3 assert（断言）](https://www.runoob.com/python3/python3-assert.html)
[14.8 创建自定义异常](https://python3-cookbook.readthedocs.io/zh_CN/latest/c14/p08_creating_custom_exceptions.html)

