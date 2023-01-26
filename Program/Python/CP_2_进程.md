# 概念
进程就是操作系统中执行的一个程序，操作系统以进程为单位分配存储空间，每个进程都有自己的地址空间、数据栈以及其他用于跟踪进程执行的辅助数据，操作系统管理所有进程的执行，为它们合理的分配资源。进程可以通过fork或spawn的方式来创建新的进程来执行其他的任务，不过新的进程也有自己独立的内存空间，因此必须通过进程间通信机制（IPC，Inter-Process Communication）来实现数据共享，具体的方式包括管道、信号、套接字、共享内存区等。

进程被定义为一个实体，它代表了系统中要实施的基本工作单元。 简而言之，我们将计算机程序编写成文本文件，当我们执行这个程序时，它就成为执行程序中提到的所有任务的过程。 在进程生命周期中，它经历了不同的阶段 - 开始，准备，运行，等待和终止。//原文出自【易百教程】，商业转载请联系作者获得授权，非商业请保留原文链接：https://www.yiibai.com/concurrency_in_python/concurrency_in_python_introduction.html


## 创建进程
### 1、以指定函数作为 target，创建 Process 对象即可创建新进程。
```
import multiprocessing
import os
 
# 定义一个普通的action函数，该函数准备作为进程执行体
def action(max):
    for i in range(max):
        print("(%s)子进程（父进程:(%s)）：%d" %
            (os.getpid(), os.getppid(), i))
if __name__ == '__main__':
    # 下面是主程序（也就是主进程）
    for i in range(100):
        print("(%s)主进程: %d" % (os.getpid(), i))
        if i == 20:
            # 创建并启动第一个进程
            mp1 = multiprocessing.Process(target=action,args=(100,))
            mp1.start()
            # 创建并启动第一个进程
            mp2 = multiprocessing.Process(target=action,args=(100,))
            mp2.start()
            mp2.join()
    print('主进程执行完成!')
```

### 2、继承Process类创建子进程
继承 Process 类创建子进程的步骤如下：
	定义继承 Process 的子类，重写其 run() 方法准备作为进程执行体。
	创建 Process 子类的实例。
	调用 Process 子类的实例的 start() 方法来启动进程。 下面程序通过继承 Process 类来创建子进程：
```
import multiprocessing
import os
 
class MyProcess(multiprocessing.Process):
    def __init__(self, max):
        self.max = max
        super().__init__()
    # 重写run()方法作为进程执行体
    def run(self):
        for i in range(self.max):
            print("(%s)子进程（父进程:(%s)）：%d" %
                (os.getpid(), os.getppid(), i))
if __name__ == '__main__':
    # 下面是主程序（也就是主进程）
    for i in range(100):
        print("(%s)主进程: %d" % (os.getpid(), i))
        if i == 20:
            # 创建并启动第一个进程
            mp1 = MyProcess(100)
            mp1.start()
            # 创建并启动第一个进程
            mp2 = MyProcess(100)
            mp2.start()
            mp2.join()
    print('主进程执行完成!')
```

## 进程启动的三种方式
根据不同的平台， multiprocessing 支持三种启动进程的方法。这些 启动方法 有

1）spawn
父进程会启动一个全新的 python 解释器进程。 子进程将只继承那些运行进程对象的 run() 方法所必需的资源。 特别地，来自父进程的非必需文件描述符和句柄将不会被继承。 使用此方法启动进程相比使用 fork 或 forkserver 要慢上许多。

可在Unix和Windows上使用。 Windows上的默认设置。

2）fork
父进程使用 os.fork() 来产生 Python 解释器分叉。子进程在开始时实际上与父进程相同。父进程的所有资源都由子进程继承。请注意，安全分叉多线程进程是棘手的。

只存在于Unix。Unix中的默认值。

3）forkserver
程序启动并选择* forkserver * 启动方法时，将启动服务器进程。从那时起，每当需要一个新进程时，父进程就会连接到服务器并请求它分叉一个新进程。分叉服务器进程是单线程的，因此使用 os.fork() 是安全的。没有不必要的资源被继承。

可在Unix平台上使用，支持通过Unix管道传递文件描述符。

在 3.8 版更改: 对于 macOS，spawn 启动方式是默认方式。 因为 fork 可能导致subprocess崩溃，被认为是不安全的，查看 bpo-33725 。

在 3.4 版更改: 在所有unix平台上添加支持了 spawn ，并且为一些unix平台添加了 forkserver 。在Windows上子进程不再继承所有可继承的父进程句柄。

在 Unix 上通过 spawn 和 forkserver 方式启动多进程会同时启动一个 资源追踪 进程，负责追踪当前程序的进程产生的、并且不再被使用的命名系统资源(如命名信号量以及 SharedMemory 对象)。当所有进程退出后，资源追踪会负责释放这些仍被追踪的的对象。通常情况下是不会有这种对象的，但是假如一个子进程被某个信号杀死，就可能存在这一类资源的“泄露”情况。（泄露的信号量以及共享内存不会被释放，直到下一次系统重启，对于这两类资源来说，这是一个比较大的问题，因为操作系统允许的命名信号量的数量是有限的，而共享内存也会占据主内存的一片空间）

要选择一个启动方法，你应该在主模块的 if __name__ == '__main__' 子句中调用 set_start_method() 。例如：

```
import multiprocessing as mp

def foo(q):
    q.put('hello')

if __name__ == '__main__':
    mp.set_start_method('spawn')
    q = mp.Queue()
    p = mp.Process(target=foo, args=(q,))
    p.start()
    print(q.get())
    p.join()
```
在程序中 set_start_method() 不应该被多次调用。

或者，你可以使用 get_context() 来获取上下文对象。上下文对象与 multiprocessing 模块具有相同的API，并允许在同一程序中使用多种启动方法。:

```
import multiprocessing as mp

def foo(q):
    q.put('hello')

if __name__ == '__main__':
    ctx = mp.get_context('spawn')
    q = ctx.Queue()
    p = ctx.Process(target=foo, args=(q,))
    p.start()
    print(q.get())
    p.join()
```
请注意，对象在不同上下文创建的进程间可能并不兼容。 特别是，使用 fork 上下文创建的锁不能传递给使用 spawn 或 forkserver 启动方法启动的进程。

想要使用特定启动方法的库应该使用 get_context() 以避免干扰库用户的选择
## 进程池 Pool
进程池内部维护一个进程序列，当使用时，则去进程池中获取一个进程，如果进程池序列中没有可供使用的进进程，那么程序就会等待，直到进程池中有可用进程为止。就是固定有几个进程可以使用。

如果在Python应用程序中讨论简单的并行处理任务，那么多处理模块提供了Pool类。 下面的Pool类方法可以用来在主程序中创建多个子进程。
apply()方法该方法与ThreadPoolExecutor的submit()方法类似，直到结果准备就绪。
apply_async()方法当需要并行执行任务时，需要使用apply_async()方法将任务提交给池。 这是一个异步操作，直到执行完所有的子进程之后才会锁定主线程。
map()方法就像apply()方法一样，它也会阻塞直到结果准备就绪。 它相当于内置的map()函数，它将多个块中的可迭代数据分开并作为单独的任务提交给进程池。
map_async()方法它是map()方法的一个变体，apply_async()是apply()方法的变体。 它返回一个结果对象。 当结果准备就绪时，就会应用一个可调用对象。 可调用函数必须立即完成; 否则，处理结果的线程将被阻止。
例子
以下示例实现执行并行执行的进程池。 通过multiprocessing.Pool方法应用square()函数，可以简单计算数字的平方。 然后使用pool.map()提交5，因为输入是从0到4的整数列表。结果将被存储在p_outputs中并被打印输出结果 - 
```
def square(n):
   result = n*n
   return result
if __name__ == '__main__':
   inputs = list(range(5))
   p = multiprocessing.Pool(processes = 4)
   p_outputs = pool.map(function_square, inputs)
   p.close()  # 关闭进程池，不允许继续添加进程
   p.join()  # 等待进程池中的所有进程结束
   print ('Pool :', p_outputs)
```

### Concurrent.futures
Python标准库有一个叫做concurrent.futures的模块。 这个模块是在Python 3.2中添加的，为开发人员提供了启动异步任务的高级接口。 它是Python的线程和多处理模块的顶层的一个抽象层，用于提供使用线程或进程池运行任务的接口。//原文出自【易百教程】，商业转载请联系作者获得授权，非商业请保留原文链接：https://www.yiibai.com/concurrency_in_python/concurrency_in_python_pool_of_processes.html

#### ProcessPoolExecutor - 一个具体的子类
它是Executor类的具体子类之一。 它使用多重处理，并且我们获得提交任务的过程池。 此池将任务分配给可用的进程并安排它们运行。//原文出自【易百教程】，商业转载请联系作者获得授权，非商业请保留原文链接：https://www.yiibai.com/concurrency_in_python/concurrency_in_python_pool_of_processes.html

```
from concurrent.futures import ProcessPoolExecutor
from time import sleep
def task(message):
   sleep(2)
   return message

def main():
   executor = ProcessPoolExecutor(5)
   future = executor.submit(task, ("Completed"))
   print(future.done())
   sleep(2)
   print(future.done())
   print(future.result())
if __name__ == '__main__':
main()
# 原文出自【易百教程】，商业转载请联系作者获得授权，非商业请保留原文链接：https://www.yiibai.com/concurrency_in_python/concurrency_in_python_pool_of_processes.html
```

#### 实例化ProcessPoolExecutor - 上下文管理器
实例化ProcessPoolExecutor的另一种方法是借助上下文管理器。 它的工作方式与上例中使用的方法类似。 使用上下文管理器的主要优点是它在语法上看起来不错。 实例化可以在下面的代码的帮助下完成 -
`with ProcessPoolExecutor(max_workers = 5) as executor`
```
import concurrent.futures
from concurrent.futures import ProcessPoolExecutor
import urllib.request

URLS = ['http://www.foxnews.com/',
   'http://www.cnn.com/',
   'http://europe.wsj.com/',
   'http://www.bbc.co.uk/',
   'http://some-made-up-domain.com/']

def load_url(url, timeout):
   with urllib.request.urlopen(url, timeout = timeout) as conn:
      return conn.read()

def main():
   with concurrent.futures.ProcessPoolExecutor(max_workers=5) as executor:
      future_to_url = {executor.submit(load_url, url, 60): url for url in URLS}
      for future in concurrent.futures.as_completed(future_to_url):
      url = future_to_url[future]
      try:
         data = future.result()
      except Exception as exc:
         print('%r generated an exception: %s' % (url, exc))
      else:
         print('%r page is %d bytes' % (url, len(data)))

if __name__ == '__main__':
   main()
# 原文出自【易百教程】，商业转载请联系作者获得授权，非商业请保留原文链接：https://www.yiibai.com/concurrency_in_python/concurrency_in_python_pool_of_processes.html
```

#### 使用Executor.map()函数
Python map()函数广泛用于执行许多任务。 一个这样的任务是对可迭代内的每个元素应用某个函数。 同样，可以将迭代器的所有元素映射到函数，并将这些作为独立作业提交给ProcessPoolExecutor。//原文出自【易百教程】，商业转载请联系作者获得授权，非商业请保留原文链接：https://www.yiibai.com/concurrency_in_python/concurrency_in_python_pool_of_processes.html
```
from concurrent.futures import ProcessPoolExecutor
from concurrent.futures import as_completed
values = [2,3,4,5]
def square(n):
   return n * n
def main():
   with ProcessPoolExecutor(max_workers = 3) as executor:
      results = executor.map(square, values)
   for result in results:
      print(result)
if __name__ == '__main__':
   main()
# 原文出自【易百教程】，商业转载请联系作者获得授权，非商业请保留原文链接：https://www.yiibai.com/concurrency_in_python/concurrency_in_python_pool_of_processes.html

```

# 进程间通信
## 管道 Pipe
顾名思义，管道Pipe 有两端，因而 main_conn, child_conn = Pipe() ，管道的两端可以放在主进程或子进程内，我在实验中没发现主管道口main_conn 和子管道口child_conn 的区别。两端可以同时放进去东西，放进去的对象都经过了深拷贝：用 conn.send()在一端放入，用 conn.recv() 另一端取出，管道的两端可以同时给多个进程。conn是 connect的缩写。

## 队列 Queue
可以 import queue 调用Python内置的队列，在多线程里也有队列 from multiprocessing import Queue。下面提及的都是多线程的队列。

队列Queue 的功能与前面的管道Pipe非常相似：无论主进程或子进程，都能访问到队列，放进去的对象都经过了深拷贝。不同的是：管道Pipe只有两个断开，而队列Queue 有基本的队列属性，更加灵活，详细请移步Stack Overflow Multiprocessing - Pipe vs Queue。
## 共享内存 Manager
为了在Python里面实现多进程通信，上面提及的 Pipe Queue 把需要通信的信息从内存里深拷贝了一份给其他线程使用（需要分发的线程越多，其占用的内存越多）。而共享内存会由解释器负责维护一块共享内存（而不用深拷贝），这块内存每个进程都能读取到，读写的时候遵守管理（因此不要以为用了共享内存就一定变快）。

Manager可以创建一块共享的内存区域，但是存入其中的数据需要按照特定的格式，Value可以保存数值，Array可以保存数组，如下。这里不推荐认为自己写代码能力弱的人尝试。下面这里例子来自Python官网的Document。
## 设计高性能的多进程时，会遵守以下规则：
https://docs.python.org/zh-cn/3/library/multiprocessing.html#the-process-class
尽可能少传一点数据
尽可能减少主线程的负担
尽可能不让某个进程傻等着
尽可能减少进程间通信的频率



[在Python中优雅地用多进程](https://zhuanlan.zhihu.com/p/340657122)
[Python Process创建进程（2种方法）详解](https://www.ixyread.com/read/ID1605494154VwJr/OEBPS-Text-Section0202.html)