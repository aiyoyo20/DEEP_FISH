
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



