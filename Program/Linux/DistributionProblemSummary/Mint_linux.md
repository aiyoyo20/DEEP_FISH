## Mint-Linux-xfce

### 字体问题

和 ubuntu 同为 debian 系的。有的字体会变得紧凑、虚化。

ubuntu的是修改`/etc/fonts/conf.avail/64-language-selector-prefer.conf`文件中所有带`SC`内容的优先级为第一即可。

但不确定因为这次安装的桌面环境是xfce而不是gnome的原因，在相应的目录下并没有这个文件。

尝试`sudo apt install language-selector-common`安装完，文件就补全了，编辑后重启系统就可以了。

### 尝试使用 `amdgpu-install --usecase=workstation --vulkan=pro` （amdgpu-install已经下载安装好）重启后进入桌面白屏幕

目前使用的`AMD RX 560`应该是免驱的，但还是尝试了一下，在重启后能正常进入显示欢迎页面，但是输入密码进入后整个屏幕为白屏，不得以进入其他终端进行了卸载重启才恢复正常。

### 使用 /etc/fstab 文件设置开机自动挂载 ntfs 磁盘后，磁盘的内容只能读取，不能写入

在系统开机自动挂载的ntfs磁盘分区只能读取不能写入，包括修改名称和删除都不能.

开始认为是不是`/etc/fstab`文件的设置不完全，去详细阅读了该文件的配置，并且将所有的auto选项都改为强制的确保这个配置是支持写的，但是仍然没有。

查看目录及目录中的文件的系统、用户权限都是支持读写执行的，即chmod命令是不生效的。

使用`mount`命令不带参数可以查看挂载的磁盘、分区的情况，发现修改配置这个命令的输出中关于读写权限的内容都没有改变。

去查询了一些资料，最后得到的结果是因为双系统的影响

应该是系统挂载了这个磁盘，但是系统没有正确的关闭，比如突然的断电等使系统中断了，这个时候磁盘会出现这样的情况，详细的原因大概是挂载的NTFS分区中存放了未释放的缓存，所以导致只能读取。

解决方案是`sudo ntfsfix /dev/sdd2`命令去修复磁盘分区即可,`/dev/sdd2`是相应的分区名。

### sublime 的全局搜索快捷键 `CTRL + SHIFT + F` 不能使用及有时误将输入法切换为繁体无法切回

sublime的快捷键问题出现比较奇怪，有时候有，有时候没有，自己考虑过是不是快捷键冲突的问题，但是在关闭所有应用的情况下去看了系统的快捷键没有异样。输入法框架本身的设置很少也没有。

有时候会因为输入误触了不知名的组合键，中文输入法会变成繁体，今天去特意查了下发现是`CTRL + SHIFT + F`刚好和sublime的对上，也就是这个冲突了。这个时候使用的是`ibus-pinyin`。

这个快捷键并不是`ibus`的而是`ibus-pinyin`的，所以只有在切换为中文使用的使用在`sublime`中冲突就无法使用了，是英文则正常。查了一下，并没有明显、方便的方法去修改。现在改换使用`ibus-rime`了

### vim 设置了寄存器和系统剪切板同步，但是不会同步到copyq

### ibus 输入法

ibus 输入法是支持状态记忆功能的，即每个窗口能记忆在被切换前的输入法状态，比如在窗口1是使用中文，切换到窗口2并且切换输入法为英文，然后再切换到窗口1，这时想要使用中文输入法并不需要去切换，之前的状态已经被记忆了，切换回来时已经自动切换了。

ibus 在xfce的图形化配置界面看到的配置很少

ibus添加输入法后在图形化配置中看到的顺序是固定的，正常来说应该是可调整了。但因为ibus配置界面的简化并没有显示出来，可以通过安装`sudo apt install dconf-editor`去查看和修改配置,但是及时修改了并且生效了在ibus的图形化界面看依旧是原样的，所以不必纠结。

### 双/多系统中Windows引导被删除
A盘先安装了一个Linux系统A，然后安装了Windows系统，这两个系统不在同一个盘，但是由于先安装的Linux，EFI分区在Linux所在的盘，安装Windows选择将Efi写入了这个分区，然后安装了Linux系统B且使用了新的efi分区，后来A不适用就给全盘格式了，连带着把Windows的引导文件全没了

使用微PE制作启动盘，然后进入PE，里面有个引导恢复工具，打开后选择Windows系统文件所在的盘和希望引导文件恢复至的盘，完成重启即可

### 先安装Linux后安装Windows默认从Windows启动而不是GRUB
windows下有相应的工具，bios中也可以修改顺序，但这两种有时候看软件和设备，有时候不成功。

linux下使用efibootmgr先查看有哪些启动项

```txt
BootCurrent: 0006
Timeout: 1 seconds
BootOrder: 0006,0000,0007,0008,000A,000B,000C
Boot0000* Windows Boot Manager
Boot0002* Hard Drive
Boot0006* ubuntu
Boot0008* Hard Drive
Boot000A* UEFI OS
Boot000C* Windows Boot Manager
```

`0000 0002 0006`为启动项编号。启动项编号可能因系统而异。确保仔细观察列表以确定要更改顺序的启动项的编号。

`efibootmgr -o N1,N2,N3,...`将想要的启动顺序设置即可

### 系统删除后启动项仍然在如何删除
启动项保存在EFI分区的，只要相应的分区在，即使系统文件被删除仍然能看到启动项但是已经不能正常进入。

在linux系统下比较好的方法是使用efibootmgr工具查看有哪些启动项，确定哪些是多余的并且记下启动项编号，使用命令`efibootmgr -b N -B`删除即可，N为启动项编号。有同名的可以去依次尝试哪个是可以进入的，efibootmgr的结果中会显示哪个是当前系统的启动项这样就可以排除出重名但无用的了。

### 安装了多次windows，导致进入windows让选择，如何删除多余的选项
要删除多余的 Windows 启动选项，你可以使用系统自带的 `msconfig` 工具来进行操作。以下是在 Windows 中删除多余的启动选项的步骤：

1. 打开“运行”对话框。可以通过按下 Win + R 键组合来快速打开它。

2. 在运行对话框中，输入 `msconfig` 并按下回车键。这将打开系统配置工具。

3. 在系统配置窗口中，切换到“引导”选项卡。

4. 在“引导”选项卡中，你将看到所有可用的启动选项列表。确保仔细观察列表，确认要删除的多余启动选项。

5. 选中要删除的启动选项，然后点击“删除”按钮。你可以选择多个启动选项进行删除。

6. 点击“应用”或“确定”按钮，保存更改并关闭系统配置工具。

7. 重启计算机，系统将不再显示已删除的多余启动选项。

### Ventoy安装windows时提示 “缺少介质驱动程序”
1.添加物理硬盘的时候，有几种虚拟磁盘类型可以选择，IDE/SCSI/SATA/NVME 等
2.安装Ventoy的磁盘本身的问题，尝试换个磁盘

不过都没有去尝试，后面直接使用微PE了

### AMD RX 560 显卡在linux系统开机风扇就是满速，无法调节

在尝试了所有的软件后并且切换至windows下尝试确认不是系统及软件的问题。

拆解显卡发现连接风扇的是2pin线，按资料这种是不支持调节风扇速度调节的，即只传输电流而无数据。看显卡预留了4pin接口吗，尝试更换风扇应该能解决

### xfce-terminal 内容的回滚限制
在长时间使用没有使用新的tab和窗口，往回查看以前的命令的结果会发现能看的结果是有限的。这是因为这些内容是暂存在内存中的，因此软件对显示的行有限制

除了使用图形窗口去关闭限制外也可以直接更改`~/.config/xfce/terminal/terminalrc`文件中的`ScrollingUnlimited=TRUE`或者`ScrollingLines=10`的值

[xfce-terminal-preferences](./images/xfce-terminal-preferences.png)

### 制作的微PE不能正确安装windows的镜像。提示windows源文件不存在或不合法

最开始是使用的esd类型的文件，但是后面使用了正确的iso类型也是一样的。由于是新制作的PE盘，而且在另一台设备上刚用于恢复EFI启动项并且成功就没怀疑到PE上，后来格式化盘并重新制作了PE发现可以了。

### dd 命令制作的启动盘无法正常启动

同样是因为之前的PE安装WINDOWS没有成功，就尝试直接制作启动盘，启动后没有相应的UEFI启动项，重复试了几次都是这样，更换了Linux的镜像，也是一样，最后在windows中使用刻录软件发现在刻录到一半的时候报错停止了。但是这个时候去看启动盘，大概文件是有的，主要是启动文件，甚至是大小也差不多，估计dd命令出现了类似的情况，未刻录完全但是没有报提示，导致误以为完整了。

### 罗技的接收器配对失败

使用的是 Unifying Software 软件进行配对，有两个接收器，这个软件在最初都都能为其接收器和所有的设备配对，后来不知怎么的，有个接收器会出现断连的情况，后来直接连接不上了。

配对的时候，插入usb接收器，设备有响应，设备管理器能看到相应的驱动，并且内容和另一个能用的接收器一样，但是在使用软件的时候，软件识别不到这个接收器，非这个设备的接口、系统、驱动问题。

最后是使用软件Logitech Connection Utility能正常识别并配对，现在又能正常使用了。

看更新时间，Logitech Connection Utility停止更新很久了，应该是旧款的接收器使用的。

### kde-connect android不能自动同步剪切板到其他设备
这是因为安卓版本的限制，在android10以后的版本对这块的权限进行了调整，可以通过一些其他方法去开启，目前在android11上测试可用。

```sh
adb -d shell pm grant org.kde.kdeconnect_tp android.permission.READ_LOGS
adb -d shell appops set org.kde.kdeconnect_tp SYSTEM_ALERT_WINDOW allow
adb -d shell am force-stop org.kde.kdeconnect_tp  # 这部会关闭应用，重启后就正常使用了
```

通过adb使用上面的三条命令后就能无障碍同步了，而且应用重启，系统重启都不影响

### 不知名原因在系统启动看到主板的log后没有正常进入grub启动页面，而是灰屏，按一下ESC才显示

### apt 安装的telegrm不是最新版本
不仅不是最新版本而且还是很旧的，需要新版本可以通过其他方式安装，比如snap，但目前源的速度很慢，通过二进制包的方式安装的话又不方便更新

### 浏览器插件 Onetab 的 BUG
1. 正常情况下，右键弹出的菜单里面有关于Onetab选项只有一项，但出异常后有多项且只有一项起效。而且每次关闭浏览器再重开都会对一项，直至到达一定的数量。

2. 在数量过多的情况下，原来已经有了1900多条链接，再增加100多条进入，导致插件卡死，一直在转圈加载，重启也不行。不停重启了几次后有次正常，才赶紧导出保存，但没有最新的100多条。后面再重启还是不停加载。猜测可能是不支持如此多的数据，超出负载了。

### virtualenvwrapper 的问题
在安装时提示过这个异常，但是`pip list`看到相应的包了就没有在意。后来在使用时发现每次初始化都提示。大概意思是其`stevedore`包引发的异常，找不到具体的异常信息了。大致的原因是`virtualenvwrapper`的依赖包中这个包系统自带了，但是版本较低，而使用`apt` 更新由于这个是python的包，所有没有更新，就导致了这个情况，去单独更新这个包就可以了（建议升级前查看清楚这个包的版本信息，如果更新后出现兼容问题，其他的软件或者系统不能使用了还可以通过终端降级补救回来）

### shell 的一些问题记录
1. shell 变量的作用域，没有通过`local`命令指定的变量是全局变量、在其他函数内部可以访问到

2. shell 的通配符在不同命令有不同的表现，有的可以被引号包裹有的不可以

### ibus 输入法框架的问题
在xfce桌面的图形界面可配置的内容很少，包括调整输入法的顺序。安装了rime和其中一个英文输入法，无论添加的顺序如何都是rime在前，然后通过下载dconf-editor修改了配置，使得英文在前。但是有时在重启后会变回之前的。

由于需要在vim上确保进入命令模式后，输入法是英文的。自己在vim的配置中添加了一些代码用于这个功能，但是实际的情况不是很好，在编辑模式使用中文输入法键入后再次输入会切换为英文，暂时没有解决这个问题，所以暂时停用了 ibus。

### fcitx5 安装rime后不能使用中文输入法
之前就是因为这个问题而去使用ibus的，兜兜转转又回来了。在命令行或者是图形化的状态栏显式的都是切换到了rime，但是输出的是英文的，最后因为之前使用的就是ibus-rime，配置的内容都还在，rime的配置是相对独立的，就直接把那个配置复制过来，最后发现居然正常使用了。

### fcitx5 在 qmplay2 软件中不能使用中文输入法
软件是使用QT5开发的，打包形式的AppImage包。

1:认为环境变量的问题，因为确实是需要配置一些环境变量以让输入法在gtk或者qt的软件上能正常使用，但是在检查一遍配置后没有发现异常.

2:认为是相应的包的缺失的问题，类似于两者之间的中间件，去检查了一下，也没有发现异常

通过命令`fcitx5-diagnose`查看，有报错但都是不影响使用的。

最后排查出是因为软件在打包时没有加入支持中文的包。解决方式是解压相应的AppImage包，然后将相应的包创建软连接到解包后的目录`squashfs-root/usr/plugins/platforminputcontexts/`，再打包即可

相应的包在`/usr/lib/x86_64-linux-gnu/qt5/plugins/platforminputcontexts/libfcitx5platforminputcontextplugin.so`，如果缺失这个包可以找找再下载到这个目录

不直接复制到相应的目录，而是通过软连接的方式复制，具体的原因不知，但我在尝试的时候直接复制文件后不能正常打包，而软连接可以

### AppImage 打包工具 appimagetool 报错
报错信息 `execv error: No such file or directory`

最开始下载的是从`https://appimage.github.io/appimagetool/`给的下载链接，这个链接跳转到`https://github.com/AppImage/appimagetool/releases`，这个不能使用，`https://github.com/AppImage/AppImageKit/releases`下载的可以正常使用

### mega 的 chrome 插件加载内容很慢
使用了这个插件，加载消耗的资源减少了，内存占用大幅减小。但是在后期再其他网页测试代理的速度都很快，但是这个插件的加载很慢。停止使用这个插件后再访问相应的分享链接则很快打开了。应该是`SwitchyOmega`设置了自动代理导致这个插件直接走了没有代理的那条线

## 其他

`fcitx`修改`luna\_pinyin.custom.yaml`可以对全半角符号进行修改且有效，但是在换到`fcitx5`后就无效了，建议先去看`user.yaml`文件的内容

比如内容为:

    var:
      last_build_time: 1655690864
      previously_selected_schema: luna_pinyin_simp
      schema_access_time:
        luna_pinyin_simp: 1647270274

则文件名为 `luna_pinyin_simp.custom.yaml`

### adb 没有权限

在以前的版本，那会应该是安卓 8、9，只要开启了开发者模式，设置了允许 usb 调试，数据线连上手机和电脑后手机端会弹出一个确认连接。但是这次手机是安卓 11，连接上后没有这个弹窗，去查看连接情况也报权限异常，记录下解决方案。

`adb devices` 会输出当前连接的设备号。但是这次的结果是`4f8595f2     no permissions; see [http://developer.android.com/tools/device.html]`

从结果看发现了设备，但是提示没有权限。去尝试比如查看包等操作也是提示权限不足。

解决方案：

    1、`lsusb` 命令查看当前的 usb 使用情况，会出现一堆这样的结果`Bus 001 Device 060: ID 2a70:4ee7 OnePlus Technology (Shenzhen) Co., Ltd. ONEPLUS A3010 [OnePlus 3T] / A5010 [OnePlus 5T] / A6003 [OnePlus 6] (Charging + USB debugging modes)`，这是选出的自己的一加手机的信息，如果信息不明不确定是哪一个最简单的方法就是把掉输出一次插上输出一次找不同就可以了。选出里面的关键信息，比如这条里面的 `2a70:4ee7` 记下，然后继续下一步。

    2、`sudo vim /etc/udev/rules.d/51-android.rules` 命令编辑文件，写入`SUBSYSTEM=="usb", ATTR{idVendor}=="2a70", ATTR{idProduct}=="4ee7", MODE="0666", GROUP="plugdev"`，里面的 idVendor 和 idProduct 就分别对应第一步骤中提取信息的前后段。写入后保存关闭。

    3、`sudo adb kill-server` 关闭之前的服务

    4、`sudo adb start-server` 重新开启服务

    这时候再去连接手机就会恢复弹窗，后面也正常使用了。

### 双（多）系统启动项修复

一般推荐的是先安装linux 系统再安装win系统，这样一般不会出现启动项被 win 强占的后果，因为win的启动项只支持自身的系统，不会检测启动其他启动项，回导致明明安装了多个系统，但是启动总是进入win。

也有的启动项因为启动项本事设置的问题，硬件的兼容问题，有时也会启动项失效，安装deepin时有这种情况出现过，ubuntu、mnajaro、kali都正常。

或者电脑维修、清灰等时启动盘未完全归位的开机也会导致启动项重置。并且这种情况是在bios中也找不到其他系统的启动项的。

在确定磁盘内的各文件都还在的情况下可通过软件DiskGenius的工具-`设置UEFI-BIOS启动项`，点击添加找到相应目录下的文件即可，然后调整linux的为第一位。如果安装混乱也可以通过这个工具删除多余的启动项。


### charles的多网卡问题
在同时连接有线、无线、以及启动了docker会有一个虚拟网口，这些网口都会被使用，但是在给手机配置的时候得到的不是想要的那个，导致安装认证文件失败，目前没有好的办法，只有去禁用其他的网口，确定只有一个网口的情况下才能正常

### ssh 连接失败
提示：`no matching host key type found. Their offer: ssh-rsa`

可使用`ssh -oHostKeyAlgorithms=+ssh-rsa`来解决，实际测试`ssh -o HostKeyAlgorithms=+ssh-rsa`也可以，`-o`用于指定ssh的配置，连写也能识别，但在其他的shell命令中不一定，建议还是分开写更好

或在`~/.ssh/config`中加入`HostKeyAlgorithms +ssh-rsa`，`HostKeyAlgorithms=+ssh-rsa`也可以

如果执行指定特定的 ip、域名这样使用，则如添加下面这样添加：

```txt
Host [ipaddress]
    HostKeyAlgorithms=+ssh-rsa
```

## 添加的源无效

添加源的命令为：`echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null`

去查看文件`/etc/apt/sources.list.d/docker.list`的内容为：

`deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu victoria stable`

格式上也没有什么不对。

然后去查看其他的源的格式：`deb [signed-by=/etc/apt/keyrings/hluk-copyq-jammy.gpg] https://ppa.launchpadcontent.net/hluk/copyq/ubuntu jammy main`

前部分有差异但问题不大。后部分的 `victoria` 和 `jammy` 不一样。

尝试将 `victoria` 修改为 `jammy` 再次更新发现正常了。

去访问 `https://download.docker.com/linux/ubuntu` 进入 `dists` 页面发现有:

`artful/`,
`bionic/`,
`cosmic/`,
`disco/`,
`eoan/`,
`focal/`,
`groovy/`,
`hirsute/`,
`impish/`,
`jammy/`,
`kinetic/`,
`lunar/`,
`mantic/`,
`trusty/`,
`xenial/`,
`yakkety/`,
`zesty/`,

这么多版本，但是就是没有 `victoria` 这个版本。

回想起来自己在使用 mint 的过程中并没有换源，但是使用的体验却非常好。而使用 ubuntu 或者 debian 的时候都是需要换源的。查看`/etc/apt/sources.list`的内容为空。应该是在很大程度上使用了 MINT 自己的源。

`VERSION_CODENAME`变量的特殊含义在于，它提供了一个统一的方式来获取操作系统版本的代号。因此这是 mint 的版本代号。而不是 ubuntu 的版本代号。

完整的`/etc/os-release`文件如下 :

```sh
NAME="Linux Mint"
VERSION="21.2 (Victoria)"
ID=linuxmint
ID_LIKE="ubuntu debian"
PRETTY_NAME="Linux Mint 21.2"
VERSION_ID="21.2"
HOME_URL="https://www.linuxmint.com/"
SUPPORT_URL="https://forums.linuxmint.com/"
BUG_REPORT_URL="http://linuxmint-troubleshooting-guide.readthedocs.io/en/latest/"
PRIVACY_POLICY_URL="https://www.linuxmint.com/"
VERSION_CODENAME=victoria
UBUNTU_CODENAME=jammy
```

可以看到有另一个：`UBUNTU_CODENAME` 的变量的值为 `jammy`。之前的代码应该是在 ubuntu 的环境下运行的。而当前环境下是在 mint 的环境下运行的。若想添加ubuntu的源应该获取的是ubuntu的版本代号。即`UBUNTU_CODENAME`的值。

## sublime 4 无故卡死
具体原因尚不清楚。在打字的时候突然就卡死了、也不会说整个软件崩溃后闪退，就一直卡着不懂，鼠标、键盘都没反应。

这在一定程度上还是有影响，如果之前没有保存，那部分的内容在重启软件后就丢失了。

## 设置了代理变量 `ALL_PROXY` 但是 wget 依旧报错

详解在 [代理变量详解](../Shell/Syntax/代理变量详解.md)