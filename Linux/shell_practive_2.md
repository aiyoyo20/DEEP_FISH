一、简单题
1. 统计文件的行数
题目链接： 【牛客网 | 统计文件的行数】
题目描述
写一个 bash脚本以输出一个文本文件 nowcoder.txt中的行数
示例:
假设 nowcoder.txt 内容如下：
#include <iostream>
using namespace std;
int main()
{
    int a = 10;
    int b = 100;
    cout << "a + b:" << a + b << endl;
    return 0;
}
1
2
3
4
5
6
7
8
9
你的脚本应当输出：9

方法一：使用wc命令，统计行数
参考资料《wc - 统计文件的字节数、字数、行数》
直接使用 wc -l ./nowcoder.txt 会输出“总行号 文件名”，我们可以使用以下方法来完成此题。
使用输入重定向与wc命令进行统计行号
wc -l < ./nowcoder.txt
1
统计cat命令输出的内容中的行号
cat ./nowcoder.txt | wc -l
1
使用awk工具，只输出第一列
wc -l ./nowcoder.txt | awk '{print $1}'
1
方法二：使用awk工具，处理文本
参考资料《awk - 文本和数据进行处理的编程语言》
打印每一行的行号，只取最后一行
awk '{print NR}' ./nowcoder.txt |tail -n 1
1
直接打印最后一行的行号
awk 'END{print NR}' nowcoder.txt
1
方法三：使用cat或nl命令，添加行号
参考资料《nl - 为每一个文件添加行号》
cat -n file_name 添加行号
给文件添加行号后，取最后一行第一列
cat -n ./nowcoder.txt | tail -n1 | awk '{print $1}'
#或
cat -n ./nowcoder.txt | awk 'END{print $1}'
1
2
3
方法四：使用grep文本搜索工具
参考资料《grep - 强大的文本搜索工具》
使用-c参数，只输出匹配行的数量
grep -c "" ./nowcoder.txt
1
使用-n参数，列出所有的匹配行及行号。格式为 “行号：内容”。这里使用awk工具处理文本格式
grep -n "" ./nowcoder.txt  | awk -F ":" '{print $1 }' | tail -n 1
1
方法五：使用sed文本编辑器
参考资料《sed - 功能强大的流式文本编辑器》
参数说明
-n 如果test被匹配，则移动到匹配行的下一行
= 打印当前行号
$ 匹配行结束
sed -n '$=' ./nowcoder.txt
1
2. 打印文件的最后5行
题目链接：【牛客网 | 打印文件的最后5行】
题目描述
经常查看日志的时候，会从文件的末尾往前查看，于是请你写一个 bash脚本以输出一个文本文件 nowcoder.txt中的最后5行
示例:
假设 nowcoder.txt 内容如下：
#include<iostream>
using namespace std;
int main()
{
int a = 10;
int b = 100;
cout << "a + b:" << a + b << endl;
return 0;
}
1
2
3
4
5
6
7
8
9
你的脚本应当输出：

int a = 10;
int b = 100;
cout << "a + b:" << a + b << endl;
return 0;
}
1
2
3
4
5
方法一：使用tail，显示文件末尾n行
参考资料《tail - 在屏幕上显示指定文件的末尾若干行》

tail -n5 ./nowcoder.txt
1
方法二：使用awk编程语言，处理文本和数据
参考资料《awk - 文本和数据进行处理的编程语言》
求出总行数，减去5即为倒数第5行。从该行打印至末行即可
total=`awk 'END{print NR}' ./nowcoder.txt`       # 总行数

# -v 定义awk变量
awk -v val=$(expr $total - 5) 'NR>val' ./nowcoder.txt
1
2
3
4
使用awk内的循环
awk支持while、do…while、for循环等操作，还可以定义变量。我们完全可以把awk的内部当做一个函数进行处理，只需编写出适合的代码即可完成此题。
awk '{arr[NR]=$0} END { i=NR-5+1; do{ print arr[i]; i++}while(i <= NR);  }' ./nowcoder.txt
1
方法三：使用tac命令，反序输出
参考资料 《tac - 连接多个文件并以行为单位反向打印到标准输出》
tac是cat命令的反序形式，功能也与cat功能相似，成反序输出
tac ./nowcoder.txt | head -n5 | tac
1
同理，使用相同的思路，我们也可以使用cat命令给文本带上行号，然后使用sort根据行号逆序排序，取排序后的前5行，然后在正序。过滤掉行号输出即可。
cat -n  ./nowcoder.txt | sort -n$1 -r | head -n5 | sort | awk '{$1=""; print $0}'
1
二、中等题
3. 输出7的倍数
题目链接：【牛客网 | 输出7的倍数】
题目描述
写一个 bash脚本以输出数字 0 到 500 中 7 的倍数(0 7 14 21…)的命令
方法一：使用seq以指定增量从首数开始打印数字到尾数
参考资料《seq - 以指定增量从首数开始打印数字到尾数》
生成步长为7的，范围为 0~500 的数列
seq 0 7 500
1
方法二：使用shell中的for循环
shell中主要支持三种循环，while、for、until。
类似C语言风格的for循环写法for((exp1; exp2; exp3)) do ... done 。
# for((i=0; i<500; i+=7)); do  echo $i; done
for((i=0; i<500; i+=7))
do
    echo $i
done
1
2
3
4
5
for in 循环，类似python风格 for var in list do ... done
# for i in {0..500..7}; do  echo $i ; done
for i in {0..500..7}
do  
    echo $i 
done
1
2
3
4
5
方法三：使用awk工具内提供的循环
awk内部支持for循环，通过待处理文本 “0 500 7” 便可轻松获得7的倍数
awk '{i=0; while(i<=500){print i;i+=7}}'
#echo "0 500 7" | awk '{i=$1; while(i<=$2){print i;i+=$3}}'
1
2
4. 输出第5行内容
题目链接：【牛客网 | 输出第5行内容】
题目描述
写一个 bash脚本以输出一个文本文件 nowcoder.txt 中第5行的内容。
示例:
假设 nowcoder.txt 内容如下：
welcome
to
nowcoder
this
is
shell
code
1
2
3
4
5
6
7
你的脚本应当输出：is

方法一：使用sed文本编辑
参考资料《sed - 功能强大的流式文本编辑器》
sed -n 5p nowcoder.txt
1
方法二：使用head+tail命令
head命令 – 显示文件开头内容
tail命令 – 查看文件尾部内容
使用head提取出文本前5行，再通过tail查看最后一行的内容
head -5 ./nowcoder.txt | tail -1
#head -n5 ./nowcoder.txt | tail -n1
1
2
使用tail -n +5 显示5行以后的内容，再通过head提取第一行内容
tail ./nowcoder.txt -n +5 | head -n 1
1
方法三：显示行号，提取对应行输出
cat -n参数可以显示行号，使用awk提取出对应文本
cat -n ./nowcoder.txt | awk '$1==5 {print $2}'
1
方法四：使用awk工具，处理文本
直接使用awk内置变量NR 匹配到第5行，进行输出。
awk 'NR==5' ./nowcoder.txt
#awk 'NR==5 {print $0}' ./nowcoder.txt
1
2
5. 打印空行的行号
题目链接：【牛客网 | 打印空行的行号】
题目描述
写一个 bash脚本以输出一个文本文件 nowcoder.txt中空行的行号,可能连续,从1开始
示例:
假设 nowcoder.txt 内容如下：
a
b
 
c
 
d
 
e
 
 
f
1
2
3
4
5
6
7
8
9
10
11
你的脚本应当输出：

3
5
7
9
10
注意：空行与含有空格的行不同，必要是可使用cat -A查看。

方法一：使用awk工具，正则匹配&关系表达式
当前行为空时，打印行号
awk '{if($0 == "") {print NR}}' ./nowcoder.txt
1
正则匹配到空行时，打印行号
awk '/^$/ {print NR}' ./nowcoder.txt 

1
2
方法二：使用cat命令，显示行号
在文本显示行号后，选中第2列没有数据的行，输出他们的首列即可
cat -n ./nowcoder.txt | awk '$2=="" {print $1}'
1
方法三：使用grep过滤，正则过滤空行
统计文本中空行个数 grep -c ^$ file_name，非空行grep -c ^[^$] file_name
带行号的输出空行 grep -n ^$，注意：输出格式为 “行号：数据”
使用awk工具或cut工具提取第一列，即只含有行号的列
grep -n ^$ ./nowcoder.txt | awk -F: '{print $1}'
#grep -n ^$ ./nowcoder.txt | cut -f1 -d":"
1
2
6. 去掉空行
题目链接：【牛客网 | 去掉空行】
题目描述
写一个 bash脚本以去掉一个文本文件 nowcoder.txt中的空行
示例:
假设 nowcoder.txt 内容如下：
abc

567


aaa
bbb



ccc
1
2
3
4
5
6
7
8
9
10
11
你的脚本应当输出：

abc
567
aaa
bbb
ccc
方法一：使用tr命令，字符压缩替换工具
参考资料 《tr - 将字符进行替换压缩和删除》
cat ./nowcoder.txt | tr -s '\n'
1
方法二：使用awk工具，正则&函数
正则
awk '/^[^$]/' ./nowcoder.txt 
1
该行不为空
awk '$0!=""' ./nowcoder.txt
1
行长度不为0
awk 'length!=0' ./nowcoder.txt
1
方法三：使用grep文本搜索工具
正则，匹配非空行
grep "^[^$]" ./nowcoder.txt 
1
\s匹配空白字符，等价于[ \f\n\r\t\v]等，而\S匹配非空白字符，等价于 [^ \f\n\r\t\v]
grep '\S' nowcoder.txt
1
方法四：使用sed流式文本编辑器
去除空行。-d 参数，删除选择的行
sed '/^$/d' ./nowcoder.txt 
1
方法五：使用printf格式化输出工具
参考资料 《printf - 格式化并输出结果》
printf '%s\n' $(cat ./nowcoder.txt)
1
方法六：使用xargs命令工具
参考资料 《xargs - 给其他命令传递参数的一个过滤器》
cat ./nowcoder.txt | xargs -n1 echo

1
2
13. 去掉所有包含this的语句
题目链接：【牛客网 | 去掉所有包含this的语句】
题目描述
写一个 bash脚本以实现一个需求，去掉输入中含有this的语句，把不含this的语句输出
示例:
假设输入如下：
this is your bag
is this your bag?
to the degree or extent indicated.
there was a court case resulting from this incident
welcome to nowcoder
1
2
3
4
5
你的脚本获取以上输入应当输出：

to the degree or extent indicated.
welcome to nowcoder
说明:
你可以不用在意输出的格式，包括空格和换行

方法一：使用sed文本编辑工具
sed ‘/tset/d’ 删除含有“test”的行
sed '/this/d'
1
相关扩展：

删除文件中所有开头是test的行：sed '/^test/'d file
删除空白行：sed '/^$/d' file
删除文件的第2行：sed '2d' file
删除文件的第2行到末尾所有行：sed '2,$d' file
删除文件最后一行：sed '$d' file
方法二：使用awk工具，正则匹配
/正则表达式/：使用通配符的扩展集。
模式匹配表达式：用运算符~（匹配）和!~（不匹配）。
awk '$0!~/this/ {print $0}'
# awk '$0!~/this/'
1
2
方法三：使用grep文本搜索工具
输出除之外的所有行 -v 选项
grep -v "this"
1
三、较难题
7. 打印字母数小于8的单词
题目链接：【牛客网 | 打印字母数小于8的单词】
题目描述
写一个 bash脚本以统计一个文本文件 nowcoder.txt中字母数小于8的单词。
示例:
假设 nowcoder.txt 内容如下：
how they are implemented and applied in computer
你的脚本应当输出：
how
they
are
and
applied
in
说明:
不要担心你输出的空格以及换行的问题

方法一：使用xargs命令工具
cat ./nowcoder.txt | xargs -n1 echo
1
方法二：使用awk工具，关系表达式
awk '{for(i=1;i<=NF;i++){if(length($i)<8){print $i}}}' nowcoder.txt
1
方法三：将行转为列，使用awk工具处理
tr+awk
cat ./nowcoder.txt | tr ' ' '\n' | awk 'length<8'
1
printf+awk
printf "%s\n" $(cat ./nowcoder.txt) | awk 'length<8'

1
2
xargs
cat ./nowcoder.txt | xargs -n1 | awk 'length<8'

1
2
方法四：使用shell中的for循环
#for s in $(cat ./nowcoder.txt); do  if [ ${#s} -lt 8 ]; then echo $s; fi; done
for s in $(cat ./nowcoder.txt)
do
	if [ ${#s} -lt 8 ]
then
	echo $s 
fi
done
1
2
3
4
5
6
7
8
8. 统计所有进程占用内存大小的和
题目链接：【牛客网 | 统计所有进程占用内存大小的和】
题目描述
假设 nowcoder.txt 内容如下：
 USER      | PID | %CPU |%MEM | VSZ  | RSS | TTY | STAT |    TIME      | COMMAND
root           2   0.0   0.0       0      0  ?     S     9月25   0:00    [kthreadd]
root           4   0.0   0.0       0      0  ?     I<    9月25   0:00    [kworker/0:0H]
web         1638   1.8   1.8  6311352 612400 ?     Sl    10月16  21:52   test
web         1639   2.0   1.8  6311352 612401 ?     Sl    10月16  21:52   test
tangmiao-pc 5336   0.0   1.4  9100240 238544 ??    S    3:09下午 0:31.70  /Applications
1
2
3
4
5
以上内容是通过ps aux | grep -v ‘RSS TTY’ 命令输出到nowcoder.txt文件下面的
请你写一个脚本计算一下所有进程占用内存大小的和:

分析：

首先我们需要了解ps命令的输出的字段参数的意义。

ps -aux 显示所有包含其他使用者的行程, 输出格式为 :
> USER      PID     %CPU             %MEM                 VSZ                     RSS 
> 进程拥有者  pid   占用的 CPU 使用率  占用的物理内存的使用率 占用的虚拟内存大小(单位KB) 占用的实际物理内存大小(单位KB)

			TTY                   STAT                 START          TIME                COMMAND
		进程在哪一个终端上运行      进程的状态            行程开始时间   进程占用的CPU运算时间    所执行的指令
		本地进制太终端tty1~ty7  R(运行)、S(睡眠)、T(停止)...
题目要求计算的是进程真实占用的物理内存，即nowcoder.txt中的第6列数据。

方法一：使用awk工具
awk '{sum+=$6} END{print sum}' ./nowcoder.txt
1
使用awk解此题是最方便高效的，不过我们也可以尝试不使用awk工具解此题。其中方法2方法3的主要思路都是将数据提取为一行或一列，让后对齐求和即可。而我们需要做的只是尽可能多的使用不同的方法完成“数据求和”这一步骤。

下面的shell求和方法多有参考stackoverflow的这篇讨论《Shell command to sum integers, one per line?》

方法二：提取数据，对一列求和
echo命令：输出指定的字符串或者变量
tr：字符串压缩和替换
cut：从文件的每一行剪切字节、字符和字段并将这些字节、字符和字段写至标准输出
bc：算术操作精密运算工具
对一列数据求和
echo `cat ./nowcoder.txt | tr -s ' ' | cut -d' ' -f 6 | tr '\n' '+' `0 | bc
1
提取第6列数据，通过tr命令将其替换成带加号表达式。

echo `cat ./nowcoder.txt | tr -s ' ' | cut -d' ' -f 6 | tr '\n' '+' `0 | bc
=>    echo  "0+0+612400+612401+238544+"0  |  bc
=>    echo  "0+0+612400+612401+238544+0"  |  bc

类似的还有
perl语言解释器，执行perl脚本
cat ./nowcoder.txt | tr -s ' ' | cut -d' ' -f 6 | perl -lpe '$c+=$_}{$_=$c'
1
方法三：提取数据，对一行数据求和
方法二将数据提取至一列，我们可以通过 xargs命令将其转换为一行后再行操作。

通过sed与bc工具计算表达式的值
cat ./nowcoder.txt | tr -s ' ' | cut -d' ' -f 6 | xargs | sed -e 's/\ /+/g' | bc

1
2
以上步骤可主要分为三步：
1，提取第6列至nums中， nums+=`cat ./nowcoder.txt | tr -s ' ' | cut -d' ' -f 6`
tr -s ' ' 删除重复出现的空格，只保留一个
cut -d ' ' -f 6 提取第6列的数据
2，将列转为行之后，通过sed工具计算， echo $nums | xargs | sed -e 's/\ /+/g'
echo $nums | xargs ，列转行
sed命令及参数 sed -e 's/\ /+/g'，此scriptfile的作用是，将空格替换成‘+’。
-e 指定的script来处理输入的文本文件，在scriptfile 中各参数意义为：
使用后缀 /g 标记会替换每一行中的所有匹配
替换操作：s命令，使用前缀 s/ 标记
字符 / 在sed中作为定界符使用，也可以使用任意的定界符：'s|\ |+|g' 、's:\ :+:g'
3，替换完成之后，数据为 0+0+612400+612401+238544 ，我们通过bc命令计算表达式的值。
9. 统计每个单词出现的个数
题目链接：【牛客网 | 统计每个单词出现的个数】
题目描述
写一个 bash脚本以统计一个文本文件 nowcoder.txt 中每个单词出现的个数。
为了简单起见，你可以假设：
nowcoder.txt只包括小写字母和空格。
每个单词只由小写字母组成。
单词间由一个或多个空格字符分隔。
示例:
假设 nowcoder.txt 内容如下：
welcome nowcoder
welcome to nowcoder
nowcoder
1
2
3
你的脚本应当输出（以词频升序排列）：

to 1 
welcome 2 
nowcoder 3 
1
2
3
说明:
不要担心个数相同的单词的排序问题，每个单词出现的个数都是唯一的。

方法一：使用[sort] | [uniq] | [awk]
参考资料 《uniq - 显示或忽略重复的行》
通过 排序 | 去重 | 打印三步即可完成
cat ./nowcoder.txt | xargs -n1 | sort | uniq -c | sort -n$1 | awk '{print $2,$1}'
# 或
cat ./nowcoder.txt | tr -s ' ' '\n' | sort | uniq -c | sort -n$1 | awk '{print $2,$1}'
1
2
3
步骤解析：

行转列。使用 xargs -n1 或 tr -s ’ ’ ‘\n’ 都可以。
$ cat ./nowcoder.txt | tr -s ' ' '\n'
welcome
nowcoder
welcome
to
nowcoder
nowcoder
1
2
3
4
5
6
7
去重，并统计每个词出现的次数。需要注意的是，uniq命令只对相邻行去重和统计次数。
因此，在去重前需要先排一次序。
$ cat ./nowcoder.txt | tr -s ' ' '\n' | sort | uniq -c
      3 nowcoder
      1 to
      2 welcome
1
2
3
4
按要求打印输出对应列即可，这里我们选择使用awk工具，先输出第2列，再输出第1列。
注意，题目要求按照词频降序排列，所以这里我们再使用一次排序。
$ cat ./nowcoder.txt | tr -s ' ' '\n' | sort | uniq -c | sort -r -n $1 | awk '{print $2,$1}'
nowcoder 3
welcome 2
to 1
1
2
3
4
10. 第二列是否有重复
题目链接：【牛客网 | 第二列是否有重复】
题目描述
给定一个 nowcoder.txt文件，其中有3列信息，如下实例，编写一个shell脚本来检查文件第二列是否有重复，且有几个重复，并提取出重复的行的第二列信息：
实例：
20201001 python 99
20201002 go 80
20201002 c++ 88
20201003 php 77
20201001 go 88
20201005 shell 89
20201006 java 70
20201008 c 100
20201007 java 88
20201006 go 97
1
2
3
4
5
6
7
8
9
10
结果：

2 java
3 go
1
2
方法一：使用sort & uniq 组合命令
sort 及其参数
-n是按照数字大小排序
-r是以相反顺序
-k是指定需要排序的栏位
-t指定栏位分隔符为冒号
cat ./nowcoder.txt | sort -rk 2 | cut -d' '  -f 2 | uniq -cd
1
步骤解析：

排序，是相同的列可以相邻
$ cat ./nowcoder.txt | sort -rk 2
20201005 shell 89
20201001 python 99
20201003 php 77
20201007 java 88
20201006 java 70
20201006 go 97
20201001 go 88
20201002 go 80
20201002 c++ 88
20201008 c 100
1
2
3
4
5
6
7
8
9
10
11
按题目要求，截取第2列字段
$ cat ./nowcoder.txt | sort -rk 2 | cut -d ' ' -f 2
shell
python
php
java
java
go
go
go
c++
c
1
2
3
4
5
6
7
8
9
10
11
去重，并统计词频。使用 -d 选项打印临近的重复行
$ cat ./nowcoder.txt | sort -rk 2 | cut -d ' ' -f 2 | uniq -cd
      2 java
      3 go

1
2
3
4
方法二：使用awk工具
与上面同理，这里使用了awk的提取列字段的功能
cat ./nowcoder.txt | awk '{print $2}' | sort -r | uniq -cd
1
11. 转置文件的内容
题目链接：【牛客网 | 转置文件的内容】
题目描述
写一个 bash脚本来转置文本文件nowcoder.txt中的文件内容。
为了简单起见，你可以假设：
假设每行列数相同，并且每个字段由空格分隔
示例:
假设 nowcoder.txt 内容如下：
job salary
c++ 13
java 14
php 12
1
2
3
4
你的脚本应当输出（以词频升序排列）：

job c++ java php
salary 13 14 12
1
2
方法一：使用xargs进行‘列转行’
cat ./nowcoder.txt | cut -d' ' -f 1 | xargs
cat ./nowcoder.txt | cut -d' ' -f 2 | xargs
1
2
方法一：使用tr进行‘列转行’
cat ./nowcoder.txt | cut -d' ' -f 1 | tr ' ' '\n'
cat ./nowcoder.txt | cut -d' ' -f 2 | tr ' ' '\n'
1
2
方法三：使用awk工具
先输出第1列的数据，同时将第2列的数据保存在数组中，等到第1列数据输入完成之后，遍历数组元素输出第2列数据
awk '{;printf  $1" "; str[NR]=$2 } END{print ""; for(i=1; i<=NR; i++){printf str[i]" "} print ""}' ./nowcoder.txt 
1
简化。输出第一列数据的同时，将第2列数据保存在buff中，并拼接成一个字符串。
awk '{  printf  $1" "; buff=$2" "; str=str""buff } END{ print ""; print str""}' ./nowcoder.txt

#或者
awk '{  printf  $1" "; buff=buff$2" " } END{ print ""; print buff}' ./nowcoder.txt
1
2
3
4
12. 打印每一行出现的数字个数
题目链接：【牛客网 | 打印每一行出现的数字个数】
题目描述
写一个 bash脚本以统计一个文本文件 nowcoder.txt中每一行出现的1,2,3,4,5数字个数并且要计算一下整个文档中一共出现了几个1,2,3,4,5数字数字总数。
示例:
假设 nowcoder.txt 内容如下：
a12b8
10ccc
2521abc
9asf
1
2
3
4
你的脚本应当输出：

line1 number: 2
line2 number: 1
line3 number: 4
line4 number: 0
sum is 7
1
2
3
4
5
说明:
不要担心你输出的空格以及换行的问题

方案一：使用sed & awk组合工具
sed、grep、awk都支持正则表达式，而此题使用正则表达式将会非常简单。
如果使用grep配合awk也能达到统计每行个数的效果，但不符合题目要求的是，grep会过滤掉不含匹配项的行。如此以来，最终的结果就会缺少一个“line4 number: 0”答案。因此我们选择使用sed工具。
l$ grep '[1-5]*' ./nowcoder.txt -o 
12
1
2521
1
2
3
4
使用sed将文本处理为每行仅有 1~5 范围的数组，再使用awk工具进行输出。
sed s/[^1-5]//g nowcoder.txt | awk '{print "line"NR" number: "length; total+=length} END{print "sum is "total}' 

1
2
步骤解析：

使用sed处理文本，格式为 sed s/待替换文本/替换内容/g
$ sed s/[^1-5]//g nowcoder.txt 
12
1
2521
			# 注意：这里有一个空行
1
2
3
4
5
使用awk内置函数length输出每行长度即可。
方法二：使用awk工具内置命令gsub，正则替换
gsub( Ere, Repl, [ In ] )，匹配正则表达式Ere的字符被替换为Repl，储存在[In]中
awk -v sum=0 '{gsub(/[^1-5]/,"",$0); print "line"NR" number: "length;sum+=length} END{print "sum is "sum}' ./nowcoder.txt 

1
2
步骤解析：

使用gsub() 将文本处理成只包含数组 1~5 的形式
$ awk 'gsub(/[^1-5]/,"",$0)' ./nowcoder.txt 
12
1
2521
			# 注意这里的空行
1
2
3
4
5
使用awk按照题目个数输出，其中{ }类似一个循环体，会对文件中的每一行进行迭代
方法三：使用tr删除字符集
tr命令也可以将数据处理成每行只包含1~5数字字符或空行的形式。

cat ./nowcoder.txt | tr -d '/a-z06-9/'  | awk '{print "line"NR" number: "length; total+=length} END{print "sum is "total}' 
1
步骤解析：

tr -d 选项可以删除字符集中的元素，详见如下：

删除字符集中的所有元素
$ cat ./nowcoder.txt | tr -d '/a-z06-9/' 
12
1
2521
		# 空行
1
2
3
4
5
删除不在字符集的补集中的所有字符
$ cat ./nowcoder.txt | tr -d -c '1-5\n' 
12
1
2521
		# 存在空行
1
2
3
4
5
方法四：编写shell脚本函数，类似C语言处理数据
# row=1; sum=0; while read line; do cnt=`echo $line | grep -oE "[1-5]" | wc -l`; echo "line${row} number: ${cnt}"; let "row++"; let "sum+=$cnt"; done < ./nowcoder.txt
row=1			# 记录行数
sum=0			# 记录总字符数
while read line		# 循环读取
do
    # 使用grep过滤，只输出12345. 使用wc -w 统计字符个数
    cnt=`echo $line | grep -oE "[1-5]" | wc -l`
    echo "line${row} number: ${cnt}"
    let "row++"
    let "sum+=$cnt"
done < ./nowcoder.txt			# 文件重定向
echo "sum is $sum"
1
2
3
4
5
6
7
8
9
10
11
12
此外，我们也可以将其编写成函数，然后通过脚本调用。

function CountNumber(){
	local row=1			# 记录行数
	local sum=0			# 记录总字符数
	while read line		# 循环读取
	do
		# 使用grep过滤，只输出12345. 使用wc -w 统计字符个数
		cnt=`echo $line | grep -oE "[1-5]" | wc -l`
		echo "line${row} number: ${cnt}"
		let "row++"
		let "sum+=$cnt"
	done < $1			# 文件重定向
	return $sum
}

# 调用函数
CountNumber $1
echo "sum is $?"		# $? 函数退出返回值

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
保存为文件，通过 执行shell脚本处理。

14. 求平均值
题目链接：【牛客网 | 求平均值】
题目描述
写一个bash脚本以实现一个需求，求输入的一个的数组的平均值
第1行为输入的数组长度N
第2~N行为数组的元素，如以下为:
数组长度为4，数组元素为1 2 9 8
示例:
4
1
2
9
8
1
2
3
4
5
那么平均值为:5.000(保留小数点后面3位)
你的脚本获取以上输入应当输出：5.000

方法一：使用awk工具
在第一行时，记录当前数据，表示数组长度。大于一行时，累加求和。
 awk 'NR==1{cnt=$0} NR>1{sum+=$0} END{printf "%.3f\n" ,sum/cnt}' ./nowcoder.txt
1
方法二：使用bc命令工具
将列数据转置成为行数据后，通过字符串拼接成为形如“1+2+3+4…”的形式，再通过bc计算工具计算
sum=`cat ./nowcoder.txt | xargs | cut -d ' ' -f 1 --complement | tr ' ' '+' | bc`
cnt=`cat ./nowcoder.txt | xargs | cut -d ' ' -f 1`
echo "scale=3;"$sum/$cnt | bc
1
2
3
步骤解析：

列转行
$ cat ./nowcoder.txt | xargs 
4 1 2 9 8
1
2
分别取第一列和其余列的数据
# 取第一列的数据
$ cat ./nowcoder.txt | xargs | cut -d ' ' -f 1
4
# 取其余列的数据
$ cat ./nowcoder.txt | xargs | cut -d ' ' -f 1 --complement
1 2 9 8
1
2
3
4
5
6
拼接字符串，这里使用tr命令将 ‘空格’ 替换为 ‘+’ 。也可以使用sed命令工具
# 使用 tr 替换
$ cat ./nowcoder.txt | xargs | cut -d ' ' -f 1 --complement | tr ' ' '+'
1+2+9+8
# 使用sed 替换
$ cat ./nowcoder.txt | xargs | cut -d ' ' -f 1 --complement | sed 's/ /+/g'
1+2+9+8
1
2
3
4
5
6
使用 bc计算工具
参数scale=2是将bc输出结果的小数位设置为2位
方法三：通过while循环处理
sum=0            # 累加求和
read cnt         # 读取数组长度
while read num   # 读取剩余部分
do
    let "sum+=num"
done
echo "scale=3;$sum/$cnt" | bc
1
2
3
4
5
6
7
15. 去掉不需要的单词
题目链接：
题目描述
写一个 bash脚本以实现一个需求，去掉输入中的含有B和b的单词
示例:
假设输入如下：
big
nowcoder
Betty
basic
test
1
2
3
4
5
你的脚本获取以上输入应当输出：

nowcoder test
1
说明:
你可以不用在意输出的格式，空格和换行都行

方法一：使用grep文本搜索工具
使用grep过滤
-v 过滤掉匹配的行
-i 忽略大小写
cat ./nowcoder.txt |grep -v -i b 
1
使用正则匹配
grep方法过滤掉含有‘B’与‘b’的字符，相关参数如下
-w --word-regexp # 只显示全字符合的列。
-x --line-regexp # 只显示全列符合的列。
cat ./nowcoder.txt | grep '[^Bb]*' -x
或
cat ./nowcoder.txt | grep '[^Bb]*' -w
1
2
3
方法二：使用sed流失文本工具
使用正则匹配 ，参数 ‘d’ 为删除选择的行。
sed /[bB]/d ./nowcoder.txt 
1
删除‘b’与‘d’所在行
sed '/b/d' ./nowcoder.txt  | sed '/B/d'
# 或
sed '/b/d; /B/d' ./nowcoder.txt 
# 或
sed '/B\|b/d' nowcoder.txt
1
2
3
4
5
方法三：使用awk工具
输出不匹配‘B’或‘b’的行
~ 匹配正则表达式
!~ 不匹配正则表达式
awk '$0!~/[B,b]/ {print $0}' ./nowcoder.txt 
# 或
awk '$0!~/^B|b/ {print $0}' ./nowcoder.txt 
