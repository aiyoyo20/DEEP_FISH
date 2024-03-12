# ubuntu-Gnome

## Failed to load module "xapp-gtk3-module"

Installing xapp installs the missing modules and removes the warning

`sudo apt install xapp`

## 某个命令平时能正常使用，加sudo或者进入root用户显示命令未找到

以node，npm为例，自己下载了包解压到/opt并且在当前用户`.bashrc`文件配置了环境变量，所以能使用，但是在root用户的环境下却是没有的，为其创建软链接（使用绝对路径）到`/usr/local/bin`,或者`/usr/bin`即可,建议前者吧，不用了要删除也方便分辨些

## AppImage文件无法正常启动

通过命令行`./appname`启动,发现是缺少相应的库，补全即可`sudo apt install libfuse2`

## 提示configure: error: glib-compile-schemas not found

`apt-get install libglib2.0-dev`

## 提示configure: error: Your intltool is too old. You need intltool 0.40.4 or later

`apt install intltool`

## ubuntu 字体异常

系统使用全英文时，默认字体Noto Sans CJK优先显示日文汉字，打开文件`/etc/fonts/conf.avail/64-language-selector-prefer.conf`将SC的优先级提到最高后重启电脑即可。

## ln 命令错误 Too many levels of symbolic links

原因在于生成软连接是没有写完整的路径，所以只要写绝对路径就行了

## 安装 python 后，使用`python`使用的不是系统的版本

`/bin` ,`/usr/bin`,`usr/local/bin`中的软链接指向的都是系统版本

因为在`.bashrc`或`.zshrc`中设置了环境变量，优先级覆盖了

## 安装libevent报错：configure: error: openssl is a must but can not be found. 

有 openssl 的情况下安装 `openssl-devel` 即可
