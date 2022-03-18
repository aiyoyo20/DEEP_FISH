## grep、egrep、fgrep
grep （global search regular expression(RE) and print out the line,全面搜索正则表达式并把行打印出来）是一种强大的文本搜索工具，它能使用正则表达式搜索文本，并把匹配的行打印出来。Unix的grep家族包括grep、egrep和fgrep。egrep和fgrep的命令只跟grep有很小不同。egrep是grep的扩展，支持更多的re元字符， fgrep就是fixed grep或fast grep，它们把所有的字母都看作单词，也就是说，正则表达式中的元字符表示回其自身的字面意义，不再特殊。Linux使用GNU版本的grep。它功能更强，可以通过-G、-E、-F命令行选项来使用egrep和fgrep的功能。

grep的工作方式是这样的，它在一个或多个文件中搜索字符串模板。如果模板包括空格，则必须被引用，模板后的所有字符串被看作文件名。搜索的结果被送到屏幕，不影响原文件内容。

grep可用于shell脚本，因为grep通过返回一个状态值来说明搜索的状态，如果模板搜索成功，则返回0，如果搜索不成功，则返回1，如果搜索的文件不存在，则返回2。我们利用这些返回值就可进行一些自动化的文本处理工作。

匹配模式选择:

|参数|意义|                                
|---|---|  
|-E, --extended-regexp|扩展正则表达式egrep|
|-F, --fixed-strings  | 一个换行符分隔的字符串的集合fgrep|
|-G, --basic-regexp   |基本正则|
|-P, --perl-regexp    |调用的perl正则|
|-e, --regexp=PATTERN | 后面根正则模式，默认无|
|-f, --file=FILE      | 从文件中获得匹配模式|
|-i, --ignore-case    |不区分大小写|
|-w, --word-regexp    |匹配整个单词|
|-x, --line-regexp    |匹配整行|
|-z, --null-data      |一个 0 字节的数据行，但不是空行|

杂项:

|参数|意义|                                
|---|---| 
|-s, --no-messages 	|不显示错误信息|
|-v, --invert-match 	|显示不匹配的行|
|-V, --version 		|显示版本号|
|--help 				|显示帮助信息|
|--mmap 				|use memory-mapped input if possible|

输入控制:

|参数|意义|                                
|---|---| 
|-m, --max-count=NUM 		|匹配的最大数|
|-b, --byte-offset 			|打印匹配行前面打印该行所在的块号码。|
|-n, --line-number 			|显示的加上匹配所在的行号|
|--line-buffered 			|刷新输出每一行|
|-H, --with-filename 		|当搜索多个文件时，显示匹配文件名前缀|
|-h, --no-filename 			|当搜索多个文件时，不显示匹配文件名前缀|
|--label=LABEL 				|print LABEL as filename for standard input|
|-o, --only-matching 		|只显示一行中匹配PATTERN 的部分|
|-q, --quiet, --silent 		|不显示任何东西|
|--binary-files=TYPE 		|假定二进制文件的TYPE 类型； TYPE 可以是binary', text', 或`without-match'|
|-a, --text 				|匹配二进制的东西|
|-I 						|不匹配二进制的东西|
|-d, --directories=ACTION 	|目录操作，读取，递归，跳过|
|-D, --devices=ACTION 		|设置对设备，FIFO,管道的操作，读取，跳过|
|-R, -r, --recursive 		|递归调用|
|--include=PATTERN 			|只查找匹配FILE_PATTERN 的文件|
|--exclude=PATTERN 			|跳过匹配FILE_PATTERN 的文件和目录|
|--exclude-from=FILE 		|跳过所有除FILE 以外的文件|
|-L, --files-without-match 	|匹配多个文件时，显示不匹配的文件名|
|-l, --files-with-matches 	|匹配多个文件时，显示匹配的文件名|
|-c, --count 				|显示匹配的行数|
|-Z, --null 				|在FILE 文件最后打印空字符|

文件控制:

|参数|意义|                                
|---|---| 
|-B, --before-context=NUM 	|打印匹配本身以及前面的几个行由NUM控制|
|-A, --after-context=NUM 	|打印匹配本身以及随后的几个行由NUM控制|
|-C, --context=NUM 			|打印匹配本身以及随后，前面的几个行由NUM控制|
|-NUM 						|和-C的用法一样的|
|--color[=WHEN],||
|--colour[=WHEN] 			|使用标志高亮匹配字串；|
|-U, --binary 				|使用标志高亮匹配字串；|
|-u, --unix-byte-offsets 	|当CR 字符不存在，报告字节偏移(MSDOS 模式)|

>‘egrep’ is the same as ‘grep -E’.  ‘fgrep’ is the same as ‘grep -F’.
Direct invocation as either ‘egrep’ or ‘fgrep’ is deprecated, but is
   Traditional ‘egrep’ did not support interval expressions and some
‘egrep’ implementations use ‘\{’ and ‘\}’ instead, so portable scripts


## head、tail
`head` 命令可用于查看文件的开头部分的内容，有一个常用的参数 -n 用于显示行数，默认为 10，即显示 10 行的内容。

命令格式：`head [参数] [文件]`

|参数|意义|
|  ----  | ----  |
|-q |隐藏文件名|
|-v |显示文件名|
|-c<数目>| 显示的字节数。|
|-n<行数>| 显示的行数。|

`tail` 命令和`head`类似，但用于查看文件的末尾部分的内容

命令格式`tail [参数] [文件] `

|参数 |  意义|
|---|---|
|-f   |	循环读取,如日志文件有更新时不断输出更新的内容|
|-q  |	不显示处理信息|
|-v		| 显示详细的处理信息|
|-c<数目>| 显示的字节数|
|-n<行数>| 显示文件的尾部 n 行内容|
|--pid=PID| 与-f合用,表示在进程ID,PID死掉之后结束|
|-q, --quiet, --silent| 从不输出给出文件名的首部|
|-s, --sleep-interval=S| 与-f合用,表示在每次反复的间隔休眠S秒|

## cat、tac
cat（英文全拼：concatenate）命令用于连接文件并打印到标准输出设备上,可输出多个文件

语法格式
`
cat [-AbeEnstTuv] [--help] [--version] fileName1 fileName2
`

|参数|意义|
|---|---|
|-b 或 --number-nonblank	|和 -n 相似，只不过对于空白行不编号。|
|-s 或 --squeeze-blank		|当遇到有连续两行以上的空白行，就代换为一行的空白行。|
|-v 或 --show-nonprinting	|使用 ^ 和 M- 符号，除了 LFD 和 TAB 之外。|
|-E 或 --show-ends  		|在每行结束处显示 $。|
|-T 或 --show-tabs			| 将 TAB 字符显示为 ^I。|
|-A, --show-all			|等价于 -vET。|
|-e						|等价于"-vE"选项；|

`tac`按行为单位反向显示文件内容，如果没有文件或文件为-则读取标准输入。
处理多个文件时，依次将每个文件反向显示，而不是将所有文件连在一起再反向显示。

|参数					|	意义|
|---|---|
|-b, --before           |  在之前而不是之后连接分隔符。|
|-r, --regex            |  将分隔符作为基础正则表达式（BRE）处理。|
|-s, --separator=STRING |  使用STRING作为分隔符代替默认的换行符。|
|--help                 |  显示帮助信息并退出。|
|--version              |  显示版本信息并退出。|

## less、more
less 可以随意浏览文件，支持翻页和搜索，支持向上翻页和向下翻页。

|参数| 意义|
|---|---|
|-b |<缓冲区大小> 设置缓冲区的大小|
|-e |当文件显示结束后，自动离开|
|-f |强迫打开特殊文件，例如外围设备代号、目录和二进制文件|
|-g |只标志最后搜索的关键词|
|-i |忽略搜索时的大小写|
|-m |显示类似more命令的百分比|
|-N |显示每行的行号|
|-o |<文件名> 将less 输出的内容在指定文件中保存起来|
|-Q |不使用警告音|
|-s |显示连续空行为一行|
|-S |行过长时间将超出部分舍弃|
|-x |<数字> 将"tab"键显示为规定的数字空格|

进入文件浏览页面后可以进一步操作的键

|参数| 意义|
|---|---|
|/字符串|向下搜索"字符串"的功能|
|?字符串|向上搜索"字符串"的功能|
|n|重复前一个搜索（与 / 或 ? 有关）|
|N|反向重复前一个搜索（与 / 或 ? 有关）|
|b| 向上翻一页|
|d |向后翻半页|
|h| 显示帮助界面|
|Q |退出less 命令|
|u |向前滚动半页|
|y| 向前滚动一行|
|空格键| 滚动一页|
|回车键 |滚动一行|
|[pagedown]| 向下翻动一页|
|[pageup]| 向上翻动一页|

浏览多个文件:`less log1.log log2.log`

说明：

输入 `：n`后，切换到 log2.log

输入 `：p` 后，切换到log1.log

more 命令类似 cat ，不过会以一页一页的形式显示，更方便使用者逐页阅读

语法：`more [-dlfpcsu] [-num] [+/pattern] [+linenum] [fileNames..]`

|参数|意义|
|---|---|
|-num|一次显示的行数|
|-d 		|提示使用者，在画面下方显示 [Press space to continue, 'q' to quit.] ，如果使用者按错键，则会显示 [Press 'h' for instructions.] 而不是 '哔' 声|
|-l 		|取消遇见特殊字元 ^L（送纸字元）时会暂停的功能|
|-f 		|计算行数时，以实际上的行数，而非自动换行过后的行数（有些单行字数太长的会被扩展为两行或两行以上）|
|-p 		|不以卷动的方式显示每一页，而是先清除萤幕后再显示内容|
|-c 		|跟 -p 相似，不同的是先显示内容再清除其他旧资料|
|-s 		|当遇到有连续两行以上的空白行，就代换为一行的空白行|
|-u 		|不显示下引号 （根据环境变数 TERM 指定的 terminal 而有所不同）|

+/pattern 在每个文档显示前搜寻该字串（pattern），然后从该字串之后开始显示

+linenum 从第 num 行开始显示

fileNames 欲显示内容的文档，可为复数个数

|常用操作命令|意义|
|---|---|
|Enter  |向下n行，需要定义。默认为1行|
|Ctrl+F |向下滚动一屏|
|空格键  |向下滚动一屏|
|Ctrl+B |返回上一屏|
|=     |输出当前行的行号|
|：f   |输出文件名和当前行的行号|
|V     |调用配置的编辑器|
|!命令 |调用Shell，并执行命令|
|q     |退出more|

## find、locate

`find` 语法:`find   path   -option   [   -print ]   [ -exec   -ok   command ]   {} \;`

path 为查找的起始目录，如果 path 是空字串则使用目前路径，path 后的部分为expression，如果 expression 是空字串则使用 -print 为预设 expression。

|参数|意义|
|---|---|
|-amin<分钟>|查找在指定时间曾被存取过的文件或目录，单位以分钟计算；|
|-anewer<参考文件或目录>|查找其存取时间较指定文件或目录的存取时间更接近现在的文件或目录；|
|-atime<24小时数>|查找在指定时间曾被存取过的文件或目录，单位以24小时计算；|
|-cmin<分钟>|查找在指定时间之时被更改过的文件或目录；|
|-cnewer<参考文件或目录>|查找其更改时间较指定文件或目录的更改时间更接近现在的文件或目录；|
|-ctime<24小时数>|查找在指定时间之时被更改的文件或目录，单位以24小时计算；|
|-daystart|从本日开始计算时间；|
|-depth|从指定目录下最深层的子目录开始查找；|
|-empty|寻找文件大小为0 Byte的文件，或目录下没有任何子目录或文件的空目录；|
|-exec<执行指令>|假设find指令的回传值为True，就执行该指令；|
|-false|将find指令的回传值皆设为False；|
|-fls<列表文件>|此参数的效果和指定“-ls”参数类似，但会把结果保存为指定的列表文件；|
|-follow|排除符号连接；|
|-fprint<列表文件>|此参数的效果和指定“-print”参数类似，但会把结果保存成指定的列表文件；|
|-fprint0<列表文件>|此参数的效果和指定“-print0”参数类似，但会把结果保存成指定的列表文件；|
|-fprintf<列表文件><输出格式>|此参数的效果和指定“-printf”参数类似，但会把结果保存成指定的列表文件；|
|-fstype<文件系统类型>|只寻找该文件系统类型下的文件或目录；|
|-gid<群组识别码>|查找符合指定之群组识别码的文件或目录；|
|-group<群组名称>|查找符合指定之群组名称的文件或目录；|
|-help或--help|在线帮助；|
|-ilname<范本样式>|此参数的效果和指定“-lname”参数类似，但忽略字符大小写的差别；|
|-iname<范本样式>|此参数的效果和指定“-name”参数类似，但忽略字符大小写的差别；|
|-inum<inode编号>|查找符合指定的inode编号的文件或目录；|
|-ipath<范本样式>|此参数的效果和指定“-path”参数类似，但忽略字符大小写的差别；|
|-iregex<范本样式>|此参数的效果和指定“-regexe”参数类似，但忽略字符大小写的差别；|
|-links<连接数目>|查找符合指定的硬连接数目的文件或目录；|
|-lname<范本样式>|指定字符串作为寻找符号连接的范本样式；|
|-ls|假设find指令的回传值为Ture，就将文件或目录名称列出到标准输出；|
|-maxdepth<目录层级>|设置最大目录层级；|
|-mindepth<目录层级>|设置最小目录层级；|
|-mmin<分钟>|查找在指定时间曾被更改过的文件或目录，单位以分钟计算；|
|-mount|此参数的效果和指定“-xdev”相同；|
|-mtime<24小时数>|查找在指定时间曾被更改过的文件或目录，单位以24小时计算；|
|-name<范本样式>|指定字符串作为寻找文件或目录的范本样式；|
|-newer<参考文件或目录>|查找其更改时间较指定文件或目录的更改时间更接近现在的文件或目录；|
|-nogroup|找出不属于本地主机群组识别码的文件或目录；|
|-noleaf|不去考虑目录至少需拥有两个硬连接存在；|
|-nouser|找出不属于本地主机用户识别码的文件或目录；|
|-ok<执行指令>|此参数的效果和指定“-exec”类似，但在执行指令之前会先询问用户，若回答“y”或“Y”，则放弃执行命令；|
|-path<范本样式>|指定字符串作为寻找目录的范本样式；|
|-perm<权限数值>|查找符合指定的权限数值的文件或目录；|
|-print|假设find指令的回传值为Ture，就将文件或目录名称列出到标准输出。格式为每列一个名称，每个名称前皆有“./”字符串；|
|-print0|假设find指令的回传值为Ture，就将文件或目录名称列出到标准输出。格式为全部的名称皆在同一行；|
|-printf<输出格式>|假设find指令的回传值为Ture，就将文件或目录名称列出到标准输出。格式可以自行指定；|
|-prune|不寻找字符串作为寻找文件或目录的范本样式;|
|-regex<范本样式>|指定字符串作为寻找文件或目录的范本样式；|
|-size<文件大小>|查找符合指定的文件大小的文件；|
|-true|将find指令的回传值皆设为True；|
|-type<文件类型>|只寻找符合指定的文件类型的文件；|
|-uid<用户识别码>|查找符合指定的用户识别码的文件或目录；|
|-used<日数>|查找文件或目录被更改之后在指定时间曾被存取过的文件或目录，单位以日计算；|
|-user<拥有者名称>|查找符和指定的拥有者名称的文件或目录；|
|-version或——version|显示版本信息；|
|-xdev|将范围局限在先行的文件系统中；|
|-xtype<文件类型>|此参数的效果和指定“-type”参数类似，差别在于它针对符号连接检查。|

类型参数列表：

|参数|意义|
|---|---|
|f| 普通文件|
|l| 符号连接|
|d| 目录|
|c| 字符设备|
|b| 块设备|
|s| 套接字|
|p| Fifo|

你可以使用 ( ) 将运算式分隔，并使用下列运算。
```
exp1 -and exp2
! expr
-not expr
exp1 -or/-o exp2
exp1, exp2
```
例子：

在/home目录下查找以.txt结尾的文件名：`find /home -name "*.txt"`

查找上周新增的图片：`find ~ \( -iname '*jpeg' -o -iname '*jpg' \) -type f -mtime -7`

借助-exec选项与其他命令结合使用；

删除 mac 下自动生成的文件：`find ./ -name '__MACOSX' -depth -exec rm -rf {} \;`

查找 /var/log 目录中更改时间在 7 日以前的普通文件，并在删除之前询问它们：`find /var/log -type f -mtime +7 -ok rm {} \;`
