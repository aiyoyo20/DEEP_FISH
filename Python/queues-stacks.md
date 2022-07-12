[Python中栈、队列和优先级队列的实现](https://zhuanlan.zhihu.com/p/78060313)

## 栈(Stack)
栈是一种LIFO(后进先出)的数据结构，有入栈(push)、出栈(pop)两种操作，且只能操作栈顶元素。

### 1、list
list是Python内置的列表数据结构，它支持栈的特性，有入栈和出栈操作。只不过用list实现栈性能不是特别好。
因为list内部是通过一个动态扩容的数组来实现的。当增减元素时就有可能会触发扩容操作。如果在list的头部增减元素，也会移动整个列表。

如要使用list来实现一个栈的话，可以使用list的append()(入栈)、pop()(出栈)方法。

```
stack_list = []
stack_list.append('one')
stack_list.append('two')
stack_list.append('three')
stack_list.pop()
stack_list.pop()
stack_list.pop()
stack_list.pop()
```

### 2、collections.deque
deque类是一种双端队列。在Python中它就是一个双向列表，可以以常用时间在两端执行添加和删除元素的操作，非常高效，所以它既可以实现栈也可以实现队列。

如果要在Python实现一个栈，那么应该优先选择deque，而不是list。

deque的入栈和出栈方法也分别是append()和pop()。

```
from collections import deque
stack_deque = deque()
stack_deque.append('eat')
stack_deque.append('sleep')
stack_deque.append('code')
stack_deque.pop()
stack_deque.pop()
stack_deque.pop()
stack_deque.pop()
```

### 3、queue.LifoQueue
顾名思义，这个就是一个栈。不过它是线程安全的，如果要在并发的环境下使用，那么就可以选择使用LifoQueue。
它入栈和出栈操作是使用put()和get()，其中get()在LifoQueue为空时会阻塞。

```
from queue import LifoQueue
stack_queue = LifoQueue()
stack_queue.put('eat')
stack_queue.put('sleep')
stack_queue.put('code')
stack_queue.get()
stack_queue.get()
stack_queue.get()
stack_queue.get()	# 阻塞并一直等待直到栈不为空
```

## 队列(Queue)
队列是一种FIFO(先进先出)的数据结构。它有入队(enqueue)、出队(dequeue)两种操作，而且也是常数时间的操作。

在Python中可以使用哪些数据结构来实现一个队列呢？

### 1、list
list可以实现一个队列，但它的入队、出队操作就不是非常高效了。因为list是一个动态列表，在队列的头部执行出队操作时，会发生整个元素的移动。

使用list来实现一个队列时，用append()执行入队操作，使用pop(0)方法在队列头部执行出队操作。由于在list的第一个元素进行操作，所以后续的元素都会向前移动一位。因此用list来实现队列是不推荐的。

```
queue_list = []
queue_list.append('1')
queue_list.append('2')
queue_list.append('3')
queue_list.pop(0)
queue_list.pop(0)
queue_list.pop(0)
queue_list.pop(0)
```


### 2、collections.deque
从上文我们已经知道deque是一个双向列表，它可以在列表两端以常数时间进行添加删除操作。所以用deque来实现一个队列是非常高效的。
deque入队操作使用append()方法，出队操作使用popleft()方法。

```
from collections import deque
queue_deque = deque()
queue_deque.append('eat')
queue_deque.append('sleep')
queue_deque.append('code')
# 使用popleft出队
queue_deque.popleft()
queue_deque.popleft()
queue_deque.popleft()
queue_deque.popleft()
```

### 3、queue.Queue
同样地，如果要在并发环境下使用队列，那么选择线程安全的queue.Queue。
与LifoQueue类似，入队和出队操作分别是put()和get()方法，get()在队列为空时会一直阻塞直到有元素入队。

```
from queue import Queue
queue_queue = Queue()
queue_queue.put('eat')
queue_queue.put('sleep')
queue_queue.put('code')
queue_queue.get()
queue_queue.get()
queue_queue.get()
queue_queue.get_nowait()  # 队列为空不要执行等待
```

### 4、multiprocessing.Queue
多进程版本的队列。如果要在多进程环境下使用队列，那么应该选择multiprocessing.Queue。

同样地，它的入队出队操作分别是put()和get()。get()方法在队列为空，会一直阻塞直到队列不为空。

```
from multiprocessing import Queue
queue_mq = Queue()
queue_mq.put('eat')
queue_mq.put('sleep')
queue_mq.put('code')
queue_mq.get()
queue_mq.get()
queue_mq.get()
queue_mq.get_nowait()
# 也会一直阻塞直到队列不为空
```

## 优先级队列(PriorityQueue)
一个近乎排序的序列里可以使用优先级队列这种数据结构，它能高效获取最大或最小的元素。

在调度问题的场景中经常会用到优先级队列。它主要有获取最大值或最小值的操作和入队操作。

### 1、list
使用list可以实现一个优先级队列，但它并不高效。因为当要获取最值时需要排序，然后再获取最值。一旦有新的元素加入，再次获取最值时，又要重新排序。所以并推荐使用。

### 2、heapq
一般来说，优先级队列都是使用堆这种数据结构来实现。而heapq就是Python标准库中堆的实现。heapq默认情况下实现的是最小堆。

入队操作使用heappush()，出队操作使用heappop()。

```
import heapq
pq_heapq = []
heapq.heappush(pq_heapq, (2, 'code'))
heapq.heappush(pq_heapq, (1, 'eat'))
heapq.heappush(pq_heapq, (3, 'sleep'))
while q:
    next_item = heapq.heappop(pq_heapq)
    print(next_item)
```

### 3、queue.PriorityQueue
queue.PriorityQueue内部封装了heapq，不同的是它是线程安全的。在并发环境下应该选择使用PriorityQueue。

```
from queue import PriorityQueue
pq_qp = PriorityQueue()
pq_qp.put((2, 'code'))
pq_qp.put((1, 'eat'))
pq_qp.put((3, 'sleep'))
while not pq_qp.empty():
    next_item = pq_qp.get()
    print(next_item)

```



collections.deque 是一种双向链表，在单线程的情况下，它可以用来实现 Stack 和 Queue。而 heapq 模块可以帮我们实现高效的优先级队列。
如果要在多并发的情况下使用 Stack、Queue 和 PriorityQueue 的话，那么应该选用queue模块下类：
	实现 Stack的queue.LifoQueue
	实现 Queue的queue.Queue 或 multiprocessing.Queue
	实现 PriorityQueue的queue.PriorityQueue
	以上这些类都有 put() 和 get() 方法，且 get() 会在栈/队列为空时阻塞。
