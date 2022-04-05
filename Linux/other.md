
```
wget -m -e robots=off -k -E "https://python3webspider.cuiqingcai.com/"
```

```
wget整站抓取、网站抓取功能；下载整个网站；下载网站到本地
wget -r   -p -np -k -E  http://www.xxx.com 抓取整站

wget -l 1 -p -np -k       http://www.xxx.com 抓取第一级


-r 递归抓取
-k 抓取之后修正链接，适合本地浏览

wget -m -e robots=off -k -E "http://www.abc.net/"
可以将全站下载以本地的当前工作目录，生成可访问、完整的镜像。

解释：
-m  //镜像，就是整站抓取
-e robots=off   //忽略robots协议，强制、流氓抓取
-k  //将绝对URL链接转换为本地相对URL
-E //将所有text/html文档以.html扩展名保存
```


## 一、回到上次操作的目录
cd  -
进入上次访问目录

## 命令跳转

在终端中按捉 [Ctrl] 键的同时 [r] 键，出现提示：(reverse-i-search)
此时你尝试一下输入你以前输入过的命令，当你每输入一个字符的时候，终端都会滚动显示你的历史命令。
当显示到你想找的合适的历史命令的时候，直接 [Enter]，就执行了历史命令。

另外， [Ctrl + p] 或 [Ctrl + n] 快速向前或向后滚动查找一个历史命令，
对于快速提取刚刚执行过不久的命令很有用。

三、命令行内快速操作键
1. 移动操作快捷键
Ctrl + f-- 向右移动一个字符，当然多数人用→
Ctrl + b-- 向左移动一个字符， 多数人用←
ESC + f-- 向右移动一个单词，MAC下建议用ALT + →
ESC + b-- 向左移动一个单词，MAC下建议用ALT + ←
Ctrl + a-- 跳到行首
Ctrl + e-- 跳到行尾

2. 删除操作快捷键
Ctrl + d-- 向右删除一个字符
Ctrl + h-- 向左删除一个字符
Ctrl + u-- 删除当前位置字符至行首（输入密码错误的时候多用下这个）
Ctrl + k-- 删除当前位置字符至行尾
Ctrl + w-- 删除从光标到当前单词开头

3.其他操作快捷键
Ctrl + y-- 插入最近删除的单词
Ctrl + c-- 终止操作
Ctrl + d-- 当前操作转到后台
Ctrl + l-- 清屏 （有时候为了好看）


## 输出重定向
重定向通过特定的符号来实现。

如:`command1 > file1`，该命令执行后会将输出的内容存入file1中，注意该文件中之前的内容会被新内容替代。如果希望在文件末追加，则应该使用`>>`操作符。

实例:`ls -lh > test.txt`，会将原本在屏幕输出的信息存入test.txt文件中，屏幕不再输出内容。

## 输入重定向
如有文件 dir_file.txt 里面有如下目录地址`~/Desktop/deep`，使用命令`ls < dir_file.txt`，则会从文件中获取目录地址传递给命令，相当于`ls ~/Desktop/deep`。

输入输出可以混合使用`command1 < infile > outfile`,同时替换输入和输出，执行command1，从文件infile读取内容，然后将输出写入到outfile中。

重定向深入讲解
一般情况下，每个 Unix/Linux 命令运行时都会打开三个文件：

标准输入文件(stdin)：stdin的文件描述符为0，Unix程序默认从stdin读取数据。
标准输出文件(stdout)：stdout 的文件描述符为1，Unix程序默认向stdout输出数据。
标准错误文件(stderr)：stderr的文件描述符为2，Unix程序会向stderr流中写入错误信息。
默认情况下，command > file 将 stdout 重定向到 file，command < file 将stdin 重定向到 file。

如果希望 stderr 重定向到 file，可以这样:`command 2>file`,实例使用rmdir删除一个非空目录`rmdir test 2> test.txt`，希望追加到末尾也是同样的`command 2>>file`,

如果希望将 stdout 和 stderr 合并后重定向到 file，可以这样写：`command > file 2>&1`、`command >> file 2>&1`

Here Document
Here Document 是 Shell 中的一种特殊的重定向方式，用来将输入重定向到一个交互式 Shell 脚本或程序。
TODO 没有太理解

/dev/null 文件
如果希望执行某个命令，但又不希望在屏幕上显示输出结果，那么可以将输出重定向到 /dev/null：
`command > /dev/null`

/dev/null 是一个特殊的文件，写入到它的内容都会被丢弃；如果尝试从该文件读取内容，那么什么也读不到。但是 /dev/null 文件非常有用，将命令的输出重定向到它，会起到"禁止输出"的效果。

如果希望屏蔽 stdout 和 stderr，可以这样写：
`command > /dev/null 2>&1`

注意：0 是标准输入（STDIN），1 是标准输出（STDOUT），2 是标准错误输出（STDERR）。

这里的 2 和 > 之间不可以有空格，2> 是一体的时候才表示错误输出。


|命令				|说明|
|---|---|
|command > file		|将输出重定向到 file。|
|command < file		|将输入重定向到 file。|
|command >> file	|将输出以追加的方式重定向到 file。|
|n > file			|将文件描述符为 n 的文件重定向到 file。|
|n >> file			|将文件描述符为 n 的文件以追加的方式重定向到 file。|
|n >& m				|将输出文件 m 和 n 合并。|
|n <& m				|将输入文件 m 和 n 合并。|
|<< tag				|将开始标记 tag 和结束标记 tag 之间的内容作为输入。|

## 环境变量
[Linux 环境变量](https://www.cjavapy.com/article/2250/)
```
简介：Linux的一个重要概念是环境变量，环境变量需要进行定义。有些是由系统设置的，有些是由用户自定义的，还有一些是由shell或加载执行程序时，由程序设置的。环境变量是一个赋值给它的字符串。分配的值可以是数字、文本、文件名、设备或任何其他类型的数据。

1、环境变量介绍
Linux中环境变量包括系统级和用户级，系统级的环境变量是每个登录到系统的用户都要读取的系统变量，而用户级的环境变量则是该用户使用系统时加载的环境变量。所以管理环境变量的文件也分为系统级和用户级的.

1）系统级

/etc/environment：系统在登录时读取的第一个文件，用于为所有进程设置环境变量。系统使用此文件时并不是执行此文件中的命令，而是根据KEY=VALUE模式的代码，对KEY赋值以VALUE，因此文件中如果要定义PATH环境变量，只需加入类似如PATH=$PATH:/xxx/bin的代码即可。

/etc/profile：是系统登录时执行的第二个文件，可以用于设定针对全系统所有用户的环境变量。该文件一般是调用/etc/bash.bashrc文件。

/etc/bash.bashrc：系统级的bashrc文件，为每一个运行bash shell的用户执行此文件。此文件会在用户每次打开shell时执行一次。

注意：/etc/environment是设置整个系统的环境，而/etc/profile是设置所有用户的环境，前者与登录用户无关，后者与登录用户有关。 这两个文件修改后一般都要重启系统才能生效。

2）用户级

~/.profile: 是对应当前登录用户的profile文件，用于定制当前用户的个人工作环境。

每个用户都可使用该文件输入专用于自己使用的shell信息,当用户登录时,该文件仅仅执行一次。默认情况下，会设置一些环境变量，执行用户的.bashrc文件。

~/.bashrc: 是对应当前登录用户的bash初始化文件，当用户每次打开shell时，系统都会执行此文件一次。通常设置环境变量修改这个文件。

上述配置文件执行先后顺序如下：

/etc/enviroment –> /etc/profile –> ~/.profile –> /etc/bash.bashrc –> ~/.bashrc

2、环境变量的作用
环境变量相当于给系统或用户应用程序设置的一些参数，具体起什么作用这当然和具体的环境变量相关。比如PATH，是告诉系统，当要求系统运行一个程序而没有告诉它程序所在的完整路径时，系统除了在当前目录下面寻找此程序外，还应到哪些目录下去寻找；再如tc或vc++中，set include=path1;path2; 是告诉编译程序到哪里去找.h类型的文件；当然不仅仅是指定什么路径，还有其它的作用的，如set dircmd=/4 设置一个环境变量的作用是在使用dir命令时会把/4作为缺省的参数添加到你的dir命令之后，就像你的每个命令都加了/4参数，它实际上是给命令解释程序command设置的一个环境变量，并且是给dir这个内部命令。

3、配置环境变量的方法
1）临时环境变量

linux下设定环境变量时，如果只是临时用一下，可以直接在shell下用set或export命令设定环境变量。但是只能在当前shell环境下可以用，切换或关闭重新进入就会失效。具体配置方法，如下，

#终端输入：
export MYSQLPATH=/home/mysql  #MYSQLPATH设置为该路径
#终端查看一个特定环境变量包含的内容，比如，MYSQLPATH，PATH
echo $PATH
echo $MYSQLPATH
2）永久环境变量

设置的环境变量，需要经常使用的，而不是临时使用，把上面的设置环境变量命令写到上面提到的相应配置文件中即可，则可以每次开机或打开shell时自动设置，

例如，

只需要当前用户生效的环境变量：

终端中输入：sudo vi ~/.bashrc，编辑这个文件，在其末尾添加：

export MYSQLPATH=/home/mysql:$MYSQLPATH
# path采用:来分隔,冒号左右不需要空格.
# :$MYSQLPATH在后面新添加的优先搜索，$MYSQLPATH:在前面说明新添加的最后搜索，不加代表新路径设置为MYSQLPATH路径。
注意：在终端执行，source ~/.bashrc ，使其立即生效，或者重启电脑即可。

设置所有用户生效的环境变更：

终端中输入：sudo vi /etc/profile，编辑这个文件，在其末尾添加：

export MYSQLPATH=/home/mysql:$MYSQLPATH
# path采用:来分隔,冒号左右不需要空格.
# :$MYSQLPATH在后面新添加的优先搜索，$MYSQLPATH:在前面说明新添加的最后搜索，不加代表新路径设置为MYSQLPATH路径。
注意：在终端执行，source /etc/profile ，使其立即生效，或者重启电脑即可。

4、PATH环境变量
Linux命令其实是一个个的命令行程序，这些程序是分布在不同的众多目录中的。当命令行中输入一个命令的时，Linux需要到指定目录去查找命令对应的程序，而在PATH环境变量就记录这些目录。所以PATH环境变量的作用就是记录命令的查找路径，多个路径之间用英文冒号分割的（和Windows系统的PATH变量不同，Windows的PATH变量的路径是用英文分号分割的），有需要时也可以加入自己的路径。具体配置方法，如下，

#比如添加搜索路径/home/cjavapy/python和/home/cjavapy/java 路径到PATH中,采用:来分隔,冒号左右不需要空格
export PATH=$PATH:/home/cjavapy/python:/home/cjavapy/java
#若需要将路径放在优先搜索位置，将$PATH放在后面
export PATH=/home/cjavapy/python:/home/cjavapy/java:$PATH
注意：配置PATH环境变量可以永久生效，也可以临时生效，具体可以参考上面介绍的配置环境变量的方法。

5、常用环境变量
Linux系统有一些重要常用的环境变量，具体如下，

$HOME：用户家目录。

$SHELL：用户在使用的Shell解释器名称。

$HISTSIZE：输出的历史命令记录条数。

$HISTFILESIZE：保存的历史命令记录条数。

$MAIL：邮件保存路径。

$LANG：系统语言、语系名称。

$RANDOM：生成一个随机数字。

$PS1 ：Bash解释器的提示符。

$PATH：定义解释器搜索用户执行命令的路径。

$EDITOR：用户默认的文本编辑器。

$TERM：表示显示类型。

$RANDOM：每次引用时生成一个0到32,767之间的随机整数。

$PWD：指示由cd命令设置的当前工作目录。

$TZ：指时区。它可以使用GMT、AST等值。

$UID：显示当前用户的数字用户 ID，在shell 启动时初始化。

可以使用echo查看变量信息，

例如，

$ echo $HOME
/root
$ echo $TERM
xterm
$ echo $PATH
/usr/local/bin:/bin:/usr/bin:/home/amrood/bin:/usr/local/bin
6、PS环境变量
PS即是Prompt String,命令提示符的意思。在bash中一共有四个。分为表示为PS1,PS2,PS3,PS4。

1）PS1

PS1是用来控制默认提示符显示格式。下面方括号中的内容便是PS1。

例如，

$ echo $PS1
\h:\W \u\$
PS1的常用参数以及含义:

\d 代表日期，格式为weekday month date，例如：”Mon Aug 1″

\H 完整的主机名称

\h 仅取主机名中的第一个名字

\t 显示时间为24小时格式，如HHMMSS

\T 显示时间为12小时格式

\A 显示时间为24小时格式HHMM

\@显示时间，为12小时格式am/pm

\u 当前用户的账号名称

\v BASH的版本信息

\w 完整的工作目录名称

\W 利用basename取得工作目录名称，只显示最后一个目录名

\# 下达的第几个命令

\$ 提示字符，如果是root用户，提示符为 # ，普通用户则为 $

2）PS2

一个非常长的命令可以通过在末尾加\使其分行显示。多行命令的默认提示符是>。 我们可以通过修改PS2 ，将提示符修改为->。

例如，

$ PS2='->'
$ ls \
->/etc \
->/boot
3）PS3

shell脚本中使用select循环时的提示符。

例如，

#!/usr/bin/bash
PS3="Select a program to exectue: "
select program in 'ls -F' pwd date
do
  $program
done

(The Command Line)
Select a program to exectue: 2
1) ls -F
2) pwd
3) date
# /home/yang
# 在执行脚本的时候，PS3里面的字符串会显示在菜单的底部
4）PS4

PS4 是Prompt String 4的缩写，它是Linux/Unix下的一个用于控制脚本调试显示信息的环境变量。

用来修改set -x跟踪输出的前缀 。

例如，

$ export PS4="+Debug Info: "
$ set -x test_syntax.sh
+Debug Info: GREETINGS=
++Debug Info: pwd
+Debug Info: CURRENT_DIR=/Users/liumiao
+Debug Info: '[' _HELLO = _ ']'

```


PATH 环境变量导入的优先级，`echo $PATH` 查看`/home/fiki/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl`，自己安装的python在`/home/fiki/.local/bin`中，所以覆盖掉了系统自身的`python3`，`.bashrc`时最后加载的，所以如果在里面定义的路径的内容会覆盖掉之前的，换言之拥有最高优先级
