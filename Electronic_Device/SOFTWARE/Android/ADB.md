### 问题：

在以前的版本，那会应该是安卓 8、9，只要开启了开发者模式，设置了允许 usb 调试，数据线连上手机和电脑后手机端会弹出一个确认连接。但是这次手机是安卓 11，连接上后没有这个弹窗，去查看连接情况也报权限异常，记录下解决方案。

`adb devices` 会输出当前连接的设备号。但是这次的结果是`4f8595f2     no permissions; see [http://developer.android.com/tools/device.html]`

从结果看发现了设备，但是提示没有权限。去尝试比如查看包等操作也是提示权限不足。

解决方案：

    1、`lsusb` 命令查看当前的 usb 使用情况，会出现一堆这样的结果`Bus 001 Device 060: ID 2a70:4ee7 OnePlus Technology (Shenzhen) Co., Ltd. ONEPLUS A3010 [OnePlus 3T] / A5010 [OnePlus 5T] / A6003 [OnePlus 6] (Charging + USB debugging modes)`，这是选出的自己的一加手机的信息，如果信息不明不确定是哪一个最简单的方法就是把掉输出一次插上输出一次找不同就可以了。选出里面的关键信息，比如这条里面的 `2a70:4ee7` 记下，然后继续下一步。

    2、`sudo vim /etc/udev/rules.d/51-android.rules` 命令编辑文件，写入`SUBSYSTEM=="usb", ATTR{idVendor}=="2a70", ATTR{idProduct}=="4ee7", MODE="0666", GROUP="plugdev"`，里面的 idVendor 和 idProduct 就分别对应第一步骤中提取信息的前后段。写入后保存关闭。

    3、`sudo adb kill-server` 关闭之前的服务

    4、`sudo adb start-server` 重新开启服务

    这时候再去连接手机就会恢复弹窗，后面也正常使用了。


### 简单使用
查看包名：`adb shell pm list packages`

卸载包：` `

强制卸载（可卸载自带应用）：`adb shell pm uninstall --user -0 com.google.android.googlequicksearchbox`


