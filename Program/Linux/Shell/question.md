## “sudo echo ＞＞”或类似命令串提示权限不够的解决办法

这是因为重定向符号 “>” 和 “>>” 也是 bash 的命令。sudo 只是让 echo 命令具有了 root 权限，但是没有让 “>” 和 “>>” 命令也具有root 权限，所以 bash 会认为这两个命令都没有写入信息的权限。

解决方法一：
利用 “sh -c” 命令，它可以让 bash 将一个字串作为完整的命令来执行，这样就可以将 sudo 的影响范围扩展到整条命令。具体用法如下：

    sudo sh -c 'command line'
    sudo sh -c 'echo "114.250.64.34    translate.googleapis.com" >> /etc/hosts'

解决方法二：
利用管道和 tee 命令，该命令可以从标准输入中读入信息并将其写入标准输出或文件中，具体用法如下：

    echo "strings" | sudo tee -a filename
    echo "114.250.64.34    translate.googleapis.com" | sudo tee -a /etc/hosts

#### sed 的非贪婪匹配
目前 sed 命令只支持贪婪匹配，要么换其他命令，要么在表达式后部增加字符或者是二次及多次匹配。

## SHELL执行脚本并输出日志文件

shell 错误输出重定向到标准输出
./tmp/test.sh > /tmp/test.log 2>&1

>和<是文件重定向符。那么1和2是什么？

SHELL中每个进程都和三个系统文件相关联
标准输入stdin
标准输出stdout
标准错误stderr
三个系统文件的文件描述符分别为0，1和2。
所以这里2>&1的意思就是将标准错误也输出到标准输出当中。

下面通过一个例子来展示2>&1有什么作用：

$ cat test.sh
t
date
test.sh中包含两个命令，其中t是一个不存在的命令，执行会报错，默认情况下，错误会输出到stderr。date则能正确执行，并且输出时间信息，默认输出到stdout。

标准输出重定向到LOG文件中，标准错误打印在屏幕上
./test.sh > test1.log
/test.sh: line 1: t: command not found

$ cat test1.log
Tue Oct 9 20:51:50 CST 2007
可以看到，date的执行结果被重定向到log文件中了，而t无法执行的错误则只打印在屏幕上。

标准输处和标准错误重定向到同一LOG文件中
$ ./test.sh > test2.log 2>&1

$ cat test2.log
./test.sh: line 1: t: command not found
Tue Oct 9 20:53:44 CST 2007
这次，stderr和stdout的内容都被重定向到log文件中了。

实际上， >就相当于1>也就是重定向标准输出，不包括标准错误。通过2>&1，就将标准错误重定向到标准输出了（stderr已作为stdout的副本），那么再使用>重定向就会将标准输出和标准错误信息一同重定向了。

标准输处和标准错误重定向到不同LOG文件中
如果只想重定向标准错误到文件中，则可以使用2> file。

1 sh mr_add_test.sh 1>log.log 2>log_err.log