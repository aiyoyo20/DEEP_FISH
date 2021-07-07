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

```
#＝＝＝＝＝＝＝＝＝文件保存目录自行修改
dir=/home/fish/Downloads/ #根据实际情况修改或者更换其他目录
disable-ipv6=true
 
[[打开rpc的目的是为了给web]]管理端用
enable-rpc=true
rpc-allow-origin-all=true
rpc-listen-all=true
[[rpc-listen-port]]=6800
#断点续传
continue=true
input-file=/etc/aria2/aria2.session 
save-session=/etc/aria2/aria2.session
 
#最大同时下载任务数
max-concurrent-downloads=20
 
save-session-interval=120
 
# Http/FTP 相关
connect-timeout=120
[[lowest-speed-limit]]=10K
#同服务器连接数
max-connection-per-server=10
[[max-file-not-found]]=2
#最小文件分片大小, 下载线程数上限取决于能分出多少片, 对于小文件重要
min-split-size=10M
#单文件最大线程数, 路由建议值: 5
split=10
check-certificate=false
[[http-no-cache]]=true
```

另外一份aria2.conf文件内容：没细看，应该都差不多

```
dir=dir=/home/fish/Downloads/
disable-ipv6=true
#断点续传
continue=true
input-file=/etc/aria2/aria2.session
save-session=/etc/aria2/aria2.session
# 启用磁盘缓存, 0为禁用缓存, 需1.16以上版本, 默认:16M
disk-cache=32M
# 文件预分配方式, 能有效降低磁盘碎片, 默认:prealloc
# 预分配所需时间: none < falloc ? trunc < prealloc
# falloc和trunc则需要文件系统和内核支持, NTFS建议使用falloc, EXT3/4建议trunc
file-allocation=trunc
# 断点续传
continue=true
# 最大同时下载任务数, 运行时可修改, 默认:5
max-concurrent-downloads=5
# 同一服务器连接数, 添加时可指定, 默认:1
max-connection-per-server=5
# 最小文件分片大小, 添加时可指定, 取值范围1M -1024M, 默认:20M
# 假定size=10M, 文件为20MiB 则使用两个来源下载; 文件为15MiB 则使用一个来源下载
min-split-size=10M
# 单个任务最大线程数, 添加时可指定, 默认:5
split=64
# 整体下载速度限制, 运行时可修改, 默认:0
[[max-overall-download-limit]]=0
# 单个任务下载速度限制, 默认:0
[[max-download-limit]]=0
# 整体上传速度限制, 运行时可修改, 默认:0
[[max-overall-upload-limit]]=0
# 单个任务上传速度限制, 默认:0
[[max-upload-limit]]=0
# 禁用IPv6, 默认:false
disable-ipv6=true
## 进度保存相关 ##
# 从会话文件中读取下载任务
input-file=aria2.session
# 在Aria2退出时保存`错误/未完成`的下载任务到会话文件
save-session=aria2.session
# 定时保存会话, 0为退出时才保存, 需1.16.1以上版本, 默认:0
save-session-interval=60
## RPC相关设置 ##
enable-rpc=true
# 允许所有来源, 默认:false
rpc-allow-origin-all=true
# 允许非外部访问, 默认:false
rpc-listen-all=true
# 事件轮询方式, 取值:[epoll, kqueue, port, poll, select], 不同系统默认值不同
[[event-poll]]=select
# RPC监听端口, 端口被占用时可以修改, 默认:6800
[[rpc-listen-port]]=6800
## BT/PT下载相关 ##
# 当下载的是一个种子(以.torrent结尾)时, 自动开始BT任务, 默认:true
[[follow-torrent]]=true
# BT监听端口, 当端口被屏蔽时使用, 默认:6881-6999
listen-port=51413
# 单个种子最大连接数, 默认:55
[[bt-max-peers]]=55
# 打开DHT功能, PT需要禁用, 默认:true
enable-dht=false
# 打开IPv6 DHT功能, PT需要禁用
[[enable-dht6]]=false
# DHT网络监听端口, 默认:6881-6999
[[dht-listen-port]]=6881-6999
# 本地节点查找, PT需要禁用, 默认:false
[[bt-enable-lpd]]=false
# 种子交换, PT需要禁用, 默认:true
enable-peer-exchange=false
# 每个种子限速, 对少种的PT很有用, 默认:50K
[[bt-request-peer-speed-limit]]=50K
# 客户端伪装, PT需要
peer-id-prefix=-TR2770-
user-agent=Transmission/2.77
# 当种子的分享率达到这个数时, 自动停止做种, 0为一直做种, 默认:1.0
seed-ratio=0
# 强制保存会话, 话即使任务已经完成, 默认:false
# 较新的版本开启后会在任务完成后依然保留.aria2文件
[[force-save]]=false
# BT校验相关, 默认:true
[[bt-hash-check-seed]]=true
# 继续之前的BT任务时, 无需再次校验, 默认:false
bt-seed-unverified=true
# 保存磁力链接元数据为种子文件(.torrent文件), 默认:false
bt-save-metadata=true
```

第三份

```text
## `#`开头为注释内容, 选项都有相应的注释说明, 根据需要修改 ##
## 被注释的选项填写的是默认值, 建议在需要修改时再取消注释  ##
## 如果出现`Initializing EpollEventPoll failed.`之类的
## 错误提示, 可以取消event-poll选项的注释                  ##

## 文件保存相关 ##

# 文件的保存路径(可使用绝对路径或相对路径), 默认: 当前启动位置
dir=/home/zz/Downloads
# 启用磁盘缓存, 0为禁用缓存, 需1.16以上版本, 默认:16M
disk-cache=32M
# 文件预分配方式, 能有效降低磁盘碎片, 默认:prealloc
# 预分配所需时间: none < falloc ? trunc < prealloc
# falloc和trunc则需要文件系统和内核支持, NTFS建议使用falloc, EXT3/4建议trunc
file-allocation=trunc
# 断点续传
continue=true

## 下载连接相关 ##

# 最大同时下载任务数, 运行时可修改, 默认:5
max-concurrent-downloads=5
# 同一服务器连接数, 添加时可指定, 默认:1
max-connection-per-server=5
# 最小文件分片大小, 添加时可指定, 取值范围1M -1024M, 默认:20M
# 假定size=10M, 文件为20MiB 则使用两个来源下载; 文件为15MiB 则使用一个来源下载
min-split-size=10M
# 单个任务最大线程数, 添加时可指定, 默认:5
split=32
# 整体下载速度限制, 运行时可修改, 默认:0
[[max-overall-download-limit]]=0
# 单个任务下载速度限制, 默认:0
[[max-download-limit]]=0
# 整体上传速度限制, 运行时可修改, 默认:0
[[max-overall-upload-limit]]=0
# 单个任务上传速度限制, 默认:0
[[max-upload-limit]]=0
# 禁用IPv6, 默认:false
disable-ipv6=true

## 进度保存相关 ##

# 从会话文件中读取下载任务
input-file=/etc/aria2/aria2.session
# 在Aria2退出时保存`错误/未完成`的下载任务到会话文件
save-session=/etc/aria2/aria2.session
# 定时保存会话, 0为退出时才保存, 需1.16.1以上版本, 默认:0
save-session-interval=60

## RPC相关设置 ##

# 启用RPC, 默认:false
enable-rpc=true
# 允许所有来源, 默认:false
rpc-allow-origin-all=true
# 允许非外部访问, 默认:false
rpc-listen-all=true
# 事件轮询方式, 取值:[epoll, kqueue, port, poll, select], 不同系统默认值不同
[[event-poll]]=select
# RPC监听端口, 端口被占用时可以修改, 默认:6800
[[rpc-listen-port]]=6800

## BT/PT下载相关 ##

# 当下载的是一个种子(以.torrent结尾)时, 自动开始BT任务, 默认:true
[[follow-torrent]]=true
# BT监听端口, 当端口被屏蔽时使用, 默认:6881-6999
listen-port=51413
# 单个种子最大连接数, 默认:55
[[bt-max-peers]]=55
# 打开DHT功能, PT需要禁用, 默认:true
enable-dht=false
# 打开IPv6 DHT功能, PT需要禁用
[[enable-dht6]]=false
# DHT网络监听端口, 默认:6881-6999
[[dht-listen-port]]=6881-6999
# 本地节点查找, PT需要禁用, 默认:false
[[bt-enable-lpd]]=false
# 种子交换, PT需要禁用, 默认:true
enable-peer-exchange=false
# 每个种子限速, 对少种的PT很有用, 默认:50K
[[bt-request-peer-speed-limit]]=50K
# 客户端伪装, PT需要
peer-id-prefix=-TR2770-
user-agent=Transmission/2.77
# 当种子的分享率达到这个数时, 自动停止做种, 0为一直做种, 默认:1.0
seed-ratio=0
# 强制保存会话, 话即使任务已经完成, 默认:false
# 较新的版本开启后会在任务完成后依然保留.aria2文件
[[force-save]]=false
# BT校验相关, 默认:true
[[bt-hash-check-seed]]=true
# 继续之前的BT任务时, 无需再次校验, 默认:false
bt-seed-unverified=true
# 保存磁力链接元数据为种子文件(.torrent文件), 默认:false
bt-save-metadata=true
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