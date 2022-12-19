## 插件
### 插件管理器vim-plug
`curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`

### 其他插件及配置
[配置文件vimrc](./vimrc)里面有详细的备注，就不一个个展开了。

## 快捷键设置
[模式映射](images/vim_mapping.png)
使用`h key-notation`命令查看帮助信息,查看键盘符号的详细说明

|notation   | meaning         |equivalent| decimal |value(s)    ~           |
|-----------|-----------------|----------|---------|--------------          |
|\<Nul\>     | zero           |CTRL-@    |0        |  (stored as 10) \*\<Nul\>|
|\<BS\>      | backspace      |CTRL-H    |8        |  \*backspace\*           |
|\<Tab\>     | tab            |CTRL-I    |9        |  \*tab\* \*Tab\*           |
|            |                |\*linefeed\*|         |                        |
|\<NL\>      | linefeed       |CTRL-J    |10       |  (used for \<Nul\>)      |
|\<CR\>      | carriage return|CTRL-M    |13       |  \*carriage-return\*     |
|\<Return\>  | same as <CR>   |          |         |  \*\<Return\>\*            |
|\<Enter\>   | same as <CR>   |          |         |  \*\<Enter\>\*             |
|\<Esc\>     | escape         |CTRL-[    |27       |   \*escape\* \*\<Esc\>\*     |
|\<Space\>   | space          |          |32       |   \*space\*              |
|\<lt\>      | less-than      |\<         |60       |   \*<lt>\*               |
|\<Bslash\>  | backslash      |\\         |92       |  \*backslash\* \*\<Bslash\>\*|
|\<Bar\>     | vertical bar   |    \\     | 124     | \*\<Bar\>\*|    |
|\<Del\>     | delete         |          |127      |                        |


使用 `:map` 命令，可以列出所有键盘映射
使用`:map!`命令，则只列出插入和命令行模式的映射。而`:imap`，`:vmap`，`:omap`，`:nmap`命令则只是列出相应模式下的映射

### markdown-preview.nvim 问题
原来的 markdown-preview.vim 插件在文件较大时会导致 vim 卡死。
需要yarn 环境对包进行编译安装。成功后才能正常使用。如果安装后执行预览命令无反映，可以检查环境后自行`cd ~/.vim/plugged/markdown-preview.nvim/app & yarn install` 编译安装试试。

### 内容显示异常
vim 打开文件有时内容排序混乱，行内容中部有横穿的直线，
可视化目录及标题栏异常等问题可以先尝试退出重新载入，有时候时插件未加载完全或者配置内容加载错误导致的。
在文本中有一个键"\<Del>",被错误的识别造成后面的内容全被增加了删除线。

### 输入\*号看不见，其他编辑器打开能看见
indentLine 插件的配置造成的，要么根据官方文档调整配置，要么使用其他的类似插件。

### lsp 的 bash 问题
出现"SHELLCHECK_PATH" 或 "shellchcek"，原因是 shell 文本中没有shebang（hashbang）头导致的。
