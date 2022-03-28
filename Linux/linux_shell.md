变量，只读变量，删除变量，重命名变量，使用变量
	数字，运算

	字符串，拼接，获取长度，提取（分片）
	字符串可以用单引号，也可以用双引号，也可以不用引号。
	readonly
	unset
	$name
	length=${#name}
	split_name=${name:start:end}

	单引号字符串的限制：
		单引号里的任何字符都会原样输出，单引号字符串中的变量是无效的；
		单引号字串中不能出现单独一个的单引号（对单引号使用转义符后也不行），但可成对出现，作为字符串拼接使用。

	双引号的优点：
		双引号里可以有变量
		双引号里可以出现转义字符

	数组
	数组中可以存放多个值。初始化时不需要定义数组大小。与大部分编程语言类似，数组元素的下标由 0 开始。数组用括号来表示，元素用"空格"符号分割开。
	取得数组元素的个数，`length=${#array_name[@]}`或者`length=${#array_name[*]}`

	传递参数
	我们可以在执行 Shell 脚本时，向脚本传递参数，脚本内获取参数的格式为：$n。n 代表一个数字，1 为执行脚本的第一个参数，2 为执行脚本的第二个参数，以此类推……
	特殊字符用来处理参数：
	|参数处理|	说明|
	|$#	|传递到脚本的参数个数|
	|$*	|以一个单字符串显示所有向脚本传递的参数。如"$*"用「"」括起来的情况、以"$1 $2 … $n"的形式输出所有参数。|
	|$$	|脚本运行的当前进程ID号|
	|$!	|后台运行的最后一个进程的ID号|
	|$@	|与$*相同，但是使用时加引号，并在引号中返回每个参数。如"$@"用「"」括起来的情况、以"$1" "$2" … "$n" 的形式输出所有参数。|
	|$-	|显示Shell使用的当前选项，与set命令功能相同。|
	|$?	|显示最后命令的退出状态。0表示没有错误，其他任何值表明有错误。|

输入输出
	read
	echo
	printf

单行注释，多行注释
以 # 开头的行就是注释，会被解释器忽略。通过每一行加一个 # 号设置多行注释

条件判断
	if 语句语法格式：
	```
	if condition
	then
	    command1 
	    command2
	    ...
	    commandN 
	fi
	```

	if else 语法格式：
	```
	if condition
	then
	    command1 
	    command2
	    ...
	    commandN
	else
	    command
	fi
	```

	if else-if else 语法格式：
	```
	if condition1
	then
	    command1
	elif condition2 
	then 
	    command2
	else
	    commandN
	fi
	```

循环
	for循环一般格式为：
	```
	for var in item1 item2 ... itemN
	do
	    command1
	    command2
	    ...
	    commandN
	done
	```

	while 循环用于不断执行一系列命令，也用于从输入文件中读取数据。其语法格式为：
	```
	while condition
	do
	    command
	done
	```

	无限循环语法格式：
	```
	while :
	do
	    command
	done
	```
	或者
	```
	while true
	do
	    command
	done
	```

	until 循环执行一系列命令直至条件为 true 时停止。
	until 循环与 while 循环在处理方式上刚好相反。
	一般 while 循环优于 until 循环，但在某些时候—也只是极少数情况下，until 循环更加有用。

	until 语法格式:
	```
	until condition
	do
	    command
	done
	```

	case ... esac 为多选择语句，与其他语言中的 switch ... case 语句类似，是一种多分支选择结构，每个 case 分支用右圆括号开始，用两个分号 ;; 表示 break，即执行结束，跳出整个 case ... esac 语句，esac（就是 case 反过来）作为结束标记。
	可以用 case 语句匹配一个值与一个模式，如果匹配成功，执行相匹配的命令。
	case ... esac 语法格式如下：

	```
	case 值 in
	模式1)
	    command1
	    command2
	    ...
	    commandN
	    ;;
	模式2)
	    command1
	    command2
	    ...
	    commandN
	    ;;
	esac
	```

	跳出循环:
	break命令允许跳出所有循环（终止执行后面的所有循环）。
	continue

函数
	函数的定义格式如下：

	```
	[ function ] funname [()]

	{

	    action;

	    [return int;]

	}
	```

	说明：
	1、可以带function fun() 定义，也可以直接fun() 定义,不带任何参数。
	2、参数返回，可以显示加：return 返回，如果不加，将以最后一条命令运行结果，作为返回值。 return后跟数值n(0-255)

	调用函数时可以向其传递参数。在函数体内部，通过 $n 的形式来获取参数的值，例如，$1表示第一个参数，$2表示第二个参数...
	注意，$10 不能获取第十个参数，获取第十个参数需要${10}。当n>=10时，需要使用${n}来获取参数。

文件包含
和其他语言一样，Shell 也可以包含外部脚本。这样可以很方便的封装一些公用的代码作为一个独立的文件。

Shell 文件包含的语法格式如下：
`. filename   # 注意点号(.)和文件名中间有一空格`或`source filename`

被包含的文件不需要可执行权限。

