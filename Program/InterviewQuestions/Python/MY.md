## python lambda 递归
### 阶乘
f = lambda n: f(n-1) * n if n>=2 else 1

## 序列乘积
a=[2,3,4]
f = lambda n: f(n-1) * a[n] if n>=0 else 1
print(f(len(a)))

## 求和
f = lambda n: f(n-1) * n if n>=2 else 0

### 斐波那契数列
lambdafunc = lambda n : 1 if n == 1 or n == 2 else lambdafunc(n -1 ) + lambdafunc(n - 2)



