
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
