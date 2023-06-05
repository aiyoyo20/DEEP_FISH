
## 查找并过滤出自己 markdown 笔记项目下的所有图片名
`find . -name images | xargs ls -l | grep -E "rw" | tr -s " " | cut -d " " -f 9`

## 过滤出文件中所有使用的图片名
`find . -name "*md" | xargs cat | sed -n  's/.*images\/\(.*png\).*/\1/p'`

这里有个陷阱，find 命令查找的内容名并不会自动转义，比如空格或其他特殊字符，当用其他命令接收时会出错。

例子：

文件名：`test .txt` `test\.txt`

find 结果： `find . -name "*test*"` >> `./test .txt` `./test\.txt`
可以看到输出的内容即没有进行转义，也没有用引号包裹内容，这时我们使用联合命令`find . -name "*test*" | xargs cat` ,

结果是
```
cat: ./test: No such file or directory
cat: .txt: No such file or directory
cat: ./test.txt: No such file or directory
```
对于文件`test .txt` ,由于查找出来的结果传递给下一个命令时没有使用括号包裹，中间有空格，空格又是默认分隔符，预想的`cat "test .txt"`就变成了`cat test .txt`，被当成了两个文件

对于文件`test\.txt` ,`\`在这里起到了转义作用，预想的`cat "test\.txt"`变成了`cat test.txt`

可以使用自带的参数`-exce`执行命令：`find . -name "*test*txt" -exec cat {} \;`

也可以使用 sed 替换，这里自己被绕了一下，想找能直接格式化输出的命令，但是没有合适的，也想到sed，不过忘了可以搭配正则集，认为要多次替换会麻烦不如使用其他语言。

实现：`find . -name "*test*txt" | sed 's/\([[\*^$ ]\)/\\\1/g' | xargs cat`，`[]`填写需要转义的字符，空格就直接空格`[  ]`，但是需要注意的是 sed 是行处理的，直接 cat 得到不结果，需要 xargs 逐参运行。


## 过滤 .zsh_history 的内容

`.zsh_history` 和 `.bash_history` 用于记录使用过的命令，记录的形式中带有时间戳，所以即使相同的命令也会被存储多次。而有时查找会有多个结果，明显多余了。

忽略时间戳对比命令，相同的只保留一个。


`awk -F";" '!a[$2]++' file.txt > tmp && mv tmp file.txt`

解释一下命令的各个部分：
- `-F";"`：指定分号为字段分隔符
- `!a[$2]++`：使用数组 `a` 来存储每个关键字出现的次数，如果该关键字是第一次出现，则 `!a[$2]` 的值为真，输出当前行并自增计数器 `$2`，否则不输出。
- `file.txt`：输入文件名
- `> tmp`：将输出重定向到名为 `tmp` 的临时文件中
- `&&`：如果前一个命令成功执行，则执行下一个命令
- `mv tmp file.txt`：将临时文件 `tmp` 移动到原文件 `file.txt` 中


