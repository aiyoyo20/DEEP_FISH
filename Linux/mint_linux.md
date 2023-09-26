### 字体问题：

和 ubuntu 同为 debian 系的。有的字体会变得紧凑、虚化。

ubuntu 的是修改 `/etc/fonts/conf.avail/64-language-selector-prefer.conf` 文件中所有带 SC 内容的优先级为第一即可。但不确定因为这次安装的桌面环境是 xfce 而不是 gnome 的原因，在相应的目录下并没有这个文件。

尝试 `sudo apt install language-selector-common ` 安装完，文件就补全了，编辑后重启系统就可以了。


### 尝试使用 `amdgpu-install --usecase=workstation --vulkan=pro` （amdgpu-install已经下载安装好）重启后进入桌面白屏幕
目前使用的 AMD RX 460 应该是免驱的，单色还是尝试了一下，在重启后能正常进入显示欢迎页面，但是输入密码进入后整个屏幕为白屏，不得以进入其他终端进行了卸载重启才恢复正常。