## grep

grep （global search regular expression(RE) and print out the line,全面搜索正则表达式并把行打印出来）是一种强大的文本搜索工具，它能使用正则表达式搜索文本，并把匹配的行打印出来。

Unix 的 grep 家族包括 grep、egrep 和 fgrep。egrep 和 fgrep 的命令只跟 grep 有很小不同。egrep 是 grep 的扩展，支持更多的 re 元字符， fgrep 就是 fixed grep 或 fast grep，它们把所有的字母都看作单词，也就是说，正则表达式中的元字符表示回其自身的字面意义，不再特殊。Linux 使用 GNU 版本的 grep。它功能更强，可以通过-G、-E、-F 命令行选项来使用 egrep 和 fgrep 的功能。

grep 的工作方式是这样的，它在一个或多个文件中搜索字符串模板。如果模板包括空格，则必须被引用，模板后的所有字符串被看作文件名。搜索的结果被送到屏幕，不影响原文件内容。grep 可用于 shell 脚本，因为 grep 通过返回一个状态值来说明搜索的状态，如果模板搜索成功，则返回 0，如果搜索不成功，则返回1，如果搜索的文件不存在，则返回 2。我们利用这些返回值就可进行一些自动化的文本处理工作。

匹配模式选择:

| 参数                  | 意义                               |
| ---                   | ---                                |
| -E, --extended-regexp | 扩展正则表达式 egrep               |
| -F, --fixed-strings   | 一个换行符分隔的字符串的集合 fgrep |
| -G, --basic-regexp    | 基本正则                           |
| -P, --perl-regexp     | 调用的 perl 正则                   |
| -e, --regexp=PATTERN  | 后面根正则模式，默认无             |
| -f, --file=FILE       | 从文件中获得匹配模式               |
| -i, --ignore-case     | 不区分大小写                       |
| -w, --word-regexp     | 匹配整个单词                       |
| -x, --line-regexp     | 匹配整行                           |
| -z, --null-data       | 一个 0 字节的数据行，但不是空行    |

杂项:

| 参数               | 意义                                |
| ---                | ---                                 |
| -s, --no-messages  | 不显示错误信息                      |
| -v, --invert-match | 显示不匹配的行                      |
| -V, --version      | 显示版本号                          |
| --help             | 显示帮助信息                        |
| --mmap             | use memory-mapped input if possible |

输入控制:

| 参数                      | 意义                                                                         |
| ---                       | ---                                                                          |
| -m, --max-count=NUM       | 匹配的最大数                                                                 |
| -b, --byte-offset         | 打印匹配行前面打印该行所在的块号码。                                         |
| -n, --line-number         | 显示的加上匹配所在的行号                                                     |
| --line-buffered           | 刷新输出每一行                                                               |
| -H, --with-filename       | 当搜索多个文件时，显示匹配文件名前缀                                         |
| -h, --no-filename         | 当搜索多个文件时，不显示匹配文件名前缀                                       |
| --label=LABEL             | print LABEL as filename for standard input                                   |
| -o, --only-matching       | 只显示一行中匹配 PATTERN 的部分                                              |
| -q, --quiet, --silent     | 不显示任何东西                                                               |
| --binary-files=TYPE       | 假定二进制文件的 TYPE 类型； TYPE 可以是 'binary', 'text', 或'without-match' |
| -a, --text                | 匹配二进制的东西                                                             |
| -I                        | 不匹配二进制的东西                                                           |
| -d, --directories=ACTION  | 目录操作，读取，递归，跳过                                                   |
| -D, --devices=ACTION      | 设置对设备，FIFO,管道的操作，读取，跳过                                      |
| -R, -r, --recursive       | 递归调用                                                                     |
| --include=PATTERN         | 只查找匹配 FILE\_PATTERN 的文件                                               |
| --exclude=PATTERN         | 跳过匹配 FILE\_PATTERN 的文件和目录                                           |
| --exclude-from=FILE       | 跳过所有除 FILE 以外的文件                                                   |
| -L, --files-without-match | 匹配多个文件时，显示不匹配的文件名                                           |
| -l, --files-with-matches  | 匹配多个文件时，显示匹配的文件名                                             |
| -c, --count               | 显示匹配的行数                                                               |
| -Z, --null                | 在 FILE 文件最后打印空字符                                                   |

文件控制:

| 参数                     | 意义                                          |
| ---                      | ---                                           |
| -B, --before-context=NUM | 打印匹配本身以及前面的几个行由 NUM 控制       |
| -A, --after-context=NUM  | 打印匹配本身以及随后的几个行由 NUM 控制       |
| -C, --context=NUM        | 打印匹配本身以及随后，前面的几个行由 NUM 控制 |
| -NUM                     | 和-C 的用法一样的                             |
| --color\[=WHEN],          |                                               |
| --colour\[=WHEN]          | 使用标志高亮匹配字串；                        |
| -U, --binary             | 使用标志高亮匹配字串；                        |
| -u, --unix-byte-offsets  | 当 CR 字符不存在，报告字节偏移(MSDOS 模式)    |

## egrep、fgrep

> ‘egrep’ is the same as ‘grep -E’.> ‘fgrep’ is the same as ‘grep -F’.Direct invocation as either ‘egrep’ or ‘fgrep’ is deprecated, but is Traditional ‘egrep’ did not support interval expressions and some

> ‘egrep’ implementations use ‘{’ and ‘}’ instead, so portable scripts

## head

`head` 命令可用于查看文件的开头部分的内容，有一个常用的参数 -n 用于显示行数，默认为 10，即显示 10 行的内容。

命令格式：`head [参数] [文件]`

| 参数     | 意义           |
| ---      | ---            |
| -q       | 隐藏文件名     |
| -v       | 显示文件名     |
| -c<数目> | 显示的字节数。 |
| -n<行数> | 显示的行数。   |

## tail

`tail` 命令和`head`类似，但用于查看文件的末尾部分的内容

命令格式`tail [参数] [文件] `

| 参数                   | 意义                                          |
| ---                    | ---                                           |
| -f                     | 循环读取,如日志文件有更新时不断输出更新的内容 |
| -q                     | 不显示处理信息                                |
| -v                     | 显示详细的处理信息                            |
| -c<数目>               | 显示的字节数                                  |
| -n<行数>               | 显示文件的尾部 n 行内容                       |
| --pid=PID              | 与-f 合用,表示在进程 ID,PID 死掉之后结束      |
| -q, --quiet, --silent  | 从不输出给出文件名的首部                      |
| -s, --sleep-interval=S | 与-f 合用,表示在每次反复的间隔休眠 S 秒       |

## cat

cat（英文全拼：concatenate）命令用于连接文件并打印到标准输出设备上,可输出多个文件

语法格式:`cat [-AbeEnstTuv] [--help] [--version] fileName1 fileName2`

| 参数                     | 意义                                                 |
| ---                      | ---                                                  |
| -b 或 --number-nonblank  | 和 -n 相似，只不过对于空白行不编号。                 |
| -s 或 --squeeze-blank    | 当遇到有连续两行以上的空白行，就代换为一行的空白行。 |
| -v 或 --show-nonprinting | 使用 ^ 和 M- 符号，除了 LFD 和 TAB 之外。            |
| -E 或 --show-ends        | 在每行结束处显示 $。                                 |
| -T 或 --show-tabs        | 将 TAB 字符显示为 ^I。                               |
| -A, --show-all           | 等价于 -vET。                                        |
| -e                       | 等价于"-vE"选项；                                    |

## tac

`tac`按行为单位反向显示文件内容，如果没有文件或文件为-则读取标准输入。
处理多个文件时，依次将每个文件反向显示，而不是将所有文件连在一起再反向显示。

| 参数                   | 意义                                     |
| ---                    | ---                                      |
| -b, --before           | 在之前而不是之后连接分隔符。             |
| -r, --regex            | 将分隔符作为基础正则表达式（BRE）处理。  |
| -s, --separator=STRING | 使用 STRING 作为分隔符代替默认的换行符。 |
| --help                 | 显示帮助信息并退出。                     |
| --version              | 显示版本信息并退出。                     |

## rev

`rev`:命令 将文件中的每行内容以字符为单位反序输出，即第一个字符最后输出，最后一个字符最先输出，依次类推。

## less

less 可以随意浏览文件，支持翻页和搜索，支持向上翻页和向下翻页。

| 参数 | 意义                                                 |
| ---  | ---                                                  |
| -b   | <缓冲区大小> 设置缓冲区的大小                        |
| -e   | 当文件显示结束后，自动离开                           |
| -f   | 强迫打开特殊文件，例如外围设备代号、目录和二进制文件 |
| -g   | 只标志最后搜索的关键词                               |
| -i   | 忽略搜索时的大小写                                   |
| -m   | 显示类似 more 命令的百分比                           |
| -N   | 显示每行的行号                                       |
| -o   | <文件名> 将 less 输出的内容在指定文件中保存起来      |
| -Q   | 不使用警告音                                         |
| -s   | 显示连续空行为一行                                   |
| -S   | 行过长时间将超出部分舍弃                             |
| -x   | <数字> 将"tab"键显示为规定的数字空格                 |

进入文件浏览页面后可以进一步操作的键

| 参数       | 意义                                 |
| ---        | ---                                  |
| /字符串    | 向下搜索"字符串"的功能               |
| ?字符串    | 向上搜索"字符串"的功能               |
| n          | 重复前一个搜索（与 / 或 ? 有关）     |
| N          | 反向重复前一个搜索（与 / 或 ? 有关） |
| b          | 向上翻一页                           |
| d          | 向后翻半页                           |
| h          | 显示帮助界面                         |
| Q          | 退出 less 命令                       |
| u          | 向前滚动半页                         |
| y          | 向前滚动一行                         |
| 空格键     | 滚动一页                             |
| 回车键     | 滚动一行                             |
| \[pagedown] | 向下翻动一页                         |
| \[pageup]   | 向上翻动一页                         |

浏览多个文件:`less log1.log log2.log`
说明：输入 `：n`后，切换到 log2.log输入 `：p` 后，切换到 log1.log

## more

more 命令类似 cat ，不过会以一页一页的形式显示，更方便使用者逐页阅读语法：`more [-dlfpcsu] [-num] [+/pattern] [+linenum] [fileNames..]`

| 参数 | 意义                                                                                                                                         |
| ---  | ---                                                                                                                                          |
| -num | 一次显示的行数                                                                                                                               |
| -d   | 提示使用者，在画面下方显示 \[Press space to continue, 'q' to quit.] ，如果使用者按错键，则会显示 \[Press 'h' for instructions.] 而不是 '哔' 声 |
| -l   | 取消遇见特殊字元 ^L（送纸字元）时会暂停的功能                                                                                                |
| -f   | 计算行数时，以实际上的行数，而非自动换行过后的行数（有些单行字数太长的会被扩展为两行或两行以上）                                             |
| -p   | 不以卷动的方式显示每一页，而是先清除萤幕后再显示内容                                                                                         |
| -c   | 跟 -p 相似，不同的是先显示内容再清除其他旧资料                                                                                               |
| -s   | 当遇到有连续两行以上的空白行，就代换为一行的空白行                                                                                           |
| -u   | 不显示下引号 （根据环境变数 TERM 指定的 terminal 而有所不同）                                                                                |

+/pattern 在每个文档显示前搜寻该字串（pattern），然后从该字串之后开始显示 +linenum 从第 num 行开始显示 fileNames 欲显示内容的文档，可为复数个数

| 常用操作命令 | 意义                             |
| ---          | ---                              |
| Enter        | 向下 n 行，需要定义。默认为 1 行 |
| Ctrl+F       | 向下滚动一屏                     |
| 空格键       | 向下滚动一屏                     |
| Ctrl+B       | 返回上一屏                       |
| =            | 输出当前行的行号                 |
| ：f          | 输出文件名和当前行的行号         |
| V            | 调用配置的编辑器                 |
| !命令        | 调用 Shell，并执行命令           |
| q            | 退出 more                        |

## find

语法:`find path -option [ -print ] [ -exec -ok command ] {} \;`
path 为查找的起始目录，如果 path 是空字串则使用目前路径，path 后的部分为 expression，如果 expression 是空字串则使用 -print 为预设 expression。

| 参数                         | 意义                                                                                                             |
| ---                          | ---                                                                                                              |
| -amin<分钟>                  | 查找在指定时间曾被存取过的文件或目录，单位以分钟计算；                                                           |
| -anewer<参考文件或目录>      | 查找其存取时间较指定文件或目录的存取时间更接近现在的文件或目录；                                                 |
| -atime<24 小时数>            | 查找在指定时间曾被存取过的文件或目录，单位以 24 小时计算；                                                       |
| -cmin<分钟>                  | 查找在指定时间之时被更改过的文件或目录；                                                                         |
| -cnewer<参考文件或目录>      | 查找其更改时间较指定文件或目录的更改时间更接近现在的文件或目录；                                                 |
| -ctime<24 小时数>            | 查找在指定时间之时被更改的文件或目录，单位以 24 小时计算；                                                       |
| -daystart                    | 从本日开始计算时间；                                                                                             |
| -depth                       | 从指定目录下最深层的子目录开始查找；                                                                             |
| -empty                       | 寻找文件大小为 0 Byte 的文件，或目录下没有任何子目录或文件的空目录；                                             |
| -exec<执行指令>              | 假设 find 指令的回传值为 True，就执行该指令；                                                                    |
| -false                       | 将 find 指令的回传值皆设为 False；                                                                               |
| -fls<列表文件>               | 此参数的效果和指定“-ls”参数类似，但会把结果保存为指定的列表文件；                                                |
| -follow                      | 排除符号连接；                                                                                                   |
| -fprint<列表文件>            | 此参数的效果和指定“-print”参数类似，但会把结果保存成指定的列表文件；                                             |
| -fprint0<列表文件>           | 此参数的效果和指定“-print0”参数类似，但会把结果保存成指定的列表文件；                                            |
| -fprintf<列表文件><输出格式> | 此参数的效果和指定“-printf”参数类似，但会把结果保存成指定的列表文件；                                            |
| -fstype<文件系统类型>        | 只寻找该文件系统类型下的文件或目录；                                                                             |
| -gid<群组识别码>             | 查找符合指定之群组识别码的文件或目录；                                                                           |
| -group<群组名称>             | 查找符合指定之群组名称的文件或目录；                                                                             |
| -help 或--help               | 在线帮助；                                                                                                       |
| -ilname<范本样式>            | 此参数的效果和指定“-lname”参数类似，但忽略字符大小写的差别；                                                     |
| -iname<范本样式>             | 此参数的效果和指定“-name”参数类似，但忽略字符大小写的差别；                                                      |
| -inum\<inode 编号>            | 查找符合指定的 inode 编号的文件或目录；                                                                          |
| -ipath<范本样式>             | 此参数的效果和指定“-path”参数类似，但忽略字符大小写的差别；                                                      |
| -iregex<范本样式>            | 此参数的效果和指定“-regexe”参数类似，但忽略字符大小写的差别；                                                    |
| -links<连接数目>             | 查找符合指定的硬连接数目的文件或目录；                                                                           |
| -lname<范本样式>             | 指定字符串作为寻找符号连接的范本样式；                                                                           |
| -ls                          | 假设 find 指令的回传值为 Ture，就将文件或目录名称列出到标准输出；                                                |
| -maxdepth<目录层级>          | 设置最大目录层级；                                                                                               |
| -mindepth<目录层级>          | 设置最小目录层级；                                                                                               |
| -mmin<分钟>                  | 查找在指定时间曾被更改过的文件或目录，单位以分钟计算；                                                           |
| -mount                       | 此参数的效果和指定“-xdev”相同；                                                                                  |
| -mtime<24 小时数>            | 查找在指定时间曾被更改过的文件或目录，单位以 24 小时计算；                                                       |
| -name<范本样式>              | 指定字符串作为寻找文件或目录的范本样式；                                                                         |
| -newer<参考文件或目录>       | 查找其更改时间较指定文件或目录的更改时间更接近现在的文件或目录；                                                 |
| -nogroup                     | 找出不属于本地主机群组识别码的文件或目录；                                                                       |
| -noleaf                      | 不去考虑目录至少需拥有两个硬连接存在；                                                                           |
| -nouser                      | 找出不属于本地主机用户识别码的文件或目录；                                                                       |
| -ok<执行指令>                | 此参数的效果和指定“-exec”类似，但在执行指令之前会先询问用户，若回答“y”或“Y”，则放弃执行命令；                    |
| -path<范本样式>              | 指定字符串作为寻找目录的范本样式；                                                                               |
| -perm<权限数值>              | 查找符合指定的权限数值的文件或目录；                                                                             |
| -print                       | 假设 find 指令的回传值为 Ture，就将文件或目录名称列出到标准输出。格式为每列一个名称，每个名称前皆有“./”字符串； |
| -print0                      | 假设 find 指令的回传值为 Ture，就将文件或目录名称列出到标准输出。格式为全部的名称皆在同一行；                    |
| -printf<输出格式>            | 假设 find 指令的回传值为 Ture，就将文件或目录名称列出到标准输出。格式可以自行指定；                              |
| -prune                       | 不寻找字符串作为寻找文件或目录的范本样式;                                                                        |
| -regex<范本样式>             | 指定字符串作为寻找文件或目录的范本样式；                                                                         |
| -size<文件大小>              | 查找符合指定的文件大小的文件；                                                                                   |
| -true                        | 将 find 指令的回传值皆设为 True；                                                                                |
| -type<文件类型>              | 只寻找符合指定的文件类型的文件；                                                                                 |
| -uid<用户识别码>             | 查找符合指定的用户识别码的文件或目录；                                                                           |
| -used<日数>                  | 查找文件或目录被更改之后在指定时间曾被存取过的文件或目录，单位以日计算；                                         |
| -user<拥有者名称>            | 查找符和指定的拥有者名称的文件或目录；                                                                           |
| -version                     | 显示版本信息；                                                                                                   |
| -xdev                        | 将范围局限在先行的文件系统中；                                                                                   |
| -xtype<文件类型>             | 此参数的效果和指定“-type”参数类似，差别在于它针对符号连接检查。                                                  |

类型参数列表：

| 参数 | 意义     |
| ---  | ---      |
| f    | 普通文件 |
| l    | 符号连接 |
| d    | 目录     |
| c    | 字符设备 |
| b    | 块设备   |
| s    | 套接字   |
| p    | Fifo     |

你可以使用 ( ) 将运算式分隔，并使用下列运算。

    exp1 -and exp2
    ! expr
    -not expr
    exp1 -or/-o exp2
    exp1, exp2

例子：

在/home 目录下查找以.txt 结尾的文件名：`find /home -name "*.txt"`

查找上周新增的图片：`find ~ \( -iname '*jpeg' -o -iname '*jpg' \) -type f -mtime -7`

借助-exec 选项与其他命令结合使用；删除 mac 下自动生成的文件：`find ./ -name '__MACOSX' -depth -exec rm -rf {} \;`

查找 /var/log 目录中更改时间在 7 日以前的普通文件，并在删除之前询问它们：`find /var/log -type f -mtime +7 -ok rm {} \;`

## slocate/locate + updatedb

在 manjaro 中并没有自带 locate 这个命令，需要自行安装`sudo pacman -Sy mlocate`,初次使用需要`updatedb`建立初始库

`locate`命令用于查找符合条件的文档，他会去保存文档和目录名称的数据库内，查找合乎范本样式条件的文档或目录。

一般情况我们只需要输入 `locate your_file_name `即可查找指定文件。与 find 不同，find 是去硬盘找，locate 只在 '/var/lib/slocate' 资料库中找。

locate 的速度比 find 快，它并不是真的查找，而是查数据库，一般文件数据库在 '/var/lib/slocate/slocate.db' 中，

所以 locate 的查找并不是实时的，而是以数据库的更新为准，一般是系统自己维护，也可以手工升级数据库 ，命令为：`updatedb`,可能需要权限，以及更新需要较长的时间语法`locate [-d ][--help][--version][范本样式...]`

后面了解到 manjaro 有`slocate`这个命令，功能和`locate`差不多，且共用库，

| 参数                  | 意义                                                                                                                                                |
| ---                   | ---                                                                                                                                                 |
| -b, --basename        | 仅匹配路径名的基本名称                                                                                                                              |
| -c, --count           | 只输出找到的数量                                                                                                                                    |
| -d, --database DBPATH | 使用 DBPATH 指定的数据库，而不是默认数据库 '/var/lib/mlocate/mlocate.db'                                                                            |
| -e, --existing        | 仅打印当前现有文件的条目                                                                                                                            |
| -1                    | 如果 是 1．则启动安全模式。在安全模式下，使用者不会看到权限无法看到 的档案。这会始速度减慢，因为 locate 必须至实际的档案系统中取得档案的 权限资料。 |
| -0, --null            | 在输出上带有 NUL 的单独条目                                                                                                                         |
| -S, --statistics      | 不搜索条目，打印有关每个数据库的统计信息                                                                                                            |
| -q                    | 安静模式，不会显示任何错误讯息。                                                                                                                    |
| -P, --nofollow, -H    | 检查文件存在时不要遵循尾随的符号链接                                                                                                                |
| -l, --limit, -n LIMIT | 将输出（或计数）限制为 LIMIT 个条目                                                                                                                 |
| -n                    | 至多显示 n 个输出。                                                                                                                                 |
| -m, --mmap            | 被忽略，为了向后兼容                                                                                                                                |
| -r, --regexp REGEXP   | 使用基本正则表达式                                                                                                                                  |
| --regex               | 使用扩展正则表达式                                                                                                                                  |
| -q, --quiet           | 安静模式，不会显示任何错误讯息                                                                                                                      |
| -s, --stdio           | 被忽略，为了向后兼容                                                                                                                                |
| -o                    | 指定资料库存的名称。                                                                                                                                |
| -h, --help            | 显示帮助                                                                                                                                            |
| -i, --ignore-case     | 忽略大小写                                                                                                                                          |
| -V, --version         | 显示版本信息                                                                                                                                        |

不同的 locate 有对应的 updatedb

> updatedb - update a database for mlocate

| 参数                      | 意义                                                                                   |
| ---                       | ---                                                                                    |
| -U、 --database-root PATH | 仅存储扫描以生成的数据库路径为根的文件系统子树的结果。默认情况下，会扫描整个文件系统。 |
| -o、 --output FILE        | 将数据库写入文件，而不是使用默认数据库。                                               |

## touch

`touch`命令用于修改文件或者目录的时间属性，包括存取时间和更改时间。若文件不存在，系统会建立一个新的文件。

| 参数        | 意义                                                              |
| ---         | ---                                                               |
| -a          | 改变档案的读取时间记录。                                          |
| -m          | 改变档案的修改时间记录。                                          |
| -c          | 假如目的档案不存在，不会建立新的档案。与 --no-create 的效果一样。 |
| -f          | 不使用，是为了与其他 unix 系统的相容性而保留。                    |
| -r          | 使用参考档的时间记录，与 --file 的效果一样。                      |
| -d          | 设定时间与日期，可以使用各种不同的格式。                          |
| -t          | 设定档案的时间记录，格式与 date 指令相同。                        |
| --no-create | 不会建立新档案。                                                  |
| --help      | 列出指令格式。                                                    |
| --version   | 列出版本讯息。                                                    |

## mkdir

`mkdir`:英文全拼,make directory,命令用于创建目录

| 参数            | 意义                                                                     |
| ---             | ---                                                                      |
| -m, --mode=MODE | 创建目录并且设定权限                                                     |
| -p, --parents   | 创建多级目录时确保没一级目录都会创建 与-m 参数使用时，作用在最后一级目录 |
| -v, --verbose   | 为每个创建的目录打印一条消息                                             |
| --help          | 显示帮助之后退出                                                         |

## rm 、rmdir

`rm`:（英文全拼:remove）命令用于删除一个文件或者目录。

| 参数            | 意义                                                 |
| ---             | ---                                                  |
| -d              | 直接把欲删除的目录的硬连接数据删除成 0，删除该目录； |
| -f              | 强制删除文件或目录；                                 |
| -i              | 删除已有文件或目录之前先询问用户；                   |
| -r 或-R         | 递归处理，将指定目录下的所有文件与子目录一并处理；   |
| --preserve-root | 不对根目录进行递归操作；                             |
| -v              | 显示指令的详细执行过程。                             |

文件一旦通过`rm`命令删除，则无法恢复，所以必须格外小心地使用该命令。

`rmdir`:（英文全拼:remove directory）命令删除空的目录。
语法: `rmdir [-p] dirName`
dirName：要删除的空目录列表。当删除多个空目录时，目录名之间使用空格隔开。

| 参数                       | 意义                                                             |
| ---                        | ---                                                              |
| -p 或 --parents            | 删除指定目录后，若该目录的上层目录已变成空目录，则将其一并删除； |
| --ignore-fail-on-non-empty | 此选项使 rmdir 命令忽略由于删除非空目录时导致的错误信息；        |
| -v 或-verboes              | 显示命令的详细执行过程；                                         |
| --help                     | 显示命令的帮助信息；                                             |
| --version                  | 显示命令的版本信息。                                             |

`rmdir -p www/Test`：在工作目录下的 www 目录中，删除名为 Test 的子目录。若 Test 删除后，www 目录成为空目录，则 www 亦予删除。

## pwd

`pwd`：（英文全拼：print work directory） 命令用于显示工作目录。执行 pwd 指令可立刻得知您目前所在的工作目录的绝对路径名称。

| 参数           | 意义                                     |
| ---            | ---                                      |
| -L, --logical  | 打印环境变量"$PWD"的值，可能为符号链接。 |
| -P, --physical | （默认值）打印当前工作目录的物理位置。   |
| --help         | 显示帮助信息并退出。                     |
| --version      | 显示版本信息并退出。                     |

## ls

`ls`（英文全拼：list files）命令用于显示指定工作目录下之内容（列出目前工作目录所含之文件及子目录)。

语法:

    ls [选项] [文件名...] [-1abcdfgiklmnopqrstuxABCDFGLNQRSUX] [-w cols] [-T cols] [-I pattern] [--full-time] [--format={long,verbose,commas,across,vertical,single-col‐umn}] [--sort={none,time,size,extension}] [--time={atime,access,use,ctime,status}] [--color[={none,auto,always}]] [--help] [--version] [--]

| 参数                                                         | 意义:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| ---                                                          | ---                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| -C                                                           | 多列输出，纵向排序。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| -F                                                           | 每个目录名加 "/" 后缀，每个 FIFO 名加 "                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | " 后缀， 每个可运行名加“ \* ”后缀。                             |
| -R                                                           | 递归列出遇到的子目录。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| -a                                                           | 列出所有文件，包括以 "." 开头的隐含文件。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| -c                                                           | 使用“状态改变时间”代替“文件修改时间”为依据来排序（使用“-t”选项时）或列出（使用“-l”选项时）。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| -d                                                           | 将目录名像其它文件一样列出，而不是列出它们的内容。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| -i                                                           | 输出文件前先输出文件系列号（即 i 节点号: i-node number）。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| -l                                                           | 列出(以单列格式)文件模式(file mode)，文件的链接数，所有者名，组名，文件大小(以字节为单位)，时间信息，及文件名。 缺省时，时间信息显示最近修改时间；可以以选项“-c”和“-u”选择显示其它两种时间信息。对于设备文件，原先显示文件大小的区域通常显示的是主要和次要的信号(majorand minor device numbers)。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| -q                                                           | 将文件名中的非打印字符输出为问号。（对于到终端的输出这是缺省的。）                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| -r                                                           | 逆序排列。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| -t                                                           | 按时间信息排序。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| -u                                                           | 使用最近访问时间代替最近修改时间为依据来排序（使用“-t”选项时）或列出（使用“-l”选项时）。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| -1                                                           | 单列输出。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| -1,--format=single-column                                    | 一行输出一个文件（单列输出）。如标准输出不是到终端，此选项就是缺省选项。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| -a,--all                                                     | 列出目录中所有文件，包括以“.”开头的文件。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| -b                                                           | --escape # 把文件名中不可输出的字符用反斜杠加字符编号(就像在 C 语言里一样)的形式列出。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| -c, --time=ctime, --time=status                              | 按文件状态改变时间（i节点中的ctime）排序并输出目录内 容。如采用长格式输出（选项“-l”），使用文件的状态改变时间取代文件修改时间。【译注：所谓文件状态改变（i节 点中以ctime标志），既包括文件被修改，又包括文件属性（ 如所有者、组、链接数等等）的变化】                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| -d, --directory                                              | 将目录名像其它文件一样列出，而不是列出它们的内容。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| -f                                                           | 不排序目录内容；按它们在磁盘上存储的顺序列出。同时启动'-a'选项，如果在'-f'之前存在'-l'、'--color'或'-s'，则禁止它们。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| -g                                                           | 忽略，为兼容UNIX用。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| -i, --inode                                                  | 在每个文件左边打印i节点号（也叫文件序列号和索引号:fileserialnumber and index num‐ber）。i节点号在每个特定的文件系统中是唯一的。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| -k, --kilobytes                                              | 如列出文件大小，则以千字节KB为单位。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| -l, --format=long,--format=verbose                           | 输出的信息从左到右依次包括文件名、文件类型、权限、硬链接数、所有者名、组名、大小（byte）、及时间信息（如未指明是其它时间即指修改时间）。对于6个月以上的文件或超出未来1小时的文件，时间信息中的时分将被年代取代。每个目录列出前，有一行“总块数”显示目录下全部文件所占的磁盘空间。块默认是1024字节； # 如果设置了 POSIXLY\_CORRECT 的环境变量，除非用“-k”选项，则默认块大小是512字节。每一个硬链接都计入总块数（因此可能重复计数），这无疑是个缺点。列出的权限类似于以符号表示（文件）模式的规范。但是 ls 在每套权限的第三个字符中结合了多位（ multiple bits ） 的信息，如下： s 如果设置了setuid 位或 setgid位，而且也设置了相应的可执行位。 S 如果设置了 setuid 位或 setgid位，但是没有设置相应的可执行位。 t如果设置了sticky位，而且也设置了相应的可执行位。T如果设置了sticky位，但是没有设置相应的可执行位。x如果仅仅设置了可执行位而非以上四种情况。 - 其它情况（即可执行位未设置）。 |
| -m, --format=commas                                          | 水平列出文件，每行尽可能多，相互用逗号和一个空格分隔。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| -n, --numeric-uid-gid                                        | 列出数字化的 UID 和 GID 而不是用户名和组名。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| -o                                                           | 以长格式列出目录内容，但是不显示组信息。等于使用“--format=long --no-group ”选项。提供此选项是为了与其它版本的 ls 兼容。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| -p                                                           | 在每个文件名后附上一个字符以说明该文件的类型。类似“ -F ”选项但是不 标示可执行文件。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |

*   | q， --hide-control-chars                                     | 用问号代替文件名中非打印的字符。这是缺省选项。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
    | -r, --reverse                                                | 逆序排列目录内容。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
    | -s, --size                                                   | 在每个文件名左侧输出该文件的大小，以1024字节的块为单位。如果设置了POSIXLY\_CORRECT的环境变量，除非用“-k”选项，块大小是 512 字节。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
    | -t, --sort=time                                              | 按文件最近修改时间（ i 节点中的 mtime ）而不是按文件名字典序排序，新文件 靠前。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
    | -u, --time=atime, --time=access, --time=use                  | 类似选项“-t”，但是用文件最近访问时间（i节点中的atime）取代文件修改时间。如果使用长格式列出，打印的时间是最近访问时间。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
    | -w, --width cols                                             | 假定屏幕宽度是cols（cols以实际数字取代）列。如未用此选项，缺省值是这样获得的：如可能先尝试取自终端驱动，否则尝试取自环境变量COLUMNS （如果设# 置了的话），都不行则取 80 。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
    | -x, --format=across, --format=horizontal多列输出，横向排序。 |
    | -A, --almost-all                                             | 显示除 "." 和 ".." 外的所有文件。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
    | -B, --ignore-backups                                         | 不输出以“ ~ ”结尾的备份文件，除非已经在命令行中给出。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
    | -C, --format=vertical                                        | 多列输出，纵向排序。当标准输出是终端时这是缺省项。使用命令名 dir 和 d 时， 则总是缺省的。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
    | -G, --no-group                                               | 以长格式列目录时不显示组信息。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
    | -I, --ignorepattern                                          | 除非在命令行中给定，不要列出匹配shell文件名匹配式（pattern，不是指一般表达式）的文件。在shell中，文                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | 件名以"."起始的不与在文件名匹配式(pattern)# 开头的通配符匹配。 |
    | -L, --dereference                                            | 列出符号链接指向的文件的信息，而不是符号链接本身。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
    | -N, --literal                                                | 不要用引号引起文件名。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
    | -Q, --quote-name                                             | 用双引号引起文件名，非打印字符以 C 语言的方法表示。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
    | -R, --recursive                                              | 递归列出全部目录的内容。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
    | -S, --sort=size                                              | 按文件大小而不是字典序排序目录内容，大文件靠前。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
    | -T, --tabsize cols                                           | 假定每个制表符宽度是 cols 。缺省为8。为求效率，ls可能在输出中使用制表符。若cols为0，则不使用制表符。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
    | -U, --sort=none                                              | 不排序目录内容；按它们在磁盘上存储的顺序列出。（选项“-U”和“-f”的不同是前者不启动或禁止相关的选项。）这在列很大的目录时特别有用，因为不加排序# 能显著地加快速度。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
    | -X, --sort=extension                                         | 按文件扩展名（由最后的 "." 之后的字符组成）的字典序排序。没有扩展名的先列出。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |

## dir、vdir

`dir`:和`ls` 类似，会显示目录内容列表。若罗列出的文件名中有特殊字符，比如空格，在返回结果上这些特殊字符前将会显示一个反斜杠 \。
dir 命令和下面这条命令功能是一样的：`ls -C -b`

用法：`dir [选项]... [文件]...`

`vdir` 命令将使用长列表的形式罗列目录下的内容（除了以 . 开始的隐藏文件与目录），而且在特殊字符前还会加反斜杠 \ 。长列表中还会显示该文件或者目录的权限信息，连接数，所有者，组所有者，文件大小，上次修改时间和名称等等，和 ll 命令一样。

vdir 命令和下面这条命令功能是一样的：`ls -l -b`

## stat

`stat`:用于显示文件的状态信息。stat 命令的输出信息比 ls 命令的输出信息要更详细。用于显示 inode 内容。以文字的格式来显示 inode 的内容。

语法：`stat [文件或目录]`

| 选项      | 说明                           |
| -L        | 支持符号连接；                 |
| -f        | 显示文件系统状态而非文件状态； |
| -t        | 以简洁方式输出信息；           |
| --help    | 显示指令的帮助信息；           |
| --version | 显示指令的版本信息。           |

> inode 的内容
> inode 包含文件的元信息，具体来说有以下内容：
> 文件的字节数
> 文件拥有者的 User ID
> 文件的 Group ID
> 文件的读、写、执行权限
> 文件的时间戳，共有三个：ctime 指 inode 上一次变动的时间，mtime 指文件内容上一次变动的时间，atime 指文件上一次打开的时间。
> 链接数，即有多少文件名指向这个 inode
> 文件数据 block 的位置

## man

`man`用于查看 Linux 中的指令帮助

语法：`man(选项)(参数)`

| 选项 | 意义                                               |
| ---  | ---                                                |
| -a   | 在所有的 man 帮助手册中搜索；                      |
| -f   | 等价于 whatis 指令，显示给定关键字的简短描述信息； |
| -P   | 指定内容时使用分页程序；                           |
| -M   | 指定 man 手册搜索的路径。                          |

| 参数 | 意义                                                                 |
| ---  | ---                                                                  |
| 1    | 用户在 shell 环境可操作的命令或执行文件；                            |
| 2    | 系统内核可调用的函数与工具等                                         |
| 3    | 一些常用的函数(function)与函数库(library)，大部分为 C 的函数库(libc) |
| 4    | 设备文件说明，通常在/dev 下的文件                                    |
| 5    | 配置文件或某些文件格式                                               |
| 6    | 游戏(games)                                                          |
| 7    | 惯例与协议等，如 Linux 文件系统，网络协议，ASCII code 等说明         |
| 8    | 系统管理员可用的管理命令                                             |
| 9    | 跟 kernel 有关的文件                                                 |

## info语法：

`info(选项)(参数)`

| 选项 | 意义                                 |
| ---  | ---                                  |
| -d   | 添加包含 info 格式帮助文档的目录；   |
| -f   | 指定要读取的 info 格式的帮助文档；   |
| -n   | 指定首先访问的 info 帮助文件的节点； |
| -o   | 输出被选择的节点内容到指定文件。     |

## file

`file` 命令用于辨识文件类型。通过 file 指令，我们得以辨识该文件的类型。

语法:`file(选项)(参数)`

| 选项             | 意义                                                                                           |
| ---              | ---                                                                                            |
| -b               | 列出辨识结果时，不显示文件名称；                                                               |
| -c               | 详细显示指令执行过程，便于排错或分析程序执行的情形；                                           |
| -f<名称文件>     | 指定名称文件，其内容有一个或多个文件名称时，让 file 依序辨识这些文件，格式为每列一个文件名称； |
| -L               | 直接显示符号连接所指向的文件类别；                                                             |
| -m<魔法数字文件> | 指定魔法数字文件；                                                                             |
| -v               | 显示版本信息；                                                                                 |
| -z               | 尝试去解读压缩文件的内容。                                                                     |

参数,文件：要确定类型的文件列表，多个文件之间使用空格分开，可以使用 shell 通配符匹配多个文件。

## cp

`cp`:（英文全拼：copy file）命令主要用于复制文件或目录。语法：`cp [options] source dest`

| 参数 | 说明                                                                                                |
| ---  | ---                                                                                                 |
| -a   | 此选项通常在复制目录时使用，它保留链接、文件属性，并复制目录下的所有内容。其作用等于 dpR 参数组合。 |
| -d   | 复制时保留链接。这里所说的链接相当于 Windows 系统中的快捷方式。                                     |
| -f   | 覆盖已经存在的目标文件而不给出提示。                                                                |
| -i   | 与 -f 选项相反，在覆盖目标文件之前给出提示，要求用户确认是否覆盖，回答 y 时目标文件将被覆盖。       |
| -p   | 除复制文件的内容外，还把修改时间和访问权限也复制到新文件中。                                        |
| -r   | 若给出的源文件是一个目录文件，此时将复制该目录下所有的子目录和文件。                                |
| -l   | 不复制文件，只是生成链接文件。                                                                      |

实例：使用指令 cp 将当前目录 test/ 下的所有文件复制到新目录 newtest 下，输入如下命令：`cp –r test/ newtest`注意：用户使用该指令复制目录时，必须使用参数 -r 或者 -R 。

## mv

`mv`：（英文全拼：move file）命令用来为文件或目录改名、或将文件或目录移入其它位置。

语法：`mv [options] source dest`

| 参数 | 说明                                                                                                                     |
| ---  | ---                                                                                                                      |
| -b   | 当目标文件或目录存在时，在执行覆盖前，会为其创建一个备份。                                                               |
| -i   | 如果指定移动的源目录或文件与目标的目录或文件同名，则会先询问是否覆盖旧文件，输入 y 表示直接覆盖，输入 n 表示取消该操作。 |
| -f   | 如果指定移动的源目录或文件与目标的目录或文件同名，不会询问，直接覆盖旧文件。                                             |
| -n   | 不要覆盖任何已存在的文件或目录。                                                                                         |
| -u   | 当源文件比目标文件新或者目标文件不存在时，才执行移动操作。                                                               |

## alias 、unalias

`alias`命令用于设置指令的别名。用户可利用 alias，自定指令的别名。若仅输入 alias，则可列出目前所有的别名设置。

alias 的效力仅及于该次登入的操作。若要每次登入是即自动设好别名，可在.profile 或.cshrc 中设定指令的别名。

语法：`alias[别名]=[指令名称]`

参数说明：若不加任何参数，则列出目前所有的别名设置。`unlias`unalias 命令用于删除别名。

语法：`unalias [-a][别名]`参数：-a删除全部的别名。

## sort

`sort`： 命令用于将文本文件内容加以排序。

语法：

    sort [OPTION]... [FILE]...
    sort [OPTION]... --files0-from=F

主要用途：可针对文本文件的内容，以行为单位来排序。将所有输入文件的内容排序后并输出。当没有文件或文件为-时，读取标准输入。

| 排序选项                    | 意义                                              |
| ---                         | ---                                               |
| -b, --ignore-leading-blanks | 忽略开头的空白。                                  |
| -d, --dictionary-order      | 仅考虑空白、字母、数字。                          |
| -f, --ignore-case           | 将小写字母作为大写字母考虑。                      |
| -g, --general-numeric-sort  | 根据数字排序。                                    |
| -i, --ignore-nonprinting    | 排除不可打印字符。                                |
| -M, --month-sort            | 按照非月份、一月、十二月的顺序排序。              |
| -h, --human-numeric-sort    | 根据存储容量排序(注意使用大写字母，例如：2K 1G)。 |
| -n, --numeric-sort          | 根据数字排序。                                    |
| -R, --random-sort           | 随机排序，但分组相同的行。                        |
| --random-source=FILE        | 从 FILE 中获取随机长度的字节。                    |
| -r, --reverse               | 将结果倒序排列。                                  |
| --sort=WORD                 | 根据 WORD 排序。                                  |
| -V, --version-sort          | 文本中(版本)数字的自然排序。                      |

| 其他选项                            | 意义                                                                                                        |
| ---                                 | ---                                                                                                         |
| --batch-size=NMERGE                 | 一次合并最多 NMERGE 个输入；超过部分使用临时文件。                                                          |
| -c, --check, --check=diagnose-first | 检查输入是否已排序，该操作不会执行排序。                                                                    |
| -C, --check=quiet, --check=silent   | 类似于 -c 选项，但不输出第一个未排序的行。                                                                  |
| --compress-program=PROG             | 使用 PROG 压缩临时文件；使用 PROG -d 解压缩。                                                               |
| --debug                             | 注释用于排序的行，发送可疑用法的警报到 stderr。                                                             |
| --files0-from=F                     | 从文件 F 中读取以 NUL 结尾的所有文件名称；如果 F 是 - ，那么从标准输入中读取名字。                          |
| -k, --key=位置 1\[,位置 2]           | 通过一个 key 排序；KEYDEF 给出位置和类型。 在位置 1 开始一个 key，在位置 2 终止(默认为行尾) 参看 POS 语法。 |
| -m, --merge                         | 合并已排序文件，之后不再排序。                                                                              |
| -o, --output=FILE                   | 将结果写入 FILE 而不是标准输出。                                                                            |
| -s, --stable                        | 通过禁用最后的比较来稳定排序。                                                                              |
| -S, --buffer-size=SIZE              | 使用 SIZE 作为内存缓存大小。                                                                                |
| -t, --field-separator=SEP           | 使用 SEP 作为列的分隔符。                                                                                   |
| -T, --temporary-directory=DIR       | 使用 DIR 作为临时目录，而不是 $TMPDIR 或 /tmp；多次使用该选项指定多个临时目录。                             |
| --parallel=N                        | 将并发运行的排序数更改为 N。                                                                                |
| -u, --unique                        | 同时使用-c，严格检查排序；不同时使用-c，输出排序后去重的结果。                                              |
| -z, --zero-terminated               | 设置行终止符为 NUL（空），而不是换行符。                                                                    |
| --help                              | 显示帮助信息并退出。                                                                                        |
| --version                           | 显示版本信息并退出。                                                                                        |

POS 是 `F[.C][opts]`，F 代表域编号，C 是域中字母的位置，F 和 C 均从 1 开始计数。如果没有有效的-t 或-b 选项存在，则从前导空格后开始计数字符。OPTS 是一个或多个由单个字母表示的顺序选项，以此覆盖此 key 的全局顺序设置。如果没有指定 key， 则将其整个行。指定的大小可以使用以下单位之一：
内存使用率% 1%，b 1、K 1024 (默认)，M、G、T、P、E、Z、Y 等依此类推。如果不指定文件，或者文件为"-"，则从标准输入读取数据。参数：FILE（可选）：要处理的文件，可以为任意数量。返回值：返回 0 表示成功，返回非 0 值表示失败。

例子：

    cat sort.txt
    AAA:BB:CC
    aaa:30:1.6
    ccc:50:3.3
    ddd:20:4.2
    bbb:10:2.5
    eee:40:5.4
    eee:60:5.1

    # 将BB列按照数字从小到大顺序排列：sort -nk 2 -t: sort.txt
    AAA:BB:CC
    bbb:10:2.5
    ddd:20:4.2
    aaa:30:1.6
    eee:40:5.4
    ccc:50:3.3
    eee:60:5.1

    # 将CC列数字从大到小顺序排列：
    # -n是按照数字大小排序，-r是以相反顺序，-k是指定需要排序的栏位，-t指定栏位分隔符为冒号
    sort -nrk 3 -t: sort.txt
    eee:40:5.4
    eee:60:5.1
    ddd:20:4.2
    ccc:50:3.3
    bbb:10:2.5
    aaa:30:1.6
    AAA:BB:CC

关于-k 选项的解读和例子：-k 选项深度解读：FStart.CStart Modifier,FEnd.CEnd Modifier
\---Start---,---End---
FStart.CStart 选项 , FEnd.CEnd 选项
这个语法格式可以被其中的逗号,分为两大部分，Start 部分和 End 部分。 Start 部分由三部分组成，其中的 Modifier 部分就是我们之前说过的选项部分； 我们重点说说 Start 部分的 FStart 和 C.Start；C.Start 是可以省略的，省略的话就表示从本域的开头部分开始。FStart.CStart，其中 FStart 就是表示使用的域，而 CStart 则表示在 FStart 域中从第几个字符开始算排序首字符。 同理，在 End 部分中，你可以设定 FEnd.CEnd，如果你省略.CEnd 或将它设定为 0，则表示结尾到本域的最后一个字符。

    例子：从公司英文名称的第二个字母开始排序：
    $ sort -t ' ' -k 1.2 facebook.txt
    baidu 100 5000
    sohu 100 4500
    google 110 5000
    guge 50 3000

    解读：使用了-k 1.2，表示对第一个域的第二个字符开始到本域的最后一个字符为止的字符串进行排序。你会发现baidu因为第二个字母是a而名列榜首。sohu和google第二个字符都是o，但sohu的h在google的o前面，所以两者分别排在第二和第三。guge只能屈居第四了。

    例子：只针对公司英文名称的第二个字母进行排序，如果相同的按照员工工资进行降序排序：
    $ sort -t ' ' -k 1.2,1.2 -nrk 3,3 facebook.txt
    baidu 100 5000
    google 110 5000
    sohu 100 4500
    guge 50 3000

    解读：由于只对第二个字母进行排序，所以我们使用了-k 1.2,1.2的表示方式，表示我们只对第二个字母进行排序（如果你问我使用-k 1.2怎么不行？当然不行，因为你省略了End部分，这就意味着你将对从第二个字母起到本域最后一个字符为止的字符串进行排序）。 对员工工资进行排序，我们也使用了-k 3,3，这是最准确的表述，表示我们只对本域进行排序，因为如果你省略了后面的3，就变成了我们对第3个域开始到最后一个域位置的内容进行排序了。

## uniq

`uniq`：显示或忽略重复的行。

语法：`uniq [OPTION]... [INPUT [OUTPUT]]`主要用途：将输入文件（或标准输入）中邻近的重复行写入到输出文件（或标准输出）中。当没有选项时，邻近的重复行将合并为一个。

| 选项                    | 意义                                                                                           |
| ---                     | ---                                                                                            |
| -c, --count             | 在每行开头增加重复次数。                                                                       |
| -d, --repeated          | 所有邻近的重复行只被打印一次。                                                                 |
| -D                      | 所有邻近的重复行将全部打印。                                                                   |
| --all-repeated\[=METHOD] | 类似于 -D，但允许每组之间以空行分割。METHOD 取值范围{none(默认)，prepend，separate}。          |
| -f, --skip-fields=N     | 跳过对前 N 个列的比较。                                                                        |
| --group\[=METHOD]        | 显示所有行，允许每组之间以空行分割。METHOD 取值范围：{separate(默认)，prepend，append，both}。 |
| -i, --ignore-case       | 忽略大小写的差异。                                                                             |
| -s, --skip-chars=N      | 跳过对前 N 个字符的比较。                                                                      |
| -u, --unique            | 只打印非邻近的重复行。                                                                         |
| -z, --zero-terminated   | 设置行终止符为 NUL（空），而不是换行符。                                                       |
| -w, --check-chars=N     | 只对每行前 N 个字符进行比较。                                                                  |
| --help                  | 显示帮助信息并退出。                                                                           |
| --version               | 显示版本信息并退出。                                                                           |

参数:
INPUT（可选）：输入文件，不提供时为标准输入。
OUTPUT（可选）：输出文件，不提供时为标准输出。返回值:
返回 0 表示成功，返回非 0 值表示失败。

例子：

    uniq -i -c uniqtest#检查的时候，不区分大小写
    uniq -s 4 -c uniqtest #检查的时候，不考虑前4个字符，这样whom have a try 就和 you have a try 就一样了。
    uniq -w 2 -c uniqtest#对每行第2个字符以后的内容不作检查，所以i am tank 根 i love tank就一样了。

## wc

`wc`：统计文件的字节数、字数（英文单词数）、行数。统计指定文件中的字节数、字数、行数，并将统计结果显示输出。利用 wc 指令我们可以计算文件的 Byte 数、字数或是列数，若不指定文件名称，或是所给予的文件名为“-”，则 wc 指令会从标准输入设备读取数据。wc 同时也给出所指定文件的总统计数。

语法：

    wc(选项)(参数)
    wc [选项]... [文件]...
    wc [选项]... --files0-from=F

| 选项      | 意义                                                                                |
| ---       | ---                                                                                 |
| -c        | # 统计字节数，或--bytes：显示 Bytes 数。                                            |
| -l        | # 统计行数，或--lines：显示列数。                                                   |
| -m        | # 统计字符数，或--chars：显示字符数。                                               |
| -w        | # 统计字数，或--words：显示字数。一个字被定义为由空白、跳格或换行字符分隔的字符串。 |
| -L        | # 打印最长行的长度，或--max-line-length。                                           |
| -help     | 显示帮助信息。                                                                      |
| --version | 显示版本信息。                                                                      | 参数:文件,需要统计的文件列表。

## tee

`tee`:从标准输入读取数据并重定向到标准输出和文件。替代重定向可检查输入结果。

语法：`tee [OPTION]... [FILE]...`

主要用途:需要同时查看数据内容并输出到文件时使用。参数:FILE（可选）：要输出的文件，可以为一或多个。

| 选项                    | 意义                                         |
| ---                     | ---                                          |
| -a, --append            | 追加到文件中而不是覆盖。                     |
| -i, --ignore-interrupts | 忽略中断信号（Ctrl+c 中断操作无效）。        |
| -p                      | 诊断写入非管道的错误。                       |
| --output-error\[=MODE]   | 设置写错误时的行为，请查看下方的 MODE 部分。 |
| --help                  | 显示帮助信息并退出。                         |
| --version               | 显示版本信息并退出。                         |

MODE 决定了当出现写错误时的输出行为，可用的 MODE 如下：

    'warn'当写入到任何输出报错时诊断。
    'warn-nopipe' 当写入到任何输出（而不是管道）报错时诊断。
    'exit'当写入到任何输出报错时退出。
    'exit-nopipe' 当写入到任何输出（而不是管道）报错时退出。

-p 选项的指定的默认 MODE 为'warn-nopipe'。当'--output-error'没有在选项中时，默认的操作是当写入到管道报错时立刻退出，诊断错误信息并写入到非管道输出。

## ps 、pstree

`ps`:报告当前系统的进程状态

    ps [-aAcdefHjlmNVwy][acefghLnrsSTuvxX][-C <指令名称>][-g <群组名称>][-G <群组识别码>][-p <进程识别码>][p <进程识别码>][-s <阶段作业>][-t <终端机编号>][t <终端机编号>][-u <用户识别码>][-U <用户识别码>][U <用户名称>][-<进程识别码>][--cols <每列字符数>][--columns <每列字符数>][--cumulative][--deselect][--forest][--headers][--help][-- info][--lines <显示列数>][--no-headers][--group <群组名称>][-Group <群组识别码>][--pid <进程识别码>][--rows <显示列数>][--sid <阶段作业>][--tty <终端机编号>][--user <用户名称>][--User <用户识别码>][--version][--width <每列字符数>]

| 参数                  | 意义                                                                         |
| ---                   | ---                                                                          |
| -a                    | 显示所有终端机下执行的程序，除了阶段作业领导者之外。                         |
| a                     | 显示现行终端机下的所有程序，包括其他用户的程序。                             |
| -A                    | 显示所有程序。                                                               |
| -c                    | 显示 CLS 和 PRI 栏位。                                                       |
| c                     | 列出程序时，显示每个程序真正的指令名称，而不包含路径，选项或常驻服务的标示。 |
| -C<指令名称>          | 指定执行指令的名称，并列出该指令的程序的状况。                               |
| -d                    | 显示所有程序，但不包括阶段作业领导者的程序。                                 |
| -e                    | 此选项的效果和指定"A"选项相同。                                              |
| e                     | 列出程序时，显示每个程序所使用的环境变量。                                   |
| -f                    | 显示 UID,PPIP,C 与 STIME 栏位。                                              |
| f                     | 用 ASCII 字符显示树状结构，表达程序间的相互关系。                            |
| -g<群组名称>          | 此选项的效果和指定"-G"选项相同，当亦能使用阶段作业领导者的名称来指定。       |
| g                     | 显示现行终端机下的所有程序，包括群组领导者的程序。                           |
| -G<群组识别码>        | 列出属于该群组的程序的状况，也可使用群组名称来指定。                         |
| h                     | 不显示标题列。                                                               |
| -H                    | 显示树状结构，表示程序间的相互关系。                                         |
| -j 或 j               | 采用工作控制的格式显示程序状况。                                             |
| -l 或 l               | 采用详细的格式来显示程序状况。                                               |
| L                     | 列出栏位的相关信息。                                                         |
| -m 或 m               | 显示所有的执行绪。                                                           |
| n                     | 以数字来表示 USER 和 WCHAN 栏位。                                            |
| -N                    | 显示所有的程序，除了执行 ps 指令终端机下的程序之外。                         |
| -p<程序识别码>        | 指定程序识别码，并列出该程序的状况。                                         |
| p<程序识别码>         | 此选项的效果和指定"-p"选项相同，只在列表格式方面稍有差异。                   |
| r                     | 只列出现行终端机正在执行中的程序。                                           |
| -s<阶段作业>          | 指定阶段作业的程序识别码，并列出隶属该阶段作业的程序的状况。                 |
| s                     | 采用程序信号的格式显示程序状况。                                             |
| S                     | 列出程序时，包括已中断的子程序资料。                                         |
| -t<终端机编号>        | 指定终端机编号，并列出属于该终端机的程序的状况。                             |
| t<终端机编号>         | 此选项的效果和指定"-t"选项相同，只在列表格式方面稍有差异。                   |
| -T                    | 显示现行终端机下的所有程序。                                                 |
| -u<用户识别码>        | 此选项的效果和指定"-U"选项相同。                                             |
| u                     | 以用户为主的格式来显示程序状况。                                             |
| -U<用户识别码>        | 列出属于该用户的程序的状况，也可使用用户名称来指定。                         |
| U<用户名称>           | 列出属于该用户的程序的状况。                                                 |
| v                     | 采用虚拟内存的格式显示程序状况。                                             |
| -V 或 V               | 显示版本信息。                                                               |
| -w 或 w               | 采用宽阔的格式来显示程序状况。                                               |
| x                     | 显示所有程序，不以终端机来区分。                                             |
| X                     | 采用旧式的 Linux i386 登陆格式显示程序状况。                                 |
| -y                    | 配合选项"-l"使用时，不显示 F(flag)栏位，并以 RSS 栏位取代 ADDR 栏位　。      |
| -<程序识别码>         | 此选项的效果和指定"p"选项相同。                                              |
| --cols<每列字符数>    | 设置每列的最大字符数。                                                       |
| --columns<每列字符数> | 此选项的效果和指定"--cols"选项相同。                                         |
| --cumulative          | 此选项的效果和指定"S"选项相同。                                              |
| --deselect            | 此选项的效果和指定"-N"选项相同。                                             |
| --forest              | 此选项的效果和指定"f"选项相同。                                              |
| --headers             | 重复显示标题列。                                                             |
| --help                | 在线帮助。                                                                   |
| --info                | 显示排错信息。                                                               |
| --lines<显示列数>     | 设置显示画面的列数。                                                         |
| --no-headers          | 此选项的效果和指定"h"选项相同，只在列表格式方面稍有差异。                    |
| --group<群组名称>     | 此选项的效果和指定"-G"选项相同。                                             |
| --Group<群组识别码>   | 此选项的效果和指定"-G"选项相同。                                             |
| --pid<程序识别码>     | 此选项的效果和指定"-p"选项相同。                                             |
| --rows<显示列数>      | 此选项的效果和指定"--lines"选项相同。                                        |
| --sid<阶段作业>       | 此选项的效果和指定"-s"选项相同。                                             |
| --tty<终端机编号>     | 此选项的效果和指定"-t"选项相同。                                             |
| --user<用户名称>      | 此选项的效果和指定"-U"选项相同。                                             |
| --User<用户识别码>    | 此选项的效果和指定"-U"选项相同。                                             |
| --version             | 此选项的效果和指定"-V"选项相同。                                             |
| --widty<每列字符数>   | 此选项的效果和指定"-cols"选项相同。                                          |

au(x) 输出格式 :`USER PID %CPU %MEM VSZ RSS TTY STAT START TIME COMMAND`

    USER: 行程拥有者
    PID: pid
    %CPU: 占用的 CPU 使用率
    %MEM: 占用的记忆体使用率
    VSZ: 占用的虚拟记忆体大小
    RSS: 占用的记忆体大小
    TTY: 终端的次要装置号码 (minor device number of tty)
    STAT: 该行程的状态:D: 无法中断的休眠状态 (通常 IO 的进程)R: 正在执行中S: 静止状态T: 暂停执行Z: 不存在但暂时无法消除W: 没有足够的记忆体分页可分配
    <: 高优先序的行程
    N: 低优先序的行程
    L: 有记忆体分页分配并锁在记忆体内 (实时系统或捱A I/O)
    START: 行程开始时间
    TIME: 执行的时间
    COMMAND:所执行的指令

`pstree`:命令 以树状图的方式展现进程之间的派生关系，显示效果比较直观。

| 参数           | 意义                                                       |
| ---            | ---                                                        |
| -a             | 显示每个程序的完整指令，包含路径，参数或是常驻服务的标示； |
| -c             | 不使用精简标示法；                                         |
| -G             | 使用 VT100 终端机的列绘图字符；                            |
| -h             | 列出树状图时，特别标明现在执行的程序；                     |
| -H<程序识别码> | 此参数的效果和指定"-h"参数类似，但特别标明指定的程序；     |
| -l             | 采用长列格式显示树状图；                                   |
| -n             | 用程序识别码排序。预设是以程序名称来排序；                 |
| -p             | 显示程序识别码；                                           |
| -u             | 显示用户名称；                                             |
| -U             | 使用 UTF-8 列绘图字符；                                    |
| -V             | 显示版本信息。                                             |

## kill、killall、pkill

`kill`:发送信号到进程(可以为多个)。

语法：

    kill [-s sigspec | -n signum | -sigspec] pid | jobspec ...
    kill -l [sigspec]

| 选项   | 意义                                                                   |
| ---    | ---                                                                    |
| -s sig | 信号名称。                                                             |
| -n sig | 信号名称对应的数字。                                                   |
| -l     | 列出信号名称。如果在该选项后提供了数字那么假设它是信号名称对应的数字。 |
| -L     | 等价于-l 选项。                                                        |

参数:
pid：进程 ID;
jobspec：作业标识符

    # 列出所有信号名称：
    [user2@pc] kill -l1) SIGHUP 2) SIGINT 3) SIGQUIT4) SIGILL5) SIGTRAP6) SIGABRT7) SIGBUS 8) SIGFPE9) SIGKILL10) SIGUSR111) SIGSEGV12) SIGUSR2
    13) SIGPIPE14) SIGALRM15) SIGTERM16) SIGSTKFLT
    17) SIGCHLD18) SIGCONT19) SIGSTOP20) SIGTSTP
    21) SIGTTIN22) SIGTTOU23) SIGURG24) SIGXCPU
    25) SIGXFSZ26) SIGVTALRM27) SIGPROF28) SIGWINCH
    29) SIGIO 30) SIGPWR31) SIGSYS34) SIGRTMIN
    35) SIGRTMIN+136) SIGRTMIN+237) SIGRTMIN+338) SIGRTMIN+4
    39) SIGRTMIN+540) SIGRTMIN+641) SIGRTMIN+742) SIGRTMIN+8
    43) SIGRTMIN+944) SIGRTMIN+10 45) SIGRTMIN+11 46) SIGRTMIN+12
    47) SIGRTMIN+13 48) SIGRTMIN+14 49) SIGRTMIN+15 50) SIGRTMAX-14
    51) SIGRTMAX-13 52) SIGRTMAX-12 53) SIGRTMAX-11 54) SIGRTMAX-10
    55) SIGRTMAX-956) SIGRTMAX-857) SIGRTMAX-758) SIGRTMAX-6
    59) SIGRTMAX-560) SIGRTMAX-461) SIGRTMAX-362) SIGRTMAX-2
    63) SIGRTMAX-164) SIGRTMAX# 下面是常用的信号。
    # 只有第9种信号(SIGKILL)才可以无条件终止进程，其他信号进程都有权利忽略。HUP1 终端挂断
    INT2 中断（同 Ctrl + C）
    QUIT 3 退出（同 Ctrl + \）
    KILL 9 强制终止
    TERM15 终止
    CONT18 继续（与STOP相反，fg/bg命令）
    STOP19 暂停（同 Ctrl + Z）

`killall`:用于杀死一个进程，与 kill 不同的是它会杀死指定名字的所有进程。

语法：` killall [选项] name`

| 选项               | 意义                                 |
| ---                | ---                                  |
| -e --exact         | 进程需要和名字完全相符               |
| -I --ignore-case   | 忽略大小写                           |
| -g --process-group | 结束进程组                           |
| -i --interactive   | 结束之前询问                         |
| -l --list          | 列出所有的信号名称                   |
| -q --quite         | 进程没有结束时，不输出任何信息       |
| -r --regexp        | 将进程名模式解释为扩展的正则表达式。 |
| -s --signal        | 发送指定信号                         |
| -u --user          | 结束指定用户的进程                   |
| -v --verbose       | 显示详细执行过程                     |
| -w --wait          | 等待所有的进程都结束                 |
| -V --version       | 显示版本信息                         |
| --help             | 显示帮助信息                         |

name:进程名称。`pkill`:用于杀死一个进程，与 kill 不同的是它会杀死指定名字的所有进程，类似于 killall 命令。kill 命令杀死指定进程 PID，需要配合 ps 使用，而 pkill 直接对进程对名字进行操作，更加方便。

## jobs

`jobs`:显示作业的状态。主要用途:显示作业的状态。列出活动的作业。列出停止的作业。

| 选项 | 意义                                   |
| ---  | ---                                    |
| -l   | 在作业信息中额外的列出 PID。           |
| -n   | 只列出最近一次通知以来状态变更的作业。 |
| -p   | 只列出 PID。                           |
| -r   | 只输出处于运行状态的作业。             |
| -s   | 只输出处于停止状态的作业。             |

    └─(10:07:54 on master ✖ ✹ ✭)──> sleep 120──(Wed,Mar30)─┘
    # 此时按下ctrl+z使得交互停止。
    ^Z
    [1]+ 100640 suspendedsleep 120
    ┌─(~/Documents/DEEP_FISH/DEEP)──────────────────────────────────────────────────────────────────────────────────(fiki@FIKI-AI:pts/2)─┐
    └─(10:08:01 on master ✖ ✹ ✭)──> sleep 120 & 148 ↵ ──(Wed,Mar30)─┘
    [2] 100665
    ┌─(~/Documents/DEEP_FISH/DEEP)──────────────────────────────────────────────────────────────────────────────────(fiki@FIKI-AI:pts/2)─┐
    └─(10:08:09 on master ✖ ✹ ✭)──> jobs -l──(Wed,Mar30)─┘
    [1]+ 100640 suspendedsleep 120
    [2]- 100665 running sleep 120

## bg

`bg`：将前台终端作业移动到后台运行,后跟指定要移动到后台执行的作业标识符，可以是一到多个。若后台任务中只有一个，则使用该命令时可以省略任务号。

## fg

`fg`：将后台作业移动到前台终端运行，后跟指定要移动到后台执行的作业标识符，可以是一到多个。若后台任务中只有一个，则使用该命令时可以省略任务号。

    └─(10:07:54 on master ✖ ✹ ✭)──> sleep 120──(Wed,Mar30)─┘
    # 此时按下ctrl+z使得交互停止。
    ^Z
    [1]+ 100640 suspendedsleep 120
    ┌─(~/Documents/DEEP_FISH/DEEP)──────────────────────────────────────────────────────────────────────────────────(fiki@FIKI-AI:pts/2)─┐
    └─(10:08:01 on master ✖ ✹ ✭)──> sleep 120 & 148 ↵ ──(Wed,Mar30)─┘
    [2] 100665
    ┌─(~/Documents/DEEP_FISH/DEEP)──────────────────────────────────────────────────────────────────────────────────(fiki@FIKI-AI:pts/2)─┐
    └─(10:08:09 on master ✖ ✹ ✭)──> jobs -l──(Wed,Mar30)─┘
    [1]+ 100640 suspendedsleep 120
    [2]- 100665 running sleep 120
    ┌─(~/Documents/DEEP_FISH/DEEP)──────────────────────────────────────────────────────────────────────────────────(fiki@FIKI-AI:pts/2)─┐
    └─(10:10:52 on master ✖ ✹ ✭)──> bg %1 148 ↵ ──(Wed,Mar30)─┘
    # 此时后台挂载的程序1在后台恢复运行
    [1]- 100640 continuedsleep 120
    ┌─(~/Documents/DEEP_FISH/DEEP)──────────────────────────────────────────────────────────────────────────────────(fiki@FIKI-AI:pts/2)─┐
    └─(10:11:03 on master ✖ ✹ ✭)──> fg %2 ──(Wed,Mar30)─┘
    # 此时后台运行的程序2被调到前台运行
    [2]- 100665 running sleep 120

## cd

`cd`:（英文全拼：change directory）命令用于切换当前工作目录。其中 dirName 表示法可为绝对路径或相对路径。若目录名称省略，则变换至使用者的 home 目录 (也就是刚 login 时所在的目录)。另外，~ 也表示为 home 目录 的意思， . 则是表示目前所在的目录， .. 则表示目前目录位置的上一层目录。

语法:`cd [dirName] `,dirName：要切换的目标目录。

## tree

`tree`:命令用于以树状图列出目录的内容。执行 tree 指令，它会列出指定目录下的所有文件，包括子目录里的文件。

语法：`tree [-aACdDfFgilnNpqstux][-I <范本样式>][-P <范本样式>][目录...]`

| 参数                   | 说明                                                                                                               |
| ---                    | ---                                                                                                                |
| 列表选项               |
| -a                     | 显示所有文件和目录。                                                                                               |
| -d                     | 显示目录名称而非文件。                                                                                             |
| -l                     | 如遇到性质为符号连接的目录，直接列出该连接所指向的原始目录。                                                       |
| -f                     | 在每个文件或目录之前，显示完整的相对路径名称。                                                                     |
| -x                     | 将范围局限在现行的文件系统中，若指定目录下的某些子目录，其存放于另一个文件系统上，则将该目录予以排除在寻找范围外。 |
| -L level               | 限制目录显示层级。                                                                                                 |
| -R                     | Rerun tree when max dir level reached.                                                                             |
| -P pattern             | <范本样式> 只显示符合范本样式的文件和目录名称。                                                                    |
| -I pattern             | Do not list files that match the given pattern.                                                                    |
| --ignore-case          | Ignore case when pattern matching.                                                                                 |
| --matchdirs            | Include directory names in -P pattern matching.                                                                    |
| --noreport             | Turn off file/directory count at end of tree listing.                                                              |
| --charset X            | Use charset X for terminal/HTML and indentation line output.                                                       |
| --filelimit            | Do not descend dirs with more than # files in them.                                                                |
| --timefmt <f>          | Print and format time according to the format <f>.                                                                 |
| -o filename            | Output to file instead of stdout.                                                                                  |
| 文件选项               |
| -q                     | 用“？”号取代控制字符，列出文件和目录名称。                                                                         |
| -N                     | 直接列出文件和目录名称，包括控制字符。                                                                             |
| -Q                     | Quote filenames with double quotes.                                                                                |
| -p                     | 列出权限标示。                                                                                                     |
| -u                     | 列出文件或目录的拥有者名称，没有对应的名称时，则显示用户识别码。                                                   |
| -g                     | 列出文件或目录的所属群组名称，没有对应的名称时，则显示群组识别码。                                                 |
| -s                     | 列出文件和目录大小。                                                                                               |
| -h                     | Print the size in a more human readable way.                                                                       |
| --si                   | Like -h, but use in SI units (powers of 1000).                                                                     |
| -D                     | 列出文件或目录的更改时间。                                                                                         |
| -F                     | 在执行文件，目录，Socket，符号连接，管道名称名称，各自加上"\*"，"/"，"@"，"#"号。                                  |
| --inodes               | Print inode number of each file.                                                                                   |
| --device               | Print device ID number to which each file belongs.                                                                 |
| 排序选项               |
| -v                     | Sort files alphanumerically by version.                                                                            |
| -t                     | 用文件和目录的更改时间排序。                                                                                       |
| -c                     | Sort files by last status change time.                                                                             |
| -U                     | Leave files unsorted.                                                                                              |
| -r                     | Reverse the order of the sort.                                                                                     |
| --dirsfirst            | List directories before files (-U disables).                                                                       |
| --sort X               | Select sort: name,version,size,mtime,ctime.                                                                        |
| 图形选项               |
| -i                     | 不以阶梯状列出文件和目录名称。                                                                                     |
| -A                     | 使用 ASNI 绘图字符显示树状图而非以 ASCII 字符组合。                                                                |
| -S                     | Print with CP437 (console) graphics indentation lines.                                                             |
| -n                     | Turn colorization off always (-C overrides).                                                                       |
| -C                     | 在文件和目录清单加上色彩，便于区分各种类型。                                                                       |
| XML / HTML / JSON 选项 |
| -X                     | Prints out an XML representation of the tree.                                                                      |
| -J                     | Prints out an JSON representation of the tree.                                                                     |
| -H baseHREF            | Prints out HTML format with baseHREF as top directory.                                                             |
| -T string              | Replace the default HTML title and H1 header with string.                                                          |
| --nolinks              | Turn off hyperlinks in HTML output.                                                                                |
| 杂项选项               |
| --version              | 输入版本信息。                                                                                                     |
| --help                 | 打印使用帮助信息。                                                                                                 |
| --                     | Options processing terminator.                                                                                     |

## du

`du`:（英文全拼：disk usage）命令用于显示目录或文件的大小。du 会显示指定的目录或文件所占用的磁盘空间。

语法:`du [-abcDhHklmsSx][-L <符号连接>][-X <文件>][--block-size][--exclude=<目录或文件>][--max-depth=<目录层数>][--help][--version][目录或文件]`

| 参数                                  | 意义                                                                                                         |
| ---                                   | ---                                                                                                          |
| -a, --all                             | 显示目录中个别文件的大小。                                                                                   |
| -B, --block-size=                     | 大小使用指定字节数的块                                                                                       |
| -b, --bytes                           | 显示目录或文件大小时，以byte为单位。                                                                         |
| -c, --total                           | 除了显示个别目录或文件的大小外，同时也显示所有目录或文件的总和。                                             |
| -D, --dereference-args                | 显示指定符号链接的源文件大小。                                                                               |
| -H, --si                              | 与-h参数相同，但是K，M，G是以1000为换算单位。                                                                |
| -h, --human-readable                  | 以K，M，G为单位，提高信息的可读性。                                                                          |
| -k, --kilobytes                       | 以KB(1024bytes)为单位输出。                                                                                  |
| -l, --count-links                     | 重复计算硬件链接的文件。                                                                                     |
| -m, --megabytes                       | 以MB为单位输出。                                                                                             |
| -L<符号链接>, --dereference<符号链接> | 显示选项中所指定符号链接的源文件大小。                                                                       |
| -P, --no-dereference                  | 不跟随任何符号链接(默认)                                                                                     |
| -0, --null                            | 将每个空行视作0 字节而非换行符                                                                               |
| -S, --separate-dirs                   | 显示个别目录的大小时，并不含其子目录的大小。                                                                 |
| -s, --summarize                       | 仅显示总计，只列出最后加总的值。                                                                             |
| -x, --one-file-xystem                 | 以一开始处理时的文件系统为准，若遇上其它不同的文件系统目录则略过。                                           |
| -X<文件>, --exclude-from=<文件>       | 在<文件>指定目录或文件。
| --apparent-size                       | 显示表面用量，而并非是磁盘用量；虽然表面用量通常会小一些，但有时它会因为稀疏文件间的"洞"、内部碎片、非直接引 | 用的块等原因而变大。 |
| --files0-from=F                       | 计算文件F中以NUL结尾的文件名对应占用的磁盘空间如果F的值是"-"，则从标准输入读入文件名                         |
| --exclude=<目录或文件>                | 略过指定的目录或文件。                                                                                       |
| --max-depth=N                         | 显示目录总计(与--all 一起使用计算文件)当N为指定数值时计算深度为N，等于0时等同--summarize                     |
| --si                                  | 类似-h，但在计算时使用1000 为基底而非1024                                                                    |
| --time                                | 显示目录或该目录子目录下所有文件的最后修改时间                                                               |
| --time=WORD                           | 显示WORD时间，而非修改时间：atime，access，use，ctime 或status                                               |
| --time-style=                         | 样式 按照指定样式显示时间(样式解释规则同"date"命令)：full-iso，long-iso，iso，+FORMAT                        |
| --help                                | 显示此帮助信息并退出                                                                                         |
| --version                             | 显示版本信息并退出                                                                                           |

## df

`df`:（英文全拼：disk free） 命令用于显示目前在 Linux 系统上的文件系统磁盘使用情况统计.默认显示单位为 KB。可以利用该命令来获取硬盘被占用了多少空间，目前还剩下多少空间等信息。

语法:`df [选项]... [FILE]...`

| 选项                                            | 意义                                                             |
| ---                                             | ---                                                              |
| -a或--all                                       | 包含全部的文件系统；                                             |
| --block-size=<区块大小>                         | 以指定的区块大小来显示区块数目；                                 |
| -h或--human-readable                            | 以可读性较高的方式来显示信息；                                   |
| -H或--si                                        | 与-h参数相同，但在计算时是以1000 Bytes为换算单位而非1024 Bytes； |
| -i或--inodes                                    | 显示inode的信息；                                                |
| -k或--kilobytes                                 | 指定区块大小为1024字节；                                         |
| -l或--local                                     | 仅显示本地端的文件系统；                                         |
| -m或--megabytes                                 | 指定区块大小为1048576字节；                                      |
| --no-sync                                       | 在取得磁盘使用信息前，不要执行sync指令，此为预设值；             |
| -P或--portability                               | 使用POSIX的输出格式；                                            |
| --sync                                          | 在取得磁盘使用信息前，先执行sync指令；                           |
| -t<文件系统类型>或--type=<文件系统类型>         | 仅显示指定文件系统类型的磁盘信息；                               |
| -T或--print-type                                | 显示文件系统的类型；                                             |
| -x<文件系统类型>或--exclude-type=<文件系统类型> | 不要显示指定文件系统类型的磁盘信息；                             |
| --help                                          | 显示帮助；                                                       |
| --version                                       | 显示版本信息。                                                   |

## diff 、diff3

`diff`:命令用于比较文件的差异。diff 以逐行的方式，比较文本文件的异同处。如果指定要比较目录，则 diff 会比较目录中相同文件名的文件，但不会比较其中子目录。

语法：
`diff [-abBcdefHilnNpPqrstTuvwy][-<行数>][-C <行数>][-D <巨集名称>][-I <字符或字符串>][-S <文件>][-W <宽度>][-x <文件或目录>][-X <文件>][--help][--left-column][--suppress-common-line][文件或目录1][文件或目录2]
`

| 选项                                                    | 意义                                                                                                                                 |
| ---                                                     | ---                                                                                                                                  |
| -<行数>                                                 | 指定要显示多少行的文本。此参数必须与-c 或-u 参数一并使用；                                                                           |
| -a 或——text                                             | diff 预设只会逐行比较文本文件；                                                                                                      |
| -b 或--ignore-space-change                              | 不检查空格字符的不同；                                                                                                               |
| -B 或--ignore-blank-lines                               | 不检查空白行；                                                                                                                       |
| -c                                                      | 显示全部内容，并标出不同之处；                                                                                                       |
| -C<行数>或--context<行数>                               | 与执行“-c-<行数>”指令相同；                                                                                                          |
| -d 或——minimal                                          | 使用不同的演算法，以小的单位来做比较；                                                                                               |
| -D<巨集名称>或 ifdef<巨集名称>                          | 此参数的输出格式可用于前置处理器巨集；                                                                                               |
| -e 或——ed                                               | 此参数的输出格式可用于 ed 的 script 文件；                                                                                           |
| -f 或-forward-ed                                        | 输出的格式类似 ed 的 script 文件，但按照原来文件的顺序来显示不同处；                                                                 |
| -H 或--speed-large-files                                | 比较大文件时，可加快速度；                                                                                                           |
| -l<字符或字符串>或--ignore-matching-lines<字符或字符串> | 若两个文件在某几行有所不同，而之际航同时都包含了选项中指定的字符或字符串，则不显示这两个文件的差异；                                 |
| -i 或--ignore-case                                      | 不检查大小写的不同；                                                                                                                 |
| -l 或——paginate                                         | 将结果交由 pr 程序来分页；                                                                                                           |
| -n 或——rcs                                              | 将比较结果以 RCS 的格式来显示；                                                                                                      |
| -N 或--new-file                                         | 在比较目录时，若文件 A 仅出现在某个目录中，预设会显示 Only in 目录，文件 A 若使用-N 参数，则 diff 会将文件 A 与一个空白的文件比较； |
| -p                                                      | 若比较的文件为 C 语言的程序码文件时，显示差异所在的函数名称；                                                                        |
| -P 或--unidirectional-new-file                          | 与-N 类似，但只有当第二个目录包含了第一个目录所没有的文件时，才会将这个文件与空白的文件做比较；                                      |
| -q 或--brief                                            | 仅显示有无差异，不显示详细的信息；                                                                                                   |
| -r 或——recursive                                        | 比较子目录中的文件；                                                                                                                 |
| -s 或--report-identical-files                           | 若没有发现任何差异，仍然显示信息；                                                                                                   |
| -S<文件>或--starting-file<文件>                         | 在比较目录时，从指定的文件开始比较；                                                                                                 |
| -t 或--expand-tabs                                      | 在输出时，将 tab 字符展开；                                                                                                          |
| -T 或--initial-tab                                      | 在每行前面加上 tab 字符以便对齐；                                                                                                    |
| -u，-U<列数>或--unified=<列数>                          | 以合并的方式来显示文件内容的不同；                                                                                                   |
| -v 或——version                                          | 显示版本信息；                                                                                                                       |
| -w 或--ignore-all-space                                 | 忽略全部的空格字符；                                                                                                                 |
| -W<宽度>或--width<宽度>                                 | 在使用-y 参数时，指定栏宽；                                                                                                          |
| -x<文件名或目录>或--exclude<文件名或目录>               | 不比较选项中所指定的文件或目录；                                                                                                     |
| -X<文件>或--exclude-from<文件>                          | 您可以将文件或目录类型存成文本文件，然后在=<文件>中指定此文本文件；                                                                  |
| -y 或--side-by-side                                     | 以并列的方式显示文件的异同之处；                                                                                                     |
| --help                                                  | 显示帮助；                                                                                                                           |
| --left-column                                           | 在使用-y 参数时，若两个文件某一行内容相同，则仅在左侧的栏位显示该行内容；                                                            |
| --suppress-common-lines                                 | 在使用-y 参数时，仅显示不同之处。                                                                                                    |

`diff3`:命令 用于比较 3 个文件，将 3 个文件的不同的地方显示到标准输出。

| 选项          | 意义                                                                                                            |
| ---           | ---                                                                                                             |
| -a            | 把所有的文件都当做文本文件按照行为单位进行比较，即给定的文件不是文本文件；                                      |
| -A            | 合并第 2 个文件和第 3 个文件之间的不同到第 1 个文件中，有冲突内容用括号括起来；                                 |
| -B            | 与选项“-A”功能相同，但是不显示冲突的内容；                                                                      |
| -e/--ed       | 生成一个“-ed”脚本，用于将第 2 个文件和第 3 个文件之间的不同合并到第 1 个文件中；                                |
| --easy-only   | 除了不显示互相重叠的变化，与选项“-e”的功能相同；                                                                |
| -i            | 为了和 system V 系统兼容，在“ed”脚本的最后生成“w”和“q”命令。此选项必须和选项“-AeExX3”连用，但是不能和“-m”连用； |
| --initial-tab | 在正常格式的行的文本前，输出一个 TAB 字符而非两个空白字符。此选项将导致在行中 TAB 字符的对齐方式看上去规范。    |

## cmp

`cmp`：Linux cmp 命令用于比较两个文件是否有差异。当相互比较的两个文件完全一样时，则该指令不会显示任何信息。若发现有所差异，预设会标示出第一个不同之处的字符和列数编号。若不指定任何文件名称或是所给予的文件名为"-"，则 cmp 指令会从标准输入设备读取数据。

| 选项                                      | 意义                                                       |
| ---                                       | ---                                                        |
| -c 或--print-chars                        | 除了标明差异处的十进制字码之外，一并显示该字符所对应字符； |
| -i<字符数目>或--ignore-initial=<字符数目> | 指定一个数目；                                             |
| -l 或——verbose                            | 标示出所有不一样的地方；                                   |
| -s 或--quiet 或——silent                   | 不显示错误信息；                                           |
| -v 或——version                            | 显示版本信息；                                             |
| --help                                    | 在线帮助。                                                 |

## comm

`comm`:Linux comm 命令用于比较两个已排过序的文件。这项指令会一列列地比较两个已排序文件的差异，并将其结果显示出来，如果没有指定任何参数，则会把结果分成 3 列显示：第 1 列仅是在第 1 个文件中出现过的列，第 2 列是仅在第 2 个文件中出现过的列，第 3 列则是在第 1 与第 2 个文件里都出现过的列。若给予的文件名称为 - ，则 comm 指令会从标准输入设备读取数据。

语法

    comm [-123][--help][--version][第1个文件][第 2 个文件]
    参数：-1 不显示只在第 1 个文件里出现过的列。
    -2 不显示只在第 2 个文件里出现过的列。
    -3 不显示只在第 1 和第 2 个文件里出现过的列。

## who

`who`:显示当前所有登陆用户的信息。当没有给出非选项参数时，按以下字段顺序为每个当前用户打印信息：登录用户名称，终端信息，登录时间，远程主机或 X display。

当用户执行 whoami 时，只显示运行该命令的用户的信息。

| 选项                                  | 说明                                                        |
| ---                                   | ---                                                         |
| -a, --all                             | 等价于调用 '-b -d --login -p -r -t -T -u'。                 |
| -b, --boot                            | 上次系统启动的时间。                                        |
| -d, --dead                            | 打印 dead 状态的进程。                                      |
| -H, --heading                         | 打印列标题行。                                              |
| -l, --login                           | 打印系统登录进程。                                          |
| --lookup                              | 尝试通过 DNS 规范主机名。                                   |
| -m                                    | 仅显示和标准输入关联的主机名和用户。                        |
| -p, --process                         | 打印由 init 生成的活动进程。                                |
| -q, --count                           | 列出所有已登录的用户的名称和数量。                          |
| -r, --runlevel                        | 打印当前运行级别。                                          |
| -s, --short                           | 仅打印名称、行和时间（默认）。                              |
| -t, --time                            | 打印上次系统时钟更改。                                      |
| -T, -w, --mesg, --message, --writable | 将 '+、-、?' 中的一个作为用户的消息状态添加到用户名称后面。 |
| -u, --users                           | 列出登录的用户。                                            |
| --help                                | 显示帮助信息并退出。                                        |
| --version                             | 显示版本信息并退出。                                        |

    关于 -T 选项的 '+、-、?'：
    '+'允许写入信息
    '-'禁止写入信息
    '?'不能查找到终端设备

## whoami

whoami`:命令用于显示自身用户名称。显示自身的用户名称，本指令相当于执行"id -un"指令。`

| 选项                                  | 说明                                                        |
| ---                                   | ---                                                         |
| -b, --boot                            | 上次系统启动的时间。                                        |
| -d, --dead                            | 打印 dead 状态的进程。                                      |
| -H, --heading                         | 打印列标题行。                                              |
| -l, --login                           | 打印系统登录进程。                                          |
| --lookup                              | 尝试通过 DNS 规范主机名。                                   |
| -m                                    | 仅显示和标准输入关联的主机名和用户。                        |
| -p, --process                         | 打印由 init 生成的活动进程。                                |
| -q, --count                           | 列出所有已登录的用户的名称和数量。                          |
| -r, --runlevel                        | 打印当前运行级别。                                          |
| -s, --short                           | 仅打印名称、行和时间（默认）。                              |
| -t, --time                            | 打印上次系统时钟更改。                                      |
| -T, -w, --mesg, --message, --writable | 将 '+、-、?' 中的一个作为用户的消息状态添加到用户名称后面。 |
| -u, --users                           | 列出登录的用户。                                            |
| --help                                | 显示帮助信息并退出。                                        |
| --version                             | 显示版本信息并退出。                                        |

    关于 -T 选项的 '+、-、?'：
    '+'允许写入信息
    '-'禁止写入信息
    '?'不能查找到终端设备

## logname

`logname`:打印当前终端登录用户的名称。`whoami`、`logname`区别，在正常用户的输出都是一样的，但如果切入超级用户，`whoami`会输出 root

## w显示目前登入系统的用户信息补充说明

w 命令 用于显示已经登陆系统的用户列表，并显示用户正在执行的指令。执行这个命令可得知目前登入系统的用户有那些人，以及他们正在执行的程序。单独执行 w 命令会显示所有的用户，您也可指定用户名称，仅显示某位用户的相关信息。

## env、export

`env`:命令 用于显示系统中已存在的环境变量，以及在定义的环境中执行指令。该命令只使用"-"作为参数选项时，隐藏了选项"-i"的功能。若没有设置任何选项和参数时，则直接显示当前的环境变量。如果使用 env 命令在新环境中执行指令时，会因为没有定义环境变量"PATH"而提示错误信息"such file or directory"。此时，用户可以重新定义一个新的"PATH"或者使用绝对路径。

`export`:为 shell 变量或函数设置导出属性。

概要:

    export [-fn] [name[=word]]...
    export -p

主要用途:定义一到多个变量并设置导出属性。
修改一到多个变量的值并设置导出属性。删除一到多个变量的导出属性。显示全部拥有导出属性的变量。为一到多个已定义函数新增导出属性。删除一到多个函数的导出属性。显示全部拥有导出属性的函数

| 选项 | 说明 |
|-f|指向函数。|
|-n|删除变量的导出属性。|
|-p|显示全部拥有导出属性的变量。|
|-pf|显示全部拥有导出属性的函数。|
|-nf|删除函数的导出属性。|
|--|在它之后的选项无效|

## free

`free`:可以显示当前系统未使用的和已使用的内存数目，还可以显示被内核使用的内存缓冲区。

| 选项         | 说明                             |
| ---          | ---                              |
| -b           | 以 Byte 为单位显示内存使用情况； |
| -k           | 以 KB 为单位显示内存使用情况；   |
| -m           | 以 MB 为单位显示内存使用情况；   |
| -g           | 以 GB 为单位显示内存使用情况。   |
| -o           | 不显示缓冲区调节列；             |
| -s<间隔秒数> | 持续观察内存使用状况；           |
| -t           | 显示内存总和列；                 |
| -V           | 显示版本信息。                   |

## clear

`clear`:清除当前屏幕终端上的任何信息

## halt 、poweroff、shutdown、reboot、init

`halt`:关闭正在运行的 Linux 操作系统,用来关闭正在运行的 Linux 操作系统。halt 命令会先检测系统的 runlevel，若 runlevel 为 0 或 6，则关闭系统，否则即调用 shutdown 来关闭系统。

| 选项 | 说明                                                       |
| ---  | ---                                                        |
| -d   | 不要在 wtmp 中记录；                                       |
| -f   | 不论目前的 runlevel 为何，不调用 shutdown 即强制关闭系统； |
| -i   | 在 halt 之前，关闭全部的网络界面；                         |
| -n   | halt 前，不用先执行 sync；                                 |
| -p   | halt 之后，执行 poweroff；                                 |
| -w   | 仅在 wtmp 中记录，而不实际结束系统。                       |

`poweroff`:关闭 Linux 系统，关闭记录会被写入到/var/log/wtmp 日志文件中

| 选项 | 说明                                           |
| ---  | ---                                            |
| -n   | 关闭之前不同步                                 |
| -p   | 当被称为 halt 时关闭电源                       |
| -v   | 增加输出，包括消息                             |
| -q   | 降低输出错误唯一的消息                         |
| -w   | 并不实际关闭系统，只是写入/var/log/wtmp 文件中 |
| -f   | 强制关机，不调用 shutdown                      |

`shhutdown`:命令 用来系统关机命令。shutdown 指令可以关闭所有程序，并依用户的需要，进行重新开机或关机的动作。

语法：`shutdown(选项)(参数)`

| 选项     | 说明                                                             |
| ---      | ---                                                              |
| -c       | 当执行“shutdown -h 11:50”指令时，只要按+键就可以中断关机的指令； |
| -f       | 重新启动时不执行 fsck；                                          |
| -F       | 重新启动时执行 fsck；                                            |
| -h       | 将系统关机；                                                     |
| -k       | 只是送出信息给所有用户，但不会实际关机；                         |
| -n       | 不调用 init 程序进行关机，而由 shutdown 自己进行；               |
| -r       | shutdown 之后重新启动；                                          |
| -t<秒数> | 送出警告信息和删除信息之间要延迟多少秒。                         |

参数:
\[时间]：设置多久时间后执行 shutdown 指令；
\[警告信息]：要传送给所有登入用户的信息。

`reboot`:重新启动正在运行的 Linux 操作系统

| 选项 | 说明                                                                                      |
| ---  | ---                                                                                       |
| -d   | 重新开机时不把数据写入记录文件/var/tmp/wtmp。本参数具有“-n”参数效果；                     |
| -f   | 强制重新开机，不调用 shutdown 指令的功能；                                                |
| -i   | 在重开机之前，先关闭所有网络界面；                                                        |
| -n   | 重开机之前不检查是否有未结束的程序；                                                      |
| -w   | 仅做测试，并不真正将系统重新开机，只会把重开机的数据写入/var/log 目录下的 wtmp 记录文件。 |

`init`:命令 是 Linux 下的进程初始化工具，init 进程是所有 Linux 进程的父进程，它的进程号为 1。init 命令是 Linux 操作系统中不可缺少的程序之一，init 进程是 Linux 内核引导运行的，是系统中的第一个进程。

语法：`init(选项)(参数)`

| 选项 | 说明                                 |
| ---  | ---                                  |
| -b   | 不执行相关脚本而直接进入单用户模式； |
| -s   | 切换到单用户模式。                   |

参数:运行等级：指定 Linux 系统要切换到的运行等级什么是运行级呢？简单的说，运行级就是操作系统当前正在运行的功能级别。这个级别从 0 到 6 ，具有不同的功能。你也可以在/etc/inittab 中查看它的英文介绍。

| 级别 | 说明                                            |
| ---  | ---                                             |
| #0   | 停机（千万不能把 initdefault 设置为 0）         |
| #1   | 单用户模式                                      |
| #2   | 多用户，没有 NFS(和级别 3 相似，会停止部分服务) |
| #3   | 完全多用户模式                                  |
| #4   | 没有用到                                        |
| #5   | x11(Xwindow)                                    |
| #6   | 重新启动（千万不要把 initdefault 设置为 6）     |

`init 0`可以实现关机，也就是调用系统的 0 级别，`init 6`可以实现重启，也就是调用系统的 6 级别.

> 在早期的 Linux 系统中，应该尽量使用 shutdown 命令来进行关机和重启。因为在那时的 Linux 中，只有 shutdown 命令在关机或重启之前会正确地中止进程及服务，所以我们一直认为 shutdown 才是最安全的关机与重启命令。
> 而在现在的系统中，一些其他的命令（如 reboot）也会正确地中止进程及服务，但我们仍建议使用 shutdown 命令来进行关机和重启。
> 在现在的系统中，reboot 命令也是安全的，而且不需要加入过多的选项。

## tr

`tr`:命令 可以对来自标准输入的字符进行替换、压缩和删除。它可以将一组字符变成另一组字符，经常用来编写优美的单行命令，作用很强大。

| 选项                 | 说明                                     |
| ---                  | ---                                      |
| -c ——complerment     | 取代所有不属于第一字符集的字符；         |
| -d ——delete          | 删除所有属于第一字符集的字符；           |
| -s --squeeze-repeats | 把连续重复的字符以单独一个字符表示；     |
| -t --truncate-set1   | 先删除第一字符集较第二字符集多出的字符。 |

语法:`tr(选项)(参数)`

参数:

字符集 1：指定要转换或删除的原字符集。当执行转换操作时，必须使用参数“字符集2”指定转换的目标字符集。但执行删除操作时，不需要参数“字符集 2”；
字符集 2：指定要转换成的目标字符集。

例子：

    echo "HELLO WORLD" | tr 'A-Z' 'a-z'# 将输入字符由大写转换为小写
    echo "HELLOWORLD" | tr -s ' '# 将空格压缩为一个

tr 可以使用的字符类：

    [:alnum:]：字母和数字
    [:alpha:]：字母
    [:cntrl:]：控制（非打印）字符
    [:digit:]：数字
    [:graph:]：图形字符
    [:lower:]：小写字母
    [:print:]：可打印字符
    [:punct:]：标点符号
    [:space:]：空白字符
    [:upper:]：大写字母
    [:xdigit:]：十六进制字符

使用方式：tr '\[:lower:]' '\[:upper:]'

## col

`col`:命令 是一个标准输入文本过滤器，它从标注输入设备读取文本内容，并把内容显示到标注输出设备。在许多 UNIX 说明文件里，都有 RLF 控制字符。当我们运用 shell 特殊字符>和>>，把说明文件的内容输出成纯文本文件时，控制字符会变成乱码，col 命令则能有效滤除这些控制字符。RLF 字符(reverse line feed)是反向换行符，HRLF 字符（half-reverse line feed）是半反向换行符。

| 选项                | 说明                                                                                  |
| ---                 | ---                                                                                   |
| -b, --no-backspaces | 不输出任何退格符，只打印写入每个列位置的最后一个字符                                  |
| -f, --fine          | 允许正向半换行符（half-forward line feeds）。通常，处于半行分界线上的字符打印在下一行 |
| -h, --tabs          | 将多个空格转换为 Tab，一般 4 个 空格转为 1 个 Tab                                     |
| -l, --lines NUMBER  | 设置缓冲行为 NUMBER，默认为 128                                                       |
| -p, --pass          | 不转换未识别的控制符                                                                  |
| -x, --spaces        | 将 Tab 转为多个空格，一般 1 一个 Tab 转为 4 个空格                                    |
| -H, --help          | 显示帮助信息并退出                                                                    |
| -V, --version       | 显示版本信息并退出                                                                    |

例子:

    echo -e "123\t456" | col -x# 将 Tab 替换为空格，一般 1 个 Tab 转为 4 个空格。
    echo -e "123 456" | col -h# 将空格替换为 Tab，一般 4 个 空格转为 1 个 Tab。
    man col | col -b > newFile# 将帮助文档内的控制符删除。以 col 命令的 manual 为例。

## join

`join`:用来将两个文件中，制定栏位内容相同的行连接起来。找出两个文件中，指定栏位内容相同的行，并加以合并，再输出到标准输出设备。

语法：`join(选项)(参数)`

| 选项               | 说明                                                                   |
| ---                | ---                                                                    |
| -a<1 或 2>         | 除了显示原来的输出内容之外，还显示指令文件中没有相同栏位的行；         |
| -e<字符串>         | 若\[文件 1]与\[文件 2]中找不到指定的栏位，则在输出中填入选项中的字符串； |
| -i 或--ignore-case | 比较栏位内容时，忽略大小写的差异；                                     |
| -j FIELD           | 等同于 -1 FIELD -2 FIELD,-j 指定一个域作为匹配字段                     |
| -o<格式>           | 按照指定的格式来显示结果；                                             |
| -t<字符>           | 使用栏位的分割字符；                                                   |
| -v<1 或 2>         | 更-a 相同，但是只显示文件中没有相同栏位的行；                          |
| -1<栏位>           | 连接\[文件 1]指定的栏位；                                               |
| -2<栏位>           | 连接\[文件 2]指定的栏位。                                               |

参数：文件 1：要进行合并操作的第 1 个文件参数；文件 2：要进行合并操作的第 2 个文件参数。

例子：

    cat 1.txt
    aa 1 2
    bb 2 3
    cc 4 6
    dd 3 3cat 2.txt
    aa 2 1
    bb 8 2
    ff 2 4
    cc 4 4
    dd 5 5join 1.txt 2.txt
    aa 1 2 2 1
    bb 2 3 8 2
    join: 2:4: is not sorted: cc 4 4
    join: input is not in sorted order
    具有相同顺序列首的行被组合在一起了，而第三行两个文件的不同，下面的就不会拼接在一起了join -1 2 -2 3 file1.txt file2.txt#以第一个文件的第二列和第二个文件的第三列做匹配字

## cut

`cut`:用来显示行中的指定部分，删除文件中指定字段。cut 经常用来显示文件的内容，类似于 type 命令。

语法：`cut（选项）（参数）`

| 选项                        | 说明                                        |
| ---                         | ---                                         |
| -b                          | 仅显示行中指定直接范围的内容；              |
| -c                          | 仅显示行中指定范围的字符；                  |
| -d                          | 指定字段的分隔符，默认的字段分隔符为“TAB”； |
| -f                          | 显示指定字段的内容；                        |
| -n                          | 与“-b”选项连用，不分割多字节字符；          |
| --complement                | 补足被选择的字节、字符或字段；              |
| --out-delimiter= 字段分隔符 | 指定输出内容是的字段分割符；                |
| --help                      | 显示指令的帮助信息；                        |
| --version                   | 显示指令的版本信息。                        |

例子：

    cat 1.txt
    aa 1 2
    bb 2 3
    cc 4 6
    dd 3 3cut -d ' ' -f 1 1.txt
    # 以空格为分割符提取第一列
    aa
    bb
    cc
    dd如果文件的分隔符为tab则可以省略-d

## exit

`exit`:执行 exit 可使 shell 以指定的状态值退出。若不设置参数，则以最后一条命令的返回值作为 exit 的返回值退出。

## type

`type`:显示指定命令的类型。

语法：`type [-afptP] name [name ...]`

主要用途：
显示要查找的命令的信息。
控制查找范围和行为。
显示要查找的命令优先级最高的类型。

| 选项 | 说明                                                                                                                                                |
| ---  | ---                                                                                                                                                 |
| -a   | 在环境变量 PATH 中查找并显示所有包含 name 的可执行文件路径；当'-p'选项没有同时给出时，如果在别名、关键字，函数，内建的信息中存在 name，则一并显示。 |
| -f   | 排除对 shell 函数的查找。                                                                                                                           |
| -p   | 如果 name 在执行'type -t name'返回的不是'file'，那么什么也不返回；否则会在环境变量 PATH 中查找并返回可执行文件路径。                                |
| -P   | 即使要查找的 name 是别名、内建、函数中的一个，仍然会在环境变量 PATH 中查找并返回可执行文件路径。                                                    |
| -t   | 根据 name 的类型返回一个单词（别名，关键字，函数，内建，文件），否则返回空值。                                                                      |

参数：name：要查找的命令，可以为多个。

## paste

`paste`:命令用于合并文件的列。会把每个文件以列对列的方式，一列列地加以合并。

语法:`paste [-s][-d <间隔字符>][--help][--version][文件...]`

| 选项                                  | 说明                           |
| ---                                   | ---                            |
| -d<间隔字符>或--delimiters=<间隔字符> | 用指定的间隔字符取代跳格字符。 |
| -s 或--serial                         | 串列进行而非平行处理。         |
| --help                                | 在线帮助。                     |
| --version                             | 显示帮助信息。                 |
| \[文件…]                               | 指定操作的文件路径             |

与`join`的区别：会无差别的把两文件的第一行合并在一起，而不会根据栏位相同选择合并。

例子：

    cat 1.txt
    aa 1 2
    bb 2 3
    cc 4 6
    dd 3 3cat 2.txt
    aa 2 1
    bb 8 2
    ff 2 4
    cc 4 4
    dd 5 5paste 1.txt 2.txt
    aa 1 2	aa 2 1
    bb 2 3	bb 8 2
    cc 4 6	ff 2 4
    dd 3 3	cc 4 4dd 5 5

## expand、unexpand

`expand`:命令 用于将文件的制表符（TAB）转换为空白字符（space），将结果显示到标准输出设备。

语法:`expand(选项)(参数)`选项:-t<数字>：指定制表符所代表的空白字符的个数，而不使用默认的 8。参数:文件,指定要转换制表符为空白的文件`unexpand`:命令 用于将给定文件中的空白字符（space）转换为制表符（TAB），并把转换结果显示在标准输出设备（显示终端）。

语法:unexpand(选项)(参数)

| 选项         | 说明                                                      |
| ---          | ---                                                       |
| -a 或--all   | 转换文件中所有的空白字符；                                |
| --first-only | 仅转换开头的空白字符；                                    |
| -t<N>        | 指定 TAB 所代表的 N 个（N 为整数）字符数，默认 N 值是 8。 |

参数:文件,指定要转换空白为 TAB 的文件列表。

## basename 、dirname

`basename`:显示指定路径除了文件名。

例子：

    pwd# /opt/go/bin/
    basename /opt/go/bin/go# /opt/go/bin
    basename /opt/go/bin/# /opt/go
    basename /opt/go/bin# /opt/go
    basename go# go

`dirname`:显示指定路径除了文件名之外的路径前缀。

例子：

    pwd # /opt/go/bin/
    dirname /opt/go/bin/go# /opt/go/bin
    dirname /opt/go/bin/# /opt/go
    dirname /opt/go/bin# /opt/go
    dirname go# .

## hostname、hostnamectl

`hostname`：命令 用于显示和设置系统的主机名称。在使用 hostname 命令设置主机名后，系统并不会永久保存新的主机名，重启之后还是原来的主机名。

如果需要永久修改主机名，需要修改`/etc/hosts` 和 `/etc/sysconfig/network` 的相关内容并进行重启；也可以使用 hostnamectl 命令进行永久修改。

`hostnamectl`：可用于查询和更改系统主机名和相关设置。

语法：`hostnamectl [选项...] 指令 ...`

| 指令                | 说明               |
| ---                 | ---                |
| status              | 显示当前主机名设置 |
| set-hostname NAME   | 设置系统主机名     |
| set-icon-name NAME  | 设置主机的图标名称 |
| set-chassis NAME    | 设置主机的机箱类型 |
| set-deployment NAME | 设置主机的部署环境 |
| set-location NAME   | 设置主机位置       |

## lsattr

`lsattr`:命令 用于查看文件的第二扩展文件系统属性。

语法：`lsattr(选项)(参数)`

| 选项 | 说明                                                                                     |
| ---  | ---                                                                                      |
| -E   | 可显示设备属性的当前值，但这个当前值是从用户设备数据库中获得的，而不是从设备直接获得的。 |
| -D   | 显示属性的名称，属性的默认值，描述和用户是否可以修改属性值的标志。                       |
| -R   | 递归的操作方式；                                                                         |
| -V   | 显示指令的版本信息；                                                                     |
| -a   | 列出目录中的所有文件，包括隐藏文件。                                                     |

lsattr 经常使用的几个选项-D，-E，-R 这三个选项不可以一起使用，它们是互斥的，经常使用的还有-l,-H，使用 lsattr 时，必须指出具体的设备名，用-l 选项指出要显示设备的逻辑名称，否则要用-c，-s，-t 等选项唯一的确定某个已存在的设备。|参数:文件：指定显示文件系统属性的文件名。

## chattr

`chattr`:命令 用来改变文件属性。这项指令可改变存放在 ext2 文件系统上的文件或目录属性，这些属性共有以下 8 种模式：

语法:`chattr(选项)`

| 选项         | 说明                                             |
| ---          | ---                                              |
| a            | 让文件或目录仅供附加用途；                       |
| b            | 不更新文件或目录的最后存取时间；                 |
| c            | 将文件或目录压缩后存放；                         |
| d            | 将文件或目录排除在倾倒操作之外；                 |
| i            | 不得任意更动文件或目录；                         |
| s            | 保密性删除文件或目录；                           |
| S            | 即时更新文件或目录；                             |
| u            | 预防意外删除。                                   |
| -R           | 递归处理，将指令目录下的所有文件及子目录一并处理 |
| -v<版本编号> | 设置文件或目录版本；                             |
| -V           | 显示指令执行过程；                               |
| +<属性>      | 开启文件或目录的该项属性；                       |
| -<属性>      | 关闭文件或目录的该项属性；                       |
| =<属性>      | 指定文件或目录的该项属性。                       |

## cal、date、timedatectl、hwclock

`cal`：显示当前日历或指定日期的日历cal 命令 用于显示当前日历，或者指定日期的日历，如果没有指定参数，则显示当前月份。
一个单一的参数指定要显示的年份 (1 - 9999) ; 注意年份必须被完全地指定: cal 89 不会 显示 1989 年的日历. 两个参数表示月份 (1 - 12) 和年份. 如果没有指定参数, 则显示当前月份的日历.
一年从 Jan 1 (1 月 1 日) 开始.

语法:`cal [ -mjy ] [ 月份 ] [ 年份 ]`

| 选项 | 说明                                                               |
| ---  | ---                                                                |
| -l   | 显示单月输出；                                                     |
| -3   | 显示临近三个月的日历；                                             |
| -s   | 将星期日作为月的第一天；                                           |
| -m   | 显示星期一作为一周的第一天.. (缺省为星期日.)                       |
| -j   | 显示儒略历的(Julian)日期 (以 1 为基的天数, 从 1 月 1 日开始计数) . |
| -y   | 显示当前年份的日历                                                 |

参数:月：指定月份；年：指定年份。

`date`：显示或设置系统时间与日期

概要:

    date [OPTION]... [+FORMAT]
    date [-u|--utc|--universal] [MMDDhhmm[[CC]YY][.ss]]

主要用途:
转换时间到选定的格式，默认为当前。
设置系统时间。参数:format：输出的时间格式。format 可用的转义序列如下：

    %%百分号
    %a当地缩写的工作日名称（例如，Sun）
    %A当地完整的工作日名称（例如，Sunday）
    %b当地缩写的月份名称（例如，Jan）
    %B当地完整的月份名称（例如，January）
    %c当地的日期和时间（例如，Thu Mar3 23:05:25 2005）
    %C世纪，和%Y类似，但是省略后两位（例如，20）
    %d一月中的一天（例如，01）
    %D日期，等价于%m/%d/%y
    %e一月中的一天，格式使用空格填充，等价于%_d
    %F完整的日期；等价于%+4Y-%m-%d
    %gISO标准计数周的年份的最后两位数字
    %GISO标准计数周的年份，通常只对%V有用
    %h等价于%b
    %H小时，范围（00..23）
    %I小时，范围（00..23）
    %j一年中的一天，范围（001..366）
    %k小时，使用空格填充，范围（0..23），等价于%_H
    %l小时，使用空格填充，范围（1..12），等价于%_I
    %m月，范围（01..12）
    %M分钟，范围（00..59）
    %n换行符
    %N纳秒，范围（000000000..000000000）
    %p用于表示当地的AM或PM，如果未知则为空白
    %P类似于%p，但用小写表示
    %q季度，范围（1..4）
    %r当地以12小时表示的时钟时间（例如，11:11:04 PM）
    %R24小时每分钟；等价于%H:%M
    %s自协调世界时1970年01月01日00时00分以来的秒数
    %S秒数，范围（00..60）
    %t水平制表符
    %T时间；等价于%H:%M:%S
    %u一周中的一天（1..7），1代表星期一
    %U一年中的第几周，周日作为一周的起始（00..53）
    %VISO标准计数周，该方法将周一作为一周的起始（01..53）
    %w一周中的一天（0..6），0代表星期天
    %W一年中的第几周，周一作为一周的起始（00..53）
    %x当地的日期表示（例如，12/31/99）
    %X当地的时间表示（例如，23:13:48）
    %y年份后两位数字，范围（00..99）
    %Y年份
    %z+hhmm格式的数值化时区格式（例如，-0400）
    %:z+hh:mm格式的数值化时区格式（例如，-04:00）
    %::z +hh:mm:ss格式的数值化时区格式（例如，-04:00:00）
    %:::z数值化时区格式，相比上一个格式增加':'以显示必要的精度（例如，-04，+05:30）
    %Z时区缩写（如EDT）

默认情况下，日期用零填充数字字段；以下可选的符号可以跟在'%'后面:

    -(连字符) 不要填充相应的字段。
    _(下划线) 使用空格填充相应的字段。
    0(数字0) 使用数字0填充相应的字段。
    +用数字0填充，未来年份大于4位数字则在前面加上'+'号。
    ^允许的情况下使用大写。
    #允许的情况下将默认的大写转换为小写，默认的小写转换为大写。

在任何标志之后都有一个可选的字段宽度，如小数；然后是一个可选的修饰符，在可用的情况下，使用 E 来使用当地语言环境的替代表示，
使用 O 来使用当地语言环境的替代数字符号。

| 选项                      | 说明                                                                                                                  |
| ---                       | ---                                                                                                                   |
| -d, --date=STRING         | 解析字符串并按照指定格式输出，字符串不能是'now'。                                                                     |
| --debug                   | 注释已解析的日期，并将有疑问的用法发送到标准错误。                                                                    |
| -f, --file=DATEFILE       | 类似于--date; 一次从 DATEFILE 处理一行。                                                                              |
| -I\[FMT], --iso-8601\[=FMT] | 按照 ISO 8601 格式输出，FMT 可以为'date'(默认)，'hours'，'minutes'，'seconds'，'ns'。 例如：2006-08-14T02:34:56-06:00 |
| -R, --rfc-email           | 按照 RFC 5322 格式输出，例如: Mon, 14 Aug 2006 02:34:56 -0600                                                         |
| --rfc-3339=FMT            | 按照 RFC 3339 格式输出，FMT 可以为'date', 'seconds','ns'中的一个， 例如：2006-08-14 02:34:56-06:00                    |
| -r, --reference=FILE      | 显示文件的上次修改时间。                                                                                              |
| -s, --set=STRING          | 根据字符串设置系统时间。                                                                                              |
| -u, --utc, --universal    | 显示或设置世界协调时(UTC)。                                                                                           |
| --help                    | 显示帮助信息并退出。                                                                                                  |
| --version                 | 显示版本信息并退出。                                                                                                  |

`timedatectl`：用于在 Linux 中设置或查询系统时间、日期和时区等配置。在 Linux 运维中，通常使用此命令来设置或更改当前的日期、时间和时区，或启用自动系统时钟与远程 NTP 服务器同步，以确保 Linux 系统始终保持正确的时间。

概要:`timedatectl [OPTIONS...] COMMAND ...`

主要用途:转换时间到选定的格式，默认为当前。设置系统时间。

| 选项                   | 说明                                      |
| ---                    | ---                                       |
| -h --help              | 显示帮助信息。                            |
| --version              | 显示软件包版本。                          |
| --no-pager             | 不用将输出通过管道传输到寻呼机（pager）。 |
| --no-ask-password      | 不提示输入密码。                          |
| -H --host=\[USER@]HOST  | 在远程主机上操作                          |
| -M --machine=CONTAINER | 在本地容器上操作。                        |
| --adjust-system-clock  | 更改本地 RTC 模式时调整系统时钟。         |

    Commands:status 显示当前的时间设置。set-time TIME设置系统时间。set-timezone ZONE设置系统时区。list-timezones显示已知时区。set-local-rtc BOOL 控制 RTC 是否在当地时间。（BOOL 的值可以是 1 / true 或 0 / false）set-ntp BOOL 启用或禁用网络时间同步。（BOOL 的值可以是 1 / true 或 0 / false）timesync-status 显示 systemd-timesyncd 的状态。show-timesync显示 systemd-timesyncd 的属性。

`hwclock`:是一个硬件时钟访问工具，它可以显示当前时间、设置硬件时钟的时间和设置硬件时钟为系统时间，也可设置系统时间为硬件时钟的时间。
在 Linux 中有硬件时钟与系统时钟等两种时钟。硬件时钟是指主机板上的时钟设备，也就是通常可在 BIOS 画面设定的时钟。系统时钟则是指 kernel 中的时钟。当 Linux 启动时，系统时钟会去读取硬件时钟的设定，之后系统时钟即独立运作。所有 Linux 相关指令与函数都是读取系统时钟的设定。

语法:`hwclock(选项)`

| 选项                      | 说明                                                                                                                                                       |
| ---                       | ---                                                                                                                                                        |
| --adjust                  | hwclock 每次更改硬件时钟时，都会记录在/etc/adjtime 文件中。使用--adjust 参数，可使 hwclock 根据先前的记录来估算硬件时钟的偏差，并用来校正目前的硬件时钟； |
| --debug                   | 显示 hwclock 执行时详细的信息；                                                                                                                            |
| --directisa               | hwclock 预设从/dev/rtc 设备来存取硬件时钟。若无法存取时，可用此参数直接以 I/O 指令来存取硬件时钟；                                                         |
| --hctosys                 | 将系统时钟调整为与目前的硬件时钟一致；                                                                                                                     |
| --set --date=<日期与时间> | 设定硬件时钟；                                                                                                                                             |
| --show                    | 显示硬件时钟的时间与日期；                                                                                                                                 |
| --systohc                 | 将硬件时钟调整为与目前的系统时钟一致；                                                                                                                     |
| --test                    | 仅测试程序，而不会实际更改硬件时钟；                                                                                                                       |
| --utc                     | 若要使用格林威治时间，请加入此参数，hwclock 会执行转换的工作；                                                                                             |
| --version                 | 显示版本信息。                                                                                                                                             |

## split

`split`：可以将一个大文件按大小分割成很多个小文件，有时需要将文件分割成更小的片段，比如为提高可读性，生成日志等。

| 选项 | 说明                                  |
| ---  | ---                                   |
| -b   | 值为每一输出档案的大小，单位为 byte。 |
| -C   | 每一输出档中，单行的最大 byte 数。    |
| -d   | 使用数字作为后缀。                    |
| -l   | 值为每一输出档的行数大小。            |
| -a   | 指定后缀长度(默认为 2)。              |

## csplit

`csplit`:命令 用于将一个大文件以模式分割成小的碎片（例如时间段），并且将分割后的每个碎片保存成一个文件。碎片文件的命名类似“xx00”，“xx01”。csplit 命令是 split 的一个变体，split 只能够根据文件大小或行数来分割，但 csplit 能够根据文件本身特点来分割文件。

语法:`csplit(选项)(参数)`

| 选项                                          | 说明                                                                                                                           |
| ---                                           | ---                                                                                                                            |
| -b<输出格式>或--suffix-format=<输出格式>      | 预设的输出格式其文件名称为 xx00，xx01 等，用户可以通过改变<输出格式>来改变输出的文件名；                                       |
| -f<输出字首字符串>或--prefix=<输出字首字符串> | 预设的输出字首字符串其文件名为 xx00，xx01 等，如果制定输出字首字符串为“hello”，则输出的文件名称会变成 hello00，hello、01...... |
| -k 或--keep-files                             | 保留文件，就算发生错误或中断执行，与不能删除已经输出保存的文件；                                                               |
| -n<输出文件名位数>或--digits=<输出文件名位数> | 预设的输出文件名位数其文件名称为 xx00，xx01......如果用户指定输出文件名位数为“3”，则输出的文件名称会变成 xx000，xx001 等；     |
| -q 或-s 或--quiet 或——silent                  | 不显示指令执行过程；                                                                                                           |
| -z 或--elide-empty-files                      | 删除长度为 0 Byte 文件。                                                                                                       |

参数:
文件：指定要分割的原文件；
模式：指定要分割文件时的匹配模式。

命令详细说明：

    /[正则表达式]/#匹配文本样式，比如/SERVER/，从第一行到包含SERVER的匹配行。
    {*}#表示根据匹配重复执行分割，直到文件尾停止，使用{整数}的形式指定分割执行的次数。
    -s#静默模式，不打印其他信息。
    -n#指定分割后的文件名后缀的数字个数。比如01、02、03等。
    -f#指定分割后的文件名前缀。
    -b#指定后缀格式。比如%02d.log，类似于C语言中的printf参数格式。
    rm server00.log #是删除第一个文件，因为分割后的的第一个文件没有内容，匹配的单词就位于文件的第一行中。

## uname

`uname`:印机器和操作系统的信息。
当没有选项时，默认启用 -s 选项。
如果给出多个选项或 -a 选项时，输出信息按以下字段排序：内核名称 主机名称 内核 release 内核版本 机器名称 处理器 硬件平台 操作系统。

| 选项                    | 说明                                                       |
| ---                     | ---                                                        |
| -a, --all               | 按顺序打印全部信息，如果 -p 和 -i 的信息是未知，那么省略。 |
| -s, --kernel-name       | 打印内核名称。                                             |
| -n, --nodename          | 打印网络节点主机名称。                                     |
| -r, --kernel-release    | 打印内核 release。                                         |
| -v, --kernel-version    | 打印内核版本。                                             |
| -m, --machine           | 打印机器名称。                                             |
| -p, --processor         | 打印处理器名称。                                           |
| -i, --hardware-platform | 打印硬件平台名称。                                         |
| -o, --operating-system  | 打印操作系统名称。                                         |
| --help                  | 显示帮助信息并退出。                                       |
| --version               | 显示版本信息并退出。                                       |

## md5sum

`md5sum`:计算和校验文件报文摘要的工具程序补充说明:md5sum 命令 采用 MD5 报文摘要算法（128 位）计算和检查文件的校验和。一般来说，安装了 Linux 后，就会有 md5sum 这个工具，直接在命令行终端直接运行。
MD5 算法常常被用来验证网络文件传输的完整性，防止文件被人篡改。MD5 全称是报文摘要算法（Message-Digest Algorithm 5），此算法对任意长度的信息逐位进行计算，产生一个二进制长度为 128 位（十六进制长度就是 32 位）的“指纹”（或称“报文摘要”），不同的文件产生相同的报文摘要的可能性是非常非常之小的。

语法:`md5sum(选项)(参数)`

| 选项        | 说明                                      |
| ---         | ---                                       |
| -b          | 二进制模式读取文件；                      |
| -t 或--text | 把输入的文件作为文本文件看待；            |
| -c          | 从指定文件中读取 MD5 校验和，并进行校验； |
| --status    | 验证成功时不输出任何信息；                |
| -w          | 当校验不正确时给出警告信息。              |

参数:文件：指定保存着文件名和校验和的文本文件。

## uptime

`uptime`:查看 Linux 系统负载信息

## echo、printf

`echo`:用于在 shell 中打印 shell 变量的值，或者直接输出指定的字符串。

`printf`:格式化并输出结果。

语法：`printf [-v var] format [arguments]`

选项:-v var：将结果输出到变量 var 中而不是输出到标准输出。

参数:format：输出格式。arguments：一到多个参数。转义序列：除了支持 printf(1)和 printf(3)的转义序列，内建 printf 还支持以下转义序列：

    %b 展开参数中的反斜杠转义字符。
    %q 将参数扩起以用作 shell 输入。
    %(fmt)T 根据 strftime(3)中的转义字符来输出日期时间字符串。

返回值:返回状态为成功除非给出了非法选项、写错误、赋值错误。

## read

`read `命令用于从标准输入读取数值。read 内部命令被用来从标准输入读取单行数据。这个命令可以用来读取键盘输入，当使用重定向的时候，可以读取文件中的一行数据。

语法:`read [-ers] [-a aname] [-d delim] [-i text] [-n nchars] [-N nchars] [-p prompt] [-t timeout] [-u fd] [name ...]`

参数说明:-a 后跟一个变量，该变量会被认为是个数组，然后给其赋值，默认是以空格为分割符,如果没有指定变量名，读取的数据将被自动赋值给特定的变量 REPLY-p

| 选项 | 意义                                                                     |
| ---  | ---                                                                      |
| -d   | 后面跟一个标志符，其实只有其后的第一个字符有用，作为结束的标志。         |
| -p   | 后面跟提示信息，即在输入前打印提示信息。                                 |
| -e   | 在输入的时候可以使用命令补全功能。                                       |
| -n   | 后跟一个数字，定义输入文本的长度，很实用。                               |
| -r   | 屏蔽\，如果没有该选项，则\作为一个转义字符，有的话 \就是个正常的字符了。 |
| -s   | 安静模式，在输入字符时不再屏幕上显示，例如 login 时输入密码。            |
| -t   | 后面跟秒数，定义输入字符的等待时间。                                     |
| -u   | 后面跟 fd，从文件描述符中读入，该文件描述符可以是 exec 新开启的。        |

```
    read first last
    从标准输入读取输入到第一个空格或者回车，将输入的第一个单词放到变量first中，并将该行其他的输入放在变量last中。read first last
    从标准输入读取输入到第一个空格或者回车，将输入的第一个单词放到变量first中，并将该行其他的输入放在变量last中。read
    从标准输入读取一行并赋值给特定变量REPLY。read -a arrayname
    把单词清单读入arrayname的数组里。read -p "text"
    打印提示（text），等待输入，并将输入存储在REPLY中。read -r line
    允许输入包含反斜杠。

<!---->

    补充一个终端输入密码时候，不让密码显示出来的例子。方法1：#!/bin/bash
    read -p "输入密码：" -s pwd
    echo
    echo password read, is "$pwd"
    方法2：#!/bin/bash
    stty -echo
    read -p "输入密码：" pwd
    stty echo
    echo
    echo 输入完毕。
    其中，选项-echo禁止将输出发送到终端，而选项echo则允许发送输出。
```

## let

`let` 命令是 BASH 中用于计算的工具，用于执行一个或多个表达式，变量计算中不需要加上 $ 来表示变量。如果表达式中包含了空格或其他特殊字符，则必须引起来。let 命令和双小括号 (( )) 的用法是类似的，它们都是用来对整数进行运算，

## exprexpr

命令是一个手工命令行计数器，用于在 UNIX/LINUX 下求表达式变量的值，一般用于整数值，也可用于字符串。

语法:`expr 表达式`

表达式说明:用空格隔开每个项；
用反斜杠 \ 放在 shell 特定的字符前面；
对包含空格和其他特殊字符的字符串要用引号括起来

    实例
    1、计算字串长度> expr length “this is a test”14
    2、抓取字串> expr substr “this is a test” 3 5
    3、抓取第一个字符数字串出现的位置> expr index "sarasara"a2
    4、整数运算> expr 14 % 95> expr 10 + 1020> expr 1000 + 9001900> expr 30 / 3 / 25> expr 30 \* 3 (使用乘号时，必须用反斜线屏蔽其特定含义。因为shell可能会误解显示星号的意义)90> expr 30 * 3expr: Syntax error

## mount、umount用于挂载 Linux 系统外的文件补充说明

`mount` 命令 Linux mount 命令是经常会使用到的命令，它用于挂载 Linux 系统外的文件。

| 选项                               | 意义                                                                                                    |
| ---                                | ---                                                                                                     |
| -V                                 | 显示程序版本                                                                                            |
| -h                                 | 显示辅助讯息                                                                                            |
| -v                                 | 显示较讯息，通常和 -f 用来除错。                                                                        |
| -a                                 | 将 /etc/fstab 中定义的所有档案系统挂上。                                                                |
| -F                                 | 这个命令通常和 -a 一起使用，它会为每一个 mount 的动作产生一个行程负责执行。在系统需要挂上大量 NFS       |  | 档案系统时可以加快挂上的动作。                                                       |
| -f                                 | 通常用在除错的用途。它会使 mount 并不执行实际挂上的动作，而是模拟整个挂上的过程。通常会和 -v 一起使用。 |
| -n                                 | 一般而言，mount 在挂上后会在 /etc/mtab                                                                  |  | 中写入一笔资料。但在系统中没有可写入档案系统存在的情况下可以用这个选项取消这个动作。 |
| -s-r                               | 等于 -o ro                                                                                              |
| -w                                 | 等于 -o rw                                                                                              |
| -L                                 | 将含有特定标签的硬盘分割挂上。                                                                          |
| -U                                 | 将档案分割序号为 的档案系统挂下。-L 和 -U 必须在/proc/partition 这种档案存在时才有意义。                |
| -t                                 | 指定档案系统的型态，通常不必指定。mount 会自动选择正确的型态。                                          |
| -o async                           | 打开非同步模式，所有的档案读写动作都会用非同步模式执行。                                                |
| -o sync                            | 在同步模式下执行。                                                                                      |
| -o atime、-o noatime               | 当 atime 打开时，系统会在每次读取档案时更新档案的『上一次调用时间』。当我们使用 flash                   |  | 档案系统时可能会选项把这个选项关闭以减少写入的次数。                                 |
| -o auto、-o noauto                 | 打开/关闭自动挂上模式。                                                                                 |
| -o defaults                        | 使用预设的选项 rw, suid, dev, exec, auto, nouser, and async.                                            |
| -o dev、-o nodev-o exec、-o noexec | 允许执行档被执行。                                                                                      |
| -o suid、-o nosuid                 | 允许执行档在 root 权限下执行。                                                                          |
| -o user、-o nouser                 | 使用者可以执行 mount/umount 的动作。                                                                    |
| -o remount                         | 将一个已经挂下的档案系统重新用不同的方式挂上。例如原先是唯读的系统，现在用可读写的模式重新挂上。        |
| -o ro                              | 用唯读模式挂上。                                                                                        |
| -o rw                              | 用可读写模式挂上。                                                                                      |
| -o loop=                           | 使用 loop 模式用来将一个档案当成硬盘分割挂上系统。                                                      |

`umount`命令 用于卸载已经加载的文件系统。利用设备名或挂载点都能 umount 文件系统，不过最好还是通过挂载点卸载，以免使用绑定挂载（一个设备，多个挂载点）时产生混乱。

语法:`umount(选项)(参数)`

| 选项             | 意义                                                 |
| ---              | ---                                                  |
| -a               | 卸除/etc/mtab 中记录的所有文件系统；                 |
| -h               | 显示帮助；                                           |
| -n               | 卸除时不要将信息存入/etc/mtab 文件中；               |
| -r               | 若无法成功卸除，则尝试以只读的方式重新挂入文件系统； |
| -t<文件系统类型> | 仅卸除选项中所指定的文件系统；                       |
| -v               | 执行时显示详细的信息；                               |
| -V               | 显示版本信息。                                       |

参数:文件系统：指定要卸载的文件系统或者其对应的设备文件名。

## chown

## chmod

`chmod`（英文全拼：change mode）命令是控制用户对文件的权限的命令

Linux/Unix 的文件调用权限分为三级 : 文件所有者（Owner）、用户组（Group）、其它用户（Other Users）。

语法：`chmod [-cfvR] [--help] [--version] mode file...`

    参数说明:mode : 权限设定字串，格式如下 :[ugoa...][[+-=][rwxX]...][,...]

    其中：u 表示该文件的拥有者，g 表示与该文件的拥有者属于同一个群体(group)者，o 表示其他以外的人，a 表示这三者皆是。
    + 表示增加权限、- 表示取消权限、= 表示唯一设定权限。
    r 表示可读取，w 表示可写入，x 表示可执行，X 表示只有当该文件是个子目录或者该文件已经被设定过为可执行。

    其他参数说明：
    -c : 若该文件权限确实已经更改，才显示其更改动作
    -f : 若该文件权限无法被更改也不要显示错误讯息
    -v : 显示权限变更的详细资料
    -R : 对目前目录下的所有文件与子目录进行相同的权限变更(即以递归的方式逐个变更)
    --help : 显示辅助说明
    --version : 显示版本

符号模式
使用符号模式可以设置多个项目：who（用户类型），operator（操作符）和 permission（权限），每个项目的设置可以用逗号隔开。 命令 chmod 将修改 who 指定的用户类型对文件的访问权限，用户类型由一个或者多个字母在 who 的位置来说明，如 who 的符号模式表所示:

| who | 用户类型 | 说明                 |
| --- | ---      | ---                  |
| u   | user     | 文件所有者           |
| g   | group    | 文件所有者所在组     |
| o   | others   | 所有其他用户         |
| a   | all      | 所用用户, 相当于 ugo |

operator 的符号模式表:

| Operator | 说明                                                   |
| ---      | ---                                                    |
| +        | 为指定的用户类型增加权限                               |
| -        | 去除指定用户类型的权限                                 |
| =        | 设置指定用户权限的设置，即将用户类型的所有权限重新设置 |

permission 的符号模式表:

| 模式 | 名字         | 说明                                                                           |
| ---  | ---          | ---                                                                            |
| r    | 读           | 设置为可读权限                                                                 |
| w    | 写           | 设置为可写权限                                                                 |
| x    | 执行权限     | 设置为可执行权限                                                               |
| X    | 特殊执行权限 | 只有当文件为目录文件，或者其他类型的用户有可执行权限时，才将文件权限设置可执行 |
| s    | setuid/gid   | 当文件被执行时，根据who参数指定的用户类型设置文件的setuid或者setgid权限        |
| t    | 粘贴位       | 设置粘贴位，只有超级用户可以设置该位，只有文件所有者u可以使用该位              |

八进制语法
chmod命令可以使用八进制数来指定权限。文件或目录的权限位是由9个权限位来控制，每三位为一组，它们分别是文件所有者（User）的读、写、执行，用户组（Group）的读、写、执行以及其它用户（Other）的读、写、执行。历史上，文件权限被放在一个比特掩码中，掩码中指定的比特位设为1，用来说明一个类具有相应的优先级。

| #   | 权限           | rwx | 二进制 |
| --- | ---            | --- | ---    |
| 7   | 读 + 写 + 执行 | rwx | 111    |
| 6   | 读 + 写        | rw- | 110    |
| 5   | 读 + 执行      | r-x | 101    |
| 4   | 只读           | r-- | 100    |
| 3   | 写 + 执行      | -wx | 011    |
| 2   | 只写           | -w- | 010    |
| 1   | 只执行         | --x | 001    |
| 0   | 无             | --- | 000    |

例如

    765 将这样解释：所有者的权限用数字表达：属主的那三个权限位的数字加起来的总和。如 rwx ，也就是 4+2+1 ，应该是 7。
    用户组的权限用数字表达：属组的那个权限位数字的相加的总和。如 rw- ，也就是 4+2+0 ，应该是 6。
    其它用户的权限数字表达：其它用户权限位的数字相加的总和。如 r-x ，也就是 4+0+1 ，应该是 5。

## chgrp

## ping

`ping`命令 用来测试主机之间网络的连通性。执行 ping 指令会使用 ICMP 传输协议，发出要求回应的信息，若远端主机的网络功能没有问题，就会回应该信息，因而得知该主机运作正常。

语法：`ping(选项)(参数)`

| 选项                         | 参数                                                  |
| ---                          | ---                                                   |
| -d                           | 使用Socket的SO\_DEBUG功能；                            |
| -c<完成次数>                 | 设置完成要求回应的次数；                              |
| -f                           | 极限检测；                                            |
| -i<间隔秒数>                 | 指定收发信息的间隔时间；                              |
| -I<网络界面>                 | 使用指定的网络界面送出数据包；                        |
| -l<前置载入>                 | 设置在送出要求信息之前，先行发出的数据包；            |
| -n                           | 只输出数值；                                          |
| -p<范本样式>                 | 设置填满数据包的范本样式；                            |
| -q                           | 不显示指令执行过程，开头和结尾的相关信息除外；        |
| -r                           | 忽略普通的Routing Table，直接将数据包送到远端主机上； |
| -R                           | 记录路由过程；                                        |
| -s<数据包大小>               | 设置数据包的大小；                                    |
| -t<存活数值>                 | 设置存活数值TTL的大小；                               |
| -v：详细显示指令的执行过程。 |

参数：目的主机：指定发送 ICMP 报文的目的主机。

## netstat

`netstat` 命令 用来打印 Linux 中网络系统的状态信息，可让你得知整个 Linux 系统的网络情况。

语法:`netstat(选项)`

| 选项                        | 参数                                         |
| ---                         | ---                                          |
| -a 或--all                  | 显示所有连线中的 Socket；                    |
| -A<网络类型>或--<网络类型>  | 列出该网络类型连线中的相关地址；             |
| -c 或--continuous           | 持续列出网络状态；                           |
| -C 或--cache                | 显示路由器配置的快取信息；                   |
| -e 或--extend               | 显示网络其他相关信息；                       |
| -F 或--fib                  | 显示 FIB；                                   |
| -g 或--groups               | 显示多重广播功能群组组员名单；               |
| -h 或--help                 | 在线帮助；                                   |
| -i 或--interfaces           | 显示网络界面信息表单；                       |
| -l 或--listening            | 显示监控中的服务器的 Socket；                |
| -M 或--masquerade           | 显示伪装的网络连线；                         |
| -n 或--numeric              | 直接使用 ip 地址，而不通过域名服务器；       |
| -N 或--netlink 或--symbolic | 显示网络硬件外围设备的符号连接名称；         |
| -o 或--timers               | 显示计时器；                                 |
| -p 或--programs             | 显示正在使用 Socket 的程序识别码和程序名称； |
| -r 或--route                | 显示 Routing Table；                         |
| -s 或--statistice           | 显示网络工作信息统计表；                     |
| -t 或--tcp                  | 显示 TCP 传输协议的连线状况；                |
| -u 或--udp                  | 显示 UDP 传输协议的连线状况；                |
| -v 或--verbose              | 显示指令执行过程；                           |
| -V 或--version              | 显示版本信息；                               |
| -w 或--raw                  | 显示 RAW 传输协议的连线状况；                |
| -x 或--unix                 | 此参数的效果和指定"-A unix"参数相同；        |
| --ip 或--inet               | 此参数的效果和指定"-A inet"参数相同。        |

## ss

> 比 netstat 好用的 socket 统计信息，iproute2 包附带的另一个工具，允许你查询 socket 的有关统计信息补充说明
>
> ss 命令 用来显示处于活动状态的套接字信息。ss 命令可以用来获取 socket 统计信息，它可以显示和 netstat 类似的内容。
>
> 但 ss 的优势在于它能够显示更多更详细的有关 TCP 和连接状态的信息，而且比 netstat 更快速更高效。当服务器的 socket 连接数量变得非常大时，无论是使用 netstat 命令还是直接 `cat /proc/net/tcp`，执行速度都会很慢。可能你不会有切身的感受，但请相信我，当服务器维持的连接达到上万个的时候，使用 netstat 等于浪费 生命，而用 ss 才是节省时间。但天下武功唯快不破。ss 快的秘诀在于，它利用到了 TCP 协议栈中 tcp\_diag。
>
> tcp\_diag 是一个用于分析统计的模块，可以获得 Linux 内核中第一手的信息，这就确保了 ss 的快捷高效。当然，如果你的系统中没有 tcp\_diag，ss 也可以正常运行，只是效率会变得稍慢。

语法:
```
    ss [参数]
    ss [参数] [过滤]
```

| 选项                | 意义                                                                                    |
| ---                 | ---                                                                                     |
| -h, --help          | 帮助信息                                                                                |
| -V, --version       | 程序版本信息                                                                            |
| -n, --numeric       | 不解析服务名称                                                                          |
| -r, --resolve       | 解析主机名                                                                              |
| -a, --all           | 显示所有套接字（sockets）                                                               |
| -l, --listening     | 显示监听状态的套接字（sockets）                                                         |
| -o, --options       | 显示计时器信息                                                                          |
| -e, --extended      | 显示详细的套接字（sockets）信息                                                         |
| -m, --memory        | 显示套接字（socket）的内存使用情况                                                      |
| -p, --processes     | 显示使用套接字（socket）的进程                                                          |
| -i, --info          | 显示 TCP 内部信息                                                                       |
| -s, --summary       | 显示套接字（socket）使用概况                                                            |
| -4, --ipv4          | 仅显示 IPv4 的套接字（sockets）                                                         |
| -6, --ipv6          | 仅显示 IPv6 的套接字（sockets）                                                         |
| -0, --packet        | 显示 PACKET 套接字（socket）                                                            |
| -t, --tcp           | 仅显示 TCP 套接字（sockets）                                                            |
| -u, --udp           | 仅显示 UCP 套接字（sockets）                                                            |
| -d, --dccp          | 仅显示 DCCP 套接字（sockets）                                                           |
| -w, --raw           | 仅显示 RAW 套接字（sockets）                                                            |
| -x, --unix          | 仅显示 Unix 套接字（sockets）                                                           |
| -f, --family=FAMILY | 显示 FAMILY 类型的套接字（sockets），FAMILY 可选，支持 unix, inet, inet6, link, netlink |
| -D, --diag=FILE     | 将原始 TCP 套接字（sockets）信息转储到文件                                              |
| -F, --filter=FILE   | 从文件中都去过滤器信息  FILTER := \[ state TCP-STATE ] \[ EXPRESSION ]

## lscpu

显示有关 CPU 架构的信息

| 选项                     | 意义                                                           |
| ---                      | ---                                                            |
| -a, --all                | 打印在线和离线 CPU（默认为-e）                                 |
| -b, --online             | 仅打印在线 CPU（-p 的默认值）                                  |
| -c, --offline            | 打印离线 CPU                                                   |
| -e, --extended\[=<list>] | 打印出一个扩展的可读格式                                       |
| -p, --parse\[=<list>]    | 打印出可解析的格式                                             |
| -s, --sysroot <dir>      | 将指定的目录用作系统根目录                                     |
| -x, --hex                | 打印十六进制掩码，而不是 CPU 列表-h, --help # 显示此帮助并退出 |
| -V, --version            | 输出版本信息并退出                                             |

## lsmod

显示已载入系统的模块

## lspci

显示当前主机的所有 PCI 总线信息

## useradd+passwd、adduser

`useradd` 创建的新的系统用户

useradd可用来建立用户帐号。帐号建好之后，再用passwd设定帐号的密码．而可用userdel删除帐号。使用useradd指令所建立的帐号，实际上是保存在/etc/passwd文本文件中。

语法：`useradd(选项)(参数)`

| 选项                                       | 意义                                                                                                     |
| ---                                        | ---                                                                                                      |
| -b, --base-dir BASE\_DIR                    | 如果未指定 -d HOME\_DIR，则系统的默认基本目录。如果未指定此选项，useradd 将使用 /etc/default/useradd 中的 | HOME 变量指定的基本目录，或默认使用 /home。 |
| -c, --comment COMMENT                      | 加上备注文字。任何文本字符串。它通常是对登录名的简短描述，目前用作用户全名的字段。                       |
| -d, --home HOME\_DIR                        | 将使用 HOME\_DIR 作为用户登录目录的值来创建新用户。                                                       |
| -D, --defaults                             | 变更预设值。                                                                                             |
| -e, --expiredate EXPIRE\_DATE               | 用户帐户将被禁用的日期。 日期以 YYYY-MM-DD                                                               | 格式指定。
| -f, --inactive INACTIVE                    | 密码过期后到帐户被永久禁用的天数。                                                                       |
| -g, --gid GROUP                            | 用户初始登录组的组名或编号。组名必须存在。组号必须引用已经存在的组。                                     |
| -G, --groups GROUP1\[,GROUP2,...\[,GROUPN]]] | 用户也是其成员的补充组列表。每个组用逗号隔开，中间没有空格。                                             |
| -h, --help                                 | 显示帮助信息并退出。                                                                                     |
| -k, --skel SKEL\_DIR                        | 骨架目录，其中包含要在用户的主目录中复制的文件和目录，当主目录由                                         | useradd 创建时。                            |
| -K, --key KEY=VALUE                        | 覆盖 /etc/login.defs 默认值（UID\_MIN、UID\_MAX、UMASK、PASS\_MAX\_DAYS 等）。                               |
| -l, --no-log-init                          | 不要将用户添加到 lastlog 和 faillog 数据库。                                                             |
| -m, --create-home                          | 如果用户的主目录不存在，则创建它。                                                                       |
| -M                                         | 不要创建用户的主目录，即使 /etc/login.defs (CREATE\_HOME) 中的系统范围设置设置为 yes。                    |
| -N, --no-user-group                        | 不要创建与用户同名的组，而是将用户添加到由 -g 选项或 /etc/default/useradd 中的 GROUP 变量指定的组中。    |
| -o, --non-unique                           | 允许创建具有重复（非唯一）UID 的用户帐户。 此选项仅在与 -o 选项结合使用时有效。                          |
| -p, --password PASSWORD                    | crypt(3) 返回的加密密码。 默认是禁用密码。                                                               |
| -r, --system                               | 创建一个系统帐户。                                                                                       |
| -s, --shell SHELL                          | 用户登录 shell 的名称。                                                                                  |
| -u, --uid UID                              | 用户 ID 的数值。                                                                                         |
| -U, --user-group                           | 创建一个与用户同名的组，并将用户添加到该组。                                                             |
| -Z, --selinux-user SEUSER                  | 用户登录的 SELinux 用户。 默认情况下将此字段留空，这会导致系统选择默认的 SELinux 用户。                  |

参数
用户名：要创建的用户名。

退出值
useradd 命令以以下值退出：

| 选项 | 意义                          |
| ---  | ---                           |
| 0    | 成功                          |
| 1    | 无法更新密码文件              |
| 2    | 无效的命令语法                |
| 3    | 选项的无效参数                |
| 4    | UID 已经在使用（并且没有 -o） |
| 6    | 指定的组不存在                |
| 9    | 用户名已被使用                |
| 10   | 无法更新组文件                |
| 12   | 无法创建主目录                |
| 13   | 无法创建邮件假脱机            |
| 14   | 无法更新 SELinux 用户映射     |

新建一个系统用户,系统用户一般用于管理服务，无需登录，所以分配nologin，限制其登录系统,简单来说就是不会主动创建`/home`目录，不能用于登陆。

`passwd`:用于设置用户的认证信息，包括用户密码、密码过期时间等。系统管理者则能用它管理系统用户的密码。只有管理者可以指定用户名称，一般用户只能变更自己的密码。

语法:`passwd(选项)(参数)`

| 选项 | 意义                                         |
| ---  | ---                                          |
| -d   | 删除密码，仅有系统管理者才能使用；           |
| -f   | 强制执行；                                   |
| -k   | 设置只有在密码过期失效后，方能更新；         |
| -l   | 锁住密码；                                   |
| -s   | 列出密码的相关信息，仅有系统管理者才能使用； |
| -u   | 解开已上锁的帐号。                           |

`adduser`命令是`useradd`包装后的程序，能够交互式创建用户。两者区别不大。

## userdel

`userdel`用于删除给定的用户以及与用户相关的文件.

语法`userdel(选项)(参数)`

| 选项 | 意义                                       |
| ---  | ---                                        |
| -f   | 强制删除用户，即使用户当前已登录；         |
| -r   | 删除用户的同时，删除与用户相关的所有文件。 |

参数:用户名：要删除的用户名。

## usermod

`usermod`用于修改用户的基本信息.

语法:`usermod(选项)(参数)`

| 选项               | 意义                                                       |
| ---                | ---                                                        |
| -c<备注>           | 修改用户帐号的备注文字；                                   |
| -d<登入目录>       | 修改用户登入时的目录，只是修改`/etc/passwd`中用户的家目录配置信息，不会自动创建新的家目录，通常和-m一起使用； |
| -m<移动用户家目录> | 移动用户家目录到新的位置，不能单独使用，一般与-d一起使用。 |
| -e<有效期限>       | 修改帐号的有效期限；                                       |
| -f<缓冲天数>       | 修改在密码过期后多少天即关闭该帐号；                       |
| -g<群组>           | 修改用户所属的群组；                                       |
| -G<群组>           | 修改用户所属的附加群组；                                   |
| -l<帐号名称>       | 修改用户帐号名称；                                         |
| -L                 | 锁定用户密码，使密码无效；                                 |
| -s<shell>          | 修改用户登入后所使用的shell；                              |
| -u<uid>            | 修改用户ID；                                               |
| -U                 | 解除密码锁定。                                             |

参数:登录名：指定要修改信息的用户登录名。

## users

`user`打印当前主机所有登陆用户的名称。

每个显示的用户名对应一个登录会话；如果一个用户有不止一个登录会话，那他的用户名将显示相同的次数。

## groupadd

注：添加用户组;

## groupdel

注：删除用户组;

## groupmod

注：修改用户组信息

## groups

注：显示用户所属的用户组

## chkconfig

检查、设置系统的各种服务。这是Red Hat公司遵循GPL规则所开发的程序，它可查询操作系统在每一个执行等级中会执行哪些系统服务，其中包括各类常驻服务。谨记chkconfig不是立即自动禁止或激活一个服务，它只是简单的改变了符号连接。

## service

用来控制系统服务的实用工具，它以启动、停止、重新启动和关闭系统服务，还可以显示所有系统服务的当前状态。

# systemd

systemd 并不是一个命令，而是一组命令，涉及到系统管理的方方面面。

## systemctl

是系统服务管理器指令，它实际上将 service 和 chkconfig 这两个命令组合到一起。

## hostnamectl

命令用于查看当前主机的信息。

## localectl

命令用于查看本地化设置。

## timedatectl

命令用于查看当前时区设置。