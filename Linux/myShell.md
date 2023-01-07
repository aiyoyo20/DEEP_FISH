
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
