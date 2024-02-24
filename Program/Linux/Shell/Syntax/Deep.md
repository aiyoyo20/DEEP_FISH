# 说明

记录 shell 中难度较高的一些内容

## 单引号和双引号的区别

以单引号`'`包围变量的值时，单引号里面是什么就输出什么，即使内容中有变量和命令（命令需要反引起来）也会把它们原样输出。这种方式比较适合定义显示纯字符串的情况，即不希望解析变量、命令等的场景。

以双引号`"`包围变量的值时，输出时会先解析里面的变量和命令，而不是把双引号中的变量名和命令原样输出。这种方式比较适合字符串中附带有变量和命令并且想将其解析后再输出的变量定义。

## 只读变量

使用 readonly 命令可以将变量定义为只读变量，只读变量的值不能被改变。

## 删除变量

使用 unset 命令可以删除变量。语法：`unset variable_name`,变量被删除后不能再次使用；unset 命令不能删除只读变量。

## 特殊变量

Shell 特殊变量及其含义

| 变量 | 含义                                                                                                               |
| ---- | ------------------------------------------------------------------------------------------------------------------ |
| $0   | 当前脚本的文件名。                                                                                                 |
| $n   | （n≥1） 传递给脚本或函数的参数。n 是一个数字，表示第几个参数。例如，第一个参数是 $1，第二个参数是 $2。             |
| $#   | 传递给脚本或函数的参数个数。                                                                                       |
| $\*  | 传递给脚本或函数的所有参数。                                                                                       |
| $@   | 传递给脚本或函数的所有参数。当被双引号" "包含时，$@ 与 $* 稍有不同，我们将在《Shell $*和$@的区别》一节中详细讲解。 |
| $?   | 上个命令的退出状态，或函数的返回值，我们将在《Shell $?》一节中详细讲解。                                           |
| $$   | 当前 Shell 进程 ID。对于 Shell 脚本，就是这些脚本所在的进程 ID。                                                   |

## 环境变量

[Linux 环境变量](.docs/Linux 环境变量-CJavaPy.pdf)

PATH 环境变量导入的优先级，`echo $PATH` 查看`/home/fiki/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl`，自己安装的 python 在`/home/fiki/.local/bin`中，所以覆盖掉了系统自身的`python3`，`.bashrc`时最后加载的，所以如果在里面定义的路径的内容会覆盖掉之前的，换言之拥有最高优先级

## Shell `$*`和`$@`的区别

当 `$*` 和 `$@` 不被双引号`" "`包围时，它们之间没有任何区别，都是将接收到的每个参数看做一份数据，彼此之间以空格来分隔。

但是当它们被双引号`" "`包含时，就会有区别了：
`$*`会将所有的参数从整体上看做一份数据，而不是把每个参数都看做一份数据。
`$@`仍然将每个参数都看作一份数据，彼此之间是独立的。

比如传递了 5 个参数，那么对于`$*`来说，这 5 个参数会合并到一起形成一份数据，它们之间是无法分割的；而对于"$@"来说，这 5 个参数是相互独立的，它们是 5 份数据。

## shell 命令替换

Shell 命令替换是指将命令的输出结果赋值给某个变量。比如，在某个目录中输入 ls 命令可查看当前目录中所有的文件，但如何将输出内容存入某个变量中呢？这就需要使用命令替换了，这也是 Shell 编程中使用非常频繁的功能。

Shell 中有两种方式可以完成命令替换，一种是反引号`command`，一种是`$(command)`，使用方法如下：

```sh
variable=`commands`
variable=$(commands)
```

其中，variable 是变量名，commands 是要执行的命令。commands 可以只有一个命令，也可以有多个命令，多个命令之间以分号;分隔。

原则上讲，上面提到的两种变量替换的形式是等价的，可以随意使用；但是，反引号毕竟看起来像单引号，有时候会对查看代码造成困扰，而使用 $() 就相对清晰，能有效避免这种混乱。而且有些情况必须使用 $()：$() 支持嵌套，反引号不行。

```sh
Fir_File_Lines=$(wc -l $(ls | sed -n '1p'))
echo "$Fir_File_Lines"
```

要注意的是，`$()`仅在 Bash Shell 中有效，而反引号可在多种 Shell 中生效。

## declare 和 typeset 命令：设置变量属性

declare 命令的用法如下所示：
`declare [+/-] [aAfFgilprtux] [变量名=变量值]`

其中，-表示设置属性，+表示取消属性，aAfFgilprtux 都是具体的选项，它们的含义如下表所示：

| 选项            | 含义                                                       |
| --------------- | ---------------------------------------------------------- |
| -f [name]       | 列出之前由用户在脚本中定义的函数名称和函数体。             |
| -F [name]       | 仅列出自定义函数名称。                                     |
| -g name         | 在 Shell 函数内部创建全局变量。                            |
| -p [name]       | 显示指定变量的属性和值。                                   |
| -a name         | 声明变量为普通数组。                                       |
| -A name         | 声明变量为关联数组（支持索引下标为字符串）。               |
| -i name         | 将变量定义为整数型。                                       |
| -r name[=value] | 将变量定义为只读（不可修改和删除），等价于 readonly name。 |
| -x name[=value] | 将变量设置为环境变量，等价于 export name[=value]。         |

## 变量高级

| 指定方式                | 说明                                                                           |
| ----------------------- | ------------------------------------------------------------------------------ |
| ${parameter-default}    | 如果变量 parameter 没被声明，那么就使用默认值。                                |
| ${parameter:-default}   | 如果变量 parameter 没被设置，那么就使用默认值。                                |
| ${parameter=default}    | 如果变量 parameter 没声明，那么就把它的值设为default。                         |
| ${parameter:=default}   | 如果变量 parameter 没设置，那么就把它的值设为 default。                        |
| ${parameter+alt_value}  | 如果变量 parameter 被声明了，那么就使用alt_value，否则就使用null字符串。       |
| ${parameter:+alt_value} | 如果变量 parameter 被设置了，那么就使用 alt_value，否则就使用 null 字符串。    |
| ${parameter?err_msg}    | 如果变量 parameter 已经被声明，那么就使用设置的值，否则打印err_msg错误消息。   |
| ${parameter:?err_msg}   | 如果变量 parameter 已经被设置，那么就使用设置的值，否则打印 err_msg 错误消息。 |

`${var#Pattern}`, `${var##Pattern}`从变量`$var`的开头删除最短或最长匹配`$Pattern`的子串。
“#”表示匹配最短，“##”表示匹配最长。

`${var%Pattern}`, `${var%%Pattern}` 从变量`$var`的结尾删除最短或最长匹配`$Pattern`的子串。
“%”表示匹配最短，“%%”表示匹配最长。

`${var:pos}` 变量var从位置pos开始扩展， 也就是pos之前的字符都丢弃。
`${var:pos:len}` 变量 var 从位置 pos 开始，并扩展 len 个字符。
`${var/Pattern/Replacement}` 使用Replacement来替换变量var中第一个匹配Pattern的字符串。
`${var//Pattern/Replacement}` 全局替换。所有在变量 var 匹配 Pattern 的字符串，都会被替换为 Replacement。
`${var/#Pattern/Replacement}` 如果变量var的前缀匹配Pattern，那么就使用Replacement来替换匹配到Pattern的字符串。
`${var/%Pattern/Replacement}` 如果变量 var 的后缀匹配 Pattern，那么就使用 Replacement 来替换匹配到 Pattern 的字符串。

## 变量的间接引用

假设一个变量的值是第二个变量的名字。如果 a=letter_of_alphabet 并且 letter_of_alphabet=z，

它被称为间接引用。我们能够通过引用变量 a 来获得 z，它使用 `eval var1=\$$var2 `这种不平常的形式。

```sh
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

## 字符串

字符串可以由单引号`' '`包围，也可以由双引号`" "`包围，也可以不用引号。它们之间是有区别的

三种形式的区别：

1. 由单引号' '包围的字符串：
   任何字符都会原样输出，在其中使用变量是无效的。
   字符串中不能出现单引号，即使对单引号进行转义也不行。

2. 由双引号" "包围的字符串：
   如果其中包含了某个变量，那么该变量会被解析（得到该变量的值），而不是原样输出。
   字符串中可以出现双引号，只要它被转义了就行。

3. 不被引号包围的字符串
   不被引号包围的字符串中出现变量时也会被解析，这一点和双引号" "包围的字符串一样。
   字符串中不能出现空格，否则空格后边的字符串会作为其他变量或者命令解析。

### 获取字符串长度

`${#string_name}`:string_name 表示字符串名字。

### 字符串拼接（连接、合并）

在 Shell 中你不需要使用任何运算符，将两个字符串并排放在一起就能实现拼接

### Shell字符串截取

## 数组

在 Shell 中，用括号`( )`来表示数组，数组元素之间用空格来分隔。由此，定义数组的一般形式为：

`array_name=(ele1 ele2 ele3 ... elen)``

注意，赋值号=两边不能有空格，必须紧挨着数组名和数组元素。

数组是可变的，在定义之后可以进行增加、删除、修改等操作

### 获取数组元素

`${array_name[index]}`:其中，array_name 是数组名，index 是下标。

使用`@`或`*`可以获取数组中的所有元素:

```sh
${nums[*]}
${nums[@]}
```

### 获取数组长度

```sh
${#array_name[@]}
${#array_name[*]}
```

其中 array_name 表示数组名。两种形式是等价的，选择其一即可。

两种方式是等价的，选择其一即可。其中，array1 和 array2 是需要拼接的数组，array_new 是拼接后形成的新数组。

### 删除数组元素

```sh
unset array_name[index] # 删除数组元素
unset array_name # 删除数组
```

## 关联数组(“键值对（key-value）”数组)

最新的 Bash Shell 已经支持关联数组了。关联数组使用字符串作为下标，而不是整数，这样可以做到见名知意。

关联数组也称为“键值对（key-value）”数组，键（key）也即字符串形式的数组下标，值（value）也即元素值。

例如，我们可以创建一个叫做 color 的关联数组，并用颜色名字作为下标。

```sh
declare -A color
color["red"]="#ff0000"
color["green"]="#00ff00"
color["blue"]="#0000ff"
```

也可以在定义的同时赋值：

```sh
declare -A color=(["red"]="#ff0000", ["green"]="#00ff00", ["blue"]="#0000ff")
```

不同于普通数组，关联数组必须使用带有-A选项的 declare 命令创建。

### 访问关联数组元素

访问关联数组元素的方式几乎与普通数组相同`array_name["index"]`

### 获取所有元素的下标和值

```sh
# 获得关联数组的所有元素值：
${array_name[@]}
${array_name[*]}
```

```sh
# 获取关联数组的所有下标值：
${!array_name[@]}
${!array_name[*]}
```

## 数学计算

Shell 中常用的六种数学计算方式简单对比:

1. `(( ))`：  用于整数运算，效率很高，推荐使用。

2. `let`：用于整数运算，和 `(())` 类似。                                      

3. `$[]`：用于整数运算，不如 `(())` 灵活。

4. `expr`：可用于整数运算，也可以处理字符串。比较麻烦，需要注意各种细节，不推荐使用。

5. `bc`：Linux下的一个计算器程序，可以处理整数和小数。Shell 本身只支持整数运算，想计算小数就得使用 bc 这个外部的计算器。 
                                                       |
6. `declare -i` ：

   将变量定义为整数，然后再进行数学运算时就不会被当做字符串了。
   
   功能有限，仅支持最基本的数学运算（加减乘除和取余），不支持逻辑运算、自增自减等，所以在实际开发中很少使用。 |

`(())` 可以用于整数计算，`bc` 可以小数计算。

### (())

`(( ))` 只能进行整数运算，不能对小数（浮点数）或者字符串进行运算。
Shell `(( ))` 的用法

双小括号 `(( ))` 的语法格式为：`((表达式))`

通俗地讲，就是将数学运算表达式放在((和))之间。

表达式可以只有一个，也可以有多个，多个表达式之间以逗号,分隔。对于多个表达式的情况，以最后一个表达式的值作为整个 `(( ))` 命令的执行结果。

可以使用`$`获取 `(( ))` 命令的结果，这和使用$获得变量值是类似的。

### bc

Bash Shell 内置了对整数运算的支持，但是并不支持浮点运算，而 Linux `bc` 命令可以很方便的进行浮点运算，当然整数运算也不再话下。

`bc` 甚至可以称得上是一种编程语言了，它支持变量、数组、输入输出、分支结构、循环结构、函数等基本的编程元素，所以 Linux 手册中是这样来描述 `bc` 的：
An arbitrary precision calculator language

翻译过来就是“一个任意精度的计算器语言”。

在终端输入`bc`命令，然后回车即可进入 `bc` 进行交互式的数学计算。在 Shell 编程中，我们也可以通过管道和输入重定向来使用 `bc`。

## 运算符

### 关系运算符

基于整数的判断

| 选 项         | 作 用                          |
| ------------- | ------------------------------ |
| num1 -eq num2 | 判断 num1 是否和 num2 相等。   |
| num1 -ne num2 | 判断 num1 是否和 num2 不相等。 |
| num1 -gt num2 | 判断 num1 是否大于 num2 。     |
| num1 -lt num2 | 判断 num1 是否小于 num2。      |
| num1 -ge num2 | 判断 num1 是否大于等于 num2。  |
| num1 -le num2 | 判断 num1 是否小于等于 num2。  |

### 布尔运算符

| 运算符 | 说明                                                | 举例                                     |
| ------ | --------------------------------------------------- | ---------------------------------------- |
| !      | 非运算，表达式为 true 则返回 false，否则返回 true。 | [ ! false ] 返回 true。                  |
| -o     | 或运算，有一个表达式为 true 则返回 true。           | [ $a -lt 20 -o $b -gt 100 ] 返回 true。  |
| -a     | 与运算，两个表达式都为 true 才返回 true。           | [ $a -lt 20 -a $b -gt 100 ] 返回 false。 |

### 字符串运算符

| 选 项        | 作 用                                                                               |
| ------------ | ----------------------------------------------------------------------------------- |
| -z str       | 判断字符串 str 是否为空。                                                           |
| -n str       | 判断宇符串 str 是否为非空。                                                         |
| str1 = str2  | 判断 str1 是否和 str2 相等。                                                        |
| str1 == str2 | =和==是等价的，都用来判断 str1 是否和 str2 相等。                                   |
| str1 != str2 | 判断 str1 是否和 str2 不相等。                                                      |
| str1 \> str2 | 判断 str1 是否大于 str2。\>是>的转义字符，这样写是为了防止>被误认为成重定向运算符。 |
| str1 \< str2 | 判断 str1 是否小于 str2。同样，\<也是转义字符。                                     |
| $str         | 检测字符串是否为空，不为空返回 true. [ $a ] 返回 true。                             |

### 文件测试运算符

文件测试运算符用于检测 Unix 文件的各种属性。

文件类型判断

| 选 项       | 作 用                                      |
| ----------- | ------------------------------------------ |
| -b filename | 判断文件是否存在，并且是否为块设备文件。   |
| -c filename | 判断文件是否存在，并且是否为字符设备文件。 |
| -d filename | 判断文件是否存在，并且是否为目录文件。     |
| -e filename | 判断文件是否存在。                         |
| -f filename | 判断文件是否存在，井且是否为普通文件。     |
| -L filename | 判断文件是否存在，并且是否为符号链接文件。 |
| -p filename | 判断文件是否存在，并且是否为管道文件。     |
| -s filename | 判断文件是否存在，并且是否为非空。         |
| -S filename | 判断该文件是否存在，并且是否为套接字文件。 |

文件权限判断

| 选 项       | 作 用                                        |
| ----------- | -------------------------------------------- |
| -r filename | 判断文件是否存在，并且是否拥有读权限。       |
| -w filename | 判断文件是否存在，并且是否拥有写权限。       |
| -x filename | 判断文件是否存在，并且是否拥有执行权限。     |
| -u filename | 判断文件是否存在，并且是否拥有 SUID 权限。   |
| -g filename | 判断文件是否存在，并且是否拥有 SGID 权限。   |
| -k filename | 判断该文件是否存在，并且是否拥有 SBIT 权限。 |

文件比较

| 选 项                   | 作 用                                                                                                                   |
| ----------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| filename1 -nt filename2 | 判断 filename1 的修改时间是否比 filename2 的新。                                                                        |
| filename -ot filename2  | 判断 filename1 的修改时间是否比 filename2 的旧。                                                                        |
| filename1 -ef filename2 | 判断 filename1 是否和 filename2 的 inode 号一致，可以理解为两个文件是否为同一个文件。这个判断用于判断硬链接是很好的方法 |

## 条件判断

### if

### case in

格式如下：

```sh
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
   *)
   statementn
esac
```

case、in 和 esac 都是 Shell 关键字，expression 表示表达式，pattern 表示匹配模式。

expression 既可以是一个变量、一个数字、一个字符串，还可以是一个数学计算表达式，或者是命令的执行结果，只要能够得到 expression 的值就可以。

pattern 可以是一个数字、一个字符串，甚至是一个简单的正则表达式。

case 会将 expression 的值与 pattern1、pattern2、pattern3 逐个进行匹配：

如果 expression 和某个模式（比如 pattern2）匹配成功，就会执行这模式（比如 pattern2）后面对应的所有语句（该语句可以有一条，也可以有多条），直到遇见双分号`;;`才停止；

然后整个 case 语句就执行完了，程序会跳出整个 case 语句，执行 esac 后面的其它语句。

如果 expression 没有匹配到任何一个模式，那么就执行`*)`后面的语句`*)`表示其它所有值），直到遇见双分号;;或者esac才结束。`*)`相当于多个 if 分支语句中最后的 else 部分。

case in 的 pattern 部分支持简单的正则表达式，具体来说，可以使用以下几种格式：

| 格式  | 说明                                                                                     |
| ----- | ---------------------------------------------------------------------------------------- |
| \*    | 表示任意字符串。                                                                         |
| [abc] | 表示 a、b、c 三个字符中的任意一个。比如，[15ZH] 表示 1、5、Z、H 四个字符中的任意一个。   |
| [m-n] | 表示从 m 到 n 的任意一个字符。比如，[0-9] 表示任意一个数字，[0-9a-zA-Z] 表示字母或数字。 |
| \     | 表示多重选择，类似逻辑运算中的或运算。比如，abc                                          |
| xyz   | 表示匹配字符串 "abc" 或者 "xyz"。                                                        |

## 循环

### while

语句中的 condition 用法都是一样的，你可以使用 test 或 [] 命令，也可以使用 (()) 或 [[]]，

用法如下：

```sh
while condition
do
statements
done
```

condition 表示判断条件，statements 表示要执行的语句（可以只有一条，也可以有多条），do 和 done 都是 Shell 中的关键字。

while 循环的执行流程为：

先对 condition 进行判断，如果该条件成立，就进入循环，执行 while 循环体中的语句，也就是 do 和 done 之间的语句。这样就完成了一次循环。

每一次执行到 done 的时候都会重新判断 condition 是否成立，如果成立，就进入下一次循环，继续执行 do 和 done 之间的语句，如果不成立，就结束整个 while 循环，执行 done 后面的其它 Shell 代码。

如果一开始 condition 就不成立，那么程序就不会进入循环体，do 和 done 之间的语句就没有执行的机会。

### until

unti 循环和 while 循环恰好相反，当判断条件不成立时才进行循环，一旦判断条件成立，就终止循环。

until 的使用场景很少，一般使用 while 即可。

Shell until 循环的用法如下：

```sh
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

```sh
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

1. 先执行 exp1。

2. 再执行 exp2，如果它的判断结果是成立的，则执行循环体中的语句，否则结束整个 for 循环。

3. 执行完循环体后再执行 exp3。

4. 重复执行步骤 2) 和 3)，直到 exp2 的判断结果不成立，就结束循环。

上面的步骤中，2) 和 3) 合并在一起算作一次循环，会重复执行，for 语句的主要作用就是不断执行步骤 2) 和 3)。

exp1 仅在第一次循环时执行，以后都不会再执行，可以认为这是一个初始化语句。exp2 一般是一个关系表达式，决定了是否还要继续下次循环，称为“循环条件”。exp3 很多情况下是一个带有自增或自减运算的表达式，以使循环条件逐渐变得“不成立”。

for 循环中的 exp1（初始化语句）、exp2（判断条件）和 exp3（自增或自减）都是可选项，都可以省略（但分号;必须保留）.

#### Python 风格的 for in 循环

用法如下：

```sh
for variable in value_list
do
statements
done
```

variable 表示变量，value_list 表示取值列表，in 是 Shell 中的关键字。

in value_list 部分可以省略，省略后的效果相当于 `in $@`，

每次循环都会从 value_list 中取出一个值赋给变量 variable，然后进入循环体（do 和 done 之间的部分），执行循环体中的 statements。直到取完 value_list 中的所有值，循环就结束了。

value_list的说明:

1.直接给出具体的值

可以在 in 关键字后面直接给出具体的值，多个值之间以空格分隔，比如1 2 3 4 5、"abc" "390" "tom"等。

2.给出一个取值范围

给出一个取值范围的具体格式为：`{start..end}`
start 表示起始值，end 表示终止值；注意中间用两个点号相连，而不是三个点号。这种形式只支持数字和字母。

3.使用命令的执行结果

4.使用 Shell 通配符

shell 通配符 `/glob` 模式通常用来匹配目录以及文件，而不是文本！！！

| 字符            | 解释                                                           |
| --------------- | -------------------------------------------------------------- |
| \*              | 匹配任意长度任意字符                                           |
| ?               | 匹配任意单个字符                                               |
| [list]          | 匹配指定范围内（list）任意单个字符，也可以是单个字符组成的集合 |
| [^list]         | 匹配指定范围外的任意单个字符或字符集合                         |
| [!list]         | 同[^list]                                                      |
| {str1,str2,...} | 匹配 srt1 或者 srt2 或者更多字符串，也可以是集合               |

| 字符       | 意义               |
| ---------- | ------------------ |
| [:alnum:]  | 任意数字或者字母   |
| [:alpha:]  | 任意字母           |
| [:space:]  | 空格               |
| [:lower:]  | 小写字母           |
| [:digit:]  | 任意数字           |
| [:upper:]  | 任意大写字母       |
| [:cntrl:]  | 控制符             |
| [:graph:]  | 图形               |
| [:print:]  | 可打印字符         |
| [:punct:]  | 标点符号           |
| [:xdigit:] | 十六进制数         |
| [:blank:]  | 空白字符（未验证） |

### select in

select in 循环用来增强交互性，它可以显示出带编号的菜单，用户输入不同的编号就可以选择不同的菜单，并执行不同的功能。

用法如下：

```sh
select variable in value_list
do
statements
done
```

例子：

```sh
#!/bin/bash
echo "What is your favourite OS?"
select name in "Linux" "Windows" "Mac OS" "UNIX" "Android"
do
echo $name
done
echo "You have selected $name"
```

运行结果：

```sh
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

> #?用来提示用户输入菜单编号；^D表示按下 Ctrl+D 组合键，它的作用是结束 select in 循环。
> 运行到 select 语句后，取值列表 value_list 中的内容会以菜单的形式显示出来，用户输入菜单编号，就表示选中了某个值，这个值就会赋给变量 variable，然后再执行循环体中的 statements（do 和 done 之间的部分）。
> 每次循环时 select 都会要求用户输入菜单编号，并使用环境变量 PS3 的值作为提示符，PS3 的默认值为#?，修改 PS3 的值就可以修改提示符。
> 如果用户输入的菜单编号不在范围之内，例如上面我们输入的 9，那么就会给 variable 赋一个空值；如果用户输入一个空值（什么也不输入，直接回车），会重新显示一遍菜单。

注意，select 是无限循环（死循环），输入空值，或者输入的值无效，都不会结束循环，只有遇到 break 语句，或者按下 Ctrl+D 组合键才能结束循环。

select in 通常和 case in 一起使用，在用户输入不同的编号时可以做出不同的反应。

```sh
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
      *)
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

Shell continue 关键字的用法为：`continue n`

n 表示循环的层数：

如果省略 n，则表示 continue 只对当前层次的循环语句有效，遇到 continue 会跳过本次循环，忽略本次循环的剩余代码，直接进入下一次循环。

如果带上 n，比如 n 的值为 2，那么 continue 对内层和外层循环语句都有效，不但内层会跳过本次循环，外层也会跳过本次循环，其效果相当于内层循环和外层循环同时执行了不带 n 的 continue。这么说可能有点难以理解，稍后我们通过代码来演示。

continue 关键字也通常和 if 语句一起使用，即满足条件时便跳出循环。

## 函数

Shell 函数必须先定义后使用，Shell 函数定义的语法格式如下：

```sh
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

函数返回值：

1）可以显式增加return语句；如果不加，会将最后一条命令运行结果作为返回值。

   Shell 函数返回值只能是整数，一般用来表示函数执行成功与否，0表示成功，其他值表示失败。如果 return 其他数据，比如一个字符串，往往会得到错误提示：“numeric argument required”。

2）使用全局变量：

   如果一定要让函数返回字符串，那么可以先定义一个变量，用来接收函数的计算结果，脚本在需要的时候访问这个变量来获得函数返回值。但是有bug

3）echo 返回值：

   安全的返回方式，即通过输出到标准输出返回。因为子进程会继承父进程的标准输出，因此，子进程的输出也就直接反应到父进程。因此不存在上面提到的由于管道导致返回值失效的情况。在外边只需要获取函数的返回值即可。

但是有一点一定要注意，不能向标准输出一些不是结果的东西（也就是说，不能随便echo一些不需要的信息），比如调试信息，这些信息可以重定向到一个文件中解决，特别要注意的是，脚本中用到其它类似grep这样的命令的时候，一定要记得`1>/dev/null 2>&1`来空这些输出信息输出到空设备，避免这些命令的输出。

总结：

   1）用变量接收函数返回值，函数用echo等标准输出将要返回的东西打印出来。

   2）用$?来接收函数的执行状态，但是$?要紧跟在函数调用处的后面。

## 重定向

### 输出重定向

标准输出重定向： 

`command >file` 以覆盖的方式，把 command 的正确输出结果输出到 file 文件中。     

`command >>file` ：以追加的方式，把 command 的正确输出结果输出到 file 文件中。

标准错误输出重定向:

`command 2>file`: 以覆盖的方式，把 command 的错误信息输出到 file 文件中。    

`command 2>>file` ：以追加的方式，把 command 的错误信息输出到 file 文件中。 

正确输出和错误信息同时保存:

`command >file 2>&1` ：以覆盖的方式，把正确输出和错误信息同时保存到同一个文件（file）中。 

`command >>file 2>&1     `  :以追加的方式，把正确输出和错误信息同时保存到同一个文件（file）中。  

`command >file1 2>file2  `  :以覆盖的方式，把正确的输出结果输出到 file1 文件中，把错误信息输出到 file2 文件中。 

`command >>file1 2>>file2`  :以追加的方式，把正确的输出结果输出到 file1 文件中，把错误信息输出到 file2 文件中。   

`command >file 2>file    `  :【不推荐】这两种写法会导致 file 被打开两次，引起资源竞争，所以 stdout 和 stderr 会互相覆盖

### 输入重定向

`command <file`: 将 file 文件中的内容作为 command 的输入。
`command <<END`: 从标准输入（键盘）中读取数据，直到遇见分界符 END 才停止（分界符可以是任意的字符串，用户自己定义）。
`command <file1 >file2`: 将 file1 作为 command 的输入，并将 command 的处理结果输出到 file2。

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

```sh
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

```sh
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

```sh
#!/bin/bash

sum=0
while read n; do
((sum += n))
echo "this number: $n"
done <nums.txt >log.txt  #同时使用输入输出重定向
echo "sum=$sum"
```

```sh
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

```sh
{ command1; command2; command3; . . . }
(command1; command2; command3;. . . )
```

两种写法的区别在于：由花括号{}包围起来的组命名在当前 Shell 进程中执行，而由小括号()包围起来的组命令会创建一个子 Shell，所有命令都在子 Shell 中执行。

对于第一种写法，花括号和命令之间必须有一个空格，并且最后一个命令必须用一个分号或者一个换行符结束。

子 Shell 就是一个子进程，是通过当前 Shell 进程创建的一个新进程。

例如，下面的代码将多个命令的输出重定向到 out.txt：

```sh
ls -l > out.txt #>表示覆盖
echo "http://c.biancheng.net/shell/" >> out.txt #>>表示追加
cat readme.txt >> out.txt
```

本段代码共使用了三次重定向。

借助组命令，我们可以将以上三条命令合并在一起，简化成一次重定向：

```sh
{ ls -l; echo "http://c.biancheng.net/shell/"; cat readme.txt; } > out.txt
```

或者写作：

```sh
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

```sh
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

| 命令    | 说明                                                                               |
| ------- | ---------------------------------------------------------------------------------- |
| awk     | 用于文本处理的解释性程序设计语言，通常被作为数据提取和报告的工具。                 |
| cut     | 用于将每个输入文件（如果没有指定文件则为标准输入）的每行的指定部分输出到标准输出。 |
| grep    | 用于搜索一个或多个文件中匹配指定模式的行。                                         |
| tar     | 用于归档文件的应用程序。                                                           |
| head    | 用于读取文件的开头部分（默认是 10 行）。如果没有指定文件，则从标准输入读取。       |
| paste   | 用于合并文件的行。                                                                 |
| sed     | 用于过滤和转换文本的流编辑器。                                                     |
| sort    | 用于对文本文件的行进行排序。                                                       |
| split   | 用于将文件分割成块。                                                               |
| strings | 用于打印文件中可打印的字符串。                                                     |
| tac     | 与 cat 命令的功能相反，用于倒序地显示文件或连接文件。                              |
| tail    | 用于显示文件的结尾部分。                                                           |
| tee     | 用于从标准输入读取内容并写入到标准输出和文件。                                     |
| tr      | 用于转换或删除字符。                                                               |
| uniq    | 用于报告或忽略重复的行。                                                           |
| wc      | 用于打印文件中的总行数、单词数或字节数。                                           |

## shell 模块化

所谓模块化，就是把代码分散到多个文件或者文件夹。对于大中型项目，模块化是必须的，否则会在一个文件中堆积成千上万行代码，这简直是一种灾难。

source 命令的用法为：`source filename`

也可以简写为：`. filename`

两种写法的效果相同。对于第二种写法，注意点号.和文件名中间有一个空格。

source 是 Shell 内置命令的一种，它会读取 filename 文件中的代码，并依次执行所有语句。你也可以理解为，source 命令会强制执行脚本文件中的全部命令，而忽略脚本文件的权限。

source 后边可以使用相对路径，也可以使用绝对路径