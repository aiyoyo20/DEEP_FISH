查找并删除符合要求的文件
1、find / -name “test\*” | xargs rm -rf
2、find / -name “test\*” -exec rm -rf {} ;
3、rm -rf $(find / -name “test”)

Linux截取文件指定行数之间的内容
sed -n ‘开始行数，结束行数p’ 被截取文件 > 另存为文件

从ps aux的结果中提取pid
`ps aux | grep process_name | tr -s  | cut -d   -f 2`
首先应该使用tr命令压缩各个列之间的空格，将多个空格压缩为一个，接着使用cut命令根据空格对列进行分割并取出第二个位置的值，也就是PID

算法题： 一个长字符串，去除重复字符串，且保持字典序最小
