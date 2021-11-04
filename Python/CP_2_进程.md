# 概念
进程就是操作系统中执行的一个程序，操作系统以进程为单位分配存储空间，每个进程都有自己的地址空间、数据栈以及其他用于跟踪进程执行的辅助数据，操作系统管理所有进程的执行，为它们合理的分配资源。进程可以通过fork或spawn的方式来创建新的进程来执行其他的任务，不过新的进程也有自己独立的内存空间，因此必须通过进程间通信机制（IPC，Inter-Process Communication）来实现数据共享，具体的方式包括管道、信号、套接字、共享内存区等。
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

## 进程启动的多种方式
1) spawn
父进程会启动一个全新的 Python 解释器进程。在这种方式下，子进程只能继承那些处理 run() 方法所必需的资源。典型的，那些不必要的文件描述器和 handle 都不会被继承。使用这种方式来启动进程，其效率比使用 fork 或 forkserver 方式要低得多。 Windows 只支持 spawn 方式来启动进程，因此在 Windows 平台上默认使用这种方式来启动进程。

2) fork
父进程使用 os.fork() 来启动一个 Python 解释器进程。在这种方式下，子进程会继承父进程的所有资源，因此子进程基本等效于父进程。这种方式只在 UNIX 平台上有效，UNIX 平台默认使用这种方式来启动进程。

3) forkserver
如果使用这种方式来启动进程，程序将会启动一个服务器进程。在以后的时间内，当程序再次请求启动新进程时，父进程都会连接到该服务器进程，请求由服务器进程来 fork 新进程。通过这种方式启动的进程不需要从父进程继承资源。这种方式只在 UNIX 平台上有效。 

从上面介绍可以看出，如果程序使用 UNIX 平台（包括 Linux 和 Mac OS X），Python 支持三种启动进程的方式；但如果使用 Windows 平台，则只能使用效率最低的 spawn 方式。 
multiprocessing 模块提供了一个set_start_method() 函数，该函数可用于设置启动进程的方式（必须将这行设置代码放在所有与多进程有关的代码之前）。


```
import multiprocessing
import os
 
def foo(q):
    print('被启动的新进程: (%s)' % os.getpid())
    q.put('Python')
if __name__ == '__main__':
    # 设置使用fork方式启动进程
    multiprocessing.set_start_method('fork')
    q = multiprocessing.Queue()
    # 创建进程
    mp = multiprocessing.Process(target=foo, args=(q, ))
    # 启动进程
    mp.start()
    # 获取队列中的消息
    print(q.get())
    mp.join()
```
上面程序显式指定必须使用 fork 方式来启动进程，因此该程序只能在 UNIX 平台（包括 Linux、Mac OS X）上运行。
上面代码实际上就相当于前面介绍的使用 os.fork() 方法来启动新进程。 
上面程序的新进程向 multiprocessing.Queue 中放入一个数据（Python 字符串），主进程取出该 Queue 中的数据，并输出该数据。 
还有一种设置进程启动方式的方法，就是利用 get_context() 方法来获取 Context 对象，调用该方法时可传入 spawn、fork 或 forkserver 字符串。
Context 拥有和 multiprocessing 相同的 API，因此程序可通过 Context 来创建并启动进程。例如如下程序：

```
import multiprocessing
import os
 
def foo(q):
    print('被启动的新进程: (%s)' % os.getpid())
    q.put('Python')
if __name__ == '__main__':
    # 设置使用fork方式启动进程，并获取Context对象
    ctx = multiprocessing.get_context('fork')
    # 接下来就可用Context对象来代替mutliprocessing模块了
    q = ctx.Queue()
    # 创建进程
    mp = ctx.Process(target=foo, args=(q, ))
    # 启动进程
    mp.start()
    # 获取队列中的消息
    print(q.get())
    mp.join()
```
上面程序中，第 9 行代码设置以 fork 方式启动进程，并获取 Context 对象，这样程序后面就可以使用 Context 对象来代替 multiprocessing 模块了。

## 进程池 Pool
4. 进程池 Pool
几乎Python多进程代码都需要你明明白白地调用Process。而进程池Pool 会自动帮我们管理子进程。Python的Pool 不方便传入多个参数，我这里提供两个解决思路：

思路1：函数 func2 需要传入多个参数，现在把它改成一个参数，无论你直接让args作为一个元组tuple、词典dict、类class都可以

思路2：使用 function.partial Passing multiple parameters to pool.map() function in Python。这个不灵活的方法固定了其他参数，且需要导入Python的内置库，我不推荐
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

尽可能少传一点数据
尽可能减少主线程的负担
尽可能不让某个进程傻等着
尽可能减少进程间通信的频率



[在Python中优雅地用多进程](https://zhuanlan.zhihu.com/p/340657122)
[Python Process创建进程（2种方法）详解](https://www.ixyread.com/read/ID1605494154VwJr/OEBPS-Text-Section0202.html)