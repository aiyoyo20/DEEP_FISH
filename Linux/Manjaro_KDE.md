# ！！！ 如何选择manajro

现在有 Xfce 、GNOME 和 KDE Plasma 作为默认桌面环境的3个版本，桌面环境差异不是很大，主要差异为如果按照桌面的轻量级排序 Xfce > GNOME > KDE Plasma 。
Xfce 是最轻量的，比较老的电脑可以选择这个。
GNOME 是以前使用比较多的桌面环境，但随着硬件设备的发展，基本都有在向着 KDE 发展。
KDE 版本 最明显的当然是它的华丽了，很多的桌面修改不用额外去安装、直接在设置里面修改就有很惊艳的效果。

以下就以我自己的配置为例 <img src="images/manjaro_screenfetch.png" alt="pic_1 manjaro_screenfetch"  width=900px />

此次安装的为 KDE 版本，正常使用的话没有问题，但是在后期设置了不少软件自启，以及桌面装饰 dock 和其他一些美化后，整个使用体验就大幅下降，时不时就卡顿一下，去掉了不必要的配置能够保证正常的使用了，而且虽然 dock 的软件只有几M，但是在运行后是很占空间的。

# 一、安装

1.启动盘制作使用的是官方网站推荐的写入软件 rufus 写入镜像。
分区和之前 ubuntu 的差不多，个人觉得几乎所有的 linux 分区都可以这样做。
以我自己的100G为例：

| boot/efi分区   | 300M   | fat32格式 |
| ---            | ---    | ---       |
| 交换分区(swap) | 8G     | ext4格式  |
| 主分区(/)      | 40G    | ext4格式  |
| home           | others | ext4格式  |

然后按照提示一步一步正常走完程序然后重启进行一些配置：

# 二、配置

## 1.更新源

1.配置国内源
`sudo  pacman-mirrors -i -c China -m rank`选择目前网络环境下最快的一个

2.增加 archlinuxcn 源
`sudo vim /etc/pacman.conf`添加如下内容：

    [archlinuxcn]
    Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch

3.安装签名秘钥和升级系统

    sudo pacman -S archlinuxcn-keyring
    sudo pacman -Syyu

## 2.安装 yay

yay 和 pacman 差不多，但是其软件资源要更丰富更新也更快。

    sudo pacman -S yay

## 3.安装软件

### (1)输入法

[typewriting](../Tools/Input_Method/Input_Method.md)

### (3)命令行利器

    yay -S htop  # 进程监控,top 命令的美化版
    yay -S screen  # 命令行终端切换
    yay -S tmux  # 和 screen 类似
    yay -S net-tools  # ifconfig、route、arp 和 netstat 等命令行工具
    yay -S iproute2  # 由于 manjaro 是基于 arch 的，所以自带了，但是没有 net-tools
    yay -S tree  # 以树状图列出目录的内容。执行 tree 指令，它会列出指定目录下的所有文件，包括子目录里的文件。

### (4)日常软件

#### 音乐

    yay -S netease-cloud-music # 网易云音乐
    yay -S spotify # 资源较少
    yay -S clementine  # 可以用做本地播放器，也可以对接 spotify,目前在用的
    yay -S cmus # 一个命令行播放音乐的小工具

#### 浏览器

    yay -S google-chrome  # 谷歌浏览器
    yay -S firefox  # 火狐浏览器(不过好像有自带，升级一下吧)
    # 注重隐私的可以自行搜索安装 Tor 浏览器

#### 视频

##### 1、VLC

`yay -S vlc`

不太习惯，已弃
1、首先是它的文件列表通过快捷键呼出后会将原画面缩小，跳转到其另一个界面，习惯了 potplayer 那样的悬挂式，不影响观看，且又能了解到具体的播放内容，在看课程的时候很有用。
2、用的时候打开多个文件后会卡住，无法打开新的文件，已经打开的窗口也无法在图形化的退出，只能通过命令行强行杀死进程才能结束。
3、而且打开一些视频播放不流畅，有花屏等等。

##### 2、MPV

    yay -S mpv  # 简单版本的视频播放器,简单播放的话功能够用

仅仅是作为 vlc 容易卡死的一个临时替代品，能播放的视频种类不是很清楚，但是只有很简单的功能，没有列表等其他的，打开一个视频后正常的播放，暂停，快进仅此而已。

##### 3、Qmplay2

界面设计很好看，功能也符合其要求，目前在使用的。

项目地址： [ QMPlay2 ](https://github.com/zaps166/QMPlay2)

#### 下载：

    yay -S  uget  # bt 下载工具
    yay -S xdman  # 类似于 idm，多线程下载工具，大大加速下载速度，有时候因为有些需要代理下载的，而代理速度不够好，或者本身源给的下载速度就不快的，比如用 sublime 的包测试，用xdm可以400-500k，而默认使用浏览器下载为10-20k

    yay -S axel
    ## 另外一个多线程下载工具，命令行的，相当于wget加强版，
    ## 使用wget命令下载容易断线，因为wget是单线程的
    ## 使用方法
    ## axel -n 100 http://download.sublimetext.com/sublime-text-3211-1-x86_64.pkg.tar.xz
    ## 注：-n 100 表示开100个线程数下载
    ## 还有其他参数可选，想要了解更多的自行搜索

<!---->

    yay -S aria2

下载利器,需要进行配置，配置方法见新篇,详情[aria2配置](../Tools/Aria2/Aria2.md)
轻型的，多协议支持的下载工具，而且还拥有很多实用的扩展工具

#### 编辑工具：

##### word、pdf、excel

    yay -S wps-office ttf-wps-fonts # WPS # 后面的为中文字体
    sudo pacman -S wps-office-mui-zh-cn # 中文字体包

#### 笔记：

    yay -S foxitreader  # pdf阅读器，但是感觉自带的Okular挺不错够用了，这个看个人喜好吧。
    yay -S mindmaster  # 思维导图工具

#### 其他

    yay -S deepin.com.qq.im  # QQ 安装后不能启动看后续问题归纳
    yay -S deepin.com.qq.im.light  # qq 轻聊版 （感觉就是老版的 qq，不过喜欢）
    yay -S electronic-wechat   # 微信
    yay -S telegram-desktop  # Telegram，电报需要做小小的配置才能使用，详见代理配置

qq 和 qq-lite 的对比图
![pic\_2 qq\_compared](images/manjaro_qq_compared.png)

    yay -S simplescreenrecorder # 录屏软件：SimpleScreenRecorder
    yay  -S flameshot # 截图工具：flameshot，截图后还有多种方式对图片简单处理
    yay -S peek  # 简单录制工具，可录制 gif
    yay -S deepin-screen-recorder  # 另一个简单录制工具，可录制 gif 后面的美化效果的 gif 就是分别用其录制的，效果都差不多，需要注意的是保存的文件名是有空格的，有些不太方便

区别： <img src="images/manajro_peek&deepin-screen.png" alt="pic_3 peek&deepin-screen"  width=900px />
左为 peek，右为 deepin-screen-recorder
peek 是先打开一个窗口，通过拖动边缘可调节大小
deepin-screen-recorder 为打开像截图那样给出截选框先选择大小再录制

### (5)开发工具

#### \[ 1 ] 、JetBrains 全家桶系列

以下是基于版本2019.3
(1)、去官网 ( https://www.jetbrains.com/ ) 下载自己所需的 linux 的 tar,gz 压缩包，命令行移动到自己安装的目录，个人习惯选择 `/opt/`

(2)、解压包 解压全部命令参考：

    tar –xvf file.tar  解压 tar
    tar -xzvf file.tar.gz 解压tar.gz
    tar -xjvf file.tar.bz2   解压 tar.bz2
    tar –xZvf file.tar.Z   解压tar.Z
    unrar e file.rar 解压rar
    unzip file.zip 解压zip
    可能因为权限不够导致解压失败，建议以超级用户解压

(3)、把 `jetbrains-agent.jar` 破解包移动到其bin目录下。

(4)、修改`* .vmoptions` 和 `*64.vmoptions` 这两个文件， 在文件最后加入。`-javaagent:安装目录/jetbrains-agent.jar`

(5)、启动 切换到 bin 目录下或通过绝对路径启动相应的 `sh` 脚本。

(6)、进入正常配置界面，选择 Activation code 找到能用的从code添加注册即可破解。

(7)、可能会没有快捷方式： 附上快捷方式制作：
创建快捷方式：`sudo vim /usr/share/applications/Pycharm.desktop`

粘贴模板：
第一个是最基本的能够获取到工作目录以及添加图标的，以前在 ubuntu 可以正常使用，但是在 manjaro 的时候缺少一些东西，不能对图标进行编辑，而且用的是 svg 那个图，不能被识别，添加到桌面后图标为灰色，所以用的是第二个，

    [Desktop Entry]
    Version=1.0
    Type=Application
    Name=Pycharm
    Icon=/opt/pycharm-2019.3.1/bin/pycharm.svg
    Exec="/opt/pycharm-2019.3.1/bin/pycharm.sh" %f
    Comment=Lightning-smart Python IDE
    Categories=Development;IDE;
    Terminal=false
    StartupWMClass=jetbrains-pycharm

<!---->

    [Desktop Entry]
    Categories=Development;IDE;
    Comment[en_US]=The smartest Python IDE
    Comment=The smartest Python IDE
    Exec="/opt/pycharm-anaconda-2019.3.1/bin/pycharm.sh" %f
    GenericName[en_US]=
    GenericName=
    Icon=/opt/pycharm-anaconda-2019.3.1/bin/pycharm.png
    MimeType=
    Name[en_US]=Pycharm
    Name=Pycharm
    Path=
    StartupNotify=true
    StartupWMClass=jetbrains-pycharm
    Terminal=false
    TerminalOptions=
    Type=Application
    Version=1.0
    X-DBUS-ServiceName=
    X-DBUS-StartupType=
    X-KDE-RunOnDiscreteGpu=false
    X-KDE-SubstituteUID=false
    X-KDE-Username=

我们需要替换掉两个地方：`Exec="xx"` 和 `Icon=`,这里要替换掉我们的 pycharm 解压的目录， 然后保存退出之后 打开 搜索 找到图标 pycharm 然后将其拖到需要放置的位置即可。

后期有了更方便的方法，直接免费试用后将破解插件拖拽进去安装完成重启即可破解。

#### \[ 2 ] Python 开发环境

[Python\_Development\_Environment](../Python/development_envirnment.md)

#### \[ 3 ]、Sublime

[sublime 基础](../Tools/Sublime/sublime_base.md)
[sublime LSP](../Tools/Sublime/sublime_LSP.md)
[sublime  go](../Tools/Sublime/sublime_go.md)
[sublime python](../Tools/Sublime/sublime_python.md)
[sublime markdown](../Tools/Sublime/sublime_markdown.md)
[sublime 前端](../Tools/Sublime/sublime_frontEnd.md)

#### \[ 4 ] 、Mysql

    yay -Si mysql # 查看软件仓库版本
    yay -S mysql # 安装mysql

初始化数据库:`sudo mysqld --initialize --user=mysql --basedir=/usr --datadir=/var/lib/mysql`

这时会输出密码，记下: <img  src="images/manjaro_mysql_init_password.png" alt="pic_7 mysql_init_password" width=900px />

需要留意安装过程中的警告和报错，这次运气好没有遇到，不过看别人的有，留个链接吧，以备不时之需：https://blog.csdn.net/uniondong/article/details/98392738

    sudo systemctl status mysqld # 查看MySql状态
    sudo systemctl enable mysqld # 开机自启
    sudo systemctl start mysqld # 启动MySql服务

<!---->

    mysql -u root -p # 登录mysql
    # 如果报错：ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES) 请再三检查是不是密码不对，或者用户名不对

<!---->

    alter user 'root'@'localhost' identified with mysql_native_password by '新密码';
    # 修改密码，密码必改，不改初始密码是随机的很难记，而且进入后不改密码也不让进行操作

<!---->

    yay -S mysql-workbench # 安装mysql可视化管理平台
    # 然后在连接的时候报错：Could not store password: The name org.freedesktop.secrets was not provided by any .service files，解决方案是安装 gnome-keyring包。
    yay -S gnome-keyring

#### \[ 5 ] 、Vim & Neovim

`yay -S vim`   # 编码利器
`yay -S neovim`   # 和 vim 差不多的命令行编辑器

#### \[ 6 ] 、SSH

    yay -S openssh

<!---->

    ssh username@server_ip  # 正常连接服务器

    ssh server_ip  # 如果客户机的用户名和服务器的用户名相同，登录时可以省略用户名。

    && SSH服务的默认端口是22，上面的都认为22，如果你不设置端口的话登录请求会自动送到远程主机的22端口。我们可以使用 -p 选项来修改端口号。
    ssh -p port ldz@192.168.0.1

第一次连接时会出现下面的情况，输入 yes 即可
![pic\_8 ssh](images/manjaro_ssh.png)

##### 公钥登录(免密登录)

> 每次登录远程主机都需要输入密码是很不方便的，如果想要省去这一步骤，可以利用密钥对进行连接，还可以提高安全性。
>
> 1、在本机生成密钥对
>
> 使用 ssh-keygen 命令生成密钥对：
>
> `ssh-keygen -t rsa`   `[[-t表示类型选项，这里采用rsa]]加密算法`
> 然后根据提示一步步的按enter键即可（其中有一个提示是要求设置私钥口令passphrase，不设置则为空，这里看心情吧，如果不放心私钥的安全可以设置一下），执行结束以后会在 /home/username/ 目录下生成一个 .ssh 文件夹,其中包含私钥文件 id\_rsa 和公钥文件 id\_rsa.pub。
>
> 2、将公钥复制到远程主机中
>
> 使用 ssh-copy-id 命令将公钥复制到远程主机。ssh-copy-id 会将公钥写到远程主机的 ~/ .ssh/authorized\_key 文件中
>
> ssh-copy-id userbname@server\_ip
> 经过以上两个步骤，以后再登录这个远程主机就不用再输入密码了

#### \[ 7 ] 、Redis

    yay -S redis

    yay -S redis-desktop-maganer  # 数据可视化工具
    # 支持: Windows 7+, Mac OS X 10.10+, Ubuntu 14+
    # 特点： C++ 编写，响应迅速，性能好。但不支持数据库备份与恢复。

***

#### \[ 8 ] 、Dbeaver 企业版@破解

> 多平台数据库可视化工具，目前的 redis，mysql，mongodb等等都有
> 不要使用yay或者pacman安装，安装的是社区版，社区版的功能有限，比如不支持 mnongodb，redis
> DBeaverEE **7.0.0**及以下版本（理论上适用于目前所有新老版本）的破解
> 下载相应的包并安装，这里就不给出地址了，网上应该能找到。
> 破解方法:
> (1). 解压 DBeaverEE 到自己想要安装的位置。
> (2). 将下载压缩包解压后得到 dbeaver-agent.jar，把它放到你认为合适的文件夹内。为了方便管理，就放在解压的 /opt/dbeaver/ 目录下
> (3). 在 DBeaverEE 安装目录下找到 Eclipse\dbeaver.ini文件
> (4). 在打开的 dbeaver.ini 编辑窗口末行添加："-javaagent:/opt/dbeaver/dbeaver-agent.jar"，一定要自己确认好路径，填错会导致 DBeaverEE打不开！！！最好使用绝对路径。
> (5). 启动 DBeaverEE 即可。注意快捷方式里面的默认指定位置是不对的，所以打不开，自己去修改下复制到快捷方式所在的目录即可。
> (6). 如果提示错误:"Error opening zip file or JAR manifest missing : dbeaver-agent.jar"，这种情况请试着填上jar文件的绝对路径.

***

#### \[ 9 ] 、Git & Gitkraken破解

    yay -S git
    yay -S gitkraken  # github 桌面版（有说能破解，但我没破解成功，后面也几乎没用上这个软件）

#### \[ 10 ] 、Docker & Docker-compose

    yay -S docker
    yay -S docker-compose

# 三、美化

## 1、dock栏

    yay -S latte-dock
    (1) 去掉多余的图标
    (2) 背调节阴影效果（我觉得没有好看些）
    (3) 图标调节大小（可据显示器大小调节）
    (4) 光标移动到相应图标上时的放大效果
    (5) 设置自动隐藏

<img src="images/manjaro_dock.gif" alt="pic_9"  width=900px />

## 2、状态栏

（1）原来的状态栏是通栏且在下面，调节为在左边，因为有 dock 栏之后，dock 栏我是放在下面的，尝试把状态栏放在右边，但是鼠标滑动滚动条的时候会带出来，影响较大
（2）调节大小不为通栏且居中 <img src="images/manjaro_Status_Bar.gif" alt="pic_10 Status_Bar"  width=900px />

## 3、文件管理器半透明

<p class='ind'> win + e 打开文件管理器-->定位到顶栏右键-->more actions-->configure special application setting-->appearance fixes-->active opacity-->force,我调到79%，感觉还不错</p>

<img src="images/manjaro_Dolphin_beautify.png" alt="pic_11 Dolphin_beautify"  width=900px />

## 4、终端(konsole)半透明

<p > ctrl + alt + t 打开终端-->定位到顶栏右键-->more actions-->configure special application setting-->appearance fixes-->active opacity-->force 同样调到79</p>
<img src="images/manjaro_konsole_beautify.png" alt="pic_12 konsole__beautify"  width=900px />

## 5、yakuake下拉终端

第一种是直接换一个透明的终端主题就可以了，比如 KDE-story
第二种是选中主题后点击编辑，去添加透明度 <img src="images/manjaro_yakuake_beautify.png" alt="pic_13 yakuake_beautify"  width=900px />

## 6、终端内容美化(zsh)

    echo $SHELL # 查看当前使用的shell
    cat /etc/shells # 查看有哪些自带的shell，发现有了，没有的话下面命令安装，manjaro 自带了所以可以不用安装
    yay -S zsh
    sudo chsh -s /bin/zsh # 修改默认shell，这个是修改当前用户的终端，如果要修改root账户，需要切换到root用户
    # 这里遇到一个问题，在执行切换shell命令后显示失败，重启终端尝试也是失败，但是在重启后显示用的是zsh，也就是说切换成功了的

安装 oh-my-zsh

    curl https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | bash # 下载包并且完成安装

如果终端没有搞定代理的话上面的命令无法下载包，链接被墙。可以手动安装，方法下

    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

上面的直接在浏览器打开那个链接去下载也行，然后再复制过去

查看可用的`Theme`：`ls ~/.oh-my-zsh/themes`

不确定安装的时候是否包含了所有的主题，但是查看还是有挺多的。[主题效果预览](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes)

修改zsh主题，编辑`~/.zshrc`文件，将`ZSH_THEME="jonathan"`,即将主题修改为`jonathan`。

安装插件：zsh不仅可以美观还很强大，

    sudo pacman -S autojump
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    sudo vim ~/.zshrc  # 编辑该文件添加入插件名称启用
    plugins=(其他的插件 zsh-autosuggestions zsh-syntax-highlighting)
    source ～/.zshrc
    # 重启

效果展示： <img src="images/manjaro_oh_my_zsh.gif" alt="pic_14  zsh_candy"  width=900px />

关闭自动更新
在使用的过程中，如果最新的版本发生变更在新开的命令行窗口中会提示更新，但是往往因为网络问题（未使用代理）而导致更新失败，可以选择关闭自动更新。`cat ～/.zshrc` 查看配置文件，在文件中有`# DISABLE_AUTO_UPDATE="true"`，默认是注释的，取消注释`DISABLE_AUTO_UPDATE="true"`即可，如果想要体验新版可以开启代理后`omz update`更新即可

***

## 7、壁纸

进入图片目录将图片拖拽到桌面然后会有提示，设置即可，但当壁纸文件移动或者删除就会恢复为默认的壁纸。

预览： <img src="images/manjaro_wallpaper.jpg" alt="pic_15 wallpaper"  width=900px />

或者使用本地的壁纸其实也挺不错的。

## 8、字体

由于是用做开发环境，对于各个字符的区分就格外重要，像一些字体里面的 \[ I (大写的i) 、1、 l (小写的L) ]、\[ 0、O (大写的o) ] 等一度让人崩溃。
JetBrainsMono,下载后解压到 `/usr/share/fonts` 下重启即可。 <img src="images/manjaro_font.png" alt="pic_16 font" width=900px />

下载地址：[JetBrainsMono-2.001.zip](https://download.jetbrains.com/fonts/JetBrainsMono-2.001.zip)

## 9、其他

还有如放大缩小的标改为mac的样子、启动后加载等待的动画、登录页面的样式、图标的更换、整体系统的颜色样式等等、由于精力有限且电脑不太允许，喜欢的可以自行摸索。

# 四、时间设置

## 硬件时钟和系统时钟

系统用两个时钟保存时间：硬件时钟和系统时钟。

硬件时钟(即实时时钟 RTC 或 CMOS 时钟)仅能保存：年、月、日、时、分、秒这些时间数值，无法保存时间标准(UTC 或 localtime)和是否使用夏令时调节。

系统时钟(即软件时间) 与硬件时间分别维护，保存了：时间、时区和夏令时设置。Linux 内核保存为自 UTC 时间 1970 年1月1日经过的秒数。初始系统时钟是从硬件时间计算得来，计算时会考虑/etc/adjtime的设置。系统启动之后，系统时钟与硬件时钟独立运行，Linux 通过时钟中断计数维护系统时钟。

大部分操作系统的时间管理包括如下方面：启动时根据硬件时钟设置系统时间,运行时通过时间同步联网校正时间,关机时根据系统时间设置硬件时间,

## 时间标准

时间表示有两个标准：localtime 和 UTC(Coordinated Universal Time) 。UTC 是与时区无关的全球时间标准。尽管概念上有差别，UTC 和 GMT (格林威治时间) 是一样的。localtime 标准则依赖于当前时区。

时间标准由操作系统设定，Windows 默认使用 localtime，Mac OS 默认使用 UTC 而 UNIX 系列的操作系统两者都有。使用 Linux 时，最好将硬件时钟设置为 UTC 标准，并在所有操作系统中使用。这样 Linux 系统就可以自动调整夏令时设置，而如果使用 localtime 标准那么系统时间不会根据夏令时自动调整。

Linux方案：

    timedatectl set-local-rtc 1 --adjust-system-clock
    timedatectl set-ntp 0

# 五、启动项设置

## 1、refind（Win + Mac + Linux）

windows10 + manjaro 双系统，先有的 win10 后安装 manjaro，manjaro 的 grub 启动项会替代 win10 原来的并且能识别 win10,界面也不错，不挑剔的话改一下选择系统的等待时间就可以了

自己的笔记本有大神几乎完美安装了黑苹果，自己也学着黑了下，目前除蓝牙不能用以外其他的几乎完美，虽然不怎么用，但毕竟是一次大胆的探索，占用的空间也不是很大，就当做个纪念(主要看着牛啊😁)

然后就出现了很尴尬的情况，manjaro 的引导只能识别 windows 和 manjaro，黑苹果的 Clover 只能识别 Mac 和 windows，这时候 refind 就完美的解决了这个问题，把 manjaro 的启动选项固定时间设为0,就可以跳过选择进入manjaro，win10 本来就没有等待直接进入，Clover 也是一样跳过等待就可以。

## 2、grub主题修改（Win + Linux）

现在有很多好看的主题可以修改了，而且修改相对简单，如果没有 Mac 的话建议使用这个,下载的时候注意选择合适的分辨率(1080P、2K、4K)

### 下载：

在 <https://www.gnome-look.org/browse/cat/109/ord/rating/> 下载自己喜欢的主题，已经测试，墙内可以使用，但可能会慢些

#### 现在比较热门的两个主题:

Tela grub themeOriginal <img src="images/manjaro_grub_Tela.png" alt="pic_17 grub_Tela"  width=900px />
Grub-theme-vimixOriginal <img src="images/manjaro_grub_vimixOriginal.png" alt="pic_18 grub_vimixOriginal"  width=900px />

### 安装、

解压下载的文件，切换到解压的目录里面，查看文件会发现有一个 install.sh 文件，运行该文件即可

    tar -xvJf Tela-1080p.tar.gz
    cd Tela-1080p
    sudo ./install.sh

# 六、问题：

## 1、改快捷方式

去 system setting 里面修改 move to trash 的快捷方式时，一直报错：
\[ The key sequence Ctrl+D is ambiguous. Use 'Configure Shortcuts' from the 'Settings' menu to solve the ambiguity.  ]
解决方法：系统里面设置的和在文件管理器里面的不是同一个快捷键，可用于桌面，文件管理器里面的在文件管理器里面设置这样就不冲突了。

## 2、Yakuake

下拉命令行的快捷键原来是 f12,和浏览器的有冲突，记得修改。

## 3、kde-connect

中间在使用 kde-connect 传东西的时候传的不完整，会缺少文件，想着换一个类似的，在搜索后下载了一个 sendanywhere，然后自动给浏览器也添加了一个插件，然后系统就变得很卡很卡，其实也不确定是不是，明天测试一下。结果证明不是。详细原因看下面。

## 4、系统卡顿原因

在开机的时候挺流畅的，运行几分种后就特别卡，点击文件打开需要很长时间，鼠标移动也特别卡，去 htop 看了一下，最开始只关注 cpu 的情况，但是占用不是很大，就怀疑是不是硬盘的问题(硬盘是二手的)，尝试删除了一些新安装的软件，也没有用，去看了驱动的情况，也没有问题，后来再去仔细看了下 htop 的结果，结果发现了一个叫 baloo\_file\_extractor 的进程竟然占用着256G的磁盘空间，自己当初给 manjaro 的总空间都不足100G，kill 后速度明显恢复了，但是很快又卡了，再看，这个进程竟然又自己启动了，去网上查了下资料，没有的到一个很好的结果，有一个说法说这是 KDE 桌面留下来的bug，但是一直没有给解决，他会在你开机后疯狂的往磁盘里面写入，从而造成系统卡顿。网上解决的方法挺多的，但我采取了最简单的一种，立刻停止并禁止启用，不知道禁止启用会不会在一些方面造成影响，有的话后续再补充。

    balooctl suspend  # 立即停止
    balooctl disable  # 禁止启用

## 5、mysql问题

![pic\_19 mysql-problem](images/manjaro_mysql-problem.png)

mysql服务没有启动。

## 6、qq安装后无法启动（deein-wine-tim）

Manjaro-KDE 桌面安装 TIM/QQ 的时候经常出现无法启动，其主要原因是 deein-wine-tim 打包了 Gnome 桌面部分内容，因此在 KDE 桌面环境下需要安装相应的 Gnome 桌面设置环境

安装gnome-settings-daemon：`yay -S gnome-settings-daemon`

依次进入system settings-->>autostar--->>add program 选择文件目录输入/usr/lib/gsd-xsettings 回车确定添加然后开启就可以了，如果没有 gsd-xsettings 就先重启一下就有了，然后再重启一下就可以打开了，第一次打开可能会提示更新wine，稍微等待一下就可以了

## 7、使用ping命令无法验证自己的socks代理是否正确启用

最常用的 `ping` 网络检测命令即是使用的 `ICMP` 协议，在 OSI 七层网络模型中，`ICMP` 协议工作在第三层 - **网络层**，`SOCKS`（非套接字 socket）协议工作在第五层 - **会话层**，`HTTP/HTTPS` 协议工作在第七层 - **应用层**，SSH 工作在第七层 - **应用层**，它们在模型中不同的层次位置，决定了 HTTP/HTTPS 和 SSH 协议可以直接走 SOCKS 代理，而 ICMP 无法直接走 SOCKS 代理。

模型中不同协议的位置如下图： <img src="images/manjaro_TCP&IP.gif" alt="pic_20 TCP/IP"  width=900px />

## 8、deb包的安装

有时候去获得的软件源的得到的包不是 manajro 可以直接安装的而是 `deb` 的
法一：
、、、、 我在使用本方法的时候没有成功 、、、、

    yay -S debtap   # 安装第三方转换软件
    sudo debtap -u     # 更新，这步无法解决，挂代理还是不挂都失败
    debtap package_name.deb  # 对包进行转换
    sudo pacman -U packagename  # 安装

![pic\_21 debtap\_error](images/manjaro_debtap_error.png)

法二：
直接解压 deb 文件，然后再解压包到根目录下，或`/opt`下，快捷方式在正常快捷方式的`/usr/share/applications/`下，主要看包内部的结构。
后期实际使用情有的可行，有的不行，涉及到一些系统的依赖吧估计。

## 9、pycharm 的快捷键问题

设置无法通过以往习惯的（ctrl+alt+s）呼出，估计有其他应用占用了这个快捷键，尝试去查找具体是哪一个占用了，目前没有找到，先改为alt+s将就用着吧。

## 10、更新启动导致 grub 设置失效

前期把 manjaro 的启动时间设置为 0 了，然后一段时间又恢复成默认的10s了，以为是系统bug导致的，今天有一个大版本的更新，包括内核，更新完成之后没有重启，电脑特别卡，重启后发现启动时间又变回去了，大版本的更新会重置之前的设置。

## 11、启动器其找不到应用快捷方式

有些自己通过解压安装的软件在启动器找不到相应的快捷方式，有点类似于解压安装的没有去写入注册表那样，
大多数快捷方式是在‘/usr/share/applications/’下，第三方解压安装的也会解压到这，如果找不到，复制其快捷方式到‘/home/fish/.local/share/applications/’即可

## 12、大版本更新启动等待时间变为默认

这个没法解决，更新时会默认强制把boot/grub里面的文件更新，不能随便删除替换，只能更新一次去更改一次 /boot/grub/grub.cfg文件，而且是重启后更改。

## 13、Appimages 软件创建桌面图标

AppimagesLauncher 可以自动将 Appimages 应用程序快捷方式添加到桌面环境的应用程序中启动器/菜单。
下载地址：<https://github.com/TheAssassin/AppimagesLauncher/releases>

## 14、无法连接到 Tor

开始直接使用的是本地的网络，但是无法进入，后切换使用代理后成功进入，再根据查找的资料，大概原因可能是所用的网络可能存在封锁。如果本地网络没法进入请使用代理。

## 15 、.run文件的运行

下载后检查有没有权限，没有的话为其添加权限`chmod 755 test.run`然后双击或者命令行`./test.run`运行，避免后期权限问题报错，加 sudo 吧。

## 16、无意切换到终端模式

之前有在使用快捷键的时候摁错了导致进入了全命令行的终端模式，当时一点头绪都没有，只有强行关机重启。

今天在使用 ctrl + alt + f5 的时候进入了，就去查询了一下相关的：

> 终端模式又称作命令行模式或者字符模式，默认情况下linux提供六个终端，使用组合键ctrl+alt+F1进入第一个终端，使用组合键ctrl+alt+F2进入第二个终端，其他终端的组合键以此类推.

> 终端又叫做tty，linux定义了六个tty，分别从tty1到tty6，tty是teletype的简写。从tty1到tty6被称为虚拟终端，如果想要切换回桌面，只需要使用组合键ctrl+alt+F7即可。

> 注意，如果系统设定默认启动的时候不启动图形界面，则tty7是不可用的。
> 此时，若想从终端字符界面进入图形界面就需要使用命令startx
> 命令如下# startx
> '#'是一个提示符，表示当前登陆的用户是root用户，也就是超级用户
> $ 也是一个提示符，表示当前登陆的用户是一个普通用户。
> 超级用户拥有对系统的全部权限，可实现所有的功能。普通用户只有部分功能。这就是区别，看词就可以定义。

## 17、开机自动挂载windows分区

没有任何配置的话 linux 开机默认是不会挂载 windows 分区的，只有比如进入文件管理器点击相应的分区后才会挂载，并且只会在本次有效，重启后恢复默认，这就造成了例如上一次导入的 windows 分区内的歌曲，视频，文件等等都会显示文件不存在或者无法找到等情况。

KDE 暂时不清楚，在 XFCE 下无论是通过在 /etc/fstab 里写入挂载的盘还是通过开机即执行挂载命令均为成功。先这样吧。

## 18、Chrome 浏览器强制使用安全搜索模式

不清楚是自己使用的代理的问题还是说最近 google 在上次更新后加入了这项机制，在设置账户为中文的情况下会默认打开安全搜索模式且无法关闭（关闭保存退出后也会自动打开），解决方法是切换到其他语言如英语就可以关闭了。

## 19、Chrome更新后的Reading List 取消

自上次无意更新 Chrome 后在标签栏的位置增加了一个新条目（功能）Reading List，功能感觉像是之前使用的插件 onetab，在添加书签会多一个选择，在打开书签目录的时候由于最右边的位置被占用了，使用习惯就很别扭。

取消方法：地址栏输入：`chrome://flags/#read-later`,把 default 改为 disabled     后 relaunch 后即可

## 20、libcrypt.so.1 问题

进行了一次大更新，原来能使用的软件不同使用了，`libcrypt.so.1` 包也找不着，通过安装`libcrypt.so.1`可以了，多加一次，如果有`libcrypt.so.1` `libcrypt.so.1.1.0`文件，可直接制作一个软连接即可，`sudo  ln  -s  libcrypt.so.1 libcrypt.so.1.1.0`

## 21、zsh-autosuggestion 颜色变为白色

同样是更新后的问题，应该是更新到了zsh
问题是配置了zsh-autosuggestion插件，根据历史命令自动提示出要补全的命令，要补全的为灰色。但是现在全为白色，完全失去了效果。查了下本地的颜色配置没有问题，去修改zsh-autosuggestion插件底层的文件无效，在.zshrc中写入OZSH\_AUTOSUGGEST\_HIGHLIGHT\_STYLE='fg=yellow'也无效。

最后看到是 `zsh-syntax-highlighting` and `zsh-autosuggestions` 叠加使用产生的bug，都更新到最新版本可解除这个问题
