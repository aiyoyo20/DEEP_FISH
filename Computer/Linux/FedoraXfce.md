### 问题
#### dnf 安装 使用 tab 补全提示报错

错误：

![dnf install error](images/dnfInstallError.png)

`sudo dnf install sqlite`之后即可

#### 快捷键
xfce 的快捷键设置有两个地方，一个是设置里面，一个是窗口管理里面。

之前在设置里面想要设置切换到桌面的快捷键，没看到可设置的，可自己添加，但是不清楚命令。

通过查询成功在窗口管理里找到了。

或者可以在`~/.config/xfce4/xfconf/xfce-perchannel-xml/keyboards.xml`中去修改实现改变快捷键，有针对所有用户而非单用户的，有需要的自己查查。对于其他配置，也可以通过修改文件的形式完成，毕竟，linux 中一切皆`文件`。

修改文件实现改配置在所有桌面都是可行的，只不过难易不同，例如 gnome 在新版本中一些配置会进行打包，不再是直接明文件。
