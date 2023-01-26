## 装饰器实现
### 函数装饰器实现单例模式
```
def singleton(cls):
    __instance = {}
    # 创建一个字典用来保存被装饰类的实例对象 _instance = {}
    def _singleton(*args, **kwargs):
        # 判断这个类有没有创建过对象，没有新创建一个，有则返回之前创建的
        if not cls in _instance:
            _instance[cls] = cls(*args, **kwargs)
        return _instance[cls]
    return _singleton

@singleton
class A(object):
    def __init__(self, a=0):
        self.a = a


a1 = A(1)
a2 = A(2)
# id()函数可以获取对象的内存地址，同一内存地址即为同一对象
print(id(a1), id(a2)
```

### 类装饰器实现单例模式
```
class Singleton(object):
    def __init__(self, cls):
        self._cls = cls
        self._instance = {}

    def __call__(self):
        if self._cls not in self._instance:
            self._instance[self._cls] = self._cls()
        return self._instance[self._cls]


@Singleton
class B(object):
    def __init__(self):
        pass

b1 = B()
b2 = B()
print(id(b1), id(b2))
```

## 类实现
```
class Singleton(object):

    def __init__(self):
        pass

    @classmethod
    def instance(cls, *args, **kwargs):
        if not hasattr(Singleton, "_instance"):
            Singleton._instance = Singleton(*args, **kwargs)
        return Singleton._instance
```
一般情况，大家以为这样就完成了单例模式，但是这样当使用多线程时会存在问题
 
```
import time
import threading
class Singleton(object):
    _instance_lock = threading.Lock()

    def __init__(self):
        time.sleep(1)

    @classmethod
    def instance(cls, *args, **kwargs):
        if not hasattr(Singleton, "_instance"):
            with Singleton._instance_lock:
                if not hasattr(Singleton, "_instance"):
                    Singleton._instance = Singleton(*args, **kwargs)
        return Singleton._instance

def task(arg):
    obj = Singleton.instance()
    print(obj)
for i in range(10):
    t = threading.Thread(target=task,args=[i,])
    t.start()
time.sleep(20)
obj = Singleton.instance()
print(obj)
```
这种方式实现的单例模式，使用时会有限制，以后实例化必须通过 obj = Singleton.instance(),如果用 obj=Singleton() ,这种方式得到的不是单例


### 看到个比较新奇的
```
def singleton(cls):
    instance = cls()
    instance.__call__ = lambda: instance
    return instance

# Sample use


@singleton
class Highlander:
    x = 100
    # Of course you can have any attributes or methods you like.

    def __call__(self):
        pass


highlander = Highlander()
another_highlander = Highlander()
print(id(highlander) == id(another_highlander))
```

### 官方wiki的
```
import functools

def singleton(cls):
    ''' Use class as singleton. '''

    cls.__new_original__ = cls.__new__

    @functools.wraps(cls.__new__)
    def singleton_new(cls, *args, **kw):
        it =  cls.__dict__.get('__it__')
        if it is not None:
            return it

        cls.__it__ = it = cls.__new_original__(cls, *args, **kw)
        it.__init_original__(*args, **kw)
        return it

    cls.__new__ = singleton_new
    cls.__init_original__ = cls.__init__
    cls.__init__ = object.__init__

    return cls

#
# Sample use:
#

@singleton
class Foo:
    def __new__(cls):
        cls.x = 10
        return object.__new__(cls)

    def __init__(self):
        assert self.x == 10
        self.x = 15

assert Foo().x == 15
Foo().x = 20
assert Foo().x == 20
```

## ____new____() 实现
实现__new__方法，然后将类的一个实例绑定到类变量_instance上；如果cls._instance为None，则说明该类还没有被实例化过，new一个该类的实例，并返回；
如果cls._instance不为None，直接返回_instance
```
class Singleton(object):
    def __new__(cls, *args, **kwargs):
        if not hasattr(cls, '_instance'):
            orig = super(Singleton, cls)
            cls._instance = orig.__new__(cls)
        return cls._instance

one = Singleton()
two = Singleton()

# one和two完全相同，可以用id()，==，is检查
print(id(one))  # 2565285375728
print(id(two))  # 2565285375728
print(one == two)   # True
print(one is two)
```
```
class Singleton(object):
    __instance=None

    def __init__(self):
        pass
    def __new__(cls, *args, **kwargs):
        if Singleton.__instance is None:
            Singleton.__instance=object.__new__(cls,*args, **kwargs)
        return Singleton.__instance

one=Singleton()
two=Singleton()
print(id(one))  # 2488569943376
print(id(two))  # 2488569943376
print(one == two)   # True
print(one is two)   # True
```

我们知道，当我们实例化一个对象时，是先执行了类的__new__方法（我们没写时，默认调用object.__new__），实例化对象；然后再执行类的__init__方法，对这个对象进行初始化，所有我们可以基于这个，实现单例模式
```
import threading
class Singleton(object):
    _instance_lock = threading.Lock()

    def __init__(self):
        pass


    def __new__(cls, *args, **kwargs):
        if not hasattr(Singleton, "_instance"):
            with Singleton._instance_lock:
                if not hasattr(Singleton, "_instance"):
                    Singleton._instance = object.__new__(cls)
        return Singleton._instance

obj1 = Singleton()
obj2 = Singleton()
print(obj1,obj2)

def task(arg):
    obj = Singleton()
    print(obj)

for i in range(10):
    t = threading.Thread(target=task,args=[i,])
    t.start()
```
采用这种方式的单例模式，以后实例化对象时，和平时实例化对象的方法一样 obj = Singleton()

## 元类实现
"""
1.类由type创建，创建类时，type的__init__方法自动执行，类() 执行type的 __call__方法(类的__new__方法,类的__init__方法)
2.对象由类创建，创建对象时，类的__init__方法自动执行，对象()执行类的 __call__ 方法
"""
```
"""
class Singleton中的__init__在Myclass声明的时候被执行Myclass=Singleton()
Myclass()执行时，最先执行父类的__call__方法（object,Singleton都作为Myclass的父类，
根据深度优先算法，会执行Singleton中的__call__()，Singleton中的__call__()写了单例模式）
"""
class Singleton(type):

    def __init__(self, name, bases, dict):
        super(Singleton,self).__init__(name,bases, dict)
        self._instance = None

    def __call__(self, *args, **kwargs):
        if self._instance is None:
            self._instance = super(Singleton,self).__call__(*args, **kwargs)
        return self._instance

class MyClass(object,metaclass=Singleton):
    a = 1

one=MyClass()
two=MyClass()
print(id(one))  # 1553247294800
print(id(two))  # 1553247294800
print(one == two)   # True
print(one is two)   # True
```


```
import threading

class SingletonType(type):
    _instance_lock = threading.Lock()
    def __call__(cls, *args, **kwargs):
        if not hasattr(cls, "_instance"):
            with SingletonType._instance_lock:
                if not hasattr(cls, "_instance"):
                    cls._instance = super(SingletonType,cls).__call__(*args, **kwargs)
        return cls._instance

class Foo(metaclass=SingletonType):
    def __init__(self,name):
        self.name = name


obj1 = Foo('name')
obj2 = Foo('name')
print(obj1,obj2)
```

## 继承
通过__new__ 或者元类实现的子类继承即为单例模式

## 使用模块
