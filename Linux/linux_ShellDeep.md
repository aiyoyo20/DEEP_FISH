## shebang 符号

`#!`:即为 shebang 符号

> 在 Shebang 之后，可以有一个或数个空白字符，后接解释器的绝对路径，用于指明执行这个脚本文件的解释器。在直接调用脚本时，系统的程序载入器会分析 Shebang 后的内容，将这些内容作为解释器指令，并调用该指令，将载有 Shebang 的文件路径作为该解释器的参数，执行脚本，从而使得脚本文件的调用方式与普通的可执行文件类似。例如，以指令#!/bin/sh 开头的文件，在执行时会实际调用 /bin/sh 程序（通常是 Bourne shell 或兼容的 shell，例如 bash、dash 等）来执行。

## shell 提示符

> 启动 Linux 桌面环境自带的终端模拟包，或者从 Linux 控制台登录后，便可以看到 Shell 命令提示符。看见命令提示符就意味着可以输入命令了。命令提示符不是命令的一部分，它只是起到一个提示作用。
> `[mozhiyan@localhost ~]$`
> 各个部分的含义如下：
> []是提示符的分隔符号，没有特殊含义。
> mozhiyan 表示当前登录的用户，我现在使用的是 mozhiyan 用户登录。
> @是分隔符号，没有特殊含义。
> localhost 表示当前系统的简写主机名（完整主机名是 localhost.localdomain）。
> ~代表用户当前所在的目录为主目录（home 目录）。如果用户当前位于主目录下的 bin 目录中，那么这里显示的就是 bin。
> $是命令提示符。Linux 用这个符号标识登录的用户权限等级：如果是超级用户（root 用户），提示符就是#；如果是普通用户，提示符就是$。
> 第二层命令提示符
> 有些命令不能在一行内输入完成，需要换行，这个时候就会看到第二层命令提示符。第二层命令提示符默认为>，请看下面的例子：
> [mozhiyan@localhost ~]$ echo "Shell 教程"
> Shell 教程
> [mozhiyan@localhost ~]$ echo "
> http://
> c.biancheng.net
> "

http://
c.biancheng.net

第一个 echo 命令在一行内输入完成，不会出现第二层提示符。第二个 echo 命令需要多行才能输入完成，提示符>用来告诉用户命令还没输入完成，请继续输入。

echo 命令用来输出一个字符串。字符串是一组由" "包围起来的字符序列，echo 将第一个"作为字符串的开端，将第二个"作为字符串的结尾。对于第二个 echo 命令，我们将字符串分成多行，echo 遇到第一个"认为是不完整的字符串，所以会继续等待用户输入，直到遇见第二个"。

Shell 通过 PS1 和 PS2 两个环境变量来控制提示符格式：
PS1 控制最外层命令行的提示符格式。
PS2 控制第二层命令行的提示符格式。

Shell 使用以\为前导的特殊字符来表示命令提示符中包含的要素，这使得 PS1 和 PS2 的格式看起来可能有点奇怪。下表展示了可以在 PS1 和 PS2 中使用的特殊字符。
Bash shell 提示符可以包含的要素
|字符| 描述|
|\a |铃声字符|
|\d |格式为“日 月 年”的日期|
|\e |ASCII 转义字符|
|\h |本地主机名|
|\H |完全合格的限定域主机名|
|\j |shell 当前管理的作业数|
|\1 |shell 终端设备名的基本名称|
|\n |ASCII 换行字符|
|\r |ASCII 回车|
|\s |shell 的名称|
|\t |格式为“小时:分钟:秒”的 24 小时制的当前时间|
|\T |格式为“小时:分钟:秒”的 12 小时制的当前时间|
|\@ |格式为 am/pm 的 12 小时制的当前时间|
|\u |当前用户的用户名|
|\v |bash shell 的版本|
|\V |bash shell 的发布级别|
|\w |当前工作目录|
|\W |当前工作目录的基本名称|
|\! |该命令的 bash shell 历史数|
|\# |该命令的命令数量|
|\$ |如果是普通用户，则为美元符号$；如果超级用户（root 用户），则为井号#。|
|\nnn| 对应于八进制值 nnn 的字符|
|\\ |斜杠|
|\[ |控制码序列的开头|
|\] |控制码序列的结尾|
注意，所有的特殊字符均以反斜杠\开头，目的是与普通字符区分开来。您可以在命令提示符中使用以上任何特殊字符的组合。

我们可以通过修改 PS1 变量来修改提示符格式，例如：
[mozhiyan@localhost ~]$ PS1="[\t][\u]\$ "
[17:27:34][mozhiyan]$
新的 Shell 提示符现在可以显示当前的时间和用户名。不过这个新定义的 PS1 变量只在当前 Shell 会话期间有效，再次启动 Shell 时将重新使用默认的提示符格式。

## 注释

shell 的单行、多行注释均以 # 开头。

## 变量

shell 在定义变量时通常不需要指明类型，直接赋值就可以

在 Bash shell 中，每一个变量的值都是字符串，无论你给变量赋值时有没有使用引号，值都会以字符串的形式存储。

这意味着，Bash shell 在默认情况下不会区分变量类型，即使你将整数和小数赋值给变量，它们也会被视为字符串，这一点和大部分的编程语言不同。例如在 C 语言或者 C++ 中，变量分为整数、小数、字符串、布尔等多种类型。

当然，如果有必要，你也可以使用 Shell declare 关键字显式定义变量的类型，但在一般情况下没有这个需求，Shell 开发者在编写代码时自行注意值的类型即可。

#### 定义变量

Shell 支持以下三种定义变量的方式：
variable=value
variable='value'
variable="value"

variable 是变量名，value 是赋给变量的值。如果 value 不包含任何空白符（例如空格、Tab 缩进等），那么可以不使用引号；如果 value 包含了空白符，那么就必须使用引号包围起来。使用单引号和使用双引号也是有区别的，稍后我们会详细说明。

注意，赋值号=的周围不能有空格，这可能和你熟悉的大部分编程语言都不一样。

Shell 变量的命名规范和大部分编程语言都一样：
变量名由数字、字母、下划线组成；
必须以字母或者下划线开头；
不能使用 Shell 里的关键字（通过 help 命令可以查看保留关键字）

### 使用变量

使用一个定义过的变量，只要在变量名前面加美元符号$即可，如：

```
author="严长生"
echo $author
echo ${author}
```

变量名外面的花括号{ }是可选的，加不加都行，加花括号是为了帮助解释器识别变量的边界，比如下面这种情况：

```
skill="Java"
echo "I am good at ${skill}Script"
```

如果不给 skill 变量加花括号，写成 echo "I am good at $skillScript"，解释器就会把 $skillScript 当成一个变量（其值为空），代码执行结果就不是我们期望的样子了。

推荐给所有变量加上花括号{ }，这是个良好的编程习惯。

### 单引号和双引号的区别

以单引号' '包围变量的值时，单引号里面是什么就输出什么，即使内容中有变量和命令（命令需要反引起来）也会把它们原样输出。这种方式比较适合定义显示纯字符串的情况，即不希望解析变量、命令等的场景。

以双引号" "包围变量的值时，输出时会先解析里面的变量和命令，而不是把双引号中的变量名和命令原样输出。这种方式比较适合字符串中附带有变量和命令并且想将其解析后再输出的变量定义。

我的建议：如果变量的内容是数字，那么可以不加引号；如果真的需要原样输出就加单引号；其他没有特别要求的字符串等最好都加上双引号，定义变量时加双引号是最常见的使用场景。

### 将命令的结果赋值给变量

Shell 也支持将命令的执行结果赋值给变量，常见的有以下两种方式：

```
variable=`command`
variable=$(command)
```

第一种方式把命令用反引号` `（位于 Esc 键的下方）包围起来，反引号和单引号非常相似，容易产生混淆，所以不推荐使用这种方式；第二种方式把命令用$()包围起来，区分更加明显，所以推荐使用这种方式。

### 只读变量

使用 readonly 命令可以将变量定义为只读变量，只读变量的值不能被改变。

下面的例子尝试更改只读变量，结果报错：

```
#!/bin/bash
myUrl="http://c.biancheng.net/shell/"
readonly myUrl
myUrl="http://c.biancheng.net/shell/"
```

运行脚本，结果如下：
bash: myUrl: This variable is read only.

### 删除变量

使用 unset 命令可以删除变量。语法：
`unset variable_name`
变量被删除后不能再次使用；unset 命令不能删除只读变量。

举个例子：

```
#!/bin/sh
myUrl="http://c.biancheng.net/shell/"
unset myUrl
echo $myUrl
```

上面的脚本没有任何输出。

### 特殊变量

|Shell 特殊变量及其含义|
|变量 |含义|
|$0	|当前脚本的文件名。|
|$n|（n≥1） 传递给脚本或函数的参数。n 是一个数字，表示第几个参数。例如，第一个参数是 $1，第二个参数是 $2。|
|$# |传递给脚本或函数的参数个数。|
|$*	|传递给脚本或函数的所有参数。|
|$@ |传递给脚本或函数的所有参数。当被双引号" "包含时，$@ 与 $* 稍有不同，我们将在《Shell $*和$@的区别》一节中详细讲解。|
|$?	|上个命令的退出状态，或函数的返回值，我们将在《Shell $?》一节中详细讲解。|
|$$ |当前 Shell 进程 ID。对于 Shell 脚本，就是这些脚本所在的进程 ID。|

### 环境变量

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

PATH 环境变量导入的优先级，`echo $PATH` 查看`/home/fiki/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl`，自己安装的 python 在`/home/fiki/.local/bin`中，所以覆盖掉了系统自身的`python3`，`.bashrc`时最后加载的，所以如果在里面定义的路径的内容会覆盖掉之前的，换言之拥有最高优先级

#### Shell $*和$@的区别

当 $\* 和 $@ 不被双引号" "包围时，它们之间没有任何区别，都是将接收到的每个参数看做一份数据，彼此之间以空格来分隔。

但是当它们被双引号" "包含时，就会有区别了：
"$*"会将所有的参数从整体上看做一份数据，而不是把每个参数都看做一份数据。
"$@"仍然将每个参数都看作一份数据，彼此之间是独立的。

比如传递了 5 个参数，那么对于"$*"来说，这 5 个参数会合并到一起形成一份数据，它们之间是无法分割的；而对于"$@"来说，这 5 个参数是相互独立的，它们是 5 份数据。

### shell 命令替换

Shell 命令替换是指将命令的输出结果赋值给某个变量。比如，在某个目录中输入 ls 命令可查看当前目录中所有的文件，但如何将输出内容存入某个变量中呢？这就需要使用命令替换了，这也是 Shell 编程中使用非常频繁的功能。

Shell 中有两种方式可以完成命令替换，一种是反引号` `，一种是$()，使用方法如下：

```
variable=`commands`
variable=$(commands)
```

其中，variable 是变量名，commands 是要执行的命令。commands 可以只有一个命令，也可以有多个命令，多个命令之间以分号;分隔。

原则上讲，上面提到的两种变量替换的形式是等价的，可以随意使用；但是，反引号毕竟看起来像单引号，有时候会对查看代码造成困扰，而使用 $() 就相对清晰，能有效避免这种混乱。而且有些情况必须使用 $()：$() 支持嵌套，反引号不行。

```
Fir_File_Lines=$(wc -l $(ls | sed -n '1p'))
echo "$Fir_File_Lines"
```

要注意的是，$() 仅在 Bash Shell 中有效，而反引号可在多种 Shell 中使用。

### declare 和 typeset 命令：设置变量属性

declare 命令的用法如下所示：
declare [+/-] [aAfFgilprtux] [变量名=变量值]

其中，-表示设置属性，+表示取消属性，aAfFgilprtux 都是具体的选项，它们的含义如下表所示：

选项 含义
-f [name] 列出之前由用户在脚本中定义的函数名称和函数体。
-F [name] 仅列出自定义函数名称。
-g name 在 Shell 函数内部创建全局变量。
-p [name] 显示指定变量的属性和值。
-a name 声明变量为普通数组。
-A name 声明变量为关联数组（支持索引下标为字符串）。
-i name 将变量定义为整数型。
-r name[=value] 将变量定义为只读（不可修改和删除），等价于 readonly name。
-x name[=value] 将变量设置为环境变量，等价于 export name[=value]。

### 变量高级

指定方式 说明
${parameter-default}	如果变量 parameter 没被声明，那么就使用默认值。
${parameter:-default} 如果变量 parameter 没被设置，那么就使用默认值。
${parameter=default}	如果变量parameter没声明，那么就把它的值设为default。
${parameter:=default} 如果变量 parameter 没设置，那么就把它的值设为 default。
${parameter+alt_value}	如果变量parameter被声明了，那么就使用alt_value，否则就使用null字符串。
${parameter:+alt_value} 如果变量 parameter 被设置了，那么就使用 alt_value，否则就使用 null 字符串。
${parameter?err_msg}	如果parameter已经被声明，那么就使用设置的值，否则打印err_msg错误消息。
${parameter:?err_msg} 如果 parameter 已经被设置，那么就使用设置的值，否则打印 err_msg 错误消息。

${var#Pattern}, ${var##Pattern} 从变量$var 的开头删除最短或最长匹配$Pattern 的子串。
“#”表示匹配最短，“##”表示匹配最长。

${var%Pattern}, ${var%%Pattern} 从变量$var 的结尾删除最短或最长匹配$Pattern 的子串。
“%”表示匹配最短，“%%”表示匹配最长。

${var:pos} 变量var从位置pos开始扩展， 也就是pos之前的字符都丢弃。
${var:pos:len} 变量 var 从位置 pos 开始，并扩展 len 个字符。
${var/Pattern/Replacement} 使用Replacement来替换变量var中第一个匹配Pattern的字符串。
${var//Pattern/Replacement} 全局替换。所有在变量 var 匹配 Pattern 的字符串，都会被替换为 Replacement。
${var/#Pattern/Replacement} 如果变量var的前缀匹配Pattern，那么就使用Replacement来替换匹配到Pattern的字符串。
${var/%Pattern/Replacement} 如果变量 var 的后缀匹配 Pattern，那么就使用 Replacement 来替换匹配到 Pattern 的字符串。

### 变量的间接引用

假设一个变量的值是第二个变量的名字。如果 a=letter_of_alphabet 并且 letter_of_alphabet=z，

它被称为间接引用。我们能够通过引用变量 a 来获得 z，它使用 eval var1=\$$var2 这种不平常的形式。

```
t=table_cell_3
table_cell_3=24
echo "\"table_cell_3\" = $table_cell_3"            # "table_cell_3" = 24
echo -n "dereferenced \"t\" = ${t}"     # dereferenced "t" = table_cell_3%

echo '------------'

echo -n "dereferenced \"t\" = "; eval echo \$$t    # dereferenced "t" = 24
echo '------------'
# eval echo \$$t  可以理解为下面的 eval t=\$$t; echo "\"t\" = $t" 的简化
echo -n "dereferenced " ;eval t=\$$t; echo "\"t\" = $t"
```

## 输入、输出

read:用来从标准输入中读取数据并赋值给变量。如果没有进行重定向，默认就是从键盘读取用户输入的数据；如果进行了重定向，那么可以从文件中读取数据。
`$REPLY`:当没有参数变量提供给 read 命令的时候，这个变量会作为默认变量提供给 read 命令。

```
read 命令用于从标准输入读取数值。

read 内部命令被用来从标准输入读取单行数据。这个命令可以用来读取键盘输入，当使用重定向的时候，可以读取文件中的一行数据。

语法
read [-ers] [-a aname] [-d delim] [-i text] [-n nchars] [-N nchars] [-p prompt] [-t timeout] [-u fd] [name ...]
参数说明:

-a 后跟一个变量，该变量会被认为是个数组，然后给其赋值，默认是以空格为分割符。
-d 后面跟一个标志符，其实只有其后的第一个字符有用，作为结束的标志。
-p 后面跟提示信息，即在输入前打印提示信息。
-e 在输入的时候可以使用命令补全功能。
-n 后跟一个数字，定义输入文本的长度，很实用。
-r 屏蔽\，如果没有该选项，则\作为一个转义字符，有的话 \就是个正常的字符了。
-s 安静模式，在输入字符时不再屏幕上显示，例如 login 时输入密码。
-t 后面跟秒数，定义输入字符的等待时间。
-u 后面跟 fd，从文件描述符中读入，该文件描述符可以是 exec 新开启的。

### 读取文件的几种方法

```

while read line
do
echo $line
done < filename

```

```

cat filename | while read line
do
echo $line
done

```

#### IFS 分隔符；cat 逐行读取文件

```

for line in `cat filename`
do
echo $line
done

````

使用上面的方法读取文件时，当行内有空白符(空格、tab、换行)时就不会按行输出了。

```test.txt
a b
1 2
3 4
````

```
for i in `cat test.txt`
do
   echo $i
done
```

```
a
b
1
2
3
4
```

除了更换之前的 while 方法外，还可以通过指定分隔符来实现。

```
IFS=$'\n' # 定义分割符
# for i in $(cat file)    # better
# for i in $(<file)       # in bash
for i in `cat file`
do
    echo "$i"
done
```

> IFS="\n" # 将字符 n 作为 IFS 的换行符。
> IFS=$"\n" # 这里\n确实通过$转化为了换行符，但仅当被解释时（或被执行时）才被转化为换行符;第一个和第二个是等价的
> IFS=$'\n' # 这才是真正的换行符。

Shell 脚本中有个变量叫 IFS(Internal Field Seprator) ，内部域分隔符。
Shell 的环境变量分为 set, env 两种，其中 set 变量可以通过 export 工具导入到 env 变量中。
其中，set 是显示设置 shell 变量，仅在本 shell 中有效；env 是显示设置用户环境变量 ，仅在当前会话中有效。

IFS 是一种 set 变量，当 shell 处理"命令替换"和"参数替换"时，shell 根据 IFS 的值，默认是 space, tab, newline 来拆解读入的变量，然后对特殊字符进行处理，最后重新组合赋值给该变量.

```

echo:用来在终端输出字符串，并在最后默认加上换行符。

printf:用来在终端输出。

## 字符串
字符串可以由单引号' '包围，也可以由双引号" "包围，也可以不用引号。它们之间是有区别的

字符串举例：
```

str1=c.biancheng.net
str2="shell script"
str3='C 语言中文网'

```
下面我们说一下三种形式的区别：

1) 由单引号' '包围的字符串：
任何字符都会原样输出，在其中使用变量是无效的。
字符串中不能出现单引号，即使对单引号进行转义也不行。

2) 由双引号" "包围的字符串：
如果其中包含了某个变量，那么该变量会被解析（得到该变量的值），而不是原样输出。
字符串中可以出现双引号，只要它被转义了就行。

3) 不被引号包围的字符串
不被引号包围的字符串中出现变量时也会被解析，这一点和双引号" "包围的字符串一样。
字符串中不能出现空格，否则空格后边的字符串会作为其他变量或者命令解析。

### 获取字符串长度
`${#string_name}`:string_name 表示字符串名字。

### 字符串拼接（连接、合并）
在 Shell 中你不需要使用任何运算符，将两个字符串并排放在一起就能实现拼接

### Shell字符串截取


## 数组
数组（Array）是若干数据的集合，其中的每一份数据都称为元素（Element）。

Shell 并且没有限制数组的大小，理论上可以存放无限量的数据。和 C++、Java、C# 等类似，Shell 数组元素的下标也是从 0 开始计数。

获取数组中的元素要使用下标[ ]，下标可以是一个整数，也可以是一个结果为整数的表达式；当然，下标必须大于等于 0。

遗憾的是，常用的 Bash Shell 只支持一维数组，不支持多维数组。

在 Shell 中，用括号( )来表示数组，数组元素之间用空格来分隔。由此，定义数组的一般形式为：
array_name=(ele1  ele2  ele3 ... elen)

注意，赋值号=两边不能有空格，必须紧挨着数组名和数组元素。

数组是可变的，在定义之后可以进行增加、删除、修改等操作

### 获取数组元素
`${array_name[index]}`:其中，array_name 是数组名，index 是下标。

使用@或*可以获取数组中的所有元素:
```

${nums[*]}
${nums[@]}

```

### 获取数组长度
```

${#array_name[@]}
${#array_name[*]}

```
其中 array_name 表示数组名。两种形式是等价的，选择其一即可。

### 数组合并
```

array_new=(${array1[@]}  ${array2[@]})
array_new=(${array1[*]} ${array2[*]})

```

两种方式是等价的，选择其一即可。其中，array1 和 array2 是需要拼接的数组，array_new 是拼接后形成的新数组。

### 删除数组元素
```

unset array_name[index] # 删除数组元素
unset array_name # 删除数组

```

## 关联数组(“键值对（key-value）”数组)
最新的 Bash Shell 已经支持关联数组了。关联数组使用字符串作为下标，而不是整数，这样可以做到见名知意。

关联数组也称为“键值对（key-value）”数组，键（key）也即字符串形式的数组下标，值（value）也即元素值。

例如，我们可以创建一个叫做 color 的关联数组，并用颜色名字作为下标。
```

declare -A color
color["red"]="#ff0000"
color["green"]="#00ff00"
color["blue"]="#0000ff"

```
也可以在定义的同时赋值：
```

declare -A color=(["red"]="#ff0000", ["green"]="#00ff00", ["blue"]="#0000ff")

```
不同于普通数组，关联数组必须使用带有-A选项的 declare 命令创建。

### 访问关联数组元素
访问关联数组元素的方式几乎与普通数组相同
`array_name["index"]`

### 获取所有元素的下标和值
```

# 获得关联数组的所有元素值：

${array_name[@]}
${array_name[*]}

```

```

# 获取关联数组的所有下标值：

${!array_name[@]}
${!array_name[*]}

```

## 数学计算
|Shell 中常用的六种数学计算方式|
|运算操作符/运算命令	|说明|
|(( ))	|用于整数运算，效率很高，推荐使用。|
|let	|用于整数运算，和 (()) 类似。|
|$[]	|用于整数运算，不如 (()) 灵活。|
|expr	|可用于整数运算，也可以处理字符串。比较麻烦，需要注意各种细节，不推荐使用。|
|bc	|Linux下的一个计算器程序，可以处理整数和小数。Shell 本身只支持整数运算，想计算小数就得使用 bc 这个外部的计算器。|
|declare -i	|将变量定义为整数，然后再进行数学运算时就不会被当做字符串了。功能有限，仅支持最基本的数学运算（加减乘除和取余），不支持逻辑运算、自增自减等，所以在实际开发中很少使用。|
如果大家时间有限，只学习 (()) 和 bc 即可，不用学习其它的了：(()) 可以用于整数计算，bc 可以小数计算。

### (())
(( )) 只能进行整数运算，不能对小数（浮点数）或者字符串进行运算。
Shell (( )) 的用法
双小括号 (( )) 的语法格式为：
((表达式))

通俗地讲，就是将数学运算表达式放在((和))之间。

表达式可以只有一个，也可以有多个，多个表达式之间以逗号,分隔。对于多个表达式的情况，以最后一个表达式的值作为整个 (( )) 命令的执行结果。

可以使用$获取 (( )) 命令的结果，这和使用$获得变量值是类似的。

### bc
Bash Shell 内置了对整数运算的支持，但是并不支持浮点运算，而 Linux bc 命令可以很方便的进行浮点运算，当然整数运算也不再话下。

bc 甚至可以称得上是一种编程语言了，它支持变量、数组、输入输出、分支结构、循环结构、函数等基本的编程元素，所以 Linux 手册中是这样来描述 bc 的：
An arbitrary precision calculator language

翻译过来就是“一个任意精度的计算器语言”。

在终端输入bc命令，然后回车即可进入 bc 进行交互式的数学计算。在 Shell 编程中，我们也可以通过管道和输入重定向来使用 bc。

## 运算符
### 算术运算符

### 关系运算符
基于整数的判断
|选 项			|作 用|
|num1 -eq num2	|判断 num1 是否和 num2 相等。|
|num1 -ne num2	|判断 num1 是否和 num2 不相等。|
|num1 -gt num2	|判断 num1 是否大于 num2 。|
|num1 -lt num2	|判断 num1 是否小于 num2。|
|num1 -ge num2	|判断 num1 是否大于等于 num2。|
|num1 -le num2	|判断 num1 是否小于等于 num2。|

### 布尔运算符
|运算符|说明|举例|
|!|非运算，表达式为 true 则返回 false，否则返回 true。|[ ! false ] 返回 true。|
|-o|或运算，有一个表达式为 true 则返回 true。|[ $a -lt 20 -o $b -gt 100 ] 返回 true。|
|-a|与运算，两个表达式都为 true 才返回 true。|[ $a -lt 20 -a $b -gt 100 ] 返回 false。|


### 字符串运算符
|选 项	作 用|
|-z str	|判断字符串 str 是否为空。|
|-n str	|判断宇符串 str 是否为非空。|
|str1 = str2|判断 str1 是否和 str2 相等。|
|str1 == str2	|=和==是等价的，都用来判断 str1 是否和 str2 相等。|
|str1 != str2	|判断 str1 是否和 str2 不相等。|
|str1 \> str2	|判断 str1 是否大于 str2。\>是>的转义字符，这样写是为了防止>被误认为成重定向运算符。|
|str1 \< str2	|判断 str1 是否小于 str2。同样，\<也是转义字符。|
|$str|检测字符串是否为空，不为空返回 true。|[ $a ] 返回 true。|

### 文件测试运算符
文件测试运算符用于检测 Unix 文件的各种属性。

|文件类型判断|
|选 项	|作 用|
|-b filename	|判断文件是否存在，并且是否为块设备文件。|
|-c filename	|判断文件是否存在，并且是否为字符设备文件。|
|-d filename	|判断文件是否存在，并且是否为目录文件。|
|-e filename	|判断文件是否存在。|
|-f filename	|判断文件是否存在，井且是否为普通文件。|
|-L filename	|判断文件是否存在，并且是否为符号链接文件。|
|-p filename	|判断文件是否存在，并且是否为管道文件。|
|-s filename	|判断文件是否存在，并且是否为非空。|
|-S filename	|判断该文件是否存在，并且是否为套接字文件。|

|文件权限判断|
|选 项	|作 用|
|-r filename	|判断文件是否存在，并且是否拥有读权限。|
|-w filename	|判断文件是否存在，并且是否拥有写权限。|
|-x filename	|判断文件是否存在，并且是否拥有执行权限。|
|-u filename	|判断文件是否存在，并且是否拥有 SUID 权限。|
|-g filename	|判断文件是否存在，并且是否拥有 SGID 权限。|
|-k filename	|判断该文件是否存在，并且是否拥有 SBIT 权限。|

|文件比较|
|选 项	|作 用|
|filename1 -nt filename2	|判断 filename1 的修改时间是否比 filename2 的新。|
|filename -ot filename2		|判断 filename1 的修改时间是否比 filename2 的旧。|
|filename1 -ef filename2	|判断 filename1 是否和 filename2 的 inode 号一致，可以理解为两个文件是否为同一个文件。这个判断用于判断硬链接是很好的方法|

## 条件判断
### if
语句中的 condition 用法都是一样的，你可以使用 test 或 [] 命令，也可以使用 (()) 或 [[]]，
语法格式为：
```

if condition
then
statement(s)
fi

```
condition是判断条件，如果 condition 成立（返回“真”），那么 then 后边的语句将会被执行；如果 condition 不成立（返回“假”），那么不会执行任何语句。

也可以将 then 和 if 写在一行：
```

if condition; then
statement(s)
fi

```
请注意 condition 后边的分号;，当 if 和 then 位于同一行的时候，这个分号是必须的，否则会有语法错误。

### if else
格式为：
```

if condition
then
statement1
else
statement2
fi

```
### if elif else
格式为：
```

if condition1
then
statement1
elif condition2
then
statement2
elif condition3
then
statement3
……
else
statementn
fi

```

### case in
格式如下：
```

case expression in
pattern1)
statement1
;;
pattern2)
statement2
;;
pattern3)
statement3
;;
……
\*)
statementn
esac

```
case、in 和 esac 都是 Shell 关键字，expression 表示表达式，pattern 表示匹配模式。
expression 既可以是一个变量、一个数字、一个字符串，还可以是一个数学计算表达式，或者是命令的执行结果，只要能够得到 expression 的值就可以。
pattern 可以是一个数字、一个字符串，甚至是一个简单的正则表达式。

case 会将 expression  的值与 pattern1、pattern2、pattern3 逐个进行匹配：
如果 expression 和某个模式（比如 pattern2）匹配成功，就会执行这模式（比如 pattern2）后面对应的所有语句（该语句可以有一条，也可以有多条），直到遇见双分号;;才停止；然后整个 case 语句就执行完了，程序会跳出整个 case 语句，执行 esac 后面的其它语句。
如果 expression 没有匹配到任何一个模式，那么就执行*)后面的语句（*表示其它所有值），直到遇见双分号;;或者esac才结束。*)相当于多个 if 分支语句中最后的 else 部分。

case in 的 pattern 部分支持简单的正则表达式，具体来说，可以使用以下几种格式：
|格式	|说明|
|*		|表示任意字符串。|
|[abc]	|表示 a、b、c 三个字符中的任意一个。比如，[15ZH] 表示 1、5、Z、H 四个字符中的任意一个。|
|[m-n]	|表示从 m 到 n 的任意一个字符。比如，[0-9] 表示任意一个数字，[0-9a-zA-Z] 表示字母或数字。|
|\|		|表示多重选择，类似逻辑运算中的或运算。比如，abc | xyz 表示匹配字符串 "abc" 或者 "xyz"。|


## 循环
### while
语句中的 condition 用法都是一样的，你可以使用 test 或 [] 命令，也可以使用 (()) 或 [[]]，
用法如下：
```

while condition
do
statements
done

```
condition表示判断条件，statements表示要执行的语句（可以只有一条，也可以有多条），do和done都是 Shell 中的关键字。

while 循环的执行流程为：
先对 condition 进行判断，如果该条件成立，就进入循环，执行 while 循环体中的语句，也就是 do 和 done 之间的语句。这样就完成了一次循环。
每一次执行到 done 的时候都会重新判断 condition 是否成立，如果成立，就进入下一次循环，继续执行 do 和 done 之间的语句，如果不成立，就结束整个 while 循环，执行 done 后面的其它 Shell 代码。
如果一开始 condition 就不成立，那么程序就不会进入循环体，do 和 done 之间的语句就没有执行的机会。

### until
unti 循环和 while 循环恰好相反，当判断条件不成立时才进行循环，一旦判断条件成立，就终止循环。

until 的使用场景很少，一般使用 while 即可。

Shell until 循环的用法如下：
```

until condition
do
statements
done

```

condition表示判断条件，statements表示要执行的语句（可以只有一条，也可以有多条），do和done都是 Shell 中的关键字。

until 循环的执行流程为：
先对 condition 进行判断，如果该条件不成立，就进入循环，执行 until 循环体中的语句（do 和 done 之间的语句），这样就完成了一次循环。
每一次执行到 done 的时候都会重新判断 condition 是否成立，如果不成立，就进入下一次循环，继续执行循环体中的语句，如果成立，就结束整个 until 循环，执行 done 后面的其它 Shell 代码。
如果一开始 condition 就成立，那么程序就不会进入循环体，do 和 done 之间的语句就没有执行的机会。

### for
#### C语言风格的 for 循环
用法如下：
```

for((exp1; exp2; exp3))
do
statements
done

```
几点说明：
exp1、exp2、exp3 是三个表达式，其中 exp2 是判断条件，for 循环根据 exp2 的结果来决定是否继续下一次循环；
statements 是循环体语句，可以有一条，也可以有多条；
do 和 done 是 Shell 中的关键字。

它的运行过程为：
1) 先执行 exp1。

2) 再执行 exp2，如果它的判断结果是成立的，则执行循环体中的语句，否则结束整个 for 循环。

3) 执行完循环体后再执行 exp3。

4) 重复执行步骤 2) 和 3)，直到 exp2 的判断结果不成立，就结束循环。

上面的步骤中，2) 和 3) 合并在一起算作一次循环，会重复执行，for 语句的主要作用就是不断执行步骤 2) 和 3)。

exp1 仅在第一次循环时执行，以后都不会再执行，可以认为这是一个初始化语句。exp2 一般是一个关系表达式，决定了是否还要继续下次循环，称为“循环条件”。exp3 很多情况下是一个带有自增或自减运算的表达式，以使循环条件逐渐变得“不成立”。

for 循环中的 exp1（初始化语句）、exp2（判断条件）和 exp3（自增或自减）都是可选项，都可以省略（但分号;必须保留）.


#### Python 风格的 for in 循环
用法如下：
```

for variable in value_list
do
statements
done

```

variable 表示变量，value_list 表示取值列表，in 是 Shell 中的关键字。
in value_list 部分可以省略，省略后的效果相当于 in $@，

每次循环都会从 value_list 中取出一个值赋给变量 variable，然后进入循环体（do 和 done 之间的部分），执行循环体中的 statements。直到取完 value_list 中的所有值，循环就结束了。

##### value_list的说明
###### 直接给出具体的值
可以在 in 关键字后面直接给出具体的值，多个值之间以空格分隔，比如1 2 3 4 5、"abc" "390" "tom"等。

###### 给出一个取值范围
给出一个取值范围的具体格式为：`{start..end}`

start 表示起始值，end 表示终止值；注意中间用两个点号相连，而不是三个点号。这种形式只支持数字和字母。

###### 使用命令的执行结果

###### 使用 Shell 通配符
shell 通配符 / glob 模式通常用来匹配目录以及文件，而不是文本！！！

|字符				|解释|
|*					|匹配任意长度任意字符|
|?					|匹配任意单个字符|
|[list]				|匹配指定范围内（list）任意单个字符，也可以是单个字符组成的集合|
|[^list]			|匹配指定范围外的任意单个字符或字符集合|
|[!list]			|同[^list]|
|{str1,str2,...}	|匹配 srt1 或者 srt2 或者更多字符串，也可以是集合|


|字符		|意义|
|[:alnum:]	|任意数字或者字母|
|[:alpha:]	|任意字母|
|[:space:]	|空格|
|[:lower:]	|小写字母|
|[:digit:]	|任意数字|
|[:upper:]	|任意大写字母|
|[:cntrl:]	|控制符|
|[:graph:]	|图形|
|[:print:]	|可打印字符|
|[:punct:]	|标点符号|
|[:xdigit:]	|十六进制数|
|[:blank:]	|空白字符（未验证）|

###### 使用特殊变量

### select in
select in 循环用来增强交互性，它可以显示出带编号的菜单，用户输入不同的编号就可以选择不同的菜单，并执行不同的功能。

用法如下：
```

select variable in value_list
do
statements
done

```

例子：
```

#!/bin/bash
echo "What is your favourite OS?"
select name in "Linux" "Windows" "Mac OS" "UNIX" "Android"
do
echo $name
done
echo "You have selected $name"

```

运行结果：
```

What is your favourite OS?

1. Linux
2. Windows
3. Mac OS
4. UNIX
5. Android
   #? 4↙
   You have selected UNIX
   #? 1↙
   You have selected Linux
   #? 9↙
   You have selected
   #? 2↙
   You have selected Windows
   #?^D

```
>#?用来提示用户输入菜单编号；^D表示按下 Ctrl+D 组合键，它的作用是结束 select in 循环。
运行到 select 语句后，取值列表 value_list 中的内容会以菜单的形式显示出来，用户输入菜单编号，就表示选中了某个值，这个值就会赋给变量 variable，然后再执行循环体中的 statements（do 和 done 之间的部分）。
每次循环时 select 都会要求用户输入菜单编号，并使用环境变量 PS3 的值作为提示符，PS3 的默认值为#?，修改 PS3 的值就可以修改提示符。
如果用户输入的菜单编号不在范围之内，例如上面我们输入的 9，那么就会给 variable 赋一个空值；如果用户输入一个空值（什么也不输入，直接回车），会重新显示一遍菜单。

注意，select 是无限循环（死循环），输入空值，或者输入的值无效，都不会结束循环，只有遇到 break 语句，或者按下 Ctrl+D 组合键才能结束循环。

select in 通常和 case in 一起使用，在用户输入不同的编号时可以做出不同的反应。

```

#!/bin/bash

echo "What is your favourite OS?"
select name in "Linux" "Windows" "Mac OS" "UNIX" "Android"
do
case $name in
"Linux")
echo "Linux 是一个类 UNIX 操作系统，它开源免费，运行在各种服务器设备和嵌入式设备。"
break
;;
"Windows")
echo "Windows 是微软开发的个人电脑操作系统，它是闭源收费的。"
break
;;
"Mac OS")
echo "Mac OS 是苹果公司基于 UNIX 开发的一款图形界面操作系统，只能运行与苹果提供的硬件之上。"
break
;;
"UNIX")
echo "UNIX 是操作系统的开山鼻祖，现在已经逐渐退出历史舞台，只应用在特殊场合。"
break
;;
"Android")
echo "Android 是由 Google 开发的手机操作系统，目前已经占据了 70%的市场份额。"
break
;;
\*)
echo "输入错误，请重新输入"
esac
done

```

### break和continue跳出循环详解
使用 while、until、for、select 循环时，如果想提前结束循环（在不满足结束条件的情况下结束循环），可以使用 break 或者 continue 关键字。

在C语言、C++、C#、Python、Java 等大部分编程语言中，break 和 continue 只能跳出当前层次的循环，内层循环中的 break 和 continue 对外层循环不起作用；但是 Shell 中的 break 和 continue 却能够跳出多层循环，也就是说，内层循环中的 break 和 continue 能够跳出外层循环。

在实际开发中，break 和 continue 一般只用来跳出当前层次的循环，很少有需要跳出多层循环的情况。

#### break 关键字
Shell break 关键字的用法为：`break n`

n 表示跳出循环的层数，如果省略 n，则表示跳出当前的整个循环。break 关键字通常和 if 语句一起使用，即满足条件时便跳出循环。

#### continue 关键字
Shell continue 关键字的用法为：
continue n

n 表示循环的层数：
如果省略 n，则表示 continue 只对当前层次的循环语句有效，遇到 continue 会跳过本次循环，忽略本次循环的剩余代码，直接进入下一次循环。
如果带上 n，比如 n 的值为 2，那么 continue 对内层和外层循环语句都有效，不但内层会跳过本次循环，外层也会跳过本次循环，其效果相当于内层循环和外层循环同时执行了不带 n 的 continue。这么说可能有点难以理解，稍后我们通过代码来演示。

continue 关键字也通常和 if 语句一起使用，即满足条件时便跳出循环。

## 函数
Shell 函数必须先定义后使用
Shell 函数定义的语法格式如下：
```

function name() {
statements
[return value]
}

```

对各个部分的说明：
function是 Shell 中的关键字，专门用来定义函数，可以省略，如果写了 function 关键字，也可以省略函数名后面的小括号；
name是函数名；
statements是函数要执行的代码，也就是一组语句；
return value表示函数的返回值，其中 return 是 Shell 关键字，专门用在函数中返回一个值；这一部分可以写也可以不写。

由{ }包围的部分称为函数体，调用一个函数，实际上就是执行函数体中的代码。

### 函数的调用、返回值
调用函数只需要给出函数名，不需要加括号。

函数返回值
1）可以显式增加return语句；如果不加，会将最后一条命令运行结果作为返回值。

Shell 函数返回值只能是整数，一般用来表示函数执行成功与否，0表示成功，其他值表示失败。如果 return 其他数据，比如一个字符串，往往会得到错误提示：“numeric argument required”。

2）使用全局变量
如果一定要让函数返回字符串，那么可以先定义一个变量，用来接收函数的计算结果，脚本在需要的时候访问这个变量来获得函数返回值。但是有bug

3）echo 返回值
安全的返回方式，即通过输出到标准输出返回。因为子进程会继承父进程的标准输出，因此，子进程的输出也就直接反应到父进程。因此不存在上面提到的由于管道导致返回值失效的情况。在外边只需要获取函数的返回值即可。

但是有一点一定要注意，不能向标准输出一些不是结果的东西（也就是说，不能随便echo一些不需要的信息），比如调试信息，这些信息可以重定向到一个文件中解决，特别要注意的是，脚本中用到其它类似grep这样的命令的时候，一定要记得1>/dev/null 2>&1来空这些输出信息输出到空设备，避免这些命令的输出。


总结：
1）用变量接收函数返回值，函数用echo等标准输出将要返回的东西打印出来。

2）用$?来接收函数的执行状态，但是$?要紧跟在函数调用处的后面。

## 重定向
### 输出重定向
|类 型|符 号|作 用|
|标准输出重定向|command >file|以覆盖的方式，把 command 的正确输出结果输出到 file 文件中。|
|command >>file|以追加的方式，把 command 的正确输出结果输出到 file 文件中。|
|标准错误输出重定向|command 2>file|以覆盖的方式，把 command 的错误信息输出到 file 文件中。|
|command 2>>file|以追加的方式，把 command 的错误信息输出到 file 文件中。|
|正确输出和错误信息同时保存|command >file 2>&1|以覆盖的方式，把正确输出和错误信息同时保存到同一个文件（file）中。|
|command >>file 2>&1|以追加的方式，把正确输出和错误信息同时保存到同一个文件（file）中。|
|command >file1 2>file2|以覆盖的方式，把正确的输出结果输出到 file1 文件中，把错误信息输出到 file2 文件中。|
|command >>file1  2>>file2|以追加的方式，把正确的输出结果输出到 file1 文件中，把错误信息输出到 file2 文件中。|
|command >file 2>file|【不推荐】这两种写法会导致 file 被打开两次，引起资源竞争，所以 stdout 和 stderr 会互相覆盖，|


### 输入重定向
|符号|说明|
|command <file|将 file 文件中的内容作为 command 的输入。|
|command <<END|从标准输入（键盘）中读取数据，直到遇见分界符 END 才停止（分界符可以是任意的字符串，用户自己定义）。|
|command <file1 >file2|将 file1 作为 command 的输入，并将 command 的处理结果输出到 file2。|


### 文件描述符
<tbody>
		<tr>
			<th>
				分类</th>
			<th>
				用法</th>
			<th>
				说明</th>
		</tr>
		<tr>
			<td colspan="1" rowspan="4">
				输出</td>
			<td>
				n&gt;filename</td>
			<td>
				以输出的方式打开文件 filename，并绑定到文件描述符 n。n 可以不写，默认为 1，也即标准输出文件。</td>
		</tr>
		<tr>
			<td>
				n&gt;&amp;m</td>
			<td>
				用文件描述符 m 修改文件描述符 n，或者说用文件描述符 m 的内容覆盖文件描述符 n，结果就是 n 和 m 都代表了同一个文件，因为 n 和 m 的文件指针都指向了同一个文件。<br>
				<br>
				因为使用的是<code>&gt;</code>，所以 n 和 m 只能用作命令的输出文件。n 可以不写，默认为 1。</td>
		</tr>
		<tr>
			<td>
				n&gt;&amp;-</td>
			<td>
				关闭文件描述符 n 及其代表的文件。n 可以不写，默认为 1。</td>
		</tr>
		<tr>
			<td>
				&amp;&gt;filename</td>
			<td>
				将正确输出结果和错误信息全部重定向到 filename。</td>
		</tr>
		<tr>
			<td colspan="1" rowspan="3">
				输入</td>
			<td>
				n&lt;filename</td>
			<td>
				以输入的方式打开文件 filename，并绑定到文件描述符 n。n 可以不写，默认为 0，也即标准输入文件。</td>
		</tr>
		<tr>
			<td>
				n&lt;&amp;m</td>
			<td>
				类似于 n&gt;&amp;m，但是因为使用的是<code>&lt;</code>，所以 n 和 m 只能用作命令的输入文件。n 可以不写，默认为 0。</td>
		</tr>
		<tr>
			<td>
				n&lt;&amp;-</td>
			<td>
				关闭文件描述符 n 及其代表的文件。n 可以不写，默认为 0。</td>
		</tr>
		<tr>
			<td>
				输入和输出</td>
			<td>
				n&lt;&gt;filename</td>
			<td>
				同时以输入和输出的方式打开文件 filename，并绑定到文件描述符 n，相当于&nbsp;n&gt;filename 和&nbsp;n&lt;filename 的总和。。n 可以不写，默认为 0。</td>
		</tr>
	</tbody>
**还有点疑惑，留个链接http://c.biancheng.net/view/3075.html**

### 使用exec命令操作文件描述符
exec 是 Shell 内置命令，它有两种用法，一种是执行 Shell 命令，一种是操作文件描述符。本节只讲解后面一种，前面一种请大家自行学习。

使用 exec 命令可以永久性地重定向，后续命令的输入输出方向也被确定了，直到再次遇到 exec 命令才会改变重定向的方向；换句话说，一次重定向，永久有效。

请看下面的例子：
```

[mozhiyan@localhost ~]$ echo "c.biancheng.net" > log.txt
[mozhiyan@localhost ~]$ echo "C 语言中文网"
C 语言中文网
[mozhiyan@localhost ~]$ cat log.txt
c.biancheng.net

```
第一个 echo 命令使用了重定向，将内容输出到 log.txt 文件；第二个 echo 命令没有再次使用重定向，内容就直接输出到显示器上了。很明显，重定向只对第一个 echo 有效，对第二个 echo 无效。

有些脚本文件的输出内容很多，我们不希望直接输出到显示器上，或者我们需要把输出内容备份到文件中，方便以后检索，按照以前的思路，必须在每个命令后面都使用一次重定向，写起来非常麻烦。如果以后想修改重定向的方向，那工作量也是不小的。

exec 命令就是为解决这种困境而生的，它可以让重定向对当前 Shell 进程中的所有命令有效，它的用法为：`exec 文件描述符操作`

在《结合Linux文件描述符谈重定向，彻底理解重定向的本质》一节讲到的所有对文件描述符的操作方式 exec 都支持，请看下面的例子：
```

[mozhiyan@localhost ~]$ echo "重定向未发生"
重定向未发生
[mozhiyan@localhost ~]$ exec >log.txt
[mozhiyan@localhost ~]$ echo "c.biancheng.net"
[mozhiyan@localhost ~]$ echo "C 语言中文网"
[mozhiyan@localhost ~]$ exec >&2
[mozhiyan@localhost ~]$ echo "重定向已恢复"
重定向已恢复
[mozhiyan@localhost ~]$ cat log.txt
c.biancheng.net
C 语言中文网

```
对代码的说明：
exec >log.txt将当前 Shell 进程的所有标准输出重定向到 log.txt 文件，它等价于exec 1>log.txt。
后面的两个 echo 命令都没有在显示器上输出，而是输出到了 log.txt 文件。
exec >&2用来恢复重定向，让标准输出重新回到显示器，它等价于exec 1>&2。2 是标准错误输出的文件描述符，它也是输出到显示器，并且没有遭到破坏，我们用 2 来覆盖 1，就能修复 1，让 1 重新指向显示器。
接下来的 echo 命令将结果输出到显示器上，证明exec >&2奏效了。
最后我们用 cat 命令来查看 log.txt 文件的内容，发现就是中间两个 echo 命令的输出。
重定向的恢复
类似echo "1234" >log.txt这样的重定向只是临时的，当前命名执行完毕后会自动恢复到显示器，我们不用担心。但是诸如exec >log.txt这种使用 exec 命令的重定向都是持久的，如果我们想再次回到显示器，就必须手动恢复。

以输出重定向为例，手动恢复的方法有两种：
/dev/tty 文件代表的就是显示器，将标准输出重定向到 /dev/tty 即可，也就是 exec >/dev/tty。
如果还有别的文件描述符指向了显示器，那么也可以别的文件描述符来恢复标号为 1 的文件描述符，例如 exec >&2。注意，如果文件描述符 2 也被重定向了，那么这种方式就无效了。



### Shell代码块重定向
所谓代码块，就是由多条语句组成的一个整体；for、while、until 循环，或者 if...else、case...in 选择结构，或者由{ }包围的命令都可以称为代码块。

```

#!/bin/bash
sum=0
while read n; do
((sum += n))
echo "this number: $n"
done <nums.txt >log.txt  #同时使用输入输出重定向
echo "sum=$sum"

```

```

#!/bin/bash
{
echo "C 语言中文网";
echo "http://c.biancheng.net";
echo "7"
} >log.txt #输出重定向
{
read name;
read url;
read age
} <log.txt #输入重定向
echo "$name已经$age 岁了，它的网址是 $url"

```

## 组命令
所谓组命令，就是将多个命令划分为一组，或者看成一个整体。

Shell 组命令的写法有两种：
```

{ command1; command2; command3; . . . }
(command1; command2; command3;. . . )

```
两种写法的区别在于：由花括号{}包围起来的组命名在当前 Shell 进程中执行，而由小括号()包围起来的组命令会创建一个子 Shell，所有命令都在子 Shell 中执行。

对于第一种写法，花括号和命令之间必须有一个空格，并且最后一个命令必须用一个分号或者一个换行符结束。

子 Shell 就是一个子进程，是通过当前 Shell 进程创建的一个新进程。


例如，下面的代码将多个命令的输出重定向到 out.txt：
```

ls -l > out.txt #>表示覆盖
echo "http://c.biancheng.net/shell/" >> out.txt #>>表示追加
cat readme.txt >> out.txt

```
本段代码共使用了三次重定向。

借助组命令，我们可以将以上三条命令合并在一起，简化成一次重定向：
```

{ ls -l; echo "http://c.biancheng.net/shell/"; cat readme.txt; } > out.txt

```
或者写作：
```

(ls -l; echo "http://c.biancheng.net/shell/"; cat readme.txt) > out.txt

```
使用组命令技术，我们节省了一些打字时间。

类似的道理，我们也可以将组命令和管道结合起来：
{ ls -l; echo "http://c.biancheng.net/shell/"; cat readme.txt; } | lpr

这里我们把三个命令的输出结果合并在一起，并把它们用管道输送给命令 lpr 的输入，以便产生一个打印报告。
两种组命令形式的对比
虽然两种 Shell 组命令形式看起来相似，它们都能用在重定向中合并输出结果，但两者之间有一个很重要的不同：由{}包围的组命令在当前 Shell 进程中执行，由()包围的组命令会创建一个子Shell，所有命令都会在这个子 Shell 中执行。

在子 Shell 中执行意味着，运行环境被复制给了一个新的 shell 进程，当这个子 Shell 退出时，新的进程也会被销毁，环境副本也会消失，所以在子 Shell 环境中的任何更改都会消失（包括给变量赋值）。因此，在大多数情况下，除非脚本要求一个子 Shell，否则使用{}比使用()更受欢迎，并且{}的进行速度更快，占用的内存更少。

## 进程替换
http://c.biancheng.net/view/3025.html

## 子Shell和子进程
[](https://www.csdn.net/tags/MtzaEgzsNjc4ODctYmxvZwO0O0OO0O0O.html)

[](http://c.biancheng.net/view/3015.html)
对于 Shell 来说，以新进程的方式运行脚本文件，比如bash ./test.sh、chmod +x ./test.sh; ./test.sh，或者在当前 Shell 中使用 bash 命令启动新的 Shell，它们都属于第二种创建子进程的方式，所以子进程除了能继承父进程的环境变量外，基本上也不能使用父进程的什么东西了，比如，父进程的全局变量、局部变量、文件描述符、别名等在子进程中都无效。

但是，组命令、命令替换、管道这几种语法都使用第一种方式创建进程，所以子进程可以使用父进程的一切，包括全局变量、局部变量、别名等。我们将这种子进程称为子 Shell（sub shell）。

子 Shell 虽然能使用父 Shell 的的一切，但是如果子 Shell 对数据做了修改，比如修改了全局变量，那么这种修改只能停留在子 Shell，无法传递给父 Shell。不管是子进程还是子 Shell，都是“传子不传父”。

## 管道
Shell 还有一种功能，就是可以将两个或者多个命令（程序或者进程）连接到一起，把一个命令的输出作为下一个命令的输入，以这种方式连接的两个或者多个命令就形成了管道（pipe）。

Linux 管道使用竖线|连接多个命令，这被称为管道符。Linux 管道的具体语法格式如下：
```

command1 | command2
command1 | command2 [ | commandN... ]

```

当在两个命令之间设置管道时，管道符|左边命令的输出就变成了右边命令的输入。只要第一个命令向标准输出写入，而第二个命令是从标准输入读取，那么这两个命令就可以形成一个管道。大部分的 Linux 命令都可以用来形成管道。
这里需要注意，command1 必须有正确输出，而 command2 必须可以处理 command2 的输出结果；而且 command2 只能处理 command1 的正确输出结果，不能处理 command1 的错误信息。

## 过滤器
我们己经知道，将几个命令通过管道符组合在一起就形成一个管道。通常，通过这种方式使用的命令就被称为过滤器。过滤器会获取输入，通过某种方式修改其内容，然后将其输出。

简单地说，过滤器可以概括为以下两点：
如果一个 Linux 命令是从标准输入接收它的输入数据，并在标准输出上产生它的输出数据（结果），那么这个命令就被称为过滤器。
过滤器通常与 Linux 管道一起使用。

常用的被作为过滤器使用的命令如下所示：
|命令|说明|
|awk|用于文本处理的解释性程序设计语言，通常被作为数据提取和报告的工具。|
|cut|用于将每个输入文件（如果没有指定文件则为标准输入）的每行的指定部分输出到标准输出。|
|grep|用于搜索一个或多个文件中匹配指定模式的行。|
|tar|用于归档文件的应用程序。|
|head|用于读取文件的开头部分（默认是 10 行）。如果没有指定文件，则从标准输入读取。|
|paste|用于合并文件的行。|
|sed|用于过滤和转换文本的流编辑器。|
|sort|用于对文本文件的行进行排序。|
|split|用于将文件分割成块。|
|strings|用于打印文件中可打印的字符串。|
|tac|与 cat 命令的功能相反，用于倒序地显示文件或连接文件。|
|tail|用于显示文件的结尾部分。|
|tee|用于从标准输入读取内容并写入到标准输出和文件。|
|tr|用于转换或删除字符。|
|uniq|用于报告或忽略重复的行。|
|wc|用于打印文件中的总行数、单词数或字节数。|

## shell 模块化
所谓模块化，就是把代码分散到多个文件或者文件夹。对于大中型项目，模块化是必须的，否则会在一个文件中堆积成千上万行代码，这简直是一种灾难。

source 命令的用法为：`source filename`

也可以简写为：`. filename`

两种写法的效果相同。对于第二种写法，注意点号.和文件名中间有一个空格。

source 是 Shell 内置命令的一种，它会读取 filename 文件中的代码，并依次执行所有语句。你也可以理解为，source 命令会强制执行脚本文件中的全部命令，而忽略脚本文件的权限。

source 后边可以使用相对路径，也可以使用绝对路径，这里我们使用的是相对路径。

### 避免重复引入
熟悉 C/C++ 的读者都知道，C/C++ 中的头文件可以避免被重复引入；换句话说，即使被多次引入，效果也相当于一次引入。这并不是 #include 的功劳，而是我们在头文件中进行了特殊处理。

Shell source 命令和 C/C++ 中的 #include 类似，都没有避免重复引入的功能，只要你使用一次 source，它就引入一次脚本文件中的代码。

那么，在 Shell 中究竟该如何避免重复引入呢？

我们可以在模块中额外设置一个变量，使用 if 语句来检测这个变量是否存在，如果发现这个变量存在，就 return 出去。

这里需要强调一下 return 关键字。return 在 C++、C#、Java 等大部分编程语言中只能退出函数，除此以外再无他用；但是在 Shell 中，return 除了可以退出函数，还能退出由 source 命令引入的脚本文件。

所谓退出脚本文件，就是在被 source 引入的脚本文件（子文件）中，一旦遇到 return 关键字，后面的代码都不会再执行了，而是回到父脚本文件中继续执行 source 命令后面的代码。

return 只能退出由 source 命令引入的脚本文件，对其它引入脚本的方式无效。

下面我们通过一个实例来演示如何避免脚本文件被重复引入。本例会涉及到两个脚本文件，分别是主文件 main.sh 和 模块文件 module.sh。

模块文件 module.sh：
```

if [ -n "$__MODULE_SH__" ]; then
return
fi
**MODULE_SH**='module.sh'
echo "http://c.biancheng.net/shell/"

```
注意第一行代码，一定要是使用双引号把$__MODULE_SH__包围起来，具体原因已经在《Shell test》一节中讲到。

主文件 main.sh：
```

#!/bin/bash
source module.sh
source module.sh
echo "here executed"

```
./表示当前文件，你也可以直接写作source module.sh。

运行 main.sh，输出结果为：
```

http://c.biancheng.net/shell/
here executed

```
我们在 main.sh 中两次引入 module.sh，但是只执行了一次，说明第二次引入是无效的。

main.sh 中的最后一条 echo 语句产生了输出结果，说明 return 只是退出了子文件，对父文件没有影响。
```
