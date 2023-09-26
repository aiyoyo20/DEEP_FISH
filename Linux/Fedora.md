## Fodora-KDE

## Fedora-Gnome

### OS : Fedora Linux 36 (Workstation Edition)
`cat /etc/os-release`

```
NAME="Fedora Linux"
VERSION="36 (Workstation Edition)"
ID=fedora
VERSION_ID=36
VERSION_CODENAME=""
PLATFORM_ID="platform:f36"
PRETTY_NAME="Fedora Linux 36 (Workstation Edition)"
ANSI_COLOR="0;38;2;60;110;180"
LOGO=fedora-logo-icon
CPE_NAME="cpe:/o:fedoraproject:fedora:36"
HOME_URL="https://fedoraproject.org/"
DOCUMENTATION_URL="https://docs.fedoraproject.org/en-US/fedora/f36/system-administrators-guide/"
SUPPORT_URL="https://ask.fedoraproject.org/"
BUG_REPORT_URL="https://bugzilla.redhat.com/"
REDHAT_BUGZILLA_PRODUCT="Fedora"
REDHAT_BUGZILLA_PRODUCT_VERSION=36
REDHAT_SUPPORT_PRODUCT="Fedora"
REDHAT_SUPPORT_PRODUCT_VERSION=36
PRIVACY_POLICY_URL="https://fedoraproject.org/wiki/Legal:PrivacyPolicy"
SUPPORT_END=2023-05-16
VARIANT="Workstation Edition"
VARIANT_ID=workstation
```

### 输入法

默认的是`ibus`框架，直接进入输入法配置添加了`Intelligent Pinyin `，每次配置 `fcitx` 挺麻烦，这次使用发现挺好的。

虽然麻烦但是后面还是换成了 `fcitx5`，但是不要卸载 `ibus`，`ibus` 是 `gnome` 内置的，可能会导致桌面系统崩溃。

换的原因是有时候会卡键，按一下后面连续输出该键的字母，敲击其他的键才会停下。

### 看图软件
#### geeqie
还可以，但是系统的暗色主题不生效

#### gwenview
还行，系统暗色主题下菜单栏会模糊化看不清字。

#### gThumb
毕竟是 gnome 自己出的，主题适配很好，使用起来感觉也很棒。

### gnome-extensions

#### Clipboard

Clipboard Indicator
设置更为丰富，但是感觉不是很需要这些设置
亮点是有个星标功能，可能对着重的进行标记，会将优先级提到最前
对于常用的或者可以作为临时备忘录之类的

Clipman
可以快速将复制的内容转为二维码。

Gnome Clipboard
问题：系统 suspend 后内容会消失

#### Proxy Switcher

在状态栏快速设置系统代理的切换，不必再一步步进入设置去开启关闭

在使用了三个月后还是决定换回 xfce 桌面，相对来说，fedora 的包管理要在个人主观上要比 ubuntu 好很多，系统也精简很多，但是系统启动慢跟 ubuntu 一样，虽然卡死、崩溃的问题在后期不多，但也很闹心，桌面的方式也别扭。干脆趁着配置不对给换了。


## Fodora-Xfce

### 使用更美观的 `greeter`
查看当前使用的桌面显示器：

    Debian/Ubuntu：`cat /etc/X11/default-display-manager`

    RedHat & Fedora：`cat /etc/sysconfig/desktop`

    OpenSuSe：`cat /etc/sysconfig/displaymanager`

xfce 默认的是 `LightDM` ，配置文件在 `/etc/lightdm`

`lightdm.conf` 是主配置文件，`greeter-session=slick-greeter`指定主题。

`slick-greeter`,`lightdm-gtk-greeter`则是主题。

主题中也可以修改配色主题（`ls /usr/share/themes` 查看拥有的主题配色），背景图，用户头像等。

一些参数例子：

```
theme-name=Adwaita-dark
icon-theme-name=Adwaita
background=/usr/share/backgrounds/2.jpg
```

查看有那些可用的 `greeter` ，`ls /usr/share/xgreeters`。也可以安装其他的。

### dnf 包管理的一个强力功能
在尝试安装 kde-connect 的过程中使用的安装命令是`sudo dnf install  builddep kde-connect`，想要去卸载。

`dnf history`：会输出包管理器执行过的详细命令，并且前面会带有序号。如果想要回滚某个操作，可以执行`dnf history undo  <number>`进行回滚。


### fcitx5 输入法框架

安裝

    sudo dnf install fcitx5 fcitx5-rime im-chooser

Fedora 沒有內置的工具`im-config`，但是可以安装使用类似的工具`im-chooser`。

[im-chooser](https://github.com/ksmail13/im-chooser) 安装后使用前有些步骤是必须的，不然会一直有异常，提示不支持当前桌面，开始时看的文章没有介绍，我还以为时工具太久没更新，跟不上gnome的升级造成的，后来去看了文档，做好准备工作后排除了异常。

[](https://fcitx-im.org/wiki/Setup_Fcitx_5#imsettings_.28Fedora.29)


修改默认为繁体的问题
查看默认的配置文件`cat ~/.local/share/fcitx5/rime/build/default.yaml`,


这里只选取了重要部分

    schema_list:
        - schema: luna_pinyin
        - schema: luna_pinyin_simp
        - schema: luna_pinyin_fluency
        - schema: bopomofo
        - schema: bopomofo_tw
        - schema: cangjie5
        - schema: stroke
        - schema: terra_pinyin

第一个便是默认的，第二个就是需要的简体，修改顺序就可以了，我对于其他的不是很需要，干脆把其他的直接给注释了。修改保存后重新加载配置文件就行了。

[fcitx5 wiki](https://wiki.archlinuxcn.org/wzh/index.php?title=Fcitx5)，里面有很详细的安装，配置介绍，以及在一些软件上的使用问题解决方案。

fcitx5 对 vim 支持的插件[fcitx.vim](https://github.com/lilydjwg/fcitx.vim)
