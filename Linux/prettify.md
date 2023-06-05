### Bootloader

#### grub Legacy
`grub-install --version` 查看版本，实际有`grub-install`命令便是 grub Legacy

配置文件在`/etc/default/grub`

配置例子：

```
GRUB_TIMEOUT=360
GRUB_DISTRIBUTOR="$(sed 's, release .*$,,g' /etc/system-release)"
GRUB_DEFAULT=saved
GRUB_DISABLE_SUBMENU=true
GRUB_TERMINAL_OUTPUT="gfxterm"
GRUB_CMDLINE_LINUX="rhgb quiet"
GRUB_DISABLE_RECOVERY="true"
GRUB_ENABLE_BLSCFG=true
GRUB_FONT=/boot/grub2/fonts/unicode.pf2
GRUB_THEME="/usr/share/grub/themes/tela/theme.txt"
GRUB_GFXMODE=1366x768,auto
```

`GRUB_TIMEOUT`是等待时间，默认的等待时间是 5 秒，没有选择超时后会进入上一次选择的程序。
`GRUB_TERMINAL_OUTPUT`，设置为`gfxterm` gfx 相关的操作才会生效，即更改分辨率才有效。
`GRUB_FONT=/boot/grub2/fonts/unicode.pf2`，主题字体
`GRUB_THEME="/usr/share/grub/themes/tela/theme.txt"` 主题
`GRUB_GFXMODE=1366x768,auto` 分辨率，界面小于或大于便是分辨率的问题

也有通过修改`/boot/grub/grub.cfg`进行配置的介绍，但是不推荐，严格来说这才是启动时调用的配置。但是因为是全配置，内容较多，修改不方便，而且如果修改出错会很麻烦。

修改配置`/etc/default/grub`后需使用命令`sudo update-grub`将配置文件更新到`/boot/grub/grub.cfg`

#### grub2
查看版本`grub2-install --version`

配置差不多，虽然增加了新功能，但是保留了很多原来的内容。

一些命令发生了改变。

grub2 中不存在 update-grub 命令了，而 update-grub 实际也是二次包装的，`grub2-mkconfig -o /boot/grub2/grub.cfg`可实现相同的效果

### Desktop Display Manager
#### 查看当前使用的桌面显示器

    Debian/Ubuntu：`cat /etc/X11/default-display-manager`

    RedHat & Fedora：`cat /etc/sysconfig/desktop`

    OpenSuSe：`cat /etc/sysconfig/displaymanager`

#### lightDM greeter
在`Fedora-Xfce`中查看已经有的`greeter`，：`ls /usr/share/xgreeters`,去掉`.desktop`便是主题名。

也可安装其他的`greeter`主题。

可以修改配置`/etc/lightdm/lightdm.conf`，也可以在`/etc/lightdm/lightdm.conf.d`下新建`greeter.conf`文件进行配置，更推荐后者吧。

例子：

```
[Seat:*]
greeter-session=lightdm-gtk-greeter
```

详细的配置建议在详细的 greeter 主题配置里更改，因为不同的主题有的配置有区别，错误的配置名不会引发异常，但是已有配置给了错误的值，可能导致 greeter 无法显示，那时也是可以补救的。通过`Alt + F2-F6`切换终端去修正配置即可。

详细的配置如`/etc/lightdm/lightdm-gtk-greeter.conf`配置。

```
[greeter]
user-background = false
theme-name = Adwaita-dark
icon-theme-name = Adwaita
background = /usr/share/backgrounds/2.jpg
default-user-image = /usr/share/backgrounds/kuiba.jpg
position = 50%,center 50%,end
```

`theme-name`、`icon-theme`的值可以是系统的主题。可以`ls /usr/share/themes/`查看。

### Desktop Environments
主要的为 KDE、Gnome、Xfce。

KDE 的配置比较齐全，几乎都可以通过图形化界面进行配置。

Gnome 则需要添加拓展实现。

Xfce 能实现的较少。
