# 简介

Firefox的优点：
1. 隐私保护：Firefox致力于用户隐私保护。它提供了丰富的隐私控制选项，例如强大的跟踪器屏蔽和隐私浏览模式。
2. 开放源代码：Firefox是一个开放源代码项目，这意味着任何人都可以查看和审查其代码，从而增加了透明度和安全性。
3. 扩展生态系统：Firefox拥有庞大的扩展生态系统，提供了各种功能强大的扩展插件，让用户根据自己的需求进行定制和扩展浏览器功能。
4. 定制性和灵活性：Firefox具有丰富的自定义选项和设置，允许用户根据个人喜好和需求进行个性化配置。

Firefox的不足：
1. 性能：相对于Chrome，一些用户认为Firefox在性能方面稍逊一筹，尤其在处理大量标签页或复杂网页时可能会感到较慢。
2. 兼容性：尽管Firefox在大多数网站上都能正常工作，但由于Chrome在市场份额上占据主导地位，少数网站可能会更注重Chrome的兼容性。


大多数的插件都能找到代替，但默认会开启较强的隐私保护，有的网站会进行强制拦截。

## 问题
在Linux系统上一些网站不能正常播放视频，比如 bilibili

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

    （安装完解码的工具后好像后面的设置项并非必要的，在新版本重启就可以了）

从网页复制到终端注意有没有被自动转义，转义后第一条命令无法成功。可以先执行 `rpm -E %fedora` 查看版本号，然后将 `$(rpm -E %fedora)` 替换为结果即可。

重启 firefox 还是没有插件项，可以选择重启系统试试。这样就可以正常的看视频了。
