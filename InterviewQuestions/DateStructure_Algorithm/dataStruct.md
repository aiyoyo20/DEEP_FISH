## 第十章 数据结构与算法
### 1. 算法的特征？
1） 有穷性： 一个算法必须保证执行有限步骤之后结束；  
2） 确切性： 算法的每一步骤必须有确切的定义；  
3） 输入：一个算法有 0 个或多个输入,以刻画运算对象的初始情况,所谓 0 个输入是指算法本身给出了初始条件；  
4） 输出：一个算法有一个或多个输出,以反映对输入数据加工后的结果。没有输出的算法是毫无意义的；  
5） 可行性： 算法原则上能够精确地运行,而且人们用笔和纸做有限次数运算后即可完成。

### 2、排序

### 3. 如何判断单向链表中是否有环？
首先遍历链表,寻找是否有相同地址,借此判断链表中是否有环。如果程序进入死循环,则需要一块空间来存储指针,遍历新指针时将其和储存的旧指针比对,若有相同指针,则该链表有环,否则将这个新指针存下来后继续往下读取,直到遇见 NULL,这说明这个链表无环。

### 4. 基础的数据结构有哪些？
基本的算法有：
排序算(冒泡排序,插入排序,快速排序,归并排序), 
查(二分查找),
搜索（（DFS）深度优先搜索,（BFS）广度优先搜索),（Dijkstra 算法）,]
动态规划算法,
分类（朴素贝叶斯分类算法等）。

评价算法的好坏一般有两种：
时间复杂度和空间复杂度。
时间复杂度：同样的输入规(问题规模) 花费多少时间。空间复杂度：同样的输入规模花费多少空(主要是内存)。以上两点越小越好。  
稳定性：不会因为输入的不同而导致不稳定的情况发生。  
算法的思路是否简单：越简单越容易实现的越好。


### 5. 哪种数据结构可以实现递归？
栈可以实现,递归需要保存正在计算的上下文, 等待当前计算完成后弹出,再继续计算, 只有栈先进后出的特性才能实现。

### 6. 斐波那契数列
斐波那契数列：简单地说,起始两项为 0 和 1,此后的项分别为它的前两项之和。
```
def fib(num):
    numList = [0,1]
    for i in range(num - 2):
        numList.append(numList[-2] + numList[-1])
    return numList
```

### 7. 二叉树如何求两个叶节点的最近公共祖先？
二叉树是搜索二叉树：  
1、原理：二叉搜索树是排序过的,位于左子树的结点都比父结点小,位于右子树的结点都比父结点大,我们只需从根节点开始和两个输入的结点进行比较,如果当前节点的值比两个结点的值都大,那么最低的公共祖先结点在该结点的左子树中,下一步开遍历当前结点的左子树。如果当前节点的两个结点的值都小,那么最低的公共祖先结点一定在该结点的右子树中,步开遍历当前结点的右子树。这样从上到下找到第一个在两个输入结点的间的结点。  
2、实现代码：
```
class TreeNod(object）：
    def __init__(self, left=None, right=None, data=None):
        self.data = data
        self.left = left
        self.right = right

    def getCommonAncesto(root, node1, node2):
        while root:
            if root.data > nodedata and root.data > nodedata:
                root = root.left
            elif root.data < nodedata and root.data < nodedata:
                root = root.right
            else:
                return root
            return None
```

### 8. 两个字符串,如何求公共字符串？
```
def getLCStrin(str1,str2):
    maxlenn = len(str1) if len(str1) < len(str2) else len(str2)
    examplen = str1 if len(str1) < len(str2) else str2
    other = str2 if str1 == examplen else str1
    for i in range(maxlenn):
        for j in range(maxlenn, 0,-1):
            if other.find(examplen[i:j]) != -1:
                print(examplen[i:j])
```

### 9. 找出二叉树中最远结点的距离？
> 计算一个二叉树的最大距离有两个情况。  
情况 A: 路径经过左子树的最深节点,通过根节点,再到右子树的最深节点。
情况 B: 路径不穿过根节点,而是左子树或右子树的最大距离路径,取其大者。只需要计算这两个情况的路径距离,并取其大者,就是该二叉树的最大距离。

### 10. 写一个二叉树
```
class TreeNode(object): 
    def __init__(self, left=None, right=None, data=None): 
        self.data = data 
        self.left = left 
        self.right = right 
    def preorder(root):  # 前序遍历  
        if root is None:  
            return 
        else:  
            print root.data 
            preorder(root.left) 
            preorder(root.right) 
  
    def inorder(root):  # 中序遍历  
        if root is None:  
         return 
        else:  
         inorder(root.left) 
            print root.data 
            inorder(root.right) 
  
     def postorder(root):  # 后序遍历  
         if root is None:  
             return   
         postorder(root.left) 
         postorder(root.right) 
         print root.data 
```

### 11. 写一个霍夫曼数
### 12. 写一个二分查找

### 13. set 用 in 时间复杂度是多少,为什么？
O(1),因为 set 是键值相同的一个数据结构,键做了 hash 处理

### 14. 深度优先遍历和广度优先遍历的区别？
1） 二叉树的深度优先遍历的非递归的通用做法是采用栈,广度优先遍历的非递归的通用做法是采用队列。  
2） 深度优先遍历：对每一个可能的分支路径深入到不能再深入为止,而且每个结点只能访问一次。要特别注意的是,二叉树的深度优先遍历比较特殊,可以细分为先序遍历、中序遍历、后序遍历。具体说明  
如下：  
    先序遍历：对任一子树,先访问根,然后遍历其左子树,最后遍历其右子树。  
    中序遍历：对任一子树,先遍历其左子树,然后访问根,最后遍历其右子树。  
    后序遍历：对任一子树,先遍历其左子树,然后遍历其右子树,最后访问根。  
广度优先遍历：又叫层次遍历,从上往下对每一层依次访问,在每一层中,从左往右（也可以从右往左）访问结点,访问完一层就进入下一层,直到没有结点可以访问为止。  
3）深度优先搜素算法：不全部保留结点,占用空间少；有回溯操(即有入栈、出栈操作),运行速度慢。广度优先搜索算法：保留全部结点,占用空间大； 无回溯操(即无入栈、出栈操作),运行速度快。通常,深度优先搜索法不全部保留结点,扩展完的结点从数据库中弹出删去,这样,一般在数据库中存储的结点数就是深度值,因此它占用空间较少。所以,当搜索树的结点较多,用其它方法易产生内存溢出时,深度优先搜索不失为一种有效的求解方法。

广度优先搜索算法,一般需存储产生的所有结点,占用的存储空间要比深度优先搜索大得多,因此,程序设计中,必须考虑溢出和节省内存空间的问题。但广度优先搜索法一般无回溯操作,即入栈和出栈的操作,所以运行速度比深度优先搜索要快些。



### 15. 写程序把一个单向链表顺序倒过来）
第一种方法：迭代
```
class ListNode(object):
    def __init__(self, x):
        self.val = x
        self.next = None

class Solution(object):
    def reverseList(self, head):
        """
        :type head: ListNode
        :rtype: ListNode
        """
        pre = cur = None
        if head:
            pre = head
            cur = head.next
            pre.next = None
        else:
            return None
        while cur:
            p = cur
            cur = cur.next
            p.next = pre
            pre = p
        return pre
```

第二种方法：递归
```
class ListNode(object):
    def __init__(self, x):
        self.val = x
        self.next = None
        
class Solution:
    def reverseList(self, head):
        return reverse(head)

    def reverse(self, node, prev=None):
        if not node:
            return prev
        n = node.next
        node.next = prev
        return reverse(n, node)
```

### 16. 青蛙跳台阶问题

> 一只青蛙要跳上 n 层高的台阶,一次能跳一级,也可以跳两级,请问这只青蛙有多少种跳上这个 n  
层高台阶的方法？  
思路分析：  
这个问题有三种方法来解决,并在下面给出三处方法的 python 实现。

> 方法 1: 递归  
设青蛙跳上 n 级台阶有 (n) 种方法,把这 n 种方法分为两大类,第一种最后一次跳了一级台阶,这  
类方法共有 (n-1) 种, 第二种最后一次跳了两级台阶,这种方法共有 (n-2) 种, 则得出递推公式  
(n)=(n-1)+(n-2),显然,(1)=1,(2)=2,递推公式如下：

*   这种方法虽然代码简单,但效率低,会超出时间上限 *  
    代码实现如下：

```
class Solution:
    # @param {integer} n
    # @return {integer}
    def climbStair(self, n):
        if n==1:
            return 1
        elif n==2:
            return 2
        else:
            return self.climbStair(n-1)+self.climbStair(n-2)
```

> 方法 2: 用循环来代替递归  
这种方法的原理仍然基于上面的公式,但是用循环代替了递归,比上面的代码效率上有较大的提升,可以 AC。  
代码实现如下：

```
class Solution:
    # @param {integer} n
    # @return {integer}
    def climbStair(self, n):
        if n==1 or n==2:
            return n
        a=1;b=2;c=3
        for i in range(3,n+1):
            c=a+b;a=b;b=c
        return c
```

> 方法三：建立简单数学模型,利用组合数公式

> 设青蛙跳上这 n 级台阶一共跳了 z 次,其中有 x 次是一次跳了两级,y 次是一次跳了一级,则有 z=x+y ,2x+y=n,对一个固定的 x,利用组合可求出跳上这 n 级台阶的方法共有种方法又因为 x 在区间 [0,n/2] 内,所以我们只需要遍历这个区间内所有的整数,求出每个 x 对应的组合数累加到最后的结果即可。

python 代码实现如下：
```
class Solution:
    # @param {integer} n
    # @return {integer}
    def climbStair(self, n):
        def fac(n):
            result=1
            for i in range(1,n+1):
                result*=i
            return result
        total=0
        for i in range(n/2+1):
            total+=fac(i+n-2*i)/fac(i)/fac(n-2*i)
        return total
```

### 17. 用两个队列如何实现一个栈,用两个栈如何实现一个队列？
两个栈实现一个队列：  
栈的特性是先进后出（FILO）,队列的特性是先进先出（FIFO）,在实现 delete 时,将一个栈中的数据依次拿出来压入到另一个为空的栈,另一个栈中数据的顺序恰好是先压入栈 1 的元素此时在栈2的上面,为了实现效率的提升,在 delete 时,判断栈 2 是否有数据,如果有的话,直接删除栈顶元素,在栈 2 为空时才将栈 1 的数据压入到栈 2 中,从而提高程序的运行效率,实现过程可以分为下面
几个步骤：  
1、push 操作时,一直将数据压入到栈 2 中  
2、delete 操作时,首先判断栈 2 是否为空,不为空的情况直接删除栈 2 栈顶元素,为空的话将栈 1 的数据压入到栈 2 中,再将栈 2 栈顶元素删除。

两个队列实现一个栈：  
因为队列是先进先出,所以要拿到队列中最后压入的数据,只能每次将队列中数据 pop 到只剩一个,此时这个数据为最后压入队列的数据,在每次 pop 时,将数据压入到另一个队列中。每次执行 delete 操作时,循环往复。

### 18. 爬楼梯 Climbing Stairs
假设你正在爬楼梯,需要 n 步你才能到达顶部。但每次你只能爬一步或者两步,你能有多少种不同的方法爬到楼顶部？  
样例：比如 n=3,1+1+1=1+2=2+1=3,共有 3 中不同的方法返回 3  
解题思路：  
如果按照从右至左的逆序递归求解,其实就相当于搜索算法了,会造成子搜索过程的重复计算。搜索算法一般都可以用动态规划来替代,因此这里就用 1D 动态规划。然后可以发现,(x) 的求解只依赖于 (x-1) 和 (x-2),因此可以将空间复杂度缩小到 int [3]。于是你就会发现,这其实就是一个裴波拉契数列问题。
```
class Solution:   
    # @param n, an integer   
    # @return an integer   
    def climbStairs(self, n):   
        if n <= 1:   
            return 1   
        arr = [1, 1, 0]      # look here, arr[0] = 1, arr[1] = 2   
        for i in range(2, n + 1):   
            arr[2] = arr[0] + arr[1]   
            arr[0], arr[1] = arr[1], arr[2]   
         return arr[2]  
```
