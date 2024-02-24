# 安装教程

1. powershell 执行`dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart` 执行完会提示重启，确认并重启。有的第一步是进控制面板以图形化的方式去启用适用于 Linux 的 Windows 子系统。都是一样的结果，方式不一样而已。

2. 执行`wsl --install`，如果提示`无法解析服务器的名称和地址`则需要更新wsl。不用像网上说的那样修改host。`https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi` 下载并安装。这步比较奇怪。在有的机器上更新后再执行`wsl --install` 就正常了。有的需要重启。

3. `wsl --set-default-version 2` 将 wsl 版本设置为 wsl2。如果不需要,可以不执行这一行。

额外补充：

WSL（Windows Subsystem for Linux）和 WSL 2 都是 Windows 操作系统中的功能，用于在 Windows 上运行 Linux 环境。WSL 2 是 WSL 的下一代版本，相比于 WSL，它具有以下几个主要优点：

	1. 更高的性能：WSL 2 使用了全新的虚拟机技术，使用真正的 Linux 内核（Hyper-V 虚拟机）来运行 Linux 发行版。这种架构改变使得 WSL 2 的性能显著提高，特别是在文件系统 I/O 和网络性能方面。

	2. 原生的系统调用兼容性：WSL 2 的 Linux 内核与传统的 Linux 系统内核更加接近，因此可以更好地支持原生的 Linux 系统调用和内核功能。这意味着在 WSL 2 中更多的 Linux 应用程序可以无需修改地运行。

	3. 更好的文件系统兼容性：WSL 2 使用虚拟硬盘（VHD）来管理文件系统，这使得 Windows 和 Linux 之间的文件共享更加高效和可靠。同时，WSL 2 支持与 Windows 文件系统的直接集成，可以访问 Windows 文件系统中的文件，并可以在 Linux 和 Windows 之间进行文件传输。

	4. 支持 Docker：WSL 2 可以直接与 Docker 集成，可以在 WSL 2 中运行 Docker 容器，而无需额外安装 Docker Desktop。这为开发人员提供了更方便的方式来在本地进行容器化应用程序的开发和测试。

	5. 更好的兼容性和更新机制：WSL 2 通过使用虚拟机来运行 Linux 内核，使得 Linux 发行版的安装和更新更加灵活。可以通过在 Microsoft Store 中安装和管理 Linux 发行版，同时可以从官方渠道直接获取 Linux 内核的更新。

4. 打开 Microsoft Store，并选择相应的 Linux 发行版。如果卸载了微软商店或者原来就没有微软商店可以直接去下载相应的版本包。下载链接在`https://learn.microsoft.com/zh-cn/windows/wsl/install-manual#step-3---enable-virtual-machine-feature` 的后半部分。

下载的包为 `<distro>.appx` 格式。然后执行`Add-AppxPackage .\app_name.appx` 即可安装。安装后的会和普通应用一样有快捷方式，正常启动即可。

这里记录下自己的安装经验。

通过微软商店安装的 ubuntu22.04打开正常，但是安装软件依赖报错。安装`g++`各种依赖版本不对。在 20.04 就是正常的。

通过 `Add-AppxPackage` 安装的 ubuntu22.04 提示错误。具体的不记得了，大概好像是硬件问题。20.04 正常。但是启动管理是 SysV，设置了开机自启动无效。上一种的安装方式没有测试。最后通过其他的方式实现的应用的开机自启动。具体看后续说明。

5. 安装后第一次启动会提示设置用户名和密码。设置后就正常进入了。后续再启动也不同设置密码。默认安装的是没有桌面的。需要桌面还需要额外安装和设置。


## 安装的 ubuntu 20.04 设置开机自启无效
安装完系统后安装了 nginx，但是设置的开机自启无效。这里先说明一下这个开机自启是重启windows后再进入 ubuntu。打开 ubuntu 再关闭该窗口实际应该是缩小化窗口而没有停止相应的服务。

正常的 Ubuntu 使用 的 init 的是 systemd。但是使用 systemctl 提示本机的 init 是 sysvinit。通过命令 `ps -p 1 -o comm=`查看的结果也是 sysvinit。

而使用 `update-rc.d`命令设置开机自启无效，在 `/etc/init.d/`下有 nginx ，并且给赋予了权限。可以启动、停止、重启。

最后是通过新建一个 `bat`脚本来设置开机自启。并且写入命令`wsl -u root service nginx start`,这个命令不会打开ubuntu终端，但是结果会传递进去，也就实现了。并且不用输入密码，因为 windows 的管理权限是更高的。需要注意的是这样启动的默认的发行版，需要指定其他的发行版。代码要适当调整。


## 安装的 linux 提示网络问题

删除重装可解决这个问题。

## 额外补充

1. 某些主板的 bios 中虚拟化默认是关闭的。要使用 WSL 需要打开。打开方式不同品牌、不同型号的主板是不一样的。

2. WSL2 是基于 `hyper-v` 的，如果系统是家庭版，则没有 `hyper-v` ，win10、win11都没有。在选择开启的选项里没有显示 `hyper-v`，但能不能使用像 `dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart`这样的方式去打开隐藏的内容没有尝试。查到的资料说这个可以。

安装脚本：
```
pushd "%~dp0"
dir /b %SystemRoot%\servicing\Packages\*Hyper-V*.mum >hyper-v.txt
for /f %%i in ('findstr /i . hyper-v.txt 2^>nul') do dism /online /norestart /add-package:"%SystemRoot%\servicing\Packages\%%i"
del hyper-v.txt
Dism /online /enable-feature /featurename:Microsoft-Hyper-V-All /LimitAccess /ALL
```

3. 安装了 `hyper-v`，再使用 VM 会冲突。将 `hyper-v` 禁用后可以正常使用 VM。