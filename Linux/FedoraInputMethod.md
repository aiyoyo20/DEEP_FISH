# OS : Fedora Linux 36 (Workstation Edition)
`cat /etc/os-release`

```
NAME="Fedora Linux"
VERSION="36 (Workstation Edition)"
ID=fedora
VERSION_ID=36
VERSION_CODENAME=""
PLATFORM_ID="platform:f36"
PRETTY_NAME="Fedora Linux 36 (Workstation Edition)"
ANSI_COLOR="0;38;2;60;110;180"
LOGO=fedora-logo-icon
CPE_NAME="cpe:/o:fedoraproject:fedora:36"
HOME_URL="https://fedoraproject.org/"
DOCUMENTATION_URL="https://docs.fedoraproject.org/en-US/fedora/f36/system-administrators-guide/"
SUPPORT_URL="https://ask.fedoraproject.org/"
BUG_REPORT_URL="https://bugzilla.redhat.com/"
REDHAT_BUGZILLA_PRODUCT="Fedora"
REDHAT_BUGZILLA_PRODUCT_VERSION=36
REDHAT_SUPPORT_PRODUCT="Fedora"
REDHAT_SUPPORT_PRODUCT_VERSION=36
PRIVACY_POLICY_URL="https://fedoraproject.org/wiki/Legal:PrivacyPolicy"
SUPPORT_END=2023-05-16
VARIANT="Workstation Edition"
VARIANT_ID=workstation
```


官方的包管理器并没有 fcitx 相关的包，能不能自己编译安装没有测试。由于该版本的桌面环境是 gnome，内置了 ibus 框架，在安装使用较其他的要复杂一些。

### 安裝

    sudo dnf install fcitx5 fcitx5-rime im-chooser

Fedora 沒有內置的工具`im-config`，但是可以安装使用类似的工具`im-chooser`。

[im-chooser](https://github.com/ksmail13/im-chooser) 安装后使用前有些步骤是必须的，不然会一直有异常，提示不支持当前桌面，开始时看的文章没有介绍，我还以为时工具太久没更新，跟不上gnome的升级造成的，后来去看了文档，做好准备工作后排除了异常。

[](https://fcitx-im.org/wiki/Setup_Fcitx_5#imsettings_.28Fedora.29)


### 修改默认为繁体的问题
查看默认的配置文件`cat ~/.local/share/fcitx5/rime/build/default.yaml`,


这里只选取了重要部分

    schema_list:
        - schema: luna_pinyin
        - schema: luna_pinyin_simp
        - schema: luna_pinyin_fluency
        - schema: bopomofo
        - schema: bopomofo_tw
        - schema: cangjie5
        - schema: stroke
        - schema: terra_pinyin

第一个便是默认的，第二个就是需要的简体，修改顺序就可以了，我对于其他的不是很需要，干脆把其他的直接给注释了。修改保存后重新加载配置文件就行了。

[fcitx5 wiki](https://wiki.archlinuxcn.org/wzh/index.php?title=Fcitx5)，里面有很详细的安装，配置介绍，以及在一些软件上的使用问题解决方案。

fcitx5 对 vim 支持的插件[fcitx.vim](https://github.com/lilydjwg/fcitx.vim)
