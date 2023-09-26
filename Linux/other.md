    wget -m -e robots=off -k -E "https://python3webspider.cuiqingcai.com/"

<!---->

    wget整站抓取、网站抓取功能；下载整个网站；下载网站到本地
    wget -r   -p -np -k -E  http://www.xxx.com 抓取整站

    wget -l 1 -p -np -k       http://www.xxx.com 抓取第一级


    -r 递归抓取
    -k 抓取之后修正链接，适合本地浏览

    wget -m -e robots=off -k -E "http://www.abc.net/"
    可以将全站下载以本地的当前工作目录，生成可访问、完整的镜像。

    解释：
    -m  //镜像，就是整站抓取
    -e robots=off   //忽略robots协议，强制、流氓抓取
    -k  //将绝对URL链接转换为本地相对URL
    -E //将所有text/html文档以.html扩展名保存

## 一、回到上次操作的目录

cd  -
进入上次访问目录

## 命令跳转

在终端中按捉 \[Ctrl] 键的同时 \[r] 键，出现提示：(reverse-i-search)
此时你尝试一下输入你以前输入过的命令，当你每输入一个字符的时候，终端都会滚动显示你的历史命令。
当显示到你想找的合适的历史命令的时候，直接 \[Enter]，就执行了历史命令。

另外， \[Ctrl + p] 或 \[Ctrl + n] 快速向前或向后滚动查找一个历史命令，
对于快速提取刚刚执行过不久的命令很有用。

三、命令行内快速操作键

1.  移动操作快捷键
    Ctrl + f-- 向右移动一个字符，当然多数人用→
    Ctrl + b-- 向左移动一个字符， 多数人用←
    ESC + f-- 向右移动一个单词，MAC下建议用ALT + →
    ESC + b-- 向左移动一个单词，MAC下建议用ALT + ←
    Ctrl + a-- 跳到行首
    Ctrl + e-- 跳到行尾

2.  删除操作快捷键
    Ctrl + d-- 向右删除一个字符
    Ctrl + h-- 向左删除一个字符
    Ctrl + u-- 删除当前位置字符至行首（输入密码错误的时候多用下这个）
    Ctrl + k-- 删除当前位置字符至行尾
    Ctrl + w-- 删除从光标到当前单词开头

3.其他操作快捷键
Ctrl + y-- 插入最近删除的单词
Ctrl + c-- 终止操作
Ctrl + d-- 当前操作转到后台
Ctrl + l-- 清屏 （有时候为了好看）

### 简单使用
查看包名：`adb shell pm list packages`

卸载包：` `

强制卸载（可卸载自带应用）：`adb shell pm uninstall --user -0 com.google.android.googlequicksearchbox`