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

## less、more、
