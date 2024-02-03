# Fedora-KDE

不确定是 Fedora 的Linux内核的问题还是硬件的问题，有时候正常关机重启会弹出很多的异常提示，看了下都是说关于内核的但没有详细的说明。而且一弹就是几百上千条，每条最低五秒的显示。很影响使用体验。而且提示了异常对正常的使用是不受影响的。

## 显示的问题

在切换或打开窗口的时候，底部会有部分有明显色差，出现一个断层，在关闭所有窗口再打开即恢复正常。这是安装的 dock 工具 latte -dock 引起的，在不使用时正常应该被隐藏，但失效时只是其中的各种图标被隐藏了，父盒子却还在，且没有被完全隐藏。在 xfce 桌面的状态栏设置自动隐藏然后将终端设置为半透明并全屏（注意是全屏而不仅仅是最大化）能观察到这样的情况。

## `fcitx5`使用`rime`的问题

使用中文输入法的时候，上字有明显的延迟。

## 源的问题

安装 MEGA 后会往系统里添加一个源文件。这个源文件在正常使用 dnf 包管理器安装、更新的时候会优先调度这个源，但这个源好像需要代理而且对于安装几乎没有用。

在没有使用代理的时候会占用大量的时间去等待这个源响应，实际最后得不到响应，也就等到超出时间报异常再使用其他的源。可以进入`/etc/yum.repos.d`删除这个以`mega`开头的源。

在 debian 类中安装这个软件也会出现这个问题。

# Fedora-Gnome 问题

## 安装问题

安装时选择了自主分区，但是一直提示一个 “biosboot error”,就是要创建一个新的 `/boot/efi`分区，无法像其他系统一样通过挂载现有的分区就行。千万不要创建类型 "biosboot" 的分区，那样重启时会什么启动项都读取不到，而直接进入 bios 或者从 u 盘启动。

## grub2 问题

manjaro 的是 grub 管理，至少之前安装的是，安装的 fedora 是 grub2 管理，在前期是明确有两个系统的启动项的，但是后面因为 grub2 的分辨率问题更新了 grub2,回头发现 grub 文件夹没了，自然也就无法启动了，资料也都备份了，新系统使用了一天也没有发现什么不合适的地方，就没有作引导的修复。也不太确定问题是不是两个grub的冲突导致的，但是如果下次遇到两个不同版本 grub 的系统，还是最好资料备份及引导修复重建合并的准备吧。

## update-grub 命令

在`grub2`中不存在`update-grub`命令了，而`update-grub`实际也是二次包装的，`grub2-mkconfig -o /boot/grub2/grub.cfg`可实现相同的效果,更改grub2配置的文件也是`/etc/default/grub`

## 分辨率问题

启动页面选择引导的分辨率模糊，被放大了，字体模糊，文字行超出显示屏，大概确定是分辨的问题，但是后期因为被查找到的资料的误导及自己经验不足失败了很多次。

debug过程

    1、调小分辨率，既然有这种情况，那估计是默认的分辨率大于自己的显示器分辨率或者判断错了自己的分辨率导致分辨率不对，尝试指定GRUB_GFXMODE为自己的`1366x768`，无效

    2、自己的分辨率不被支持，某个 `grub` 资料说是一些分辨率不被支持，通过命令`vbeinfo` or `videoinfo`可以查看适配的分辨率。
    无赖只能进入`grub`命令行查看（非系统命令行），`grub2`不存在这些命令，查文档也没有看到说有替换的。那尝试改为普遍支持的`640x480`等等。无效。

    3、在grub.cfg的构建文件中做修改，即`/etc/grub.d/00_header`，也无效。

    4、尝试对grub.cfg 的分辨率的更改的所有操作都无效。
    一直没有去查看`grub.cfg`文件中的分辨率最初为什么，更改后为什么，或者有没有被修改，而是通过不断重启看有没有改变。
    `/etc/grub.d/00_header`文件中的构建过程是建立在一个判断结构下的。对比查看其与`/etc/default/grub`，又往这方面查。
    `/etc/default/grub`中`GRUB_TERMINAL_OUTPUT=console`是被注释着的，也就是模式是console，但是 gfx 相关的操作生效的前提是应该为`GRUB_TERMINAL_OUTPUT="gfxterm"`。

但应该是不同版本的grub的差异导致，在mint linux 和 debian linux 上不修改 GRUB_TERMINAL_OUTPUT 为 gfxterm 也可以修改分辨率

## Nautilus 文件管理排序，文件、文件夹变混合排序

个性化设置可以更改，包括要显示的内容，用户、创建时间，类型等等等等。

## sublime 3 主题异常

Gnome version : GNOME Shell 42.0

在换了系统后继续在就像使用原来的`sublime 3`时,在对Fedora系统设置了全局暗色主题的前提下，原本的暗色主题设置在标题栏无效。侧边栏和编辑区正常。尝试切换其他主题也是同样的结果。

sublime 4 使用正常，尝试将 sublime 4 的默认主题包替换过去也没效果。

查了一下可能是一些 gnome 的设置项参数在新版本调整导致的。

近期在vscode相同异常上看到vscode对标题栏有特有的设置，查看了；`sublime 3、4`的配置，`sublime 4`新增加了`"themed_title_bar": true,`,这个会对其有影响，而`sublime 3`没有类似的，可能也就无法通过简单设置去解决这个问题了。

## 状态栏不显示有后台运行的应用图标

Fedora 相对于 Ubuntu 桌面更简介，一些配置是没有的，可以通过添加 `gnome-extensions` 来扩充、补全自己的需求。

添加`AppIndicator and KStatusNotifierItem Support`插件可解决问题。

## vscode 标题栏白色（标题栏颜色不随主题更换变化）

打开设置，`Title Bar Style`,`native`更改为`custom`

## Chrome、Sbulime、Terminal 等软件崩溃、卡顿

在使用软件时界面常常崩溃，然后弹出提示页面无响应，有时候弹窗自动消失恢复，有时候整个软件崩溃，更有甚整个桌面系统崩溃，回到登陆界面。

主要是 Chrome 浏览器引起的次数居多，可能不是 chrome,查的时候看到较早的版本有人是使用 firefox 经常有类似的问题，可能是内存资源的占用、gpu 驱动方面的问题吧，暂时没解决。

后面进行了一次整体升级，这个问题就没出现了。

升级后的一些信息`Kernel: 6.0.15-200.fc36.x86_64`，`DE: GNOME 42.6`，崩溃没有出现过。但是偶尔的卡顿会有，短的时候几秒，长的十几秒。

崩溃还是有，在软件启动的时候有时候会。

(补充一个可能的原因，一般使用都有浏览器在使用，当时使用的笔记本，内存较小，而浏览器比较容易占用内存，内存满了造成问题)

## 窗口切换问题

使用默认的快捷键切换窗口的使用，同个应用开启的多个窗口会被认为是一个，切换到的是最新使用的。这并不是快捷键的问题，而是整个系统的设计。

## Terminal 窗口切换问题

图形化的终端开启单窗口后开多个项后然后全屏，不能使用鼠标进行切换。后面又能了，不知道为什么。

## 使用 zsh 后不读取原 bash 配置

可以理解为不同的应用，自然就不会引用对方的配置，不过可以在`.zshrc`中去主动引入`.bashrc`中的内容即可。

但是不推荐，修改不方便，很容易混淆。根配置文件（`/etc`下的文件）会不会影响没测试，但是不建议去改动这里的文件，实在需要的话做好备份。

## 环境变量不包含 `/home/<name>/.local/bin`

接上个问题，一开始我以为是zsh的问题，后面去看了下原bash的配置，好像系统是不默认将其纳入默认环境变量的，有个代码端专门去判断后添加，添加即可。

    if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
    then
        PATH="$HOME/.local/bin:$HOME/bin:$PATH"
    fi

## fcitx 输入法

默认的是`ibus`框架，直接进入输入法配置添加了`Intelligent Pinyin`，每次配置`fcitx`挺麻烦，这次使用发现挺好的。

虽然麻烦但是后面还是换成了`fcitx5`，但是不要卸载`ibus`，`ibus`是`gnome`内置的，可能会导致桌面系统崩溃。

换的原因是有时候会卡键，按一下后面连续输出该键的字母，敲击其他的键才会停下。

# Fedora-Xfce 问题

## kde-connect

直接尝试安装 `kde-connect` 有包但是安装之后能其他设备无法连接。

去仔细看了官方文档尝试安装，首先是补全依赖比较多，177个包，400多M，安装给出的方式是编译安装，但是环境中cmake一个库的文件版本不符合要求，给放弃了。

(在fedora-xfce 中安装成功但不能正常使用，而在mint-linux-xfce 中安装后是可以正常使用的)

## dnf 安装 使用 tab 补全提示报错

错误：

![dnf install error]

`sudo dnf install sqlite`之后即可

## 快捷键

xfce 的快捷键设置有两个地方，一个是设置里面，一个是窗口管理里面。

之前在设置里面想要设置切换到桌面的快捷键，没看到可设置的，可自己添加，但是不清楚命令。

通过查询成功在窗口管理里找到了。

或者可以在`~/.config/xfce4/xfconf/xfce-perchannel-xml/keyboards.xml`中去修改实现改变快捷键，有针对所有用户而非单用户的，有需要的自己查查。对于其他配置，也可以通过修改文件的形式完成，毕竟，linux中一切皆`文件`。

修改文件实现改配置在所有桌面都是可行的，只不过难易不同，例如gnome在新版本中一些配置会进行打包，不再是直接明文件。

## 空格键突然失效

在更改了`lightdm-gtk-greeter`的主题，背景图之后，重启系统空格键无效。

在再一次重启后还是失效，但是在多次尝试按触发之后恢复了正常。

## 设置桌面的壁纸一段时间后随机切换 导致锁屏背景的也变动了

复盘下来导致这个问题的操作是，在设置屏幕壁纸的时候点选了设置里面的一段时间自动切换壁纸，并且开启了随机。

原因：

桌面有四个工作空间，每个工作空间的桌面是可以单独设置的，他们的配置文件在`~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml`，里面工作空间的命令是从0开始的。

然后锁屏的设置是`workspace 0`的。

后面是不小心切换到了其他工作空间（开始设置了壁纸应用到所有工作空间，但是出现这个问题后取消了，但是一直以为自己在工作空间，切换到之后除非再切换回去，否则系统会保存状态，不管是重启，系统崩溃后重启都会保存）

所以那会即使考虑到了是设置里面的问题去取消了设置还是没有解决问题，因为问题是在工作空间0，直到查询到不通过设置而通过命令行修改的方式才找到了配置文件，看了配置文件才大致直到之前的问题所在。

里面有两行`<property name="backdrop-cycle-enable" type="bool" value="true"/>`，`<property name="backdrop-cycle-random-order" type="bool" value="true"/>`，自己的当前桌面没有随机切换壁纸了，值却还是true，自己去修改为了false，就没有问题了。

在考虑到是壁纸设置的问题前做了一个确认，也是还好习惯将自己的配置单独文件夹，去修改了自己的壁纸文件夹名，去看锁屏变成异常单色幕布，也就是说明调用了桌面壁纸而不是背景图。

## greeter theme 问题

默认的`lightdm-gtk`程序即主题不能删除，涉及到窗口主题，卸载了不会影响系统的运行，但是窗口设置的主题会失效。比如我卸载后暗色主题变成白色。

## lightDM greeter 和 lock greeter 的问题

这个问题需要参考上两个问题

`lightDM greeter`默认使用的`lightdm-gtk-greeter`。

而`lock greeter`使用的是另一个程序`xfce4-screensaver`管理的，使用的也是`lightdm-gtk-greeter`，并且是在源码中就写死的，

[xfce4-screensaver-dialog.ui]

中明确写了`class name="lightdm-gtk-greeter"/>`，应该是考虑到各个发行版自带的greeter的不同吧，Fedora自带的有`lightdm-gtk-greeter`和`slick-grrter`。

`xfce4-screensaver`的源码中没有看到`lightdm-gtk-greeter`的拷贝，所以是在计算机本地调用了`lightdm-gtk-greeter`的静态文件，但是比如背景图、用户头像是在配置中增加的，`xfce-screensaver`并不会加载配置，所以就出现了两个不同的greeter，而如果`lightDM`使用其他主题，这个问题就更明显。

`lightdm-gtk-greeter`的安装是编译的，所以如果不卸载然后自己修改源码再编译安装是无法解决两边背景图、用户头像不一样的。`xfce-screensaver`也是，并且没有提供接口去接受配置修改。

## 安装`p7zip`包后无法使用`7z`命令

在网上搜索到的解压`7z`压缩包的包是`p7zip`,安装后无法像后面说的使用`7z`解压，测试后发现正确的解压命令是`7za`

## vim 使用 vim-which-key 拓展行尾有空格问题

严格来说不是`vim-which-key`的问题。因为多个显示内容需要对齐，不足的就用空格填充。而我使用的另一个插件`vim-trailing-whitespace`默认会高亮显示行尾空格。所以就出现了视觉上的问题。

大概样子：

![view_error]

后续自己看能不能改改`vim-which-key`的填充代码，让尾部不是空格是一些像`|`容易忽视的字符。

## 系统卡死问题（网卡相关）

之前在使用 manjaro 的 xfce 版本的时候就有这个问题，那会是刚好对系统进行了大更新，以为是系统的驱动啊、某些环境啊改变了导致的，或者是长期的待机造成设备的老化（5年的笔记本，风扇不静音、时常高温等），

随后就换了基于 gnome 的 fedora 系统，后面又换到现在的 xfce 桌面的，那个问题又出现了，这个比较巧合，插上网卡后就卡死了，但是是外接usb网卡，还是接在拓展坞上，一度没反应，也怀疑是不是接口不灵敏了。最后彻底放弃使用这个网卡。

后面有时间了又去查了下，怀疑是不是驱动不匹配的问题。最后也没发现什么。但是突然想起来，这个网卡是自带驱动的。后面把网卡又给安上，先是该网卡的连接断开，然后一段时间后就会出现系统卡死的情况。目前把原因定在这上面，后面有其他设备了再验证一下。

后续拆开这个网卡发现里面的线路松动了，有个焊接点的线脱落了。造成短路什么的吧

## 中英文混写的对齐问题

在markdown文档中写表格时，想要分割号对齐，在vim中写是正常对齐的，在终端输出也是，但是用其他编辑器打开，比如JetBrains系列的IDE,sublime等等，甚至是在浏览器中都是不对齐的。

大概情况如下：

firefox: ![fireFox_view]

sublime: ![sublime_view]

终端输出： ![terminal_view]

vim： ![vim_view]

主要是中英文的设计不同导致的，全英常用字符、字母的长是相同的，中文的与其有差别，所以无法对齐。

通过安装然后切换至换合适的等宽字体可以解决这个问题。

sublime 添加设置`"font_face":"Sarasa Mono Slab SC"`更换字体。

通常比例是`中：英文 = 2：1`，但使用这种字体英文看起来会很费劲，建议只在特定的软件中使用.vim、终端不会受影响，是因为有个不明显的限制，当字符超出范围后会自动压缩，这也是为什么一些linux里面中文很怪异的原因（比如ubuntu）

目前测试过三款字体，大多数字体都是不能对齐的。

`sarasa(更纱黑体)`，部分能

`Sauce Code Pro`，nerd 和 SourceCodePro 的整合，不能

`InconsolataGo`，nerd 和 InconsolataGo 的整合，部分能，其他的inconsolata的也应该可以

## asyncomplete.vim 插件在 markdown 中使用 Tab 上屏失效

在其他类型文件，甚至包括没有明确指定文件类似的文件都可以使用`<PageUp> <PageDown>`来上下选择然后使用`<Tab>`键来确认上屏，但是在markdown文件中能选择，但是`<Tab>`后成回车调到下一行，并没有内容填充。

去找来一圈没有找到资料，去作者的github下留言没有得到回复，去尝试看了下源码也没理清楚。

其中一段代码的解释：

    function! asyncomplete#force_refresh() abort
        return asyncomplete#menu_selected() ? "\<c-y>\<c-r>=asyncomplete#_force_refresh()\<CR>" : "\<c-r>=asyncomplete#_force_refresh()\<CR>"
    endfunction

    function! asyncomplete#menu_selected() abort
        return pumvisible() && !empty(v:completed_item)
    endfunction

原理: 这段代码是Vim插件Asyncomplete的一部分，它提供了自动完成功能。

其中，第一个函数`asyncomplete#force_refresh()`用于强制刷新自动完成菜单，第二个函数`asyncomplete#menu_selected()`判断是否已经选择了某个自动完成项。

应用: 第一个函数`asyncomplete#force_refresh()`中，如果已经选择了某个自动完成项，则使用`Ctrl+y`,`Ctrl+r`快捷键来强制刷新菜单；否则使用`Ctrl+r`快捷键来强制刷新菜单。

第二个函数`asyncomplete#menu_selected()`用于判断是否已经选择了某个自动完成项，如果菜单可见并且已经选择了某个自动完成项，则返回真。

目前的解决方案是按照官方给的文档添加快捷键然后使用`<Ctrl> + n`，这个快捷键会直接将结果上屏并滚动直到关闭浮动窗口。

原因不清楚，可能这个快捷键才是插件的本意。

## rustdesk 安装失败

缺少依赖，先`sudo dnf install libxdo`安装依赖后在安装 rpm 包即可

## zip 文件解压失败

解压zip文件提示：`unsupported compression method 99`

windows和linux的加密算法不一致，原zip是在windows环境上设定密码压缩的。

在 windows 加密压缩时，选用 zip 传统加密。

  [xfce4-screensaver-dialog.ui]: https://gitlab.xfce.org/apps/xfce4-screensaver/-/blob/master/src/xfce4-screensaver-dialog.ui
  [view_error]: images/viewError.png
  [fireFox_view]: ./images/fireFox_view.png
  [sublime_view]: ./images/sublime_view.png
  [terminal_view]: ./images/terminal_view.png
  [vim_view]: ./images/vim_view.png
  [dnf install error]: images/dnfInstallError.png