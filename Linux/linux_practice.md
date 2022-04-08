1、find / -name “test*” |xargs rm -rf 2、find / -name “test*” -exec rm -rf {} ; 3、rm -rf $(find / -name “test”)

算法题： 一个长字符串，去除重复字符串，且保持字典序最小

linux 题： 查找一个目录下的的某个类型的文件 find file_addr -name "*.type"

一个文件中的内容是有规律的，比如以时间等等，现在想要获取其中某个时间段内的 http 状态码为200的次数 按照时间段取内容并输出为新文本： sed -n '/2021-04-05 02:27:25/,/2021-04-09 05:05:58/p' obsidian.log > ob.txt 统计： grep -c count_word ob.txt 通过管道连接起来即可: sed -n '/2021-04-05 02:27:25/,/2021-04-09 05:05:58/p' obsidian.log | grep -c app grep -oE '[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}' /var/log/nginx/access.log |sort |uniq -c grep -oE '[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}' /var/log/nginx/access.log |sort |uniq -c #查看nginx访问IP数
Linux截取文件指定行数之间的内容
sed -n ‘开始行数，结束行数p’ 被截取文件 > 另存为文件
从ps aux的结果中提取pid
ps aux | grep process_name | tr -s  | cut -d   -f 2
首先应该使用tr命令压缩各个列之间的空格，将多个空格压缩为一个，接着使用cut命令根据空格对列进行分割并取出第二个位置的值，也就是PID
