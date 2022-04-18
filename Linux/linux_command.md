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

## cat、tac、rev
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

`rev`:命令 将文件中的每行内容以字符为单位反序输出，即第一个字符最后输出，最后一个字符最先输出，依次类推。

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

## find

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

## slocate/locate + updatedb
在manjaro中并没有自带locate这个命令，需要自行安装`sudo pacman -Sy mlocate`,初次使用需要`updatedb`建立初始库

`locate`命令用于查找符合条件的文档，他会去保存文档和目录名称的数据库内，查找合乎范本样式条件的文档或目录。一般情况我们只需要输入 locate your_file_name 即可查找指定文件。

与find 不同，find 是去硬盘找，locate 只在 /var/lib/slocate 资料库中找。
locate 的速度比 find 快，它并不是真的查找，而是查数据库，一般文件数据库在 /var/lib/slocate/slocate.db 中，所以 locate 的查找并不是实时的，而是以数据库的更新为准，一般是系统自己维护，也可以手工升级数据库 ，

命令为：`updatedb`,可能需要权限，以及更新需要较长的时间

语法`locate [-d ][--help][--version][范本样式...]`

后面才了解到manjaro有`slocate`这个命令，功能和`locate`差不多，且共用库，

|参数|意义|
|---|---|
|-b, --basename  | 仅匹配路径名的基本名称|
|-c, --count     | 只输出找到的数量|
|-d, --database DBPATH | 使用DBPATH指定的数据库，而不是默认数据库 /var/lib/mlocate/mlocate.db|
|-e, --existing  | 仅打印当前现有文件的条目|
|-1 | 如果 是 1．则启动安全模式。在安全模式下，使用者不会看到权限无法看到 的档案。这会始速度减慢，因为 locate 必须至实际的档案系统中取得档案的  权限资料。|
|-0, --null            | 在输出上带有NUL的单独条目|
|-S, --statistics      | 不搜索条目，打印有关每个数据库的统计信息|
|-q                    | 安静模式，不会显示任何错误讯息。|
|-P, --nofollow, -H    | 检查文件存在时不要遵循尾随的符号链接|
|-l, --limit, -n LIMIT | 将输出（或计数）限制为LIMIT个条目|
|-n                    | 至多显示 n个输出。|
|-m, --mmap            | 被忽略，为了向后兼容|
|-r, --regexp REGEXP   | 使用基本正则表达式|
|    --regex           | 使用扩展正则表达式|
|-q, --quiet           | 安静模式，不会显示任何错误讯息|
|-s, --stdio           | 被忽略，为了向后兼容|
|-o                    | 指定资料库存的名称。|
|-h, --help            | 显示帮助|
|-i, --ignore-case     | 忽略大小写|
|-V, --version         | 显示版本信息|

不同的locate有对应的updatedb

>updatedb - update a database for mlocate
部分参数

|参数|意义|
|---|---|
|-U、 --database-root PATH|仅存储扫描以生成的数据库路径为根的文件系统子树的结果。默认情况下，会扫描整个文件系统。|
|-o、 --output FILE|将数据库写入文件，而不是使用默认数据库。|

## touch、mkdir
`touch`命令用于修改文件或者目录的时间属性，包括存取时间和更改时间。若文件不存在，系统会建立一个新的文件。

|参数|意义|
|---|---|
|-a |改变档案的读取时间记录。
|-m |改变档案的修改时间记录。
|-c |假如目的档案不存在，不会建立新的档案。与 --no-create 的效果一样。|
|-f |不使用，是为了与其他 unix 系统的相容性而保留。|
|-r |使用参考档的时间记录，与 --file 的效果一样。|
|-d |设定时间与日期，可以使用各种不同的格式。|
|-t |设定档案的时间记录，格式与 date 指令相同。|
|--no-create |不会建立新档案。|
|--help		 |列出指令格式。|
|--version 	|	列出版本讯息。|


`mkdir`:英文全拼,make directory,命令用于创建目录

|参数|意义|
|---|---|
|-m, --mode=MODE 	|创建目录并且设定权限|
|-p, --parents  	|创建多级目录时确保没一级目录都会创建 与-m参数使用时，作用在最后一级目录|
|-v, --verbose 		|为每个创建的目录打印一条消息|
|--help 			|显示帮助之后退出|


## rm 、rmdir
`rm`:（英文全拼:remove）命令用于删除一个文件或者目录。

|参数|意义|
|---|---|
|-d|直接把欲删除的目录的硬连接数据删除成0，删除该目录；|
|-f|强制删除文件或目录；|
|-i|删除已有文件或目录之前先询问用户；|
|-r或-R|递归处理，将指定目录下的所有文件与子目录一并处理；|
|--preserve-root|不对根目录进行递归操作；|
|-v|显示指令的详细执行过程。|

文件一旦通过`rm`命令删除，则无法恢复，所以必须格外小心地使用该命令。

`rmdir`:（英文全拼:remove directory）命令删除空的目录。

语法: `rmdir [-p] dirName`

dirName：要删除的空目录列表。当删除多个空目录时，目录名之间使用空格隔开。

|参数|意义|
|-p 或 --parents|删除指定目录后，若该目录的上层目录已变成空目录，则将其一并删除；|
|--ignore-fail-on-non-empty|此选项使rmdir命令忽略由于删除非空目录时导致的错误信息；|
|-v或-verboes|显示命令的详细执行过程；|
|--help|显示命令的帮助信息；|
|--version|显示命令的版本信息。|

`rmdir -p www/Test`：在工作目录下的 www 目录中，删除名为 Test 的子目录。若 Test 删除后，www 目录成为空目录，则 www 亦予删除。


## pwd
`pwd`：（英文全拼：print work directory） 命令用于显示工作目录。

执行 pwd 指令可立刻得知您目前所在的工作目录的绝对路径名称。

|参数|意义|
|---|---|
|-L, --logical |打印环境变量"$PWD"的值，可能为符号链接。|
|-P, --physical |（默认值）打印当前工作目录的物理位置。|
|--help |显示帮助信息并退出。|
|--version |显示版本信息并退出。|

## ls、dir、stat
`ls`（英文全拼：list files）命令用于显示指定工作目录下之内容（列出目前工作目录所含之文件及子目录)。

语法:
```
ls [选项] [文件名...]
   [-1abcdfgiklmnopqrstuxABCDFGLNQRSUX] [-w cols] [-T cols] [-I pattern] [--full-time]
   [--format={long,verbose,commas,across,vertical,single-col‐umn}]
   [--sort={none,time,size,extension}] [--time={atime,access,use,ctime,status}]
   [--color[={none,auto,always}]] [--help] [--version] [--]
```

参数及意义:
```
-C     # 多列输出，纵向排序。
-F     # 每个目录名加 "/" 后缀，每个 FIFO 名加 "|" 后缀， 每个可运行名加“ * ”后缀。
-R     # 递归列出遇到的子目录。
-a     # 列出所有文件，包括以 "." 开头的隐含文件。
-c     # 使用“状态改变时间”代替“文件修改时间”为依据来排序（使用“-t”选项时）或列出（使用“-l”选项时）。
-d     # 将目录名像其它文件一样列出，而不是列出它们的内容。
-i     # 输出文件前先输出文件系列号（即 i 节点号: i-node number）。 -l  列出（以单列格式）文件模式
       # （file mode），文件的链接数，所有者名，组名，文件大小（以字节为单位），时间信息，及文件名。
       # 缺省时，时间信息显示最近修改时间；可以以选项“-c”和“-u”选择显示其它两种时间信息。对于设备文件，
       # 原先显示文件大小的区域通常显示的是主要和次要的信号（majorand minor device numbers）。
-q     # 将文件名中的非打印字符输出为问号。（对于到终端的输出这是缺省的。）
-r     # 逆序排列。
-t     # 按时间信息排序。
-u     # 使用最近访问时间代替最近修改时间为依据来排序（使用“-t”选项时）或列出（使用“-l”选项时）。
-1     # 单列输出。
-1, --format=single-column  # 一行输出一个文件（单列输出）。如标准输出不是到终端，此选项就是缺省选项。
-a, --all # 列出目录中所有文件，包括以“.”开头的文件。
-b, --escape # 把文件名中不可输出的字符用反斜杠加字符编号(就像在 C 语言里一样)的形式列出。
-c, --time=ctime, --time=status
      # 按文件状态改变时间（i节点中的ctime）排序并输出目录内
      # 容。如采用长格式输出（选项“-l”），使用文件的状态改
      # 变时间取代文件修改时间。【译注：所谓文件状态改变（i节
      # 点中以ctime标志），既包括文件被修改，又包括文件属性（ 如所有者、组、链接数等等）的变化】
-d, --directory
      # 将目录名像其它文件一样列出，而不是列出它们的内容。
-f    # 不排序目录内容；按它们在磁盘上存储的顺序列出。同时启 动“ -a ”选项，如果在“ -f ”之前存在“ -l”、
      # “ - -color ”或“ -s ”，则禁止它们。
-g    # 忽略，为兼容UNIX用。
-i, --inode
      # 在每个文件左边打印  i  节点号（也叫文件序列号和索引号:  file  serial  number and index num‐
      # ber）。i节点号在每个特定的文件系统中是唯一的。
-k, --kilobytes
      # 如列出文件大小，则以千字节KB为单位。
-l, --format=long, --format=verbose
      # 输出的信息从左到右依次包括文件名、文件类型、权限、硬链接数、所有者名、组名、大小（byte）
      # 、及时间信息（如未指明是其它时间即指修改时间）。对于6个月以上的文件或超出未来
      # 1小时的文件，时间信息中的时分将被年代取代。
      # 每个目录列出前，有一行“总块数”显示目录下全部文件所占的磁盘空间。块默认是1024字节；
      # 如果设置了 POSIXLY_CORRECT 的环境变量，除非用“-k”选项，则默认块大小是 512 字节。
      # 每一个硬链接都计入总块数（因此可能重复计数），这无 疑是个缺点。

# 列出的权限类似于以符号表示（文件）模式的规范。但是 ls
      # 在每套权限的第三个字符中结合了多位（ multiple bits ） 的信息，如下： s 如果设置了  setuid
      # 位或 setgid   位，而且也设置了相应的可执行位。 S 如果设置了 setuid 位或 setgid
      # 位，但是没有设置相应的可执行位。 t 如果设置了  sticky  位，而且也设置了相应的可执行位。  T
      # 如果设置了 sticky 位，但是没有设置相应的可执行位。              x
      # 如果仅仅设置了可执行位而非以上四种情况。 - 其它情况（即可执行位未设置）。
-m, --format=commas
      # 水平列出文件，每行尽可能多，相互用逗号和一个空格分隔。
-n, --numeric-uid-gid
      # 列出数字化的 UID 和 GID 而不是用户名和组名。
-o    #  以长格式列出目录内容，但是不显示组信息。等于使用“         --format=long          --no-group
      # ”选项。提供此选项是为了与其它版本的 ls 兼容。
-p    #  在每个文件名后附上一个字符以说明该文件的类型。类似“ -F ”选项但是不 标示可执行文件。
-q, --hide-control-chars
      # 用问号代替文件名中非打印的字符。这是缺省选项。
-r, --reverse
      # 逆序排列目录内容。
-s, --size
      # 在每个文件名左侧输出该文件的大小，以    1024   字节的块为单位。如果设置了   POSIXLY_CORRECT
      # 的环境变量，除非用“ -k ”选项，块大小是 512 字节。
-t, --sort=time
      # 按文件最近修改时间（ i 节点中的 mtime ）而不是按文件名字典序排序，新文件 靠前。
-u, --time=atime, --time=access, --time=use
      # 类似选项“    -t    ”，但是用文件最近访问时间（    i     节点中的     atime     ）取代文件修
      # 改时间。如果使用长格式列出，打印的时间是最近访问时间。
-w, --width cols
       # 假定屏幕宽度是      cols      （      cols     以实际数字取代）列。如未用此选项，缺省值是这
       # 样获得的：如可能先尝试取自终端驱动，否则尝试取自环境变量          COLUMNS          （如果设
       # 置了的话），都不行则取 80 。

-x, --format=across, --format=horizontal
       # 多列输出，横向排序。

-A, --almost-all
       # 显示除 "." 和 ".." 外的所有文件。

-B, --ignore-backups
       # 不输出以“ ~ ”结尾的备份文件，除非已经在命令行中给出。

-C, --format=vertical
       # 多列输出，纵向排序。当标准输出是终端时这是缺省项。使用命令名 dir 和 d 时， 则总是缺省的。

-D, --dired
       # 当采用长格式（“-l”选项）输出时，在主要输出后，额外打印一行：  //DIRED//  BEG1 END1 BEG2
       # END2 ...

# BEGn 和 ENDn 是无符号整数，记录每个文件名的起始、结束位置在输出中的位置（
#        字节偏移量）。这使得          Emacs          易于找到文件名，即使文件名包含空格或换行等非正
#        常字符也无需特异的搜索。
#
# 如果目录是递归列出的（“ -R ”选项），每个子目录后列出类似一行：
       # //SUBDIRED//  BEG1 END1 ...  【译注：我测试了 TurboLinux4.0 和 RedHat6.1 ，发现它们都是在 “
       # //DIRED//     BEG1...     ”之后列出“     //SUBDIRED//     BEG1     ...      ”，也即只有一个
       # 而不是在每个子目录后都有。而且“ //SUBDIRED// BEG1 ... ”列出的是各个子目 录名的偏移。】

-F, --classify, --file-type
       # 在每个文件名后附上一个字符以说明该文件的类型。“  * ”表示普通的可执行文件； “ / ”表示目录；“
       # @ ”表示符号链接；“ | ”表示FIFOs；“ = ”表示套接字 (sockets) ；什么也没有则表示普通文件。

-G, --no-group
       # 以长格式列目录时不显示组信息。

-I, --ignorepattern
       # 除非在命令行中给定，不要列出匹配shell文件名匹配式（pattern ，不是指一般
       # 表达式）的文件。在shell中，文件名以"."起始的不与在文件名匹配式(pattern)
       # 开头的通配符匹配。

-L, --dereference
       # 列出符号链接指向的文件的信息，而不是符号链接本身。

-N, --literal
       # 不要用引号引起文件名。

-Q, --quote-name
       # 用双引号引起文件名，非打印字符以 C 语言的方法表示。

-R, --recursive
       # 递归列出全部目录的内容。

-S, --sort=size
       # 按文件大小而不是字典序排序目录内容，大文件靠前。

-T, --tabsize cols
       # 假定每个制表符宽度是 cols 。缺省为 8。为求效率， ls 可能在输出中使用制表符。  若 cols 为
       0，则不使用制表符。

-U, --sort=none
       # 不排序目录内容；按它们在磁盘上存储的顺序列出。（选项“-U”和“-f”的不
       # 同是前者不启动或禁止相关的选项。）这在列很大的目录时特别有用，因为不加排序
       # 能显著地加快速度。

-X, --sort=extension
       # 按文件扩展名（由最后的 "." 之后的字符组成）的字典序排序。没有扩展名的先列 出。

--color[=when]
       # 指定是否使用颜色区别文件类别。环境变量  LS_COLORS  指定使用的颜色。如何设置 这个变量见 dir‐
       # colors(1) 。 when 可以被省略，或是以下几项之一：
none # 不使用颜色，这是缺省项。
       # auto 仅当标准输出是终端时使用。 always 总是使用颜色。指定 --color 而且省略 when  时就等同于
       # --color=always 。

--full-time
       # 列出完整的时间，而不是使用标准的缩写。格式如同          date(1)          的缺省格式；此格式
       # 是不能改变的，但是你可以用 cut(1) 取出其中的日期字串并将结果送至命令 “ date -d ”。

# 输出的时间包括秒是非常有用的。（ Unix 文件系统储存文件的时间信息精确到秒，
       # 因此这个选项已经给出了系统所知的全部信息。）例如，当你有一个         Makefile          文件
       # 不能恰当地生成文件时，这个选项会提供帮助。
```

`dir`:和`ls` 类似，会显示目录内容列表。

```
用法：dir [选项]... [文件]...
List information about the FILEs (the current directory by default).
Sort entries alphabetically if none of -cftuvSUX nor --sort is specified.

长选项必须使用的参数对于短选项时也是必需使用的。
  -a, --all                     不隐藏任何以. 开始的项目
  -A, --almost-all              列出除. 及.. 以外的任何项目
      --author                  与-l 同时使用时列出每个文件的作者
  -b, --escape                  以八进制溢出序列表示不可打印的字符
      --block-size=SIZE      scale sizes by SIZE before printing them.  E.g.,
                               `--block-size=M' prints sizes in units of
                               1,048,576 bytes.  See SIZE format below.
  -B, --ignore-backups       do not list implied entries ending with ~
  -c                         with -lt: sort by, and show, ctime (time of last
                               modification of file status information)
                               with -l: show ctime and sort by name
                               otherwise: sort by ctime, newest first
  -C                            每栏由上至下列出项目
      --color[=WHEN]            控制是否使用色彩分辨文件。WHEN 可以是
                                "never"(默认)、"always"或"auto"其中之一
  -d, --directory               当遇到目录时列出目录本身而非目录内的文件
  -D, --dired                   产生适合Emacs 的dired 模式使用的结果
  -f                            不进行排序，-aU 选项生效，-lst 选项失效
  -F, --classify                加上文件类型的指示符号(*/=@| 其中一个)
      --format=关键字           交错-x，逗号分隔-m，水平-x，长-l，
                                单栏-1，详细-l，垂直-C
      --full-time               即-l --time-style=full-iso
  -g                            类似-l，但不列出所有者
      --group-directories-first
                        在文件前分组目录。此选项可与--sort 一起使用，
                        但是一旦使用--sort=none (-U)将禁用分组
  -G, --no-group                以一个长列表的形式，不输出组名
  -h, --human-readable          与-l 一起，以易于阅读的格式输出文件大小
                                (例如 1K 234M 2G)
      --si                      同上面类似，但是使用1000 为基底而非1024
  -H, --dereference-command-line
                                跟随命令行列出的符号链接
      --dereference-command-line-symlink-to-dir
                                跟随命令行列出的目录的符号链接
      --hide=PATTERN            隐藏符合PATTERN 模式的项目
                                (-a 或 -A 将覆盖此选项)
      --indicator-style=方式    指定在每个项目名称后加上指示符号方式：
                                none (默认)，classify (-F)，file-type (-p)
  -i, --inode                   显示每个文件的inode 号
  -I, --ignore=PATTERN          不显示任何符合指定shell PATTERN 的项目
  -k                            即--block-size=1K
  -l                            使用较长格式列出信息
  -L, --dereference             当显示符号链接的文件信息时，显示符号链接所指示
                                的对象而并非符号链接本身的信息
  -m                            所有项目以逗号分隔，并填满整行行宽
  -n, --numeric-uid-gid         类似 -l，但列出UID 及GID 号
  -N, --literal                 输出未经处理的项目名称 (如不特别处理控制字符)
  -o                            类似 -l，但不列出有关组的信息
  -p,  --indicator-style=slash  对目录加上表示符号"/"
  -q, --hide-control-chars      以"?"字符代替无法打印的字符
      --show-control-chars      直接显示无法打印的字符 (这是默认方式，除非调用
                                的程序名称是"ls"而且是在终端输出结果)
  -Q, --quote-name              将条目名称括上双引号
      --quoting-style=方式      使用指定的quoting 方式显示条目的名称：
                                literal、locale、shell、shell-always、c、escape
  -r, --reverse                 逆序排列
  -R, --recursive               递归显示子目录
  -s, --size                    以块数形式显示每个文件分配的尺寸
  -S                            根据文件大小排序
      --sort=WORD               以下是可选用的WORD 和它们代表的相应选项：
                                extension -X       status   -c
                                none      -U       time     -t
                                size      -S       atime    -u
                                time      -t       access   -u
                                version   -v       use      -u
      --time=WORD               和-l 同时使用时显示WORD 所代表的时间而非修改时
                                间：atime、access、use、ctime 或status；加上
                                --sort=time 选项时会以指定时间作为排序关键字
      --time-style=STYLE        和-l 同时使用时根据STYLE 代表的格式显示时间：
                                full-iso、iso、locale、posix-iso、+FORMAT。
                                FORMAT 即是"date"所用的时间格式；如果FORMAT
                                是FORMAT1<换行>FORMAT2，FORMAT1 适用于较旧
                                的文件而FORMAT2 适用于较新的文件；如果STYLE
                                以"posix-"开头，则STYLE 仅在POSIX 语系之外
                                生效。
  -t                            根据修改时间排序
  -T, --tabsize=宽度    指定制表符(Tab)的宽度，而非8 个字符
  -t                         sort by modification time, newest first
  -T, --tabsize=COLS         assume tab stops at each COLS instead of 8
  -u                    同-lt 一起使用：按照访问时间排序并显示
                        同-l一起使用：显示访问时间并按文件名排序
                        其他：按照访问时间排序
  -U                    不进行排序；按照目录顺序列出项目
  -v                    在文本中进行数字(版本)的自然排序
  -w, --width=COLS      自行指定萤幕宽度而不使用目前的数值
  -x                    逐行列出项目而不是逐栏列出
  -X                    根据扩展名排序
  -1                    每行只列出一个文件
      --help            显示此帮助信息并退出
      --version         显示版本信息并退出

SIZE 可以是一个可选的整数，后面跟着以下单位中的一个：
KB 1000，K 1024，MB 1000*1000，M 1024*1024，还有 G、T、P、E、Z、Y。

使用色彩来区分文件类型的功能已被禁用，默认设置和 --color=never 同时禁用了它。
使用 --color=auto 选项，ls 只在标准输出被连至终端时才生成颜色代码。
LS_COLORS 环境变量可改变此设置，可使用 dircolors 命令来设置。
```

`stat`:用于显示文件的状态信息。stat命令的输出信息比ls命令的输出信息要更详细。
>命令用于显示 inode 内容。
stat 以文字的格式来显示 inode 的内容。

语法：`stat [文件或目录]`

|选项|说明|
|-L|支持符号连接；|
|-f|显示文件系统状态而非文件状态；|
|-t|以简洁方式输出信息；|
|--help|显示指令的帮助信息；|
|--version|显示指令的版本信息。|

>inode 的内容
inode 包含文件的元信息，具体来说有以下内容：
文件的字节数
文件拥有者的 User ID
文件的 Group ID
文件的读、写、执行权限
文件的时间戳，共有三个：ctime 指 inode 上一次变动的时间，mtime 指文件内容上一次变动的时间，atime 指文件上一次打开的时间。
链接数，即有多少文件名指向这个 inode
文件数据 block 的位置

## man 、info
`man`用于查看 Linux 中的指令帮助

语法：`man(选项)(参数)`

|选项|意义|
|---|---|
|-a|在所有的man帮助手册中搜索；|
|-f|等价于whatis指令，显示给定关键字的简短描述信息；|
|-P|指定内容时使用分页程序；|
|-M|指定man手册搜索的路径。|

|参数|意义|
|---|---|
|1|用户在shell环境可操作的命令或执行文件；|
|2|系统内核可调用的函数与工具等|
|3|一些常用的函数(function)与函数库(library)，大部分为C的函数库(libc)|
|4|设备文件说明，通常在/dev下的文件|
|5|配置文件或某些文件格式|
|6|游戏(games)|
|7|惯例与协议等，如Linux文件系统，网络协议，ASCII code等说明|
|8|系统管理员可用的管理命令|
|9|跟kernel有关的文件|

实例
我们输入man ls，它会在最左上角显示“LS（1）”，在这里，“LS”表示手册名称，而“（1）”表示该手册位于第一节章，同样，我们输man ifconfig它会在最左上角显示“IFCONFIG（8）”。也可以这样输入命令：“man [章节号] 手册名称”。

man是按照手册的章节号的顺序进行搜索的，比如：

man sleep
只会显示sleep命令的手册,如果想查看库函数sleep，就要输入:

man 3 sleep

`info`:Linux下info格式的帮助指令

就内容来说，info页面比man page编写得要更好、更容易理解，也更友好，但man page使用起来确实要更容易得多。一个man page只有一页，而info页面几乎总是将它们的内容组织成多个区段（称为节点），每个区段也可能包含子区段（称为子节点）。理解这个命令的窍门就是不仅要学习如何在单独的Info页面中浏览导航，还要学习如何在节点和子节点之间切换。可能刚开始会一时很难在info页面的节点之间移动和找到你要的东西，真是具有讽刺意味：原本以为对于新手来说，某个东西比man命令会更好些，但实际上学习和使用起来更困难。

语法：`info(选项)(参数)`

|选项|意义|
|---|---|
|-d|添加包含info格式帮助文档的目录；|
|-f|指定要读取的info格式的帮助文档；|
|-n|指定首先访问的info帮助文件的节点；|
|-o|输出被选择的节点内容到指定文件。|

## file
`file` 命令用于辨识文件类型。通过file指令，我们得以辨识该文件的类型。

语法:`file(选项)(参数)`

|选项|意义|
|---|---|
|-b|列出辨识结果时，不显示文件名称；|
|-c|详细显示指令执行过程，便于排错或分析程序执行的情形；|
|-f<名称文件>|指定名称文件，其内容有一个或多个文件名称时，让file依序辨识这些文件，格式为每列一个文件名称；|
|-L|直接显示符号连接所指向的文件类别；|
|-m<魔法数字文件>|指定魔法数字文件；|
|-v|显示版本信息；|
|-z|尝试去解读压缩文件的内容。|

参数,文件：要确定类型的文件列表，多个文件之间使用空格分开，可以使用shell通配符匹配多个文件。

## cp、mv
`cp`:（英文全拼：copy file）命令主要用于复制文件或目录。

语法：`cp [options] source dest`

|参数|说明|
|---|---|
|-a|此选项通常在复制目录时使用，它保留链接、文件属性，并复制目录下的所有内容。其作用等于dpR参数组合。|
|-d|复制时保留链接。这里所说的链接相当于 Windows 系统中的快捷方式。|
|-f|覆盖已经存在的目标文件而不给出提示。|
|-i|与 -f 选项相反，在覆盖目标文件之前给出提示，要求用户确认是否覆盖，回答 y 时目标文件将被覆盖。|
|-p|除复制文件的内容外，还把修改时间和访问权限也复制到新文件中。|
|-r|若给出的源文件是一个目录文件，此时将复制该目录下所有的子目录和文件。|
|-l|不复制文件，只是生成链接文件。|

实例：使用指令 cp 将当前目录 test/ 下的所有文件复制到新目录 newtest 下，

输入如下命令：`cp –r test/ newtest`

注意：用户使用该指令复制目录时，必须使用参数 -r 或者 -R 。


`mv`：（英文全拼：move file）命令用来为文件或目录改名、或将文件或目录移入其它位置。

语法：`mv [options] source dest`

|参数|说明|
|---|---|
|-b| 当目标文件或目录存在时，在执行覆盖前，会为其创建一个备份。|
|-i| 如果指定移动的源目录或文件与目标的目录或文件同名，则会先询问是否覆盖旧文件，输入 y 表示直接覆盖，输入 n 表示取消该操作。|
|-f| 如果指定移动的源目录或文件与目标的目录或文件同名，不会询问，直接覆盖旧文件。|
|-n| 不要覆盖任何已存在的文件或目录。|
|-u|当源文件比目标文件新或者目标文件不存在时，才执行移动操作。|

## alias 、unalias
`alias`命令用于设置指令的别名。

用户可利用alias，自定指令的别名。若仅输入alias，则可列出目前所有的别名设置。alias的效力仅及于该次登入的操作。若要每次登入是即自动设好别名，可在.profile或.cshrc中设定指令的别名。

语法：`alias[别名]=[指令名称]`

参数说明：若不加任何参数，则列出目前所有的别名设置。

`unlias`unalias命令用于删除别名。

语法：`unalias [-a][别名]`

参数：-a 　删除全部的别名。

## sort 、uniq、wc
`sort`： 命令用于将文本文件内容加以排序。

语法：
```
sort [OPTION]... [FILE]...
sort [OPTION]... --files0-from=F
```

主要用途：
可针对文本文件的内容，以行为单位来排序。
将所有输入文件的内容排序后并输出。
当没有文件或文件为-时，读取标准输入。


|排序选项|意义|
|---|---|
|-b, --ignore-leading-blanks    |忽略开头的空白。
|-d, --dictionary-order         |仅考虑空白、字母、数字。
|-f, --ignore-case              |将小写字母作为大写字母考虑。
|-g, --general-numeric-sort     |根据数字排序。
|-i, --ignore-nonprinting       |排除不可打印字符。
|-M, --month-sort               |按照非月份、一月、十二月的顺序排序。
|-h, --human-numeric-sort       |根据存储容量排序(注意使用大写字母，例如：2K 1G)。
|-n, --numeric-sort             |根据数字排序。
|-R, --random-sort              |随机排序，但分组相同的行。
|--random-source=FILE           |从FILE中获取随机长度的字节。
|-r, --reverse                  |将结果倒序排列。
|--sort=WORD                    |根据WORD排序。
|-V, --version-sort             |文本中(版本)数字的自然排序。

|其他选项|意义|
|---|---|
|--batch-size=NMERGE                    |一次合并最多NMERGE个输入；超过部分使用临时文件。|
|-c, --check, --check=diagnose-first    |检查输入是否已排序，该操作不会执行排序。|
|-C, --check=quiet, --check=silent      |类似于 -c 选项，但不输出第一个未排序的行。|
|--compress-program=PROG                |使用PROG压缩临时文件；使用PROG -d解压缩。|
|--debug                                |注释用于排序的行，发送可疑用法的警报到stderr。|
|--files0-from=F                        |从文件F中读取以NUL结尾的所有文件名称；如果F是 - ，那么从标准输入中读取名字。|
|-k, --key=位置1[,位置2]                        |通过一个key排序；KEYDEF给出位置和类型。 在位置1 开始一个key，在位置2 终止(默认为行尾) 参看POS 语法。|
|-m, --merge                            |合并已排序文件，之后不再排序。|
|-o, --output=FILE                      |将结果写入FILE而不是标准输出。|
|-s, --stable                           |通过禁用最后的比较来稳定排序。|
|-S, --buffer-size=SIZE                 |使用SIZE作为内存缓存大小。|
|-t, --field-separator=SEP              |使用SEP作为列的分隔符。|
|-T, --temporary-directory=DIR          |使用DIR作为临时目录，而不是 $TMPDIR 或 /tmp；多次使用该选项指定多个临时目录。|
|--parallel=N                           |将并发运行的排序数更改为N。|
|-u, --unique                           |同时使用-c，严格检查排序；不同时使用-c，输出排序后去重的结果。|
|-z, --zero-terminated                  |设置行终止符为NUL（空），而不是换行符。|
|--help                                 |显示帮助信息并退出。|
|--version                              |显示版本信息并退出。|

POS 是F[.C][OPTS]，F 代表域编号，C 是域中字母的位置，F 和C 均从1开始计数。如果没有有效的-t 或-b 选项存在，则从前导空格后开始计数字符。OPTS 是一个或多个由单个字母表示的顺序选项，以此覆盖此key 的全局顺序设置。如果没有指定key， 则将其整个行。

指定的大小可以使用以下单位之一：
内存使用率% 1%，b 1、K 1024 (默认)，M、G、T、P、E、Z、Y 等依此类推。

如果不指定文件，或者文件为"-"，则从标准输入读取数据。

参数：FILE（可选）：要处理的文件，可以为任意数量。

返回值：返回0表示成功，返回非0值表示失败。

例子：
```
cat sort.txt
AAA:BB:CC
aaa:30:1.6
ccc:50:3.3
ddd:20:4.2
bbb:10:2.5
eee:40:5.4
eee:60:5.1

# 将BB列按照数字从小到大顺序排列：
sort -nk 2 -t: sort.txt
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

```

关于-k选项的解读和例子：

-k选项深度解读：

FStart.CStart Modifier,FEnd.CEnd Modifier
-------Start--------,-------End--------
 FStart.CStart 选项  ,  FEnd.CEnd 选项
这个语法格式可以被其中的逗号,分为两大部分，Start 部分和 End 部分。 Start部分由三部分组成，其中的Modifier部分就是我们之前说过的选项部分； 我们重点说说Start部分的FStart和C.Start；C.Start是可以省略的，省略的话就表示从本域的开头部分开始。FStart.CStart，其中FStart就是表示使用的域，而CStart则表示在FStart域中从第几个字符开始算排序首字符。 同理，在End部分中，你可以设定FEnd.CEnd，如果你省略.CEnd或将它设定为0，则表示结尾到本域的最后一个字符。

```
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

```

`uniq`：显示或忽略重复的行。

语法：`uniq [OPTION]... [INPUT [OUTPUT]]`

主要用途：将输入文件（或标准输入）中邻近的重复行写入到输出文件（或标准输出）中。当没有选项时，邻近的重复行将合并为一个。

|选项|意义|
|---|---|
|-c, --count                |在每行开头增加重复次数。|
|-d, --repeated             |所有邻近的重复行只被打印一次。|
|-D                         |所有邻近的重复行将全部打印。|
|--all-repeated[=METHOD]    |类似于 -D，但允许每组之间以空行分割。METHOD取值范围{none(默认)，prepend，separate}。|
|-f, --skip-fields=N        |跳过对前N个列的比较。|
|--group[=METHOD]           |显示所有行，允许每组之间以空行分割。METHOD取值范围：{separate(默认)，prepend，append，both}。|
|-i, --ignore-case          |忽略大小写的差异。|
|-s, --skip-chars=N         |跳过对前N个字符的比较。|
|-u, --unique               |只打印非邻近的重复行。|
|-z, --zero-terminated      |设置行终止符为NUL（空），而不是换行符。|
|-w, --check-chars=N        |只对每行前N个字符进行比较。|
|--help                     |显示帮助信息并退出。|
|--version                  |显示版本信息并退出。|


参数:
INPUT（可选）：输入文件，不提供时为标准输入。
OUTPUT（可选）：输出文件，不提供时为标准输出。

返回值:
返回0表示成功，返回非0值表示失败。

例子：
```
uniq -i -c uniqtest     #检查的时候，不区分大小写
uniq -s 4 -c uniqtest    #检查的时候，不考虑前4个字符，这样whom have a try 就和 you have a try 就一样了。
uniq -w 2 -c uniqtest  #对每行第2个字符以后的内容不作检查，所以i am tank 根 i love tank就一样了。
```

`wc`：统计文件的字节数、字数（英文单词数）、行数。

统计指定文件中的字节数、字数、行数，并将统计结果显示输出。利用wc指令我们可以计算文件的Byte数、字数或是列数，若不指定文件名称，或是所给予的文件名为“-”，则wc指令会从标准输入设备读取数据。wc同时也给出所指定文件的总统计数。

语法：
```
wc(选项)(参数)
wc [选项]... [文件]...
wc [选项]... --files0-from=F
```

|选项|意义|
|---|---|
|-c |# 统计字节数，或--bytes：显示Bytes数。|
|-l |# 统计行数，或--lines：显示列数。|
|-m |# 统计字符数，或--chars：显示字符数。|
|-w |# 统计字数，或--words：显示字数。一个字被定义为由空白、跳格或换行字符分隔的字符串。|
|-L |# 打印最长行的长度，或--max-line-length。|
|-help     |显示帮助信息。|
|--version |显示版本信息。|

参数:文件,需要统计的文件列表。


## tee
`tee`:从标准输入读取数据并重定向到标准输出和文件。替代重定向可检查输入结果。

语法：`tee [OPTION]... [FILE]...`

主要用途:需要同时查看数据内容并输出到文件时使用。

参数:FILE（可选）：要输出的文件，可以为一或多个。

|选项|意义|
|---|---|
|-a, --append              |追加到文件中而不是覆盖。|
|-i, --ignore-interrupts   |忽略中断信号（Ctrl+c中断操作无效）。|
|-p                        |诊断写入非管道的错误。|
|--output-error[=MODE]     |设置写错误时的行为，请查看下方的MODE部分。|
|--help                    |显示帮助信息并退出。|
|--version                 |显示版本信息并退出。|


MODE决定了当出现写错误时的输出行为，可用的MODE如下：
```
'warn'           当写入到任何输出报错时诊断。
'warn-nopipe'    当写入到任何输出（而不是管道）报错时诊断。
'exit'           当写入到任何输出报错时退出。
'exit-nopipe'    当写入到任何输出（而不是管道）报错时退出。
```

-p选项的指定的默认MODE为'warn-nopipe'。
当'--output-error'没有在选项中时，默认的操作是当写入到管道报错时立刻退出，诊断错误信息并写入到非管道输出。

## ps 、pstree
`ps`:报告当前系统的进程状态
```
ps [-aAcdefHjlmNVwy][acefghLnrsSTuvxX][-C <指令名称>][-g <群组名称>]

[-G <群组识别码>][-p <进程识别码>][p <进程识别码>][-s <阶段作业>]

[-t <终端机编号>][t <终端机编号>][-u <用户识别码>][-U <用户识别码>]

[U <用户名称>][-<进程识别码>][--cols <每列字符数>]

[--columns <每列字符数>][--cumulative][--deselect][--forest]

[--headers][--help][-- info][--lines <显示列数>][--no-headers]

[--group <群组名称>][-Group <群组识别码>][--pid <进程识别码>]

[--rows <显示列数>][--sid <阶段作业>][--tty <终端机编号>]

[--user <用户名称>][--User <用户识别码>][--version]

[--width <每列字符数>]
```

|参数|意义|
|---|---|
|-a|显示所有终端机下执行的程序，除了阶段作业领导者之外。|
|a|显示现行终端机下的所有程序，包括其他用户的程序。|
|-A|显示所有程序。|
|-c|显示CLS和PRI栏位。|
|c|列出程序时，显示每个程序真正的指令名称，而不包含路径，选项或常驻服务的标示。|
|-C<指令名称>|指定执行指令的名称，并列出该指令的程序的状况。|
|-d|显示所有程序，但不包括阶段作业领导者的程序。|
|-e|此选项的效果和指定"A"选项相同。|
|e|列出程序时，显示每个程序所使用的环境变量。|
|-f|显示UID,PPIP,C与STIME栏位。|
|f|用ASCII字符显示树状结构，表达程序间的相互关系。|
|-g<群组名称>|此选项的效果和指定"-G"选项相同，当亦能使用阶段作业领导者的名称来指定。|
|g|显示现行终端机下的所有程序，包括群组领导者的程序。|
|-G<群组识别码>|列出属于该群组的程序的状况，也可使用群组名称来指定。|
|h|不显示标题列。|
|-H|显示树状结构，表示程序间的相互关系。|
|-j或j|采用工作控制的格式显示程序状况。|
|-l或l|采用详细的格式来显示程序状况。|
|L|列出栏位的相关信息。|
|-m或m|显示所有的执行绪。|
|n|以数字来表示USER和WCHAN栏位。|
|-N|显示所有的程序，除了执行ps指令终端机下的程序之外。|
|-p<程序识别码>|指定程序识别码，并列出该程序的状况。|
|p<程序识别码>|此选项的效果和指定"-p"选项相同，只在列表格式方面稍有差异。|
|r|只列出现行终端机正在执行中的程序。|
|-s<阶段作业>|指定阶段作业的程序识别码，并列出隶属该阶段作业的程序的状况。|
|s|采用程序信号的格式显示程序状况。|
|S|列出程序时，包括已中断的子程序资料。|
|-t<终端机编号>|指定终端机编号，并列出属于该终端机的程序的状况。|
|t<终端机编号>|此选项的效果和指定"-t"选项相同，只在列表格式方面稍有差异。|
|-T|显示现行终端机下的所有程序。|
|-u<用户识别码>|此选项的效果和指定"-U"选项相同。|
|u|以用户为主的格式来显示程序状况。|
|-U<用户识别码>|列出属于该用户的程序的状况，也可使用用户名称来指定。|
|U<用户名称>|列出属于该用户的程序的状况。|
|v|采用虚拟内存的格式显示程序状况。|
|-V或V|显示版本信息。|
|-w或w|采用宽阔的格式来显示程序状况。　|
|x|显示所有程序，不以终端机来区分。|
|X|采用旧式的Linux i386登陆格式显示程序状况。|
|-y|配合选项"-l"使用时，不显示F(flag)栏位，并以RSS栏位取代ADDR栏位　。|
|-<程序识别码>|此选项的效果和指定"p"选项相同。|
|--cols<每列字符数>|设置每列的最大字符数。|
|--columns<每列字符数>|此选项的效果和指定"--cols"选项相同。|
|--cumulative|此选项的效果和指定"S"选项相同。|
|--deselect|此选项的效果和指定"-N"选项相同。|
|--forest|此选项的效果和指定"f"选项相同。|
|--headers|重复显示标题列。|
|--help|在线帮助。|
|--info|显示排错信息。|
|--lines<显示列数>|设置显示画面的列数。|
|--no-headers|此选项的效果和指定"h"选项相同，只在列表格式方面稍有差异。|
|--group<群组名称>|此选项的效果和指定"-G"选项相同。|
|--Group<群组识别码>|此选项的效果和指定"-G"选项相同。|
|--pid<程序识别码>|此选项的效果和指定"-p"选项相同。|
|--rows<显示列数>|此选项的效果和指定"--lines"选项相同。|
|--sid<阶段作业>|此选项的效果和指定"-s"选项相同。|
|--tty<终端机编号>|此选项的效果和指定"-t"选项相同。|
|--user<用户名称>|此选项的效果和指定"-U"选项相同。|
|--User<用户识别码>|此选项的效果和指定"-U"选项相同。|
|--version|此选项的效果和指定"-V"选项相同。|
|--widty<每列字符数>|此选项的效果和指定"-cols"选项相同。|

au(x) 输出格式 :`USER PID %CPU %MEM VSZ RSS TTY STAT START TIME COMMAND`
```
USER: 行程拥有者
PID: pid
%CPU: 占用的 CPU 使用率
%MEM: 占用的记忆体使用率
VSZ: 占用的虚拟记忆体大小
RSS: 占用的记忆体大小
TTY: 终端的次要装置号码 (minor device number of tty)
STAT: 该行程的状态:
	D: 无法中断的休眠状态 (通常 IO 的进程)
	R: 正在执行中
	S: 静止状态
	T: 暂停执行
	Z: 不存在但暂时无法消除
	W: 没有足够的记忆体分页可分配
<: 高优先序的行程
N: 低优先序的行程
L: 有记忆体分页分配并锁在记忆体内 (实时系统或捱A I/O)
START: 行程开始时间
TIME: 执行的时间
COMMAND:所执行的指令
```

`pstree`:命令 以树状图的方式展现进程之间的派生关系，显示效果比较直观。

|参数|意义|
|---|---|
|-a|显示每个程序的完整指令，包含路径，参数或是常驻服务的标示；|
|-c|不使用精简标示法；|
|-G|使用VT100终端机的列绘图字符；|
|-h|列出树状图时，特别标明现在执行的程序；|
|-H<程序识别码>|此参数的效果和指定"-h"参数类似，但特别标明指定的程序；|
|-l|采用长列格式显示树状图；|
|-n|用程序识别码排序。预设是以程序名称来排序；|
|-p|显示程序识别码；|
|-u|显示用户名称；|
|-U|使用UTF-8列绘图字符；|
|-V|显示版本信息。|

## kill、killall、pkill
`kill`:发送信号到进程(可以为多个)。

语法：
```
kill [-s sigspec | -n signum | -sigspec] pid | jobspec ...
kill -l [sigspec]
```

|选项|意义|
|---|---|
|-s sig   |信号名称。|
|-n sig   |信号名称对应的数字。|
|-l       |列出信号名称。如果在该选项后提供了数字那么假设它是信号名称对应的数字。|
|-L       |等价于-l选项。|

参数:
pid：进程ID;
jobspec：作业标识符

```
# 列出所有信号名称：
[user2@pc] kill -l
 1) SIGHUP       2) SIGINT       3) SIGQUIT      4) SIGILL
 5) SIGTRAP      6) SIGABRT      7) SIGBUS       8) SIGFPE
 9) SIGKILL     10) SIGUSR1     11) SIGSEGV     12) SIGUSR2
13) SIGPIPE     14) SIGALRM     15) SIGTERM     16) SIGSTKFLT
17) SIGCHLD     18) SIGCONT     19) SIGSTOP     20) SIGTSTP
21) SIGTTIN     22) SIGTTOU     23) SIGURG      24) SIGXCPU
25) SIGXFSZ     26) SIGVTALRM   27) SIGPROF     28) SIGWINCH
29) SIGIO       30) SIGPWR      31) SIGSYS      34) SIGRTMIN
35) SIGRTMIN+1  36) SIGRTMIN+2  37) SIGRTMIN+3  38) SIGRTMIN+4
39) SIGRTMIN+5  40) SIGRTMIN+6  41) SIGRTMIN+7  42) SIGRTMIN+8
43) SIGRTMIN+9  44) SIGRTMIN+10 45) SIGRTMIN+11 46) SIGRTMIN+12
47) SIGRTMIN+13 48) SIGRTMIN+14 49) SIGRTMIN+15 50) SIGRTMAX-14
51) SIGRTMAX-13 52) SIGRTMAX-12 53) SIGRTMAX-11 54) SIGRTMAX-10
55) SIGRTMAX-9  56) SIGRTMAX-8  57) SIGRTMAX-7  58) SIGRTMAX-6
59) SIGRTMAX-5  60) SIGRTMAX-4  61) SIGRTMAX-3  62) SIGRTMAX-2
63) SIGRTMAX-1  64) SIGRTMAX

# 下面是常用的信号。
# 只有第9种信号(SIGKILL)才可以无条件终止进程，其他信号进程都有权利忽略。

HUP     1    终端挂断
INT     2    中断（同 Ctrl + C）
QUIT    3    退出（同 Ctrl + \）
KILL    9    强制终止
TERM   15    终止
CONT   18    继续（与STOP相反，fg/bg命令）
STOP   19    暂停（同 Ctrl + Z）
```

`killall`:用于杀死一个进程，与 kill 不同的是它会杀死指定名字的所有进程。

语法：`  killall [选项]  name`

|选项|意义|
|---|---|
|-e  --exact | 进程需要和名字完全相符|
|-I  --ignore-case |忽略大小写|
|-g  --process-group |结束进程组|
|-i  --interactive |结束之前询问|
|-l  --list |列出所有的信号名称|
|-q  --quite |进程没有结束时，不输出任何信息|
|-r  --regexp |将进程名模式解释为扩展的正则表达式。|
|-s  --signal |发送指定信号|
|-u  --user |结束指定用户的进程|
|-v  --verbose |显示详细执行过程|
|-w  --wait |等待所有的进程都结束|
|-V  --version |显示版本信息|
|--help |显示帮助信息|

name:进程名称。

`pkill`:用于杀死一个进程，与 kill 不同的是它会杀死指定名字的所有进程，类似于 killall 命令。kill 命令杀死指定进程 PID，需要配合 ps 使用，而 pkill 直接对进程对名字进行操作，更加方便。


## jobs、fg、bg
`jobs`:显示作业的状态。

主要用途:显示作业的状态。列出活动的作业。列出停止的作业。

|选项|意义|
|---|---|
|-l	|在作业信息中额外的列出PID。|
|-n	|只列出最近一次通知以来状态变更的作业。|
|-p	|只列出PID。|
|-r	|只输出处于运行状态的作业。|
|-s	|只输出处于停止状态的作业。|

```
└─(10:07:54 on master ✖ ✹ ✭)──> sleep 120                                                                              ──(Wed,Mar30)─┘
# 此时按下ctrl+z使得交互停止。
^Z
[1]  + 100640 suspended  sleep 120
┌─(~/Documents/DEEP_FISH/DEEP)──────────────────────────────────────────────────────────────────────────────────(fiki@FIKI-AI:pts/2)─┐
└─(10:08:01 on master ✖ ✹ ✭)──> sleep 120 &                                                                      148 ↵ ──(Wed,Mar30)─┘
[2] 100665
┌─(~/Documents/DEEP_FISH/DEEP)──────────────────────────────────────────────────────────────────────────────────(fiki@FIKI-AI:pts/2)─┐
└─(10:08:09 on master ✖ ✹ ✭)──> jobs -l                                                                                ──(Wed,Mar30)─┘
[1]  + 100640 suspended  sleep 120
[2]  - 100665 running    sleep 120
```

`bg`：将前台终端作业移动到后台运行,后跟指定要移动到后台执行的作业标识符，可以是一到多个。若后台任务中只有一个，则使用该命令时可以省略任务号。

`fg`：将后台作业移动到前台终端运行，后跟指定要移动到后台执行的作业标识符，可以是一到多个。若后台任务中只有一个，则使用该命令时可以省略任务号。


```
└─(10:07:54 on master ✖ ✹ ✭)──> sleep 120                                                                              ──(Wed,Mar30)─┘
# 此时按下ctrl+z使得交互停止。
^Z
[1]  + 100640 suspended  sleep 120
┌─(~/Documents/DEEP_FISH/DEEP)──────────────────────────────────────────────────────────────────────────────────(fiki@FIKI-AI:pts/2)─┐
└─(10:08:01 on master ✖ ✹ ✭)──> sleep 120 &                                                                      148 ↵ ──(Wed,Mar30)─┘
[2] 100665
┌─(~/Documents/DEEP_FISH/DEEP)──────────────────────────────────────────────────────────────────────────────────(fiki@FIKI-AI:pts/2)─┐
└─(10:08:09 on master ✖ ✹ ✭)──> jobs -l                                                                                ──(Wed,Mar30)─┘
[1]  + 100640 suspended  sleep 120
[2]  - 100665 running    sleep 120
┌─(~/Documents/DEEP_FISH/DEEP)──────────────────────────────────────────────────────────────────────────────────(fiki@FIKI-AI:pts/2)─┐
└─(10:10:52 on master ✖ ✹ ✭)──> bg %1                                                                            148 ↵ ──(Wed,Mar30)─┘
# 此时后台挂载的程序1在后台恢复运行
[1]  - 100640 continued  sleep 120
┌─(~/Documents/DEEP_FISH/DEEP)──────────────────────────────────────────────────────────────────────────────────(fiki@FIKI-AI:pts/2)─┐
└─(10:11:03 on master ✖ ✹ ✭)──> fg %2                                                                                  ──(Wed,Mar30)─┘
# 此时后台运行的程序2被调到前台运行
[2]  - 100665 running    sleep 120

```

## cd 、tree
`cd`:（英文全拼：change directory）命令用于切换当前工作目录。其中 dirName 表示法可为绝对路径或相对路径。若目录名称省略，则变换至使用者的 home 目录 (也就是刚 login 时所在的目录)。另外，~ 也表示为 home 目录 的意思， . 则是表示目前所在的目录， .. 则表示目前目录位置的上一层目录。

语法:`cd [dirName] `,dirName：要切换的目标目录。

`tree`:命令用于以树状图列出目录的内容。执行tree指令，它会列出指定目录下的所有文件，包括子目录里的文件。

语法：`tree [-aACdDfFgilnNpqstux][-I <范本样式>][-P <范本样式>][目录...]`

|参数|说明|
|---|---|
|列表选项|
|-a            | 显示所有文件和目录。|
|-d            | 显示目录名称而非文件。|
|-l            | 如遇到性质为符号连接的目录，直接列出该连接所指向的原始目录。|
|-f            | 在每个文件或目录之前，显示完整的相对路径名称。|
|-x            | 将范围局限在现行的文件系统中，若指定目录下的某些子目录，其存放于另一个文件系统上，则将该目录予以排除在寻找范围外。|
|-L level      | 限制目录显示层级。|
|-R            | Rerun tree when max dir level reached.|
|-P pattern    | <范本样式> 只显示符合范本样式的文件和目录名称。|
|-I pattern    | Do not list files that match the given pattern.|
|--ignore-case | Ignore case when pattern matching.|
|--matchdirs   | Include directory names in -P pattern matching.|
|--noreport    | Turn off file/directory count at end of tree listing.|
|--charset X   | Use charset X for terminal/HTML and indentation line output.|
|--filelimit   | Do not descend dirs with more than # files in them.|
|--timefmt <f> | Print and format time according to the format <f>.|
|-o filename   | Output to file instead of stdout.|
|文件选项|
|-q            | 用“？”号取代控制字符，列出文件和目录名称。|
|-N            | 直接列出文件和目录名称，包括控制字符。|
|-Q            | Quote filenames with double quotes.|
|-p            | 列出权限标示。|
|-u            | 列出文件或目录的拥有者名称，没有对应的名称时，则显示用户识别码。|
|-g            | 列出文件或目录的所属群组名称，没有对应的名称时，则显示群组识别码。|
|-s            | 列出文件和目录大小。|
|-h            | Print the size in a more human readable way.|
|--si          | Like -h, but use in SI units (powers of 1000).|
|-D            | 列出文件或目录的更改时间。|
|-F            | 在执行文件，目录，Socket，符号连接，管道名称名称，各自加上"*"，"/"，"@"，"#"号。|
|--inodes      | Print inode number of each file.|
|--device      | Print device ID number to which each file belongs.|
|排序选项|
|-v            | Sort files alphanumerically by version.|
|-t            | 用文件和目录的更改时间排序。|
|-c            | Sort files by last status change time.|
|-U            | Leave files unsorted.|
|-r            | Reverse the order of the sort.|
|--dirsfirst   | List directories before files (-U disables).|
|--sort X      | Select sort: name,version,size,mtime,ctime.|
|图形选项|
|-i            | 不以阶梯状列出文件和目录名称。|
|-A            | 使用ASNI绘图字符显示树状图而非以ASCII字符组合。|
|-S            | Print with CP437 (console) graphics indentation lines.|
|-n            | Turn colorization off always (-C overrides).|
|-C            | 在文件和目录清单加上色彩，便于区分各种类型。|
|XML / HTML / JSON选项|
|-X            | Prints out an XML representation of the tree.|
|-J            | Prints out an JSON representation of the tree.|
|-H baseHREF   | Prints out HTML format with baseHREF as top directory.|
|-T string     | Replace the default HTML title and H1 header with string.|
|--nolinks     | Turn off hyperlinks in HTML output.|
|杂项选项 |
|--version     | 输入版本信息。|
|--help        | 打印使用帮助信息。|
|--            | Options processing terminator.|


## du 、df
`du`:（英文全拼：disk usage）命令用于显示目录或文件的大小。du 会显示指定的目录或文件所占用的磁盘空间。

语法:`du [-abcDhHklmsSx][-L <符号连接>][-X <文件>][--block-size][--exclude=<目录或文件>][--max-depth=<目录层数>][--help][--version][目录或文件]`

```
-a, --all                              显示目录中个别文件的大小。
-B, --block-size=大小                  使用指定字节数的块
-b, --bytes                            显示目录或文件大小时，以byte为单位。
-c, --total                            除了显示个别目录或文件的大小外，同时也显示所有目录或文件的总和。
-D, --dereference-args                 显示指定符号链接的源文件大小。
-H, --si                               与-h参数相同，但是K，M，G是以1000为换算单位。
-h, --human-readable                   以K，M，G为单位，提高信息的可读性。
-k, --kilobytes                        以KB(1024bytes)为单位输出。
-l, --count-links                      重复计算硬件链接的文件。
-m, --megabytes                        以MB为单位输出。
-L<符号链接>, --dereference<符号链接>  显示选项中所指定符号链接的源文件大小。
-P, --no-dereference                   不跟随任何符号链接(默认)
-0, --null                             将每个空行视作0 字节而非换行符
-S, --separate-dirs                    显示个别目录的大小时，并不含其子目录的大小。
-s, --summarize                        仅显示总计，只列出最后加总的值。
-x, --one-file-xystem                  以一开始处理时的文件系统为准，若遇上其它不同的文件系统目录则略过。
-X<文件>, --exclude-from=<文件>        在<文件>指定目录或文件。
--apparent-size                        显示表面用量，而并非是磁盘用量；虽然表面用量通常会小一些，但有时它会因为稀疏文件间的"洞"、内部碎片、非直接引用的块等原因而变大。
--files0-from=F                        计算文件F中以NUL结尾的文件名对应占用的磁盘空间如果F的值是"-"，则从标准输入读入文件名
--exclude=<目录或文件>                 略过指定的目录或文件。
--max-depth=N                          显示目录总计(与--all 一起使用计算文件)当N为指定数值时计算深度为N，等于0时等同--summarize
--si                                   类似-h，但在计算时使用1000 为基底而非1024
--time                                 显示目录或该目录子目录下所有文件的最后修改时间
--time=WORD                            显示WORD时间，而非修改时间：atime，access，use，ctime 或status
--time-style=样式                      按照指定样式显示时间(样式解释规则同"date"命令)：full-iso，long-iso，iso，+FORMAT
--help                                 显示此帮助信息并退出
--version                              显示版本信息并退出

```

`df`:（英文全拼：disk free） 命令用于显示目前在 Linux 系统上的文件系统磁盘使用情况统计.默认显示单位为KB。可以利用该命令来获取硬盘被占用了多少空间，目前还剩下多少空间等信息。

语法:`df [选项]... [FILE]...`

```
-a或--all：包含全部的文件系统；
--block-size=<区块大小>：以指定的区块大小来显示区块数目；
-h或--human-readable：以可读性较高的方式来显示信息；
-H或--si：与-h参数相同，但在计算时是以1000 Bytes为换算单位而非1024 Bytes；
-i或--inodes：显示inode的信息；
-k或--kilobytes：指定区块大小为1024字节；
-l或--local：仅显示本地端的文件系统；
-m或--megabytes：指定区块大小为1048576字节；
--no-sync：在取得磁盘使用信息前，不要执行sync指令，此为预设值；
-P或--portability：使用POSIX的输出格式；
--sync：在取得磁盘使用信息前，先执行sync指令；
-t<文件系统类型>或--type=<文件系统类型>：仅显示指定文件系统类型的磁盘信息；
-T或--print-type：显示文件系统的类型；
-x<文件系统类型>或--exclude-type=<文件系统类型>：不要显示指定文件系统类型的磁盘信息；
--help：显示帮助；
--version：显示版本信息。

```

## diff 、diff3
`diff`:命令用于比较文件的差异。diff 以逐行的方式，比较文本文件的异同处。如果指定要比较目录，则 diff 会比较目录中相同文件名的文件，但不会比较其中子目录。

语法：`diff [-abBcdefHilnNpPqrstTuvwy][-<行数>][-C <行数>][-D <巨集名称>][-I <字符或字符串>][-S <文件>][-W <宽度>][-x <文件或目录>][-X <文件>][--help][--left-column][--suppress-common-line][文件或目录1][文件或目录2]`

|选项|意义|
|---|---|
|-<行数>|指定要显示多少行的文本。此参数必须与-c或-u参数一并使用；|
|-a或——text|diff预设只会逐行比较文本文件；|
|-b或--ignore-space-change|不检查空格字符的不同；|
|-B或--ignore-blank-lines|不检查空白行；|
|-c|显示全部内容，并标出不同之处；|
|-C<行数>或--context<行数>|与执行“-c-<行数>”指令相同；|
|-d或——minimal|使用不同的演算法，以小的单位来做比较；|
|-D<巨集名称>或ifdef<巨集名称>|此参数的输出格式可用于前置处理器巨集；|
|-e或——ed|此参数的输出格式可用于ed的script文件；|
|-f或-forward-ed|输出的格式类似ed的script文件，但按照原来文件的顺序来显示不同处；|
|-H或--speed-large-files|比较大文件时，可加快速度；|
|-l<字符或字符串>或--ignore-matching-lines<字符或字符串>|若两个文件在某几行有所不同，而之际航同时都包含了选项中指定的字符或字符串，则不显示这两个文件的差异；|
|-i或--ignore-case|不检查大小写的不同；|
|-l或——paginate|将结果交由pr程序来分页；|
|-n或——rcs|将比较结果以RCS的格式来显示；|
|-N或--new-file|在比较目录时，若文件A仅出现在某个目录中，预设会显示 Only in目录，文件A 若使用-N参数，则diff会将文件A 与一个空白的文件比较；|
|-p|若比较的文件为C语言的程序码文件时，显示差异所在的函数名称；|
|-P或--unidirectional-new-file|与-N类似，但只有当第二个目录包含了第一个目录所没有的文件时，才会将这个文件与空白的文件做比较；|
|-q或--brief|仅显示有无差异，不显示详细的信息；|
|-r或——recursive|比较子目录中的文件；|
|-s或--report-identical-files|若没有发现任何差异，仍然显示信息；|
|-S<文件>或--starting-file<文件>|在比较目录时，从指定的文件开始比较；|
|-t或--expand-tabs|在输出时，将tab字符展开；|
|-T或--initial-tab|在每行前面加上tab字符以便对齐；|
|-u，-U<列数>或--unified=<列数>|以合并的方式来显示文件内容的不同；|
|-v或——version|显示版本信息；|
|-w或--ignore-all-space|忽略全部的空格字符；|
|-W<宽度>或--width<宽度>|在使用-y参数时，指定栏宽；|
|-x<文件名或目录>或--exclude<文件名或目录>|不比较选项中所指定的文件或目录；|
|-X<文件>或--exclude-from<文件>|您可以将文件或目录类型存成文本文件，然后在=<文件>中指定此文本文件；|
|-y或--side-by-side|以并列的方式显示文件的异同之处；|
|--help|显示帮助；|
|--left-column|在使用-y参数时，若两个文件某一行内容相同，则仅在左侧的栏位显示该行内容；|
|--suppress-common-lines|在使用-y参数时，仅显示不同之处。|

`diff3`:命令 用于比较3个文件，将3个文件的不同的地方显示到标准输出。

|选项|意义|
|---|---|
|-a|把所有的文件都当做文本文件按照行为单位进行比较，即给定的文件不是文本文件；|
|-A|合并第2个文件和第3个文件之间的不同到第1个文件中，有冲突内容用括号括起来；|
|-B|与选项“-A”功能相同，但是不显示冲突的内容；|
|-e/--ed|生成一个“-ed”脚本，用于将第2个文件和第3个文件之间的不同合并到第1个文件中；|
|--easy-only|除了不显示互相重叠的变化，与选项“-e”的功能相同；|
|-i|为了和system V系统兼容，在“ed”脚本的最后生成“w”和“q”命令。此选项必须和选项“-AeExX3”连用，但是不能和“-m”连用；|
|--initial-tab|在正常格式的行的文本前，输出一个TAB字符而非两个空白字符。此选项将导致在行中TAB字符的对齐方式看上去规范。|

## who、 whoami 、logname
`who`:显示当前所有登陆用户的信息。

当没有给出非选项参数时，按以下字段顺序为每个当前用户打印信息：登录用户名称，终端信息，登录时间，远程主机或X display。
当用户执行 whoami 时，只显示运行该命令的用户的信息。

|选项|说明|
|---|---|
|-a, --all                                |等价于调用 '-b -d --login -p -r -t -T -u'。|
|-b, --boot                               |上次系统启动的时间。|
|-d, --dead                               |打印 dead 状态的进程。|
|-H, --heading                            |打印列标题行。|
|-l, --login                              |打印系统登录进程。|
|--lookup                                 |尝试通过 DNS 规范主机名。|
|-m                                       |仅显示和标准输入关联的主机名和用户。|
|-p, --process                            |打印由 init 生成的活动进程。|
|-q, --count                              |列出所有已登录的用户的名称和数量。|
|-r, --runlevel                           |打印当前运行级别。|
|-s, --short                              |仅打印名称、行和时间（默认）。|
|-t, --time                               |打印上次系统时钟更改。|
|-T, -w, --mesg, --message, --writable    |将 '+、-、?' 中的一个作为用户的消息状态添加到用户名称后面。|
|-u, --users                              |列出登录的用户。|
|--help                                   |显示帮助信息并退出。|
|--version                                |显示版本信息并退出。|

```
关于 -T 选项的 '+、-、?'：
'+'  允许写入信息
'-'  禁止写入信息
'?'  不能查找到终端设备
```

`whoami`:

|选项|说明|
|---|---|
|-a, --all                                |等价于调用 '-b -d --login -p -r -t -T -u'。|
|-b, --boot                               |上次系统启动的时间。|
|-d, --dead                               |打印 dead 状态的进程。|
|-H, --heading                            |打印列标题行。|
|-l, --login                              |打印系统登录进程。|
|--lookup                                 |尝试通过 DNS 规范主机名。|
|-m                                       |仅显示和标准输入关联的主机名和用户。|
|-p, --process                            |打印由 init 生成的活动进程。|
|-q, --count                              |列出所有已登录的用户的名称和数量。|
|-r, --runlevel                           |打印当前运行级别。|
|-s, --short                              |仅打印名称、行和时间（默认）。|
|-t, --time                               |打印上次系统时钟更改。|
|-T, -w, --mesg, --message, --writable    |将 '+、-、?' 中的一个作为用户的消息状态添加到用户名称后面。|
|-u, --users                              |列出登录的用户。|
|--help                                   |显示帮助信息并退出。|
|--version                                |显示版本信息并退出。|

```
关于 -T 选项的 '+、-、?'：
'+'  允许写入信息
'-'  禁止写入信息
'?'  不能查找到终端设备
```

`whoami`:命令用于显示自身用户名称。显示自身的用户名称，本指令相当于执行"id -un"指令。

`logname`:打印当前终端登录用户的名称。

`whoami`、`logname`区别，在正常用户的输出都是一样的，但如果切入超级用户，`whoami`会输出 root

## env、export
`env`:命令 用于显示系统中已存在的环境变量，以及在定义的环境中执行指令。该命令只使用"-"作为参数选项时，隐藏了选项"-i"的功能。若没有设置任何选项和参数时，则直接显示当前的环境变量。如果使用env命令在新环境中执行指令时，会因为没有定义环境变量"PATH"而提示错误信息"such file or directory"。此时，用户可以重新定义一个新的"PATH"或者使用绝对路径。

`export`:为shell变量或函数设置导出属性。

概要
export [-fn] [name[=word]]...
export -p
主要用途
定义一到多个变量并设置导出属性。
修改一到多个变量的值并设置导出属性。
删除一到多个变量的导出属性。
显示全部拥有导出属性的变量。
为一到多个已定义函数新增导出属性。
删除一到多个函数的导出属性。
显示全部拥有导出属性的函数

```
选项
-f：指向函数。
-n：删除变量的导出属性。
-p：显示全部拥有导出属性的变量。
-pf：显示全部拥有导出属性的函数。
-nf：删除函数的导出属性。
--：在它之后的选项无效
```

## free、clear
`free`:可以显示当前系统未使用的和已使用的内存数目，还可以显示被内核使用的内存缓冲区。

|选项|说明|
|---|---|
|-b | 以Byte为单位显示内存使用情况；|
|-k | 以KB为单位显示内存使用情况；|
|-m | 以MB为单位显示内存使用情况；|
|-g | 以GB为单位显示内存使用情况。 |
|-o | 不显示缓冲区调节列；|
|-s<间隔秒数> | 持续观察内存使用状况；|
|-t | 显示内存总和列；|
|-V | 显示版本信息。|

`clear`:清除当前屏幕终端上的任何信息

## halt 、poweroff、shutdown、reboot、init
`halt`:关闭正在运行的Linux操作系统,用来关闭正在运行的Linux操作系统。halt命令会先检测系统的runlevel，若runlevel为0或6，则关闭系统，否则即调用shutdown来关闭系统。

|选项|说明|
|---|---|
|-d|不要在wtmp中记录；|
|-f|不论目前的runlevel为何，不调用shutdown即强制关闭系统；|
|-i|在halt之前，关闭全部的网络界面；|
|-n|halt前，不用先执行sync；|
|-p|halt之后，执行poweroff；|
|-w|仅在wtmp中记录，而不实际结束系统。|

`poweroff`:关闭Linux系统，关闭记录会被写入到/var/log/wtmp日志文件中

|选项|说明|
|---|---|
|-n |关闭之前不同步|
|-p |当被称为halt时关闭电源|
|-v |增加输出，包括消息|
|-q |降低输出错误唯一的消息|
|-w |并不实际关闭系统，只是写入/var/log/wtmp文件中|
|-f |强制关机，不调用shutdown|

`shhutdown`:命令 用来系统关机命令。shutdown指令可以关闭所有程序，并依用户的需要，进行重新开机或关机的动作。

语法：`shutdown(选项)(参数)`

|选项|说明|
|---|---|
|-c|当执行“shutdown -h 11:50”指令时，只要按+键就可以中断关机的指令；|
|-f|重新启动时不执行fsck；|
|-F|重新启动时执行fsck；|
|-h|将系统关机；|
|-k|只是送出信息给所有用户，但不会实际关机；|
|-n|不调用init程序进行关机，而由shutdown自己进行；|
|-r|shutdown之后重新启动；|
|-t<秒数>|送出警告信息和删除信息之间要延迟多少秒。|

参数:
[时间]：设置多久时间后执行shutdown指令；
[警告信息]：要传送给所有登入用户的信息。

`reboot`:重新启动正在运行的Linux操作系统

|选项|说明|
|---|---|
|-d|重新开机时不把数据写入记录文件/var/tmp/wtmp。本参数具有“-n”参数效果；|
|-f|强制重新开机，不调用shutdown指令的功能；|
|-i|在重开机之前，先关闭所有网络界面；|
|-n|重开机之前不检查是否有未结束的程序；|
|-w|仅做测试，并不真正将系统重新开机，只会把重开机的数据写入/var/log目录下的wtmp记录文件。|

`init`:命令 是Linux下的进程初始化工具，init进程是所有Linux进程的父进程，它的进程号为1。init命令是Linux操作系统中不可缺少的程序之一，init进程是Linux内核引导运行的，是系统中的第一个进程。

语法：`init(选项)(参数)`

|选项|说明|
|---|---|
|-b|不执行相关脚本而直接进入单用户模式；|
|-s|切换到单用户模式。|

参数:运行等级：指定Linux系统要切换到的运行等级

什么是运行级呢？简单的说，运行级就是操作系统当前正在运行的功能级别。这个级别从0到6 ，具有不同的功能。你也可以在/etc/inittab中查看它的英文介绍。

|级别|说明|
|---|---|
|#0 |停机（千万不能把initdefault 设置为0）|
|#1 |单用户模式|
|#2 |多用户，没有 NFS(和级别3相似，会停止部分服务)|
|#3 |完全多用户模式|
|#4 |没有用到|
|#5 |x11(Xwindow)|
|#6 |重新启动（千万不要把initdefault 设置为6）|

`init 0`可以实现关机，也就是调用系统的 0 级别，`init 6`可以实现重启，也就是调用系统的 6 级别.

>在早期的 Linux 系统中，应该尽量使用 shutdown 命令来进行关机和重启。因为在那时的 Linux 中，只有 shutdown 命令在关机或重启之前会正确地中止进程及服务，所以我们一直认为 shutdown 才是最安全的关机与重启命令。
而在现在的系统中，一些其他的命令（如 reboot）也会正确地中止进程及服务，但我们仍建议使用 shutdown 命令来进行关机和重启。
在现在的系统中，reboot 命令也是安全的，而且不需要加入过多的选项。

## tr、col、join、cut
`tr`:命令 可以对来自标准输入的字符进行替换、压缩和删除。它可以将一组字符变成另一组字符，经常用来编写优美的单行命令，作用很强大。

|选项|说明|
|---|---|
|-c ——complerment|取代所有不属于第一字符集的字符；|
|-d ——delete|删除所有属于第一字符集的字符；|
|-s --squeeze-repeats|把连续重复的字符以单独一个字符表示；|
|-t --truncate-set1|先删除第一字符集较第二字符集多出的字符。|

语法:'tr(选项)(参数)'

参数:字符集1：指定要转换或删除的原字符集。当执行转换操作时，必须使用参数“字符集2”指定转换的目标字符集。但执行删除操作时，不需要参数“字符集2”；字符集2：指定要转换成的目标字符集。

例子：
```
echo "HELLO WORLD" | tr 'A-Z' 'a-z'  # 将输入字符由大写转换为小写
echo "HELLO      WORLD" | tr -s ' '  # 将空格压缩为一个
```

tr可以使用的字符类：
```
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
```
使用方式：tr '[:lower:]' '[:upper:]'

`col`:命令 是一个标准输入文本过滤器，它从标注输入设备读取文本内容，并把内容显示到标注输出设备。在许多UNIX说明文件里，都有RLF控制字符。当我们运用shell特殊字符>和>>，把说明文件的内容输出成纯文本文件时，控制字符会变成乱码，col命令则能有效滤除这些控制字符。

RLF 字符(reverse line feed)是反向换行符，HRLF字符（half-reverse line feed）是半反向换行符。

|选项|说明|
|---|---|
|-b, --no-backspaces |不输出任何退格符，只打印写入每个列位置的最后一个字符|
|-f, --fine			|允许正向半换行符（half-forward line feeds）。通常，处于半行分界线上的字符打印在下一行
|-h, --tabs			|将多个空格转换为Tab，一般 4 个 空格转为 1 个 Tab|
|-l, --lines NUMBER  |设置缓冲行为 NUMBER，默认为 128|
|-p, --pass			|不转换未识别的控制符|
|-x, --spaces		|将 Tab 转为多个空格，一般 1 一个 Tab 转为 4 个空格|
|-H, --help			|显示帮助信息并退出|
|-V, --version		|显示版本信息并退出|

例子:
```
echo -e "123\t456" | col -x  # 将 Tab 替换为空格，一般 1 个 Tab 转为 4 个空格。
echo -e "123    456" | col -h  # 将空格替换为 Tab，一般 4 个 空格转为 1 个 Tab。
man col | col -b > newFile  # 将帮助文档内的控制符删除。以 col 命令的 manual 为例。
```

`join`:用来将两个文件中，制定栏位内容相同的行连接起来。找出两个文件中，指定栏位内容相同的行，并加以合并，再输出到标准输出设备。

语法：`join(选项)(参数)`

|选项|说明|
|---|---|
|-a<1或2>|除了显示原来的输出内容之外，还显示指令文件中没有相同栏位的行；|
|-e<字符串>|若[文件1]与[文件2]中找不到指定的栏位，则在输出中填入选项中的字符串；|
|-i或--ignore-case|比较栏位内容时，忽略大小写的差异；|
|-j FIELD|等同于 -1 FIELD -2 FIELD,-j指定一个域作为匹配字段|
|-o<格式>|按照指定的格式来显示结果；|
|-t<字符>|使用栏位的分割字符；|
|-v<1或2>|更-a相同，但是只显示文件中没有相同栏位的行；|
|-1<栏位>|连接[文件1]指定的栏位；|
|-2<栏位>|连接[文件2]指定的栏位。|

参数：文件1：要进行合并操作的第1个文件参数；文件2：要进行合并操作的第2个文件参数。

例子：
```
cat 1.txt
aa 1 2
bb 2 3
cc 4 6
dd 3 3

cat 2.txt
aa 2 1
bb 8 2
ff 2 4
cc 4 4
dd 5 5

join 1.txt 2.txt
aa 1 2 2 1
bb 2 3 8 2
join: 2:4: is not sorted: cc 4 4
join: input is not in sorted order
具有相同顺序列首的行被组合在一起了，而第三行两个文件的不同，下面的就不会拼接在一起了

join -1 2 -2 3 file1.txt file2.txt  #  以第一个文件的第二列和第二个文件的第三列做匹配字
```

`cut`:用来显示行中的指定部分，删除文件中指定字段。cut 经常用来显示文件的内容，类似于 type 命令。

语法：`cut（选项）（参数）`

|选项|说明|
|---|---|
|-b|仅显示行中指定直接范围的内容；|
|-c|仅显示行中指定范围的字符；|
|-d|指定字段的分隔符，默认的字段分隔符为“TAB”；|
|-f|显示指定字段的内容；|
|-n|与“-b”选项连用，不分割多字节字符；|
|--complement|补足被选择的字节、字符或字段；|
|--out-delimiter= 字段分隔符|指定输出内容是的字段分割符；|
|--help|显示指令的帮助信息；|
|--version|显示指令的版本信息。|

例子：
```
cat 1.txt
aa 1 2
bb 2 3
cc 4 6
dd 3 3

cut -d ' ' -f 1 1.txt 
# 以空格为分割符提取第一列
aa
bb
cc
dd

如果文件的分隔符为tab则可以省略-d
```

## exit 、type
`exit`:执行exit可使shell以指定的状态值退出。若不设置参数，则以最后一条命令的返回值作为exit的返回值退出。

`type`:显示指定命令的类型。

语法：`type [-afptP] name [name ...]`

主要用途：
显示要查找的命令的信息。
控制查找范围和行为。
显示要查找的命令优先级最高的类型。

|选项|说明|
|---|---|
|-a|在环境变量PATH中查找并显示所有包含name的可执行文件路径；当'-p'选项没有同时给出时，如果在别名、关键字，函数，内建的信息中存在name，则一并显示。|
|-f|排除对shell函数的查找。|
|-p|如果name在执行'type -t name'返回的不是'file'，那么什么也不返回；否则会在环境变量PATH中查找并返回可执行文件路径。|
|-P|即使要查找的name是别名、内建、函数中的一个，仍然会在环境变量PATH中查找并返回可执行文件路径。|
|-t|根据name的类型返回一个单词（别名，关键字，函数，内建，文件），否则返回空值。|

参数：name：要查找的命令，可以为多个。

## paste
`paste`:命令用于合并文件的列。会把每个文件以列对列的方式，一列列地加以合并。

语法:`paste [-s][-d <间隔字符>][--help][--version][文件...]`

|选项|说明|
|---|---|
|-d<间隔字符>或--delimiters=<间隔字符> 　|用指定的间隔字符取代跳格字符。|
|-s或--serial 　|串列进行而非平行处理。|
|--help 　|在线帮助。|
|--version 　|显示帮助信息。|
|[文件…]  |指定操作的文件路径|

与`join`的区别：会无差别的把两文件的第一行合并在一起，而不会根据栏位相同选择合并。

例子：
```
cat 1.txt
aa 1 2
bb 2 3
cc 4 6
dd 3 3

cat 2.txt
aa 2 1
bb 8 2
ff 2 4
cc 4 4
dd 5 5

paste 1.txt 2.txt
aa 1 2	aa 2 1
bb 2 3	bb 8 2
cc 4 6	ff 2 4
dd 3 3	cc 4 4
		dd 5 5
```

## expand、unexpand
`expand`:命令 用于将文件的制表符（TAB）转换为空白字符（space），将结果显示到标准输出设备。

语法:`expand(选项)(参数)`

选项:-t<数字>：指定制表符所代表的空白字符的个数，而不使用默认的8。

参数:文件,指定要转换制表符为空白的文件

`unexpand`:命令 用于将给定文件中的空白字符（space）转换为制表符（TAB），并把转换结果显示在标准输出设备（显示终端）。

语法:unexpand(选项)(参数)

|选项|说明|
|---|---|
|-a或--all|转换文件中所有的空白字符；|
|--first-only|仅转换开头的空白字符；|
|-t<N>|指定TAB所代表的N个（N为整数）字符数，默认N值是8。|

参数:文件,指定要转换空白为TAB的文件列表。

## basename 、dirname
`basename`:显示指定路径除了文件名。
例子：
```
pwd  # /opt/go/bin/
basename /opt/go/bin/go  # /opt/go/bin
basename /opt/go/bin/  # /opt/go
basename /opt/go/bin  # /opt/go
basename go  # go
```


`dirname`:显示指定路径除了文件名之外的路径前缀。
例子：
```
pwd # /opt/go/bin/
dirname /opt/go/bin/go  # /opt/go/bin
dirname /opt/go/bin/  # /opt/go
dirname /opt/go/bin  # /opt/go
dirname go  # .
```

## hostname、hostnamectl
`hostname`：命令 用于显示和设置系统的主机名称。
在使用 hostname 命令设置主机名后，系统并不会永久保存新的主机名，重启之后还是原来的主机名。如果需要永久修改主机名，需要修改 /etc/hosts 和 /etc/sysconfig/network 的相关内容并进行重启；也可以使用 hostnamectl 命令进行永久修改。

`hostnamectl`：可用于查询和更改系统主机名和相关设置。

语法：`hostnamectl [选项...] 指令 ...`

指令：
status                 显示当前主机名设置
set-hostname NAME      设置系统主机名
set-icon-name NAME     设置主机的图标名称
set-chassis NAME       设置主机的机箱类型
set-deployment NAME    设置主机的部署环境
set-location NAME      设置主机位置

## lsattr 、chattr
`lsattr`:命令 用于查看文件的第二扩展文件系统属性。

语法：`lsattr(选项)(参数)`

选项
-E：可显示设备属性的当前值，但这个当前值是从用户设备数据库中获得的，而不是从设备直接获得的。
-D：显示属性的名称，属性的默认值，描述和用户是否可以修改属性值的标志。
-R：递归的操作方式；
-V：显示指令的版本信息；
-a：列出目录中的所有文件，包括隐藏文件。
lsattr经常使用的几个选项-D，-E，-R这三个选项不可以一起使用，它们是互斥的，经常使用的还有-l,-H，使用lsattr时，必须指出具体的设备名，用-l选项指出要显示设备的逻辑名称，否则要用-c，-s，-t等选项唯一的确定某个已存在的设备。

参数
文件：指定显示文件系统属性的文件名。

`chattr`:命令 用来改变文件属性。这项指令可改变存放在ext2文件系统上的文件或目录属性，这些属性共有以下8种模式：

语法
chattr(选项)
选项
a：让文件或目录仅供附加用途；
b：不更新文件或目录的最后存取时间；
c：将文件或目录压缩后存放；
d：将文件或目录排除在倾倒操作之外；
i：不得任意更动文件或目录；
s：保密性删除文件或目录；
S：即时更新文件或目录；
u：预防意外删除。
-R：递归处理，将指令目录下的所有文件及子目录一并处理；
-v<版本编号>：设置文件或目录版本；
-V：显示指令执行过程；
+<属性>：开启文件或目录的该项属性；
-<属性>：关闭文件或目录的该项属性；
=<属性>：指定文件或目录的该项属性。

## cal、date、timedatectl、hwclock
`cal`：显示当前日历或指定日期的日历

cal命令 用于显示当前日历，或者指定日期的日历，如果没有指定参数，则显示当前月份。

一个单一的参数指定要显示的年份 (1 - 9999) ; 注意年份必须被完全地指定: cal 89 不会 显示1989年的日历. 两个参数表示月份 (1 - 12) 和年份. 如果没有指定参数, 则显示当前月份的日历.

一年从Jan 1 (1 月 1 日) 开始.

格里高利历法改革(Gregorian Reformation)被认为发生于 1752 年 9 月 3 日. 在此之前, 多数国家已经认可这项改革(尽管有一些直到 20 世纪初才认可它). 那天之后的 10 天在这项改革被略去了, 所以那个月的日历有点不太寻常.

语法
cal [ -mjy ] [ 月份 ] [ 年份 ]
选项
-l # 显示单月输出；
-3 # 显示临近三个月的日历；
-s # 将星期日作为月的第一天；
-m # 显示星期一作为一周的第一天..  (缺省为星期日.)
-j # 显示儒略历的(Julian)日期 (以 1 为基的天数, 从 1 月 1 日开始计数) .
-y # 显示当前年份的日历..
参数
月：指定月份；
年：指定年份。

`date`：显示或设置系统时间与日期

概要
date [OPTION]... [+FORMAT]
date [-u|--utc|--universal] [MMDDhhmm[[CC]YY][.ss]]
主要用途
转换时间到选定的格式，默认为当前。
设置系统时间。
参数
format：输出的时间格式。

format可用的转义序列如下：

%%      百分号
%a      当地缩写的工作日名称（例如，Sun）
%A      当地完整的工作日名称（例如，Sunday）
%b      当地缩写的月份名称（例如，Jan）
%B      当地完整的月份名称（例如，January）
%c      当地的日期和时间（例如，Thu Mar  3 23:05:25 2005）
%C      世纪，和%Y类似，但是省略后两位（例如，20）
%d      一月中的一天（例如，01）
%D      日期，等价于%m/%d/%y
%e      一月中的一天，格式使用空格填充，等价于%_d
%F      完整的日期；等价于%+4Y-%m-%d
%g      ISO标准计数周的年份的最后两位数字
%G      ISO标准计数周的年份，通常只对%V有用
%h      等价于%b
%H      小时，范围（00..23）
%I      小时，范围（00..23）
%j      一年中的一天，范围（001..366）
%k      小时，使用空格填充，范围（0..23），等价于%_H
%l      小时，使用空格填充，范围（1..12），等价于%_I
%m      月，范围（01..12）
%M      分钟，范围（00..59）
%n      换行符
%N      纳秒，范围（000000000..000000000）
%p      用于表示当地的AM或PM，如果未知则为空白
%P      类似于%p，但用小写表示
%q      季度，范围（1..4）
%r      当地以12小时表示的时钟时间（例如，11:11:04 PM）
%R      24小时每分钟；等价于%H:%M
%s      自协调世界时1970年01月01日00时00分以来的秒数
%S      秒数，范围（00..60）
%t      水平制表符
%T      时间；等价于%H:%M:%S
%u      一周中的一天（1..7），1代表星期一
%U      一年中的第几周，周日作为一周的起始（00..53）
%V      ISO标准计数周，该方法将周一作为一周的起始（01..53）
%w      一周中的一天（0..6），0代表星期天
%W      一年中的第几周，周一作为一周的起始（00..53）
%x      当地的日期表示（例如，12/31/99）
%X      当地的时间表示（例如，23:13:48）
%y      年份后两位数字，范围（00..99）
%Y      年份
%z      +hhmm格式的数值化时区格式（例如，-0400）
%:z     +hh:mm格式的数值化时区格式（例如，-04:00）
%::z    +hh:mm:ss格式的数值化时区格式（例如，-04:00:00）
%:::z   数值化时区格式，相比上一个格式增加':'以显示必要的精度（例如，-04，+05:30）
%Z      时区缩写（如EDT）

默认情况下，日期用零填充数字字段；以下可选的符号可以跟在'%'后面:

-      (连字符) 不要填充相应的字段。
_      (下划线) 使用空格填充相应的字段。
0      (数字0) 使用数字0填充相应的字段。
+      用数字0填充，未来年份大于4位数字则在前面加上'+'号。
^      允许的情况下使用大写。
#      允许的情况下将默认的大写转换为小写，默认的小写转换为大写。

在任何标志之后都有一个可选的字段宽度，如小数；然后是一个可选的修饰符，在可用的情况下，使用E来使用当地语言环境的替代表示，
使用O来使用当地语言环境的替代数字符号。
选项
长选项与短选项等价

-d, --date=STRING          解析字符串并按照指定格式输出，字符串不能是'now'。
--debug                    注释已解析的日期，并将有疑问的用法发送到标准错误。
-f, --file=DATEFILE        类似于--date; 一次从DATEFILE处理一行。
-I[FMT], --iso-8601[=FMT]  按照ISO 8601格式输出，FMT可以为'date'(默认)，'hours'，'minutes'，'seconds'，'ns'。
                           例如：2006-08-14T02:34:56-06:00
-R, --rfc-email            按照RFC 5322格式输出，例如: Mon, 14 Aug 2006 02:34:56 -0600
--rfc-3339=FMT             按照RFC 3339格式输出，FMT可以为'date', 'seconds','ns'中的一个，
                           例如：2006-08-14 02:34:56-06:00
-r, --reference=FILE       显示文件的上次修改时间。
-s, --set=STRING           根据字符串设置系统时间。
-u, --utc, --universal     显示或设置世界协调时(UTC)。
--help                     显示帮助信息并退出。
--version                  显示版本信息并退出。

`timedatectl`：用于在 Linux 中设置或查询系统时间、日期和时区等配置。

在 Linux 运维中，通常使用此命令来设置或更改当前的日期、时间和时区，或启用自动系统时钟与远程 NTP 服务器同步，以确保 Linux 系统始终保持正确的时间。

概要
timedatectl [OPTIONS...] COMMAND ...
主要用途
转换时间到选定的格式，默认为当前。
设置系统时间。
参数
Query or change system time and date settings.

  -h --help                显示帮助信息。
     --version             显示软件包版本。
     --no-pager            不用将输出通过管道传输到寻呼机（pager）。
     --no-ask-password     不提示输入密码。
  -H --host=[USER@]HOST    在远程主机上操作
  -M --machine=CONTAINER   在本地容器上操作。
     --adjust-system-clock 更改本地 RTC 模式时调整系统时钟。

Commands:
  status                   显示当前的时间设置。
  set-time TIME            设置系统时间。
  set-timezone ZONE        设置系统时区。
  list-timezones           显示已知时区。
  set-local-rtc BOOL       控制 RTC 是否在当地时间。（BOOL 的值可以是 1 / true 或 0 / false）
  set-ntp BOOL             启用或禁用网络时间同步。（BOOL 的值可以是 1 / true 或 0 / false）
  timesync-status          显示 systemd-timesyncd 的状态。
  show-timesync            显示 systemd-timesyncd 的属性。


`hwclock`:命令 是一个硬件时钟访问工具，它可以显示当前时间、设置硬件时钟的时间和设置硬件时钟为系统时间，也可设置系统时间为硬件时钟的时间。

在Linux中有硬件时钟与系统时钟等两种时钟。硬件时钟是指主机板上的时钟设备，也就是通常可在BIOS画面设定的时钟。系统时钟则是指kernel中的时钟。当Linux启动时，系统时钟会去读取硬件时钟的设定，之后系统时钟即独立运作。所有Linux相关指令与函数都是读取系统时钟的设定。

语法
hwclock(选项)
选项
--adjust：hwclock每次更改硬件时钟时，都会记录在/etc/adjtime文件中。使用--adjust参数，可使hwclock根据先前的记录来估算硬件时钟的偏差，并用来校正目前的硬件时钟；
--debug：显示hwclock执行时详细的信息；
--directisa：hwclock预设从/dev/rtc设备来存取硬件时钟。若无法存取时，可用此参数直接以I/O指令来存取硬件时钟；
--hctosys：将系统时钟调整为与目前的硬件时钟一致；
--set --date=<日期与时间>：设定硬件时钟；
--show：显示硬件时钟的时间与日期；
--systohc：将硬件时钟调整为与目前的系统时钟一致；
--test：仅测试程序，而不会实际更改硬件时钟；
--utc：若要使用格林威治时间，请加入此参数，hwclock会执行转换的工作；
--version：显示版本信息。

## split
`split`：可以将一个大文件分割成很多个小文件，有时需要将文件分割成更小的片段，比如为提高可读性，生成日志等。

选项
-b：值为每一输出档案的大小，单位为 byte。
-C：每一输出档中，单行的最大 byte 数。
-d：使用数字作为后缀。
-l：值为每一输出档的行数大小。
-a：指定后缀长度(默认为2)。

## uname
`uname`:印机器和操作系统的信息。
当没有选项时，默认启用 -s 选项。
如果给出多个选项或 -a 选项时，输出信息按以下字段排序：内核名称 主机名称 内核release 内核版本 机器名称 处理器 硬件平台 操作系统。

选项
-a, --all                  按顺序打印全部信息，如果 -p 和 -i 的信息是未知，那么省略。
-s, --kernel-name          打印内核名称。
-n, --nodename             打印网络节点主机名称。
-r, --kernel-release       打印内核release。
-v, --kernel-version       打印内核版本。
-m, --machine              打印机器名称。
-p, --processor            打印处理器名称。
-i, --hardware-platform    打印硬件平台名称。
-o, --operating-system     打印操作系统名称。
--help                     显示帮助信息并退出。
--version                  显示版本信息并退出。


## md5sum
`md5sum`:计算和校验文件报文摘要的工具程序

补充说明
md5sum命令 采用MD5报文摘要算法（128位）计算和检查文件的校验和。一般来说，安装了Linux后，就会有md5sum这个工具，直接在命令行终端直接运行。

MD5算法常常被用来验证网络文件传输的完整性，防止文件被人篡改。MD5 全称是报文摘要算法（Message-Digest Algorithm 5），此算法对任意长度的信息逐位进行计算，产生一个二进制长度为128位（十六进制长度就是32位）的“指纹”（或称“报文摘要”），不同的文件产生相同的报文摘要的可能性是非常非常之小的。

语法
md5sum(选项)(参数)
选项
-b：二进制模式读取文件；
-t或--text：把输入的文件作为文本文件看待；
-c：从指定文件中读取MD5校验和，并进行校验；
--status：验证成功时不输出任何信息；
-w：当校验不正确时给出警告信息。
参数
文件：指定保存着文件名和校验和的文本文件。
