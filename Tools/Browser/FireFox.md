之前习惯使用 chrome，不少谷歌的工具使用非常方便。

这次使用了 firefox，启动感觉更快，安全方面也更注重，不少网站的访问会进行强制限制。

插件也基本都有可替换的版本。


### 问题
在一些网站不能正常播放视频，比如 bilibili

尝试清除缓存、重启应用、重启电脑、切换 user-agent、切换至私人默认用纯净的环境打开还是一样。

最后去查看了请求日志。有个信息：`媒体资源 blob:https://www.bilibili.com/e42b2a22-0095-4ff6-8c9f-9b776a7dff14 未能解码，错误：Error Code: NS_ERROR_DOM_MEDIA_FATAL_ERR (0x806e0005)`，再根据这个查到了为 firefox 安装解码器的方法。

方法来自 : [Linux 版 Firefox 上的视频接收问题](https://help.webex.com/zh-cn/article/WBX9000032830/Linux-%E7%89%88-Firefox-%E4%B8%8A%E7%9A%84%E8%A7%86%E9%A2%91%E6%8E%A5%E6%94%B6%E9%97%AE%E9%A2%98)

Ubuntu

    打开 Ubuntu 上的终端应用程序。
    依次运行以下命令。出现提示时，请输入您的密码，然后按照终端中的说明完成安装程序：
        sudo apt-get update
        sudo apt-get install ubuntu-restricted-extras
    重新启动 Firefox。
    单击浏览器窗口右上角的菜单图标 。
    单击加载项。
    单击左侧面板中的插件。
    找到 Cisco Systems, Inc. 提供的 Open H264 视频编解码器，确保其已安装、启用并始终处于激活状态

Fedora

    打开 Fedora 上的终端应用程序。
    依次运行以下命令。出现提示时，请输入您的密码，然后按照终端中的说明完成安装程序：
        sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
        sudo dnf install ffmpeg-libs
        sudo dnf config-manager --set-enabled fedora-cisco-openh264
        sudo dnf install gstreamer1-plugin-openh264 mozilla-openh264
    重新启动 Fedora。
    打开 Firefox。
    单击浏览器窗口右上角的菜单图标 。
    单击加载项。
    单击左侧面板中的插件。
    找到 Cisco Systems, Inc. 提供的 Open H264 视频编解码器，确保其已安装、启用并始终处于激活状态

从网页复制到终端注意有没有被自动转义，转义后第一条命令无法成功。可以先执行 `rpm -E %fedora` 查看版本号，然后将 `$(rpm -E %fedora)` 替换为结果即可。

重启 firefox 还是没有插件项，可以选择重启系统试试。这样就可以正常的看视频了。
