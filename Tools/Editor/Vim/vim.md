## 插件

### 插件管理器vim-plug

`curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`

### 其他插件及配置

配置文件[vimrc](./vimrc)里面有详细的备注，就不一个个展开了。

## 快捷键设置

[模式映射](images/vim_mapping.png)
使用`h key-notation`命令查看帮助信息,查看键盘符号的详细说明

| notation  | meaning         | equivalent   | decimal | value(s)~                   |
| ---       | ---             | ---          | ---     | ---                         |
| \<Nul>    | zero            | CTRL-@       | 0       | (stored as 10)\*\<Nul>      |
| \<BS>     | backspace       | CTRL-H       | 8       | \*backspace\*               |
| \<Tab>    | tab             | CTRL-I       | 9       | \*tab\* \*Tab\*             |
|           |                 | \*linefeed\* |         |                             |
| \<NL>     | linefeed        | CTRL-J       | 10      | (used for \<Nul>)           |
| \<CR>     | carriage return | CTRL-M       | 13      | \*carriage-return\*         |
| \<Return> | same as <CR>    |              |         | \*\<Return>\*               |
| \<Enter>  | same as <CR>    |              |         | \*\<Enter>\*                |
| \<Esc>    | escape          | CTRL-\[      | 27      | \*escape\* \*\<Esc>\*       |
| \<Space>  | space           |              | 32      | \*space\*                   |
| \<lt>     | less-than       | <            | 60      | \*<lt>\*                    |
| \<Bslash> | backslash       | \            | 92      | \*backslash\* \*\<Bslash>\* |
| \<Bar>    | vertical bar    | \            | 124     | \*\<Bar>\*                  |  |
| \<Del>    | delete          |              | 127     |                             |

使用 `:map` 命令，可以列出所有键盘映射,使用`:map!`命令，则只列出插入和命令行模式的映射。而`:imap`，`:vmap`，`:omap`，`:nmap`命令则只是列出相应模式下的映射

### markdown-preview.nvim 问题

原来的 markdown-preview.vim 插件在文件较大时会导致 vim 卡死。
需要yarn 环境对包进行编译安装。成功后才能正常使用。如果安装后执行预览命令无反映，可以检查环境后自行`cd ~/.vim/plugged/markdown-preview.nvim/app & yarn install` 编译安装试试。

### 内容显示异常

vim 打开文件有时内容排序混乱，行内容中部有横穿的直线，
可视化目录及标题栏异常等问题可以先尝试退出重新载入，有时候时插件未加载完全或者配置内容加载错误导致的。
在文本中有一个键"\<Del>",被错误的识别造成后面的内容全被增加了删除线。

### indentLine 造成的 markdown 问题
#### 输入\*号看不见，其他编辑器打开能看见
indentLine 插件的配置造成的，要么根据官方文档调整配置，要么使用其他的类似插件。

#### python 的 `if __name__ == "__main__"` 变成 `if name == "main"`，光标移动到该行变正常
包括上面的问题，设置项有个特殊参`let g:markdown_syntax_conceal=0`,加上就好了。

### lsp 的 bash 问题

出现"SHELLCHECK\_PATH" 或 "shellchcek"，原因是 shell 文本中没有shebang（hashbang）头导致的。

### 插件 fcitx.vim 与 python 虚拟环境 与 vim 的使用
fcitx.vim 使用了 python3 和自带的库`dbus-python`，具体的功能没有细看，但是这个库是在主环境中的，如果使用虚拟环境，而又没有安装这个库，使用虚拟环境的目的就是为了得到纯净环境，好调试，所以也不可能创建一个虚拟环境便去安装一次这个库。而且试着安装了一下，没成功，看错误日志好像并不是纯 python 包，下载下来后有编译或是其他操作，所以基本不用考虑自己安装了。

没有安装这个库倒是不会影响该 vim 插件的使用，但是在启用的时候加载插件会调动这个库，没有 python 就会抛出异常。

 尝试使用`vim-virtualenv`，在 vim 中切换环境后，使用`!python %`运行输出版本的脚本版本改变了，但是在 vim 中直接`:python3 import sys; print(sys.version)`，版本还是基本环境的版本，而且这种方法对使用`vim-lsp`补全不起效果，无法使用虚拟环境的库进行补全。

 这个问题最后还是在官方插件文档找到了解决方法：插件默认会使用 Python 3 并通过 D-Bus 来切换输入法状态。

 如果是使用 `fcitx5` 输入法，可以通过 `fcitx5-remote` 来切换。

 设置参数后不使用 dbus 就不会使用 python 基本就不会有这个问题。

 ```
Plug 'lilydjwg/fcitx.vim'
let g:fcitx5_remote = '/usr/bin/fcitx5-remote'  " 命令的地址
let g:fcitx5_rime = 1  " 使用 rime 输入法需设置
 ```
