# vim
## 插件
### 1、插件管理器vim-plug
`curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim` 

### 2、.vimrc文件内容

## 快捷键设置
[模式映射](images/vim_mapping.png)
使用`h key-notation`命令查看帮助信息,查看键盘符号的详细说明

|notation   | meaning         |equivalent| decimal |value(s)    ~           |        |
|-----------|-----------------|----------|---------|--------------          |----|
|\<Nul\>     | zero            |CTRL-@    |0        |  (stored as 10) *<Nul>*|        |
|\<BS\>      | backspace       |CTRL-H    |8        |  *backspace*           |        |
|\<Tab\>     | tab             |CTRL-I    |9        |  *tab* *Tab*           |        |
|           |                 |*linefeed*|         |                        |        |
|\<NL\>      | linefeed        |CTRL-J    |10       |  (used for <Nul>)      |        |
|\<CR\>      | carriage return |CTRL-M    |13       |  *carriage-return*     |        |
|\<Return\>  | same as <CR>    |          |         |  *<Return>*            |        |
|\<Enter\>   | same as <CR>    |          |         |  *<Enter>*             |        |
|\<Esc\>     | escape          |CTRL-[    |27       |   *escape* *<Esc>*     |        |
|\<Space\>   | space           |          |32       |   *space*              |        |
|\<lt\>      | less-than       |\<         |60       |   *<lt>*               |        |
|\<Bslash\>  | backslash       |\\         |92       |  *backslash* *<Bslash>*|        |
|\<Bar\>     | vertical bar    |    \\     |         |124                     | *<Bar>*|
|\<Del\>     | delete          |          |127      |                        |        |


使用 :map 命令，可以列出所有键盘映射
使用:map!命令，则只列出插入和命令行模式的映射。而:imap，:vmap，:omap，:nmap命令则只是列出相应模式下的映射


### YouCompleteMe 配置
安装 YouCompleteMe 插件后打开报错。`The ycmd server SHUT DOWN (restart with ':YcmRestartServer'). YCM...YCM before using it. Follow the instructions in the documentation.`
执行`cd ~/.vim/plugged/YouCompleteMe/ && ./install.py` 全部显示 ok 再重启即可

上面的方法有时还是会有问题，`cd ~/.vim/plugged/YouCompleteMe/ & python3 install.py` 即可 
()[https://www.jb51.net/article/172382.htm]

### markdown-preview.nvim 问题
原来的 markdown-preview.vim 插件在文件较大时会导致 vim 卡死。
安装插件后 `cd ~/.vim/plugged/markdown-preview.nvim/app & yarn install` yarn没有的需要安装

### 内容显示异常
vim 打开文件有时内容排序混乱，行内容中部有横穿的直线，
可视化目录及标题栏异常等问题可以先尝试退出重新载入，有时候时插件未加载完全或者配置内容加载错误导致的。
在文本中有一个键"\<Del>",被错误的识别造成后面的内容全被增加了删除线。


## SpaceVim
自己在配置的时候由于每个插件都需要单独单独添加、配置、调整，且插件多后管理混乱，就想找一个具有模块化功能的开箱即用的。经过一番查找后找着了spacevim，但是在使用的过程中陆陆续续出现了一些问题，虽然有着相当丰富的文档，但是在使用的时候会有一些错误的存在，而不熟悉整个包的结构，几乎找不到如何去解决错误的方法。且也是因为这个问题，意味着如果想要一些自己的自定义的话会很困难，且不能保证与原配置不冲突。

github 的意见不知道什么原因被删除，一些大家有共同问题的讨论也不复存在。

最后还是回归到自己配置，做好模块分化，慢慢习惯也就好了。

### 输入*号看不见，其他编辑器打开能看见
indentLine 插件 造成的 bug，取消了就好了


