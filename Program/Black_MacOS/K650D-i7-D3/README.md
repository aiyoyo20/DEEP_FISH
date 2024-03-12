`hackintosh-hasee-k650d-i7-d3` 是来自 <https://github.com/s1973/hackintosh-hasee-k650d-i7-d3>,说的是支持`10.15 Catalina`，但是提到的文章太久了无效了。就没怎么尝试。但好处是提供了 `Clover` 和 `OpenCore` 两种方式的。都可以尝试下。

`EFI_20200820_120303.zip`来自 <https://bbs.pcbeta.com/viewthread-1867877-1-1.html>。仅有 `OpenCore` 一种。`Big Sur基本完美EFI 兼容10.15.6`。自己在 `macOS Catalina 10.15.6(19G2021)` 上正常安装。但是需要修改一些内容。修改配置中`ScanPolicy`的值修改为`0`。这样启动才有安装选项。修改`prev-lang:kbd` 的值让在安装的时候为中文而不是俄文。

[EFI1](./EFI1)：是`EFI_20200820_120303.zip`修改了语言、修改`ScanPolicy`后的内容。

[EFI1](./EFI2)：是`EFI1` 更新了`Kexts`目录下的驱动的内容，并针对网卡`intel Dual Band Wireless-AC 3160`添加了驱动`AirportItlwm.kext`。