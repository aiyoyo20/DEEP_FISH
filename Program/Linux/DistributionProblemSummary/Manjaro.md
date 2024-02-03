## Manjaro-KDE 问题

### 1、改快捷方式

去`system setting`里面修改`move to trash`的快捷方式时，一直报错`[ The key sequence Ctrl+D is ambiguous. Use 'Configure Shortcuts' from the 'Settings' menu to solve the ambiguity. ]`

解决方法：系统里面设置的和在文件管理器里面的不是同一个快捷键，可用于桌面，文件管理器里面的在文件管理器里面设置这样就不冲突了。

### 2、Yakuake

下拉命令行的快捷键原来是 f12,和浏览器的有冲突，记得修改。

### 3、kde-connect

中间在使用`kde-connect`传东西的时候传的不完整，会缺少文件，想着换一个类似的，在搜索后下载了一个sendanywhere，然后自动给浏览器也添加了一个插件，然后系统就变得很卡很卡，其实也不确定是不是，明天测试一下。结果证明不是。详细原因看下面。

### 4、系统卡顿原因

在开机的时候挺流畅的，运行几分种后就特别卡，点击文件打开需要很长时间，鼠标移动也特别卡，去htop看了一下，最开始只关注cpu的情况，

但是占用不是很大，就怀疑是不是硬盘的问题(硬盘是二手的)，尝试删除了一些新安装的软件，

也没有用，去看了驱动的情况，也没有问题，

后来再去仔细看了下htop的结果，结果发现了一个叫`baloo_file_extractor`的进程竟然占用着256G的磁盘空间，自己当初给manjaro的总空间都不足100G，kill后速度明显恢复了，

但是很快又卡了，再看，这个进程竟然又自己启动了，

去网上查了下资料，没有的到一个很好的结果，有一个说法说这是KDE桌面留下来的bug，但是一直没有给解决，会在你开机后疯狂的往磁盘里面写入，从而造成系统卡顿。

网上解决的方法挺多的，但我采取了最简单的一种，立刻停止并禁止启用，不知道禁止启用会不会在一些方面造成影响，有的话后续再补充。

    balooctl suspend  ## 立即停止
    balooctl disable  ## 禁止启用

### 5、mysql问题

![pic_19 mysql-problem]

mysql服务没有启动。

### 6、qq 安装后无法启动（deein-wine-tim）

`Manjaro-KDE`桌面安装`TIM/QQ`的时候经常出现无法启动，其主要原因是`deein-wine-tim`打包了Gnome桌面部分内容，因此在KDE桌面环境下需要安装相应的Gnome桌面设置环境

安装gnome-settings-daemon：`yay -S gnome-settings-daemon`

依次进入`system settings-->>autostar--->>add program`

选择文件目录输入`/usr/lib/gsd-xsettings`回车确定添加然后开启就可以了，如果没有`gsd-xsettings`就先重启一下就有了，然后再重启一下就可以打开了，第一次打开可能会提示更新wine，稍微等待一下就可以了

### 7、使用ping命令无法验证自己的socks代理是否正确启用

模型中不同协议的位置如下图：

<img src="images/manjaro_TCP&IP.gif" alt="pic_20 TCP/IP"  width=900px />

ping命令的作用范围不包括代理设计的协议层。

### 8、deb包的安装

有时候去获得的软件源的得到的包不是 manajro 可以直接安装的而是 `deb` 的 法一： 、、、、 我在使用本方法的时候没有成功 、、、、

    yay -S debtap   ## 安装第三方转换软件
    sudo debtap -u     ## 更新，这步无法解决，挂代理还是不挂都失败
    debtap package_name.deb  ## 对包进行转换
    sudo pacman -U packagename  ## 安装

![pic_21 debtap_error]

法二： 直接解压 deb 文件，然后再解压包到根目录下，或`/opt`下，快捷方式在正常快捷方式的`/usr/share/applications/`下，主要看包内部的结构。 后期实际使用情况有的可行，有的不行，涉及到一些系统的依赖吧估计。

### 9、pycharm 的快捷键问题

设置无法通过以往习惯的（ctrl+alt+s）呼出，估计有其他应用占用了这个快捷键，尝试去查找具体是哪一个占用了，目前没有找到，先改为`alt+s`将就用着吧。

这个比较麻烦，linux中的快捷键比较麻烦且不太统一，有的甚至没有给出明显的设置，比如ibus输入框架有自己的设置，而如果添加了ibus-pinyin，这个输入法也有自己的快捷键，比如切换简体繁体，但是并没有给出设置，文档也没有提及。但会与sublime的`ctrl+shift+f`全局搜索冲突，导致sublime的不生效。

### 11、启动器里找不到应用快捷方式

大多数快捷方式是在‘/usr/share/applications/’下，第三方解压安装的也会解压到这，如果找不到，复制其快捷方式到‘~/.local/share/applications/’即可

如果都没有可以去自己添加一个快捷方式文件放入这两个目录中的任意一个即可

### 12、大版本更新启动等待时间变为默认

更新时会默认强制把`boot/grub`里面的文件更新，建议不要随便删除替换，只能更新一次去更改一次`/boot/grub/grub.cfg`文件，而且是重启后更改。

### 13、Appimages 软件创建桌面图标

AppimagesLauncher可以自动将Appimages应用程序快捷方式添加到桌面环境的应用程序中启动器/菜单。

下载地址：<https://github.com/TheAssassin/AppimagesLauncher/releases>

### 14、无法连接到 Tor

开始直接使用的是本地的网络，但是无法进入，后切换使用代理后成功进入，再根据查找的资料，大概原因可能是所用的网络可能存在封锁。如果本地网络没法进入请使用代理。

### 15 、.run文件的运行

下载后检查有没有权限，没有的话为其添加权限`chmod 755 test.run`然后双击或者命令行`./test.run`运行

### 16、无意切换到终端模式

之前有在使用快捷键的时候摁错了导致进入了全命令行的终端模式，当时一点头绪都没有，只有强行关机重启。

今天在使用`ctrl + alt + f5`的时候进入了，就去查询了一下相关的：

    终端模式又称作命令行模式或者字符模式，默认情况下linux提供六个终端，使用组合键ctrl+alt+F1进入第一个终端，使用组合键ctrl+alt+F2进入第二个终端，其他终端的组合键以此类推.

    终端又叫做tty，linux定义了六个tty，分别从tty1到tty6，tty是teletype的简写。从tty1到tty6被称为虚拟终端，如果想要切换回桌面，只需要使用组合键ctrl+alt+F7即可。

    注意，如果系统设定默认启动的时候不启动图形界面，则tty7是不可用的。
    此时，若想从终端字符界面进入图形界面就需要使用命令startx 命令如下##
    startx '##'是一个提示符，表示当前登陆的用户是root用户，也就是超级用户
    \$ 也是一个提示符，表示当前登陆的用户是一个普通用户。
    超级用户拥有对系统的全部权限，可实现所有的功能。普通用户只有部分功能。这就是区别，看词就可以定义。

### 17、开机自动挂载 windows 分区

没有任何配置的话linux开机默认是不会挂载windows分区的，只有比如进入文件管理器点击相应的分区后才会挂载，并且只会在本次有效，重启后恢复默认，这就造成了例如上一次导入的windows分区内的歌曲，视频，文件等等都会显示文件不存在或者无法找到等情况。

可以设置开机自动挂载分区，比如在`/etc/fstab`里写入挂载配置。

### 18、Chrome 浏览器强制使用安全搜索模式

不清楚是自己使用的代理的问题还是说最近 google 在上次更新后加入了这项机制，在设置账户为中文的情况下会默认打开安全搜索模式且无法关闭（关闭保存退出后也会自动打开），解决方法是切换到其他语言如英语就可以关闭了。

跟使用的代理也有关系，有的代理会强制打开安全搜索模式且无法关闭

### 19、Chrome 更新后的 Reading List 取消

自上次无意更新Chrome后在标签栏的位置增加了一个新条目（功能）`Reading List`，功能感觉像是之前使用的插件onetab，在添加书签会多一个选择，在打开书签目录的时候由于最右边的位置被占用了，使用习惯就很别扭。

取消方法：地址栏输入：`chrome://flags/##read-later`,把default改为disabled后relaunch后即可

### 20、libcrypt.so.1 问题

进行了一次大更新，原来能使用的软件不同使用了,`libcrypt.so.1`包也找不着，通过安装`libcrypt.so.1`可以了，

如果有`libcrypt.so.1`,`libcrypt.so.1.1.0`文件，可直接制作一个软连接即可，`sudo  ln  -s  libcrypt.so.1 libcrypt.so.1.1.0`

### 21、zsh-autosuggestion 颜色变为白色

同样是更新后的问题，应该是更新到了zsh问题是配置了zsh-autosuggestion插件，根据历史命令自动提示出要补全的命令，要补全的为灰色。

但是现在全为白色，完全失去了效果。查了下本地的颜色配置没有问题，去修改zsh-autosuggestion插件底层的文件无效，在`.zshrc`中写入`OZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=yellow'`也无效。

最后看到是`zsh-syntax-highlighting`and`zsh-autosuggestions`叠加使用产生的bug，都更新到最新版本可解除这个问题

## Manjaro-Xfce

### 1、.Appimages文件无法打开

不知道是不是动了什么东西，导致最开始能打开的".Appimages"文件无法打开了，报错忘记截图了，大概意思是 linux 的 fuse 模块没有自动加载，

`sudo vim /etc/rc.moudules` 添加`modprobe fuse`

### 2、快捷方式

在一开始的时候win键盘可以正常使用，但是后来可能是更新了还是什么的，不起作用了，而且之前设置的`xfce4-terminal`下拉终端也不起作用了，去快捷方式里面找，直接不见之前的一些设置了，而且重置也和最开始配置的那会不一样，最后查询了终于补齐了，但是有新的问题，比如调用文件夹的是`WIN + E`，会先打开开始模块再打开文件夹，相当于是个bug吧，只能用右边的WIN键，但是不方便，只好改一个键。

而且有两个设置快捷键的地方，都去改动一下。删除不需要的，以免是全局的影响了其他软件的使用

![pic_22 Keyboard]

### 3、pycharm 中 md 文件预览乱码 & 一些中文字体的不正常(如门，画等)

方法来自<http://panqiincs.me/2019/06/05/after-installing-manjaro/>，应该大多数linux都可以用吧

    sudo pacman -S ttf-roboto noto-fonts ttf-dejavu
    ## 文泉驿
    sudo pacman -S wqy-bitmapfont wqy-microhei wqy-microhei-lite wqy-zenhei
    ## 思源字体
    sudo pacman -S noto-fonts-cjk adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts

创建文件`~/.config/fontconfig/fonts.conf`，加入下面的配置：

    <?xml
    <!DOCTYPE fontconfig SYSTEM "fonts.dtd">

    <fontconfig>

        <its:rules xmlns:its="http://www.w3.org/2005/11/its" version="1.0">
            <its:translateRule translate="no" selector="/fontconfig/*[not(self::description)]"/>
        </its:rules>

        <description>Manjaro Font Config</description>

        <!-- Font directory list -->
        <dir>/usr/share/fonts</dir>
        <dir>/usr/local/share/fonts</dir>
        <dir prefix="xdg">fonts</dir>
        <dir>~/.fonts</dir> <!-- this line will be removed in the future -->

        <!-- 自动微调 微调 抗锯齿 内嵌点阵字体 -->
        <match target="font">
            <edit name="autohint"> <bool>false</bool> </edit>
            <edit name="hinting"> <bool>true</bool> </edit>
            <edit name="antialias"> <bool>true</bool> </edit>
            <edit name="embeddedbitmap" mode="assign"> <bool>false</bool> </edit>
        </match>

        <!-- 英文默认字体使用 Roboto 和 Noto Serif ,终端使用 DejaVu Sans Mono. -->
        <match>
            <test qual="any" name="family">
                <string>serif</string>
            </test>
            <edit name="family" mode="prepend" binding="strong">
                <string>Noto Serif</string>
            </edit>
        </match>
        <match target="pattern">
            <test qual="any" name="family">
                <string>sans-serif</string>
            </test>
            <edit name="family" mode="prepend" binding="strong">
                <string>Roboto</string>
            </edit>
        </match>
        <match target="pattern">
            <test qual="any" name="family">
                <string>monospace</string>
            </test>
            <edit name="family" mode="prepend" binding="strong">
                <string>DejaVu Sans Mono</string>
            </edit>
        </match>

        <!-- 中文默认字体使用思源宋体,不使用 Noto Sans CJK SC 是因为这个字体会在特定情况下显示片假字. -->
        <match>
            <test name="lang" compare="contains">
                <string>zh</string>
            </test>
            <test name="family">
                <string>serif</string>
            </test>
            <edit name="family" mode="prepend">
                <string>Source Han Serif CN</string>
            </edit>
        </match>
        <match>
            <test name="lang" compare="contains">
                <string>zh</string>
            </test>
            <test name="family">
                <string>sans-serif</string>
            </test>
            <edit name="family" mode="prepend">
                <string>Source Han Sans CN</string>
            </edit>
        </match>
        <match>
            <test name="lang" compare="contains">
                <string>zh</string>
            </test>
            <test name="family">
                <string>monospace</string>
            </test>
            <edit name="family" mode="prepend">
                <string>Noto Sans Mono CJK SC</string>
            </edit>
        </match>

        <!-- 把Linux没有的中文字体映射到已有字体，这样当这些字体未安装时会有替代字体 -->
        <match target="pattern">
            <test qual="any" name="family">
                <string>SimHei</string>
            </test>
            <edit name="family" mode="assign" binding="same">
                <string>Source Han Sans CN</string>
            </edit>
        </match>
        <match target="pattern">
            <test qual="any" name="family">
                <string>SimSun</string>
            </test>
            <edit name="family" mode="assign" binding="same">
                <string>Source Han Serif CN</string>
            </edit>
        </match>
        <match target="pattern">
            <test qual="any" name="family">
                <string>SimSun-18030</string>
            </test>
            <edit name="family" mode="assign" binding="same">
                <string>Source Han Serif CN</string>
            </edit>
        </match>

        <!-- Load local system customization file -->
        <include ignore_missing="yes">conf.d</include>
        <!-- Font cache directory list -->
        <cachedir>/var/cache/fontconfig</cachedir>
        <cachedir prefix="xdg">fontconfig</cachedir>
        <!-- will be removed in the future -->
        <cachedir>~/.fontconfig</cachedir>

        <config>
            <!-- Rescan in every 30s when FcFontSetList is called -->
            <rescan> <int>30</int> </rescan>
        </config>

    </fontconfig>

### 4、fcitx-googlepinyin 也就是谷歌输入法打不出顿号

前一次在pycharm编辑的时候记得就出现了，但是自己当时只不过是当作是一些小问题，没准重启能够解决，但是今天在编辑markdown文本的时候，迫切的需要，但是已经明确切换到中文输入法状态下，点击回车键上的反斜杠`\`出来的还是反斜杆，一直查不出什么原因，无论是重启还是修改一些配置，最终在网上找到了解决方法。

使用中英文标点切换快捷键（ctrl+.）\[ 以前不知道这个快捷键\]

估计是在pycharm使用快捷方式时不小心给触碰到了导致的。

### 5、Qv2ray代理突然无法使用

以前在代理失效时会有类似的情况，但是在更换了手机上测试可以使用的代理，确定其端口没有被占用，使用的网络没有问题，其v2ray启动之后，还是无法使用代理。

最后想到自己在前一晚切换到Win环境下，而那Win的时间被自己修改过，回想起自己最初使用Linux时候由于没有配置时间导致其使用斗鱼无法使用，于是乎去修改了自己的时间，重启代理，问题就解决了。

windows更新或者linux更新使得原来设置的时间发生了变化导致本地代理的时间信息与代理服务器的不同而引发异常。

### 6、vim 进入后行不会根据屏幕自动换行，以及左侧目录栏显示异常

关闭重新进入 vim 即可，估计是插件为完全加载的原因

### 7、Failed to register AppImage in AppImageLauncherFS: could not open map file

起因是双击打开了一个 appimage 文件，在设备了设置了 appimagelauncher 管理，然后退出后通过命令行启动，可能就无法通过 appimagelauncher 管理了，但是文件又关联了 appimagelauncer，就冲突了，设备重启了下就解决了。

### 8、无故卡死

没有解决！！！

安装了某个软件自启动一段时间后导致卡死。不确定是系统升级了某个驱动、库、依赖不兼容或者硬件老化导致的

而且有的软件本应在状态栏的显示不显示，实际应用未退出。基于arch，一些软件没有兼容到，无法安装，或者是不方便安装。

(后续总结：如果是笔记本，可以考虑查看内存的使用是否耗尽)

  [pic_19 mysql-problem]: images/manjaro_mysql-problem.png
  [pic_21 debtap_error]: images/manjaro_debtap_error.png
  [pic_22 Keyboard]: images/manjaro_keyboard.png