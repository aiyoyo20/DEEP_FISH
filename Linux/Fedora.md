# OS : Fedora Linux 36 (Workstation Edition)
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

## 输入法

默认的是ibus框架，直接进入输入法配置添加了`Intelligent Pinyin `，每次配置 fcitx 挺麻烦，这次使用发现挺好的。

虽然麻烦但是后面还是换成了 fcitx5，但是不要卸载 ibus，ibus 是 gnome 内置的，可能会导致桌面系统崩溃。

换的原因是有时候会卡键，按一下后面连续输出该键的字母，敲击其他的键才会停下。

## 看图软件
### geeqie
还可以，但是系统的暗色主题不生效

### gwenview
还行，系统暗色主题下菜单栏会模糊化看不清字。

### gThumb
毕竟是 gnome 自己出的，主题适配很好，使用起来感觉也很棒。

## gnome-extensions

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

## 问题

### 安装问题

安装时选择了自主分区，但是一直提示一个 “biosboot error”，就是要创建一个新的`/boot/efi` 分区，无法像其他系统一样通过挂载现有的分区就行。千万不要创建类型biosboot的分区，那样重启时会什么启动项都读取不到，而直接进入bios或者从u盘启动。

### grub2 问题

manjaro的是grub管理，至少之前安装的是，安装的fedora是grub2管理，在前期是明确有两个系统的启动项的，但是后面因为grub2的分辨率问题更新了grub2,回头发现grub文件夹没了，自然也就无法启动了，资料也都备份了，新系统使用了一天也没有发现什么不合适的地方，就没有作引导的修复。也不太确定问题是不是两个grub的冲突导致的，但是如果下次遇到两个不同版本grub的系统，还是最好资料备份及引导修复重建合并的准备吧。

#### update-grub 命令

在 grub2 中不存在 update-grub 命令了，而 update-grub 实际也是二次包装的，`grub2-mkconfig -o /boot/grub2/grub.cfg`可实现相同的效果,更改 grub2 配置的文件还是`/etc/default/grub`

#### 分辨率问题

启动页面选择引导的分辨率模糊，被放大了，字体模糊，文字行超出显示屏，大概确定是分辨的问题，但是后期因为被查找到的资料的误导及自己经验不足失败了很多次。
过程
1、调小分辨率，既然有这种情况，那估计是默认的分辨率大于自己的显示器分辨率或者判断错了自己的分辨率导致分辨率不对，尝试指定GRUB\_GFXMODE为自己的`1366x768`，无效
2、自己的分辨率不被支持，某个 grub 资料说是一些分辨率不被支持，通过命令`vbeinfo` or `videoinfo`可以查看适配的分辨率。无赖进入 grub 命令行查看（非系统命令行），grub2 不存在这些命令，查文档也没有看到说有替换的。那尝试改为普遍支持的 `640x480`等等。无效。
3、在grub.cfg的构建文件中做修改，即`/etc/grub.d/00_header`，也无效。
4、尝试对grub.cfg 的分辨率的更改的所有操作都无效。一直没有去查看 grub.cfg 文件中的分辨率最初为什么，更改后为什么，或者有没有被修改，而是通过不断重启看有没有改变。想想简直哭死。`/etc/grub.d/00_header`文件中的构建过程是建立在一个判断结构下的。对比查看其与`/etc/default/grub`，又往这方面查。 ` /etc/default/grub`中`GRUB_TERMINAL_OUTPUT=console`是被注释着的，也就是模式是console，但是 gfx 相关的操作生效的前提是应该为`GRUB_TERMINAL_OUTPUT="gfxterm"`。

### Nautilus 文件管理排序，文件、文件夹变混合排序

个性化设置可以更改，包括要显示的内容，用户、创建时间，类型等等等等。

### sublime 3 主题异常

Gnome version : GNOME Shell 42.0

在换了系统后继续在就像使用原来的 sublime 3 时,在对 Fedora 系统设置了全局暗色主题的前提下，原本的暗色主题设置在标题栏无效。侧边栏和编辑区正常。尝试切换其他主题也是同样的结果。sublime 4 使用正常，尝试将 sublime 4 的默认主题包替换过去也没效果。查了一下可能是一些 gnome 的设置项参数在新版本调整导致的。

近期在vscode相同异常上看到vscode对标题栏有特有的设置，查看了；`sublime 3、4` 的配置，`sublime 4 `新增加了`"themed_title_bar": true,`,这个会对其有影响，而`sublime 3`没有类似的，可能也就无法通过简单设置去解决这个问题了。

### 状态栏不显示有后台运行的应用图标

Fedora 相对于 Ubuntu 桌面更简介，一些配置是没有的，可以通过添加 gnome-extensions 来扩充、补全自己的需求。

添加`AppIndicator and KStatusNotifierItem Support`插件可解决问题。

### vscode 标题栏白色（标题栏颜色不随主题更换变化）

打开设置，`Title Bar Style`,`native`更改为`custom`

### Chrome、Sbulime、Terminal 等软件崩溃、卡顿
在使用软件时界面常常崩溃，然后弹出提示页面无响应，有时候弹窗自动消失恢复，有时候整个软件崩溃，更有甚整个桌面系统崩溃，回到登陆界面。主要是 Chrome 浏览器引起的次数居多，可能不是 chrome,查的时候看到较早的版本有人是使用 firefox 经常有类似的问题，可能是内存资源的占用、gpu 驱动方面的问题吧，暂时没解决。

后面进行了一次整体升级，这个问题就没出现了。

升级后的一些信息`Kernel: 6.0.15-200.fc36.x86_64`，`DE: GNOME 42.6`，崩溃没有出现过。但是偶尔的卡顿会有，短的时候几秒，长的十几秒。

### 窗口切换问题
使用默认的快捷键切换窗口的使用，同个应用开启的多个窗口会被认为是一个，切换到的是最新使用的。这并不是快捷键的问题，而是整个系统的设计。

### Terminal 窗口切换问题
图形化的终端开启单窗口后开多个项后然后全屏，不能使用鼠标进行切换。
