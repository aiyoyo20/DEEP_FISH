官方的包管理器并没有 fcitx 相关的包，能不能自己编译安装没有测试。由于该版本的桌面环境是 gnome，内置了ibus框架，在安装使用较其他的要复杂一些。

### 安裝

    sudo dnf install fcitx5 fcitx5 im-chooser

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
