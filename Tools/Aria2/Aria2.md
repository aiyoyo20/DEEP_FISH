# 1. 简介：

linux 中拥有大量的下载工具，不过没有一个像迅雷那样在windows中文世界中占有统治地位。 对于一般 linux 用户常用的下载工具，比如gnome和kde等桌面环境中自带的 utorrent 或 ktorrent ， 自身下载速度不快，还有着占用内存资源多，支持下载协议有限的缺点。对于追求简洁高效的系统的人来说，自然是难以接受的。

而 aria2 作为一个轻型的，多协议支持的下载工具，而且还拥有很多实用的扩展工具， 可以说是 linux 下一个杀手级的下载工具。

不过 aria2 不像一般的下载工具那样开箱即用； 它的安装和配置自定义的程度高， 并且是需要花点功夫来折腾下的， 可以说是一款偏 geek 的下载工具。

## 1.1. aria2是什么？

aria2是一款轻量级的、支持多协议的和多个下载源的下载工具，它能够支持HTTP/HTTPS，FTP，SFTP，BitTorrent以及Metalink这么多协议的下载。 具体介绍可参照[aria2官网](https://aria2.github.io/)。

除了丰富的协议支持，它还有两个非常惊艳的优点：一个是轻量级：占用内存空间十分少，通常只占用4-9MB。 另一个优势就是支持RPC界面远程控制，可以很方便的对被配置为服务器的主机进行下载管理。 可以说对于linux主机来说是一款绝佳的下载工具。

用了一段时间后，还是非常满意这个小巧易用的下载工具； 唯一的一点遗憾就是不能下载迅雷链接，每次搜老电影都只能找到迅雷链接的我真是快哭了。

体会到了aria2的强大了之后，就来看看正确安装并配置aria2。

# 2. aria2的安装及配置

1、进入 /etc 目录，新建一个文件夹和一个session文件并设置权限

```
cd /etc
mkdir aria2
touch /aria2/aria2.session
sudo chmod 777 aria2/aria2.session
```

2、新建配置文件并编辑

```
vim aria2.conf
```

3、启动

```
sudo aria2c --conf-path=/etc/aria2/aria2.conf
```

```
sudo aria2c --conf-path=/etc/aria2/aria2.conf -D
# 启动aria2到后台。-D表示运行程序到后台。 
# 假如你不确定自己的配置是否正确，你可以命令后不加-D来观察输出是否正确。
```

# 3. 问题以及解决方法：

如果跳出什么无法打开`aria2.session`的错误，
1、就在当前运行命令的目录下建一个`aria2.session`文件
2、或者切换到/etc/aria2目录下运行命令即可解决
3、相对路径改为绝对路径就好了
input-file=aria2.session
save-session=aria2.session
改为：
input-file=/etc/aria2/aria2.session
save-session=/etc/aria2/aria2.session