mx_linux 虽然是基于 debian 的，但是和同样基于 debian 的 ubuntu 有很大的不同，适用于 ubuntu 的 deb 包在 mx_linux 不一定能正常安装，包的打包方式会有不同。

1. mx_linux 的环境中并没有 python2，当安装的软件需要 python2 作为依赖的时候，即使通过 `sudo apt install python2` 安装后不行，找到安装的 python2，设置相应的软连接 python-->python2 也无效。解决的方法是安装 `python-is-python2`

2. 默认的输入法框架并不是默认的 ibus，这点和其他的 linux 不同，这也导致了如果没有将输入法框架切换至 ibus 而仅仅是配置（比如添加拼音），生效的依旧是原来的输入法。选择输入法框架的工具是 `im-config`，该工具没有默认安装，需要自己安装并启用。

3. 启用 `ibus` 添加拼音后在终端能正常使用拼音，但是在 firefox 、sublime 等软件中拼音无法正常使用，键入的只是字母。解决方法是安装 `ibus-gtk ibus-gtk3` 后登出当前用户或重启后就可以正常使用了。

4. 显卡问题：没有为 AMD 显卡安装驱动显卡也能正常驱动，但是在尝试为其安装驱动的时候提示警告：
```
W: Possible missing firmware /lib/firmware/amdgpu/raven_gpu_info.bin for module amdgpu
W: Possible missing firmware /lib/firmware/amdgpu/raven_rlc.bin for module amdgpu
W: Possible missing firmware /lib/firmware/amdgpu/raven_mec2.bin for module amdgpu
W: Possible missing firmware /lib/firmware/amdgpu/raven_mec.bin for module amdgpu
W: Possible missing firmware /lib/firmware/amdgpu/raven_me.bin for module amdgpu
W: Possible missing firmware /lib/firmware/amdgpu/raven_pfp.bin for module amdgpu
W: Possible missing firmware /lib/firmware/amdgpu/raven_ce.bin for module amdgpu
W: Possible missing firmware /lib/firmware/amdgpu/raven_sdma.bin for module amdgpu
W: Possible missing firmware /lib/firmware/amdgpu/raven_vcn.bin for module amdgpu
```

查询得知这只是警告而不是错误或异常，完全可以忽略他，对实际的使用没有影响。

5. 在 mx_linux 上安装 fcitx 有些问题，需要安装 fcitx-dbus-status 等其他附加包，但是在补齐之后能正常使用。
6. fcitx5 目前没有完全配置好，不能使用。


由于未能配置好 fcitx5 又不想使用 fcitx ,主要是其实原来安装是为了安装 搜狗输入法，有了 rime后就不用了，但是配置麻烦一些，现在觉得 rime 的那些功能也不是很需要，只要能单纯的使用 拼音 就可以了，而 ibus 的拼音已经基本够用，在任何版本都不用太折腾
