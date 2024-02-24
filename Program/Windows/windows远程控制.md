## 如何开启 windows 的远程控制

家庭版系统默认没有远程。

在其他版本默认是不开启远程控制的。打开方式在 `设置` > `系统` > `远程桌面` 中。点击 `启用远程桌面`的按钮打开即可。这是最新版本 win10 的打开方式，旧版本可能会有差异。

### 启用网络发现

在设置界面有一个浅灰色的`使我的电脑在专用网络上可被发现，以支持从远程设备进行自动连接`。需要开启该功能可以点击右边的`显示设置`会进入`控制面板 > 网络和Internet > 网络和共享中心 > 高级共享设置`。选择`启用网络发现`并点击`保存更改`。打开这个功能局域网内的设备连接会更方便。

## 当有用户连接这台设备时会锁屏

这是设计的原因。为了保证安全，只允许一个用户登录。当连接是时就相当于与登录了这台设备。原用户就会退出。而在被控设备上表现出来就是锁屏。

同样因为这个原因，当有一个新连接接入时旧的连接会被断开。

## 如何连接

协议说明：Windows 的远程连接使用的协议是 `RDP` 协议，全称 `Remote Desktop Protocol`。

### Windows 连接 Windows

参考：<https://learn.microsoft.com/zh-cn/windows-server/remote/remote-desktop-services/clients/windows>

Windows 连接使用的是`Windows远程桌面连接的命令行工具`，全称`Microsoft Terminal Services Client`。它是Windows操作系统提供的远程桌面连接客户端程序。

要使用可以`WIN + R` 后输入`mstsc`打开。也可以搜索`远程桌面连接`后选择使用。

打开后会先要求输入用户的 IP，如果是绑定了域名的话也可以输入域名。然后在弹出的界面输入用户名、密码。对的话就会接入远程桌面。

### android 连接 Windows

参考：<https://learn.microsoft.com/zh-cn/windows-server/remote/remote-desktop-services/clients/remote-desktop-android>

android 连接使用的是 `Microsoft Remote Desktop` App。在谷歌商店可以下载。

在软件中点击右上角的 `+` 按钮,弹出的界面选择 `Add PC`。如果连接的是局域网内的设备。这时候会弹出 `PC Detection`，这里面有扫描到的设备，选择再输入用户名、密码即可连接。还可以点击其中的`Scan again`按钮刷新扫描结果。都没有的话再点击`ADD MANUALLY`按钮进行正常添加。如果局域网中没有会直接进入正常添加的界面。输入相应的信息即可连接。

这里提到的 `PC Detection` 就是用来扫描局域网内的设备的。这个功能 windows 默认不允许被扫描。只有之前的`启动网络发现`功能打开才能被扫描到。

连接成功后会保存连接信息。下次直接点击就可以连接（服务端用户、密码没有改变的话）。

### Linux 连接 Windows

在 Ubuntu 系统中： `sudo apt install -y remmina remmina-plugin-rdp`。

然后使用图形化的软件 `remmina` 连接。

### 其他

从网络连接：<https://learn.microsoft.com/zh-cn/windows-server/remote/remote-desktop-services/clients/remote-desktop-web-client>

从 Macos 连接: <https://learn.microsoft.com/zh-cn/windows-server/remote/remote-desktop-services/clients/remote-desktop-mac>

从 iPhone 和 iPad 连接: <https://learn.microsoft.com/zh-cn/windows-server/remote/remote-desktop-services/clients/remote-desktop-ios>