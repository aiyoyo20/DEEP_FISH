## ibus
大多数的发行版内置了这个框架，只要安装相应的输入法配置、重启即可使用。

以Mint-linux为例

`sudo apt install im-config ibus ibus-rime ibus-gtk ibus-gtk3 -y`

`im-config`:输入法框架选择工具

`ibus`:输入法框架本体

`ibus-rime`:输入法，支持拼音，简体和繁体

`ibus-gtk` `ibus-gtk3`:缺少这两个包可能在一些应用中无法正常使用输入法。

TODO：

  ibus在xfce桌面上的配置内容较少没有介绍
  配置rime和英文输入法的时候，无法调整顺序，通过dconfig可以调整，但需要注意的要先关闭ibus服务，不然修改后会被自动重载
  ibus-rime通过图形化窗口修改竖行显示为横行显示无效，可以通过修改配置文件解决
  ibus设置输入法不全局共享，窗口拥有单独的守护进程