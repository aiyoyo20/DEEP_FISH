## fcitx

TODO：
fcitx在mint-linux上的安装配置
以及fcitx5的安装配置

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