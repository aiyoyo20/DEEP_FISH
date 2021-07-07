# 1. 一、介绍
Kali 并不是适用于普通用户的系统，由于他是基于 Debian 的 Linux 发行版，而且现在经过不断的发展，现在可以安装很多软件，可以用做一个桌面系统使用，但是由于其特殊性,其内核是修改过的，不能保证其安全性，所以使用 Kali 用做于主系统是非常危险的，应该非常小心地进行，如果你被入侵了，你将丢失所有数据，并且可能会暴露给更多的人。如果你在做一些不合法的事情，你的个人信息也可用于跟踪你。如果你不小心使用这些工具，那么你甚至可能会毁掉自己的数据。

如果是想要学习使用linux的话，不建议使用 Kali 。

>Kali Linux是一个高级渗透测试和安全审计Linux发行版。作为使用者，你可以把它理解为一个特殊的Linux发行版，集成了精心挑选的渗透测试和安全审计的工具，供渗透测试和安全设计人员使用，也可称之为平台或者框架。
>
>Kali Linux自带安全工具集，它将所带的工具集划分为十四个大类，这些大类中，很多工具会重复出现，因为这些工具同时具有多种功能，比如nmap既能作为信息搜集工具也能作为漏洞探测工具。另外，除了这些系统推荐的工具，我们也可以自行添加新的工具源，丰富工具集。不过对于新手来说，系统推荐的工具已经足够使用了。



Kali官网：[https://www.kali.org/](https://www.kali.org/)（下载镜像很慢，几十k）
![官网下载预览](images/Kali_version.png)
可以看到，很贴心的准备了很多版本，自行选择安装

第三方kali镜像网站：[http://old.kali.org/kali-images/](http://old.kali.org/kali-images/)
![](images/Kali_other_download.png)
这是第三方的下载源的镜像，下载速度会快很多，但是自己在第一次下载的时候看到有点懵，名字和官网的有些不一样，amd64和i386不清楚代表什么，是只限制于这两种型号吗，去查了一下不是
>i386 简单理解就是是32位的, amd64 是64位的版本，因为是amd把64位率先引进桌面系统的，英特尔也是要追随amd并且保持兼容，一般在软件包里包含这样的字符。


# 2. 二、安装
## 2.1. 1、正常安装
目前没有安装，但是先预留一个位置吧
## 2.2. 2、Live_USB
以前都不知道有 live 版本这样神奇的方式，在 想要安装 kali 的时候了解到了这种方式，但是没有仔细去看资料，导致一开始下载的镜像文件并不是live版本的，导致多次刻录启动盘得到的效果和教学是不一样的，后来去仔细了解了才知道自己的错误。并最终成功安装了。

>LUKS:Linux Unified Key Setup
制作live USB盘，因为ISO只有3G大小，以块的形式逐块的形式复制到U盘上，占据的只有3G的空间，剩余的U盘空间未利用，持久加密USB就是把剩余空间拿出一部分，通过Linux下通用的加密标准LUKS，将剩下的空间进行加密，通过后续系统配置，将系统目录转移到加密的分区里。对系统的更改都会保存到U盘加密的分区内。

LUKS：Linux统一的密钥安装，对磁盘级加密技术。囊括很多加密技术的优点。与操作系统无关，加密信息还在磁盘内，就必须相应密钥或证书才能打开磁盘，可以对硬盘分区和U盘分区进行加密。

区别于文件级加密技术。Windows下NTFS分区efs加密（加密文件系统） 文件从efs从加密分区copy出去，加密就失效了。以管理员身份，可以查看所有加密文件内容。

### 2.2.1. 准备材料：  
#### 2.2.1.1. 设备: 
下面的操作均以Manjaro 20.1 为开发环境进行。
#### 2.2.1.2. U盘： 
由于可能会频繁使用，而且对数据的稳定性等等都是有要求的，尽量选择大厂的U盘，大小的话个人建议大于32G，太大的话也没必要，不过也不影响，可以通过拆分磁盘的方式让多余的部分依旧作为普通U盘使用。目前使用128G的，感觉不会很浪费，后续增加软件也有足够的空间。
#### 2.2.1.3. 镜像：
由于自己出错过，所以特意列出来
需要下载的是带live的版本，其他的无法制作live盘。

### 2.2.2. 制作：
#### 2.2.2.1. 方法一、linux下命令行完成
##### 2.2.2.1.1. 写入镜像
```
sudo fdisk -l  # 查看磁盘确定外部u盘的名称，防止写入错误
```
-----
##### 2.2.2.1.2. 分区并写入镜像
使用parted或者图形化工具gparted删除分区,使磁盘为空
```
sudo parted
print devices
select /dev/sdc
print
rm 1
print
quit
```

然后使用dd命令写入镜像，格式如下：sudo dd if=xxx.iso of=U盘路径，此次演示示例：sudo dd if=path/mirror_name.iso of=/dev/sdb，回车执行，系统就开始制作启动盘了，期间终端命令窗口不会有任何反馈.
```
sudo dd if=Kali-linux-1.1.1a-amd64.iso of=/dev/sdc bs=1M
```
```
sudo parted  # 使用parted进行分区，这个是进入分区工具
print devices  # 查看磁盘情况，并为下面的做一个确认
select /dev/sdc  # 选择需要分区的磁盘
print  # 查看分区情况
mkpart primary 3021 125000  # 分区，默认的单位是MB
print  # 再次查看分区情况并检查自己分区是否成功
quit
```
![](images/Kali_print_devices.png)
![](images/Kali_parted_print.png)


-----

##### 2.2.2.1.3. 对分区进行加密
```
sudo cryptsetup --verbose --verify-passphrase luksFormat /dev/sdc3
```
没有使用超级用户运行命令会出错
![](images/Kali_sudo_error.png)
确认时输入的必须为大写的YES
![](images/Kali_YES.png)
输入密码并再次输入确认密码后完成加密
![](images/Kali_confirm_password.png)

-----

##### 2.2.2.1.4. 文件系统级的格式化
还未对分区进行文件系统级格式化，还未能进行文件写入读写。
用加密方式luksOpen打开并挂载在一个可读的目录下，目录名为fiki_usb(可自定义)
期间需要输入密码，密码为刚才设置的密码
```
sudo cryptsetup luksOpen /dev/sdc3 fiki_usb
```
```
ls /dev/mapper/fiki_usb  # 查看挂载情况
```
```
sudo mkfs.ext4 /dev/mapper/fiki_usb  # 格式化为ext4（Linux最新版本日志类型的文件级系统）
```
同样也需要超级权限
![](images/Kali_mkfs_error.png)
由于自己设定的分区较大，所以需要等待一些时间
![](images/Kali_mkfs.png)
##### 2.2.2.1.5. 指定卷标&其他
指定卷标为persistence ,kali官方对持久USB设备规定的操作，卷标必须为persistence。
```
sudo e2label /dev/mapper/fiki_usb  persistence
```


```
sudo mkdir -p /mnt/usb # 在/mnt目录下 ，新建一个usb目录，用来mount /dev 设备
```
```
sudo mount /dev/mapper/fiki_usb /mnt/usb  # 把USB设备的加密分区mount到目录里，这样可以往USB里写文件
```

输出一串字符 到/mnt/usb 目录下的 persistence.conf .会在持久USB启动时被读取，已确认这是加密的USB分区。
```
sudo sh -c 'echo “/ union” > /mnt/usb/persistence.conf' # 创建persistence.conf文件
```
一直权限错误，最终采用了一些方法解决了
![](images/Kali_persistence_error.png)
![](images/Kali_persistence.png)
>利用 “sh -c” 命令，它可以让 bash 将一个字串作为完整的命令来执行，这样就可以将 sudo 的影响范围扩展到整条命令
```
sudo umount /dev/mapper/fiki_usb  # 卸载挂载的分区
```

```
sudo cryptsetup luksClose /dev/mapper/fiki_usb # 关闭通过cryptsetup open加密的分区
```




持久加密USB制作完成。重启进入bios后选择Live USB Encrypted Persistence ，输入磁盘分区密码后进入kali操作系统。

>收尾
官方源修改
官方源位于国外服务器，下载速度往往比较慢。我们可以将其替换为国内镜像源，提高软件下载、更新的速度，修改 /etc/apt/sources.list：
>
>修改为中科大的源提交下载速度
deb http://mirrors.ustc.edu.cn/kali kali-rolling main non-free contrib
deb-src http://mirrors.ustc.edu.cn/kali kali-rolling main non-free contrib
部分软件包缺失，可以使用上一个版本的源
deb http://mirrors.ustc.edu.cn/kali kali-last-snapshot main non-free contrib
deb-src http://mirrors.ustc.edu.cn/kali kali-last-snapshot main non-free contrib
>
>修改为中科大的源提交下载速度
deb http://mirrors.ustc.edu.cn/kali kali-rolling main non-free contrib
deb-src http://mirrors.ustc.edu.cn/kali kali-rolling main non-free contrib
>
>部分软件包缺失，可以使用上一个版本的源
deb http://mirrors.ustc.edu.cn/kali kali-last-snapshot main non-free contrib
deb-src http://mirrors.ustc.edu.cn/kali kali-last-snapshot main non-free contrib
 >
>
>疑难杂症
Q：Parallels 下无法安装 paralles tools，报错如下：
>
>/usr/lib/parallels-tools/kmods/prl_fs_freeze/Snapshot/Guest/Linux/prl_freeze/prl_fs_freeze.c:220:1: warning: data definition has no type or storage class
 DEFINE_TIMER(thaw_timer, thaw_timer_fn, 0, (unsigned long)&(thaw_work));
/usr/lib/parallels-tools/kmods/prl_fs_freeze/Snapshot/Guest/Linux/prl_freeze/prl_fs_freeze.c:220:1: error: type defaults to ‘int’ in declaration of ‘DEFINE_TIMER’ [-Werror=implicit-int]
/usr/lib/parallels-tools/kmods/prl_fs_freeze/Snapshot/Guest/Linux/prl_freeze/prl_fs_freeze.c: In function ‘schedule_thaw_work’:
/usr/lib/parallels-tools/kmods/prl_fs_freeze/Snapshot/Guest/Linux/prl_freeze/prl_fs_freeze.c:224:21: error: ‘thaw_timer’ undeclared (first use in this function); did you mean ‘thaw_timer_fn’?
  if (timer_pending(&thaw_timer))
/usr/lib/parallels-tools/kmods/prl_fs_freeze/Snapshot/Guest/Linux/prl_freeze/prl_fs_freeze.c:224:21: note: each undeclared identifier is reported only once for each function it appears in
/usr/lib/parallels-tools/kmods/prl_fs_freeze/Snapshot/Guest/Linux/prl_freeze/prl_fs_freeze.c: In function ‘cancel_timeout’:
/usr/lib/parallels-tools/kmods/prl_fs_freeze/Snapshot/Guest/Linux/prl_freeze/prl_fs_freeze.c:233:18: error: ‘thaw_timer’ undeclared (first use in this function); did you mean ‘thaw_timer_fn’?
  del_timer_sync(&thaw_timer);
cc1: some warnings being treated as errors
/usr/src/linux-headers-4.15.0-kali2-common/scripts/Makefile.build:335: recipe for target '/usr/lib/parallels-tools/kmods/prl_fs_freeze/Snapshot/Guest/Linux/prl_freeze/prl_fs_freeze.o' failed
make[5]: *** [/usr/lib/parallels-tools/kmods/prl_fs_freeze/Snapshot/Guest/Linux/prl_freeze/prl_fs_freeze.o] Error 1
/usr/src/linux-headers-4.15.0-kali2-common/Makefile:1528: recipe for target '_module_/usr/lib/parallels-tools/kmods/prl_fs_freeze/Snapshot/Guest/Linux/prl_freeze' failed
make[4]: *** [_module_/usr/lib/parallels-tools/kmods/prl_fs_freeze/Snapshot/Guest/Linux/prl_freeze] Error 2
Makefile:146: recipe for target 'sub-make' failed
make[3]: *** [sub-make] Error 2
Makefile:8: recipe for target 'all' failed
make[2]: *** [all] Error 2
make[2]: Leaving directory '/usr/src/linux-headers-4.15.0-kali2-amd64'
Makefile:20: recipe for target 'modules' failed
make[1]: *** [modules] Error 2
make[1]: Leaving directory '/usr/lib/parallels-tools/kmods/prl_fs_freeze/Snapshot/Guest/Linux/prl_freeze'
Makefile.kmods:34: recipe for target 'installme' failed
make: *** [installme] Error 2
make: Leaving directory '/usr/lib/parallels-tools/kmods'
Error: could not build kernel modules
Error: failed to install kernel modules
Error: failed to install Parallels Guest Tools!
>
>/usr/lib/parallels-tools/kmods/prl_fs_freeze/Snapshot/Guest/Linux/prl_freeze/prl_fs_freeze.c:220:1: warning: data definition has no type or storage class
 DEFINE_TIMER(thaw_timer, thaw_timer_fn, 0, (unsigned long)&(thaw_work));
/usr/lib/parallels-tools/kmods/prl_fs_freeze/Snapshot/Guest/Linux/prl_freeze/prl_fs_freeze.c:220:1: error: type defaults to ‘int’ in declaration of ‘DEFINE_TIMER’ [-Werror=implicit-int]
/usr/lib/parallels-tools/kmods/prl_fs_freeze/Snapshot/Guest/Linux/prl_freeze/prl_fs_freeze.c: In function ‘schedule_thaw_work’:
/usr/lib/parallels-tools/kmods/prl_fs_freeze/Snapshot/Guest/Linux/prl_freeze/prl_fs_freeze.c:224:21: error: ‘thaw_timer’ undeclared (first use in this function); did you mean ‘thaw_timer_fn’?
  if (timer_pending(&thaw_timer))
/usr/lib/parallels-tools/kmods/prl_fs_freeze/Snapshot/Guest/Linux/prl_freeze/prl_fs_freeze.c:224:21: note: each undeclared identifier is reported only once for each function it appears in
/usr/lib/parallels-tools/kmods/prl_fs_freeze/Snapshot/Guest/Linux/prl_freeze/prl_fs_freeze.c: In function ‘cancel_timeout’:
/usr/lib/parallels-tools/kmods/prl_fs_freeze/Snapshot/Guest/Linux/prl_freeze/prl_fs_freeze.c:233:18: error: ‘thaw_timer’ undeclared (first use in this function); did you mean ‘thaw_timer_fn’?
cc1: some warnings being treated as errors
/usr/src/linux-headers-4.15.0-kali2-common/scripts/Makefile.build:335: recipe for target '/usr/lib/parallels-tools/kmods/prl_fs_freeze/Snapshot/Guest/Linux/prl_freeze/prl_fs_freeze.o' failed
make[5]: *** [/usr/lib/parallels-tools/kmods/prl_fs_freeze/Snapshot/Guest/Linux/prl_freeze/prl_fs_freeze.o] Error 1
/usr/src/linux-headers-4.15.0-kali2-common/Makefile:1528: recipe for target '_module_/usr/lib/parallels-tools/kmods/prl_fs_freeze/Snapshot/Guest/Linux/prl_freeze' failed
make[4]: *** [_module_/usr/lib/parallels-tools/kmods/prl_fs_freeze/Snapshot/Guest/Linux/prl_freeze] Error 2
Makefile:146: recipe for target 'sub-make' failed
make[3]: *** [sub-make] Error 2
Makefile:8: recipe for target 'all' failed
make[2]: *** [all] Error 2
make[2]: Leaving directory '/usr/src/linux-headers-4.15.0-kali2-amd64'
Makefile:20: recipe for target 'modules' failed
make[1]: *** [modules] Error 2
make[1]: Leaving directory '/usr/lib/parallels-tools/kmods/prl_fs_freeze/Snapshot/Guest/Linux/prl_freeze'
Makefile.kmods:34: recipe for target 'installme' failed
make: *** [installme] Error 2
make: Leaving directory '/usr/lib/parallels-tools/kmods'
Error: could not build kernel modules
Error: failed to install kernel modules
Error: failed to install Parallels Guest Tools!
>
>A：因为Paralleles Tools（暂时）与 Linux Kernel 4.15 不兼容导致，可以考虑手动安装 linux kernel 4.14。
>
>Q：部分软件版本不匹配，无法从官方源找到合适的包？
>
>A：官方源维护偶有bug，可以考虑添加上一次快照的源（kali-last-snapshot），修改 /etc/apt/sources.list：
>
>deb http://mirrors.ustc.edu.cn/kali kali-last-snapshot main non-free contrib
deb-src http://mirrors.ustc.edu.cn/kali kali-last-snapshot main non-free contrib
>
>deb http://mirrors.ustc.edu.cn/kali kali-last-snapshot main non-free contrib
deb-src http://mirrors.ustc.edu.cn/kali kali-last-snapshot main non-free contrib
 
