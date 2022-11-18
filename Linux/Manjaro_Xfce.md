[Manjaro_KDE](Manjaro_KDE.md)的大多数内容都是可以应用到这上面来的。

之前的 manajaro-kde 为18版本，当时分区`/boot/efi`并没有出错，但是在这次的 manjaro-xfce-20.1 如此分区时安装到后期报错，大概看后解释说是因为先安装有 win10,win10已经存在一个`/boot/efi`分区，因此造成冲突，将win10的分区挂载但是保持不格式化，然后分区`/boot`就可以了。
美化什么的就不要有太多期望了，可操作性很小，但是其本身虽然是很轻巧的，但是从同图标到整体风格都刚刚好，没有任何粗糙的感觉。安装的东西过程大多相同，但也有些差异。
代理的全局设置一直是一个很头疼的问题，以前在 ubuntu 没有解决，在 manjaro-kde 前期也一直在寻找合适的方法，后面在系统里面有设置全局代理解决了，但这个因为是轻量级所以没有了。

## 软件
```
yay -S geeqie # 开源看图软件
yay -S ark # 解压缩，自带的 engrampa 解压速度快但是解压的类型很少
```

之前配置过zsh，为了方便留了文件，直接本地安装吧
[https://github.com/ohmyzsh/ohmyzsh](https://github.com/ohmyzsh/ohmyzsh)下载oh-my-zsh:

```
cp oh-my-zsh/ ~/.oh--my-zsh
cp oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
```

插件：
[autojump:](https://github.com/wting/autojump)
[zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
[zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

#### qbittorrent 
能添加trackers的磁力下载器

#### liferea
rss 阅读器，重要的是可以配置代理，这样就可以添加一些墙外的源了。

## 问题
### 1、.Appimages文件无法打开
不知道是不是动了什么东西，导致最开始能打开的 .Appimages 文件无法打开了，报错忘记截图了，大概意思是 linux 的 fuse 模块没有自动加载，

```
sudo vim /etc/rc.moudules
添加 modprobe fuse
```

### 2、快捷方式
在一开始的时候 win 键盘可以正常使用，但是后来可能是更新了还是什么的，不起作用了，而且之前设置的 xfce4-terminal 下拉终端也 不起作用了，去快捷方式里面找，直接不见之前的一些设置了，而且重置也和最开始配置的那会不一样，最后查询了终于补齐了，但是有新的问题，比如调用文件夹的是`WIN + E` ，会先打开开始模块再打开文件夹，相当于是个bug吧，只能用右边的 WIN 键，但是不方便，只好改一个键。

而且有两个设置快捷键的地方，都去改动一下。删除不需要的，以免是全局的影响了其他软件的使用
![pic_22 Keyboard](images/manjaro_keyboard.png)

### 3、pycharm  中 md 文件预览乱码 & 一些中文字体的不正常(如门，画等)
方法来自[http://panqiincs.me/2019/06/05/after-installing-manjaro/](http://panqiincs.me/2019/06/05/after-installing-manjaro/)，应该大多数linux都可以用吧

```
sudo pacman -S ttf-roboto noto-fonts ttf-dejavu
# 文泉驿
sudo pacman -S wqy-bitmapfont wqy-microhei wqy-microhei-lite wqy-zenhei
# 思源字体
sudo pacman -S noto-fonts-cjk adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts
```

创建文件~/.config/fontconfig/fonts.conf，加入下面的配置：
```
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
```

### 4、fcitx-googlepinyin 也就是谷歌输入法打不出顿号

前一次在 pycharm 编辑的时候记得就出现了，但是自己当时只不过是当作是一些小问题，没准重启能够解决，但是今天在编辑markdown文本的时候，迫切的需要，但是已经明确切换到中文输入法状态下，点击回车键上的反斜杠“\”，出来的还是反斜杆，一直查不出什么原因，无论是重启还是修改一些配置，最终在网上找到了解决方法。

使用中英文标点切换快捷键（ctrl+.）[ 以前不知道这个快捷键]

估计是在pycharm使用快捷方式时不小心给触碰到了导致的。

### 5、Qv2ray代理突然无法使用

以前在代理失效时会有类似的情况，但是在更换了手机上测试可以使用的代理，确定其端口没有被占用，使用的网络没有问题，其 v2ray 启动成功 等等等等之后，还是无法使用代理。

最后想到自己在前一晚切换到 Win 环境下，而那时 Win 的时间被自己修改过，回想起自己最初使用 Linux 时候由于没有配置时间导致其使用斗鱼无法使用，于是乎去修改了自己的时间，重启代理，问题就解决了。

### 6、vim进入后行不会根据屏幕自动换行，以及左侧目录栏显示异常
关闭重新进入vim即可，估计是插件为完全加载的原因


### 7、Failed to register AppImage in AppImageLauncherFS: could not open map file
起因是双击打开了一个appimage文件，在设备了设置了appimagelauncher管理，然后退出后通过命令行启动，可能就无法通过appimagelauncher管理了，但是文件又关联了appimagelauncer，就冲突了，设备重启了下就解决了。

### 8、无故卡死
没有解决！！！
安装了某个软件自启动一段时间后导致卡死？ 
系统不断的升级某个驱动、库、依赖不兼容导致卡死？
硬件老化导致的问题？

而且有的软件本应在状态栏的显示不显示，实际应用未退出。
基于 arch，一些软件没有兼容到，无法安装，或者是不方便安装。
为了更好的开发，暂时换了系统。
