
## 插件
### 1、插件管理器vim-plug
`curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim` 

### 2、.vimrc文件内容
```
set nocompatible  " 关闭兼容模式
set nu  " 设置行号
set cursorline  "突出显示当前行
set cursorcolumn  " 突出显示当前列
set showmatch  " 显示括号匹配

" tab 缩进
set expandtab  "设置按下 Tab 键，实际输入的是空格
set tabstop=4  " 设置Tab长度为4空格
set shiftwidth=4  " 设置自动缩进长度为4空格
set autoindent  " 继承前一行的缩进方式，适用于多行注释

set incsearch  " 开启实时搜索
set ignorecase  " 搜索时大小写不敏感
set laststatus=2  " 总是显示状态栏
set ruler  " 显示光标当前位置
set autoread  " 表示如果当前文件在 Vim 外被修改且未在 Vim 里面重新载入的话，则自动重新读取。
set title  " 设置 Vim 窗口标题。
set noerrorbells  " 关闭错误提示的响铃
set mouse=nv

syntax enable
syntax on  " 开启文件类型侦测
filetype plugin indent on  " 启用自动补全
filetype off

" 定义快捷键的前缀，即<Leader> , 默认为 \
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"
set hidden
set ttimeout
set ttimeoutlen=50


" 主题配色====================================================================== 
set termguicolors  " 开启24bit的颜色，开启这个颜色会更漂亮一些
colorscheme one  " 主题
set background=dark  " 主题背景 dark-深色; light-浅色

" 插件配置======================================================================
call plug#begin('~/.vim/plugged')  " 插件开始的位置

Plug 'junegunn/vim-easy-align'  " 可以快速对齐的插件

" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Plug 'kien/ctrlp.vim'  " 文件搜索
" ctrlp文件搜索
" 打开ctrlp搜索
let g:ctrlp_map = '<leader>ff'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux"
" let g:ctrlp_custom_ignore = {
"     \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
"     \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz)$',
"     \ 'link': 'SOME_BAD_SYMBOLIC_LINKS'
" }

" 相当于mru功能，show recently opened files
map <leader>cp :CtrlPMRU<CR>  
" ----------------------------------------------------------------------




" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Plug 'jistr/vim-nerdtree-tabs'  " 可以使 nerdtree Tab 标签的名称更友好些
Plug 'scrooloose/nerdtree'  " 用来提供一个导航目录的侧边栏
" NERDTree 插件
let NERDTreeShowLineNumbers=0  " 显示行号
let NERDTreeAutoCenter=0  " 打开文件时是否显示目录
let NERDTreeShowHidden=0  " 是否显示隐藏文件
let NERDTreeWinSize=31  " 设置宽度
let NERDTreeIgnore=['\.pyc','\~$','\.swp']  " 忽略一下文件的显示
let NERDTreeShowBookmarks=0  " 打开 vim 文件及显示书签列表
let g:nerdtree_tabs_open_on_console_startup=1  " 在终端启动vim时，共享NERDTree

" 打开和关闭NERDTree快捷键
map <leader>nt :NERDTreeToggle<CR> 
" ----------------------------------------------------------------------


" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" 自动括号匹配
Plug 'jiangmiao/auto-pairs'  " 自动补全括号的插件，包括小括号，中括号，以及花括号

" 不同括号显示不同颜色
Plug 'kien/rainbow_parentheses.vim'  " 括号匹配高亮
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
" 最多多少个
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

" 打开Vim后自动启用rainbow_parenthsis插件
au VimEnter * RainbowParenthesesToggle

" 同时开启对以下 3 种扩号的多彩色高亮显示
au Syntax * RainbowParenthesesLoadRound " ()
au Syntax * RainbowParenthesesLoadSquare " []
au Syntax * RainbowParenthesesLoadBraces " {}
" ----------------------------------------------------------------------




" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" 可视化缩进
Plug 'Yggdroot/indentLine'
let g:indentLine_color_term = 239
let g:indentLine_char='|'  " 设定缩进线的样式
"let g:indentLine_concealcursor = 'inc'
"let g:indentLine_conceallevel = 2
" ----------------------------------------------------------------------




" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
" 查看当前代码文件中的变量和函数列表的插件，
" 可以切换和跳转到代码中对应的变量和函数的位置
" 大纲式导航, Go 需要 https://github.com/jstemmer/gotags 支持
Plug 'majutsushi/tagbar'

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
" tagbar 插件打开关闭快捷键
nmap <Leader>tb :TagbarToggle<CR>  
" ----------------------------------------------------------------------




" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" python
Plug 'Valloric/YouCompleteMe'
let g:ycm_collect_identifiers_from_tags_files = 1           " 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释与字符串中的内容也用于补全
let g:syntastic_ignore_files=[".*\.py$"]
let g:ycm_seed_identifiers_with_syntax = 1                  " 语法关键字补全
let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']  " 映射按键, 没有这个会拦截掉tab, 导致其他插件的tab不能用.
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:ycm_complete_in_comments = 1                          " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1                           " 在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释和字符串中的文字也会被收入补全
let g:ycm_global_ycm_extra_conf=''
let g:ycm_show_diagnostics_ui = 0                           " 禁用语法检查
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>" |            " 回车即选中当前项
nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>|     " 跳转到定义处
"let g:ycm_min_num_of_chars_for_completion=2  

" Python 代码规范
Plug 'tell-k/vim-autopep8'
Plug 'nvie/vim-flake8'
Plug 'klen/python-mode'

au BufNewFile,BufRead *.py
\ set tabstop=4 |
\ set softtabstop=4 |
\ set shiftwidth=4 |
\ set textwidth=79 |
\ set expandtab |
\ set autoindent |
\ set fileformat=unix
" ----------------------------------------------------------------------



" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"  vim-go 插件
let g:go_fmt_command = "goimports" " 格式化将默认的 gofmt 替换
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_version_warning = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1
let g:godef_split=2

Plug 'dgryski/vim-godef'  " go 中的代码追踪，输入 gd 就可以自动跳转
" ----------------------------------------------------------------------




" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" markdown
Plug 'iamcco/mathjax-support-for-mkdp'
" Plug 'iamcco/markdown-preview.vim'  无需配置，但是在文件较大时会导致vim卡死
Plug 'iamcco/markdown-preview.nvim'
Plug 'lvht/tagbar-markdown'

" markdwon 的快捷键
map <silent> <leader>mp :MarkdownPreview<CR>
map <silent> <Leader>mps :MarkdownPreviewStop<CR>
" ----------------------------------------------------------------------



" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" 配色方案
Plug 'KeitaNakamura/neodark.vim'  " colorscheme neodark
Plug 'crusoexia/vim-monokai'  " colorscheme monokai
Plug 'acarapetis/vim-colors-github'  " colorscheme github 
Plug 'rakr/vim-one'  " colorscheme one 
" ----------------------------------------------------------------------

call plug#end()  " 插件结束的位置，插件全部放在此行上面


" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" tab 标签页切换快捷键
nmap <Leader>1 1gt
nmap <Leader>2 2gt
nmap <Leader>3 3gt
nmap <Leader>4 4gt
nmap <Leader>5 5gt
nmap <Leader>6 6gt
nmap <Leader>7 7gt
nmap <Leader>8 8gt
nmap <Leader>9 8gt
nmap <Leader>0 :tablast<CR>
" ----------------------------------------------------------------------


" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let w:input_toggle = 0
function Fcitx2en()
let s:input_status = system("fcitx5-remote")
if s:input_status == 2
let w:input_toggle = 1
let l:a = system("fcitx5-remote -c")
endif
endfunction

function Fcitx2zh()
let s:input_status = system("fcitx5-remote")
if s:input_status != 2 && w:input_toggle == 1
let l:a = system("fcitx5-remote -o")
let w:input_toggle = 0
endif
endfunction


autocmd! InsertLeave * call Fcitx2en()
autocmd! InsertEnter * call Fcitx2zh()
" ----------------------------------------------------------------------

" 退出插入模式指定类型的文件自动保存
au InsertLeave *.go,*.sh,*.php,*.py,*.md,*.js,*.css,*.html,*.txt write

" 保存 .vimrc 文件后，配置立刻生效
autocmd! bufwritepost $HOME/.vimrc source %


" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
au BufNewFile,BufRead *.js, *.html, *.css
\ set tabstop=2 |
\ set softtabstop=2 |
\ set shiftwidth=2
" ----------------------------------------------------------------------

" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"设置新建文件时候，自动向文件中添加内容
autocmd BufNewFile *.sh,*.py,*.go exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
    "对于 shell 脚本文件 "
    if &filetype == 'sh'
        call setline(1, "#!/bin/bash")
    endif

    "对于 python3 文件 "
    if &filetype == 'python'
        call setline(1, "#!/usr/bin/env python3")
        call append(1, "# Author: aiyoyo🍉")
        " call append(2, "# Email: ")
    endif

    "对于 golang 文件 "
    if &filetype == 'go'
        call setline(1, "#!/usr/bin/env go")
        call append(1, "# Author: aiyoyo🍉")
        call append(2, "# Email: ")
        call append(3, "")
        call append(4, "package main")
    endif

    "自动将光标定位到文件末尾"
    normal G

    " 新建一行
    normal o
    normal o
endfunc
" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

map <Leader>cl :close<CR>
```

## 快捷键设置
[模式映射](images/vim_mapping.png)
使用`h key-notation`命令查看帮助信息,查看键盘符号的详细说明

|notation  | meaning         |equivalent| decimal |value(s)    ~|
|----------|-----------------|----------|---------|--------------|
|<Nul>     | zero            |CTRL-@    |0        |  (stored as 10) *<Nul>*|
|<BS>      | backspace       |CTRL-H    |8        |  *backspace*|
|<Tab>     | tab             |CTRL-I    |9        |  *tab* *Tab*|
|          |                 |*linefeed*|         |  |
|<NL>      | linefeed        |CTRL-J    |10       |  (used for <Nul>)|
|<CR>      | carriage return |CTRL-M    |13       |  *carriage-return*|
|<Return>  | same as <CR>    |          |         |  *<Return>*|
|<Enter>   | same as <CR>    |          |         |  *<Enter>*|
|<Esc>     | escape          |CTRL-[    |27       |   *escape* *<Esc>*|
|<Space>   | space           |          |32       |   *space*|
|<lt>      | less-than       |<         |60       |   *<lt>*|
|<Bslash>  | backslash       |\         |92       |   *backslash* *<Bslash>*|
|<Bar>     | vertical bar    |    \|     |124      |   *<Bar>*|
|<Del>     | delete          |          |127      |  |

使用 :map 命令，可以列出所有键盘映射
使用:map!命令，则只列出插入和命令行模式的映射。而:imap，:vmap，:omap，:nmap命令则只是列出相应模式下的映射


## 插件问题
### YouCompleteMe 配置
安装 YouCompleteMe 插件后打开报错。
`The ycmd server SHUT DOWN (restart with ':YcmRestartServer'). YCM...YCM before using it. Follow the instructions in the documentation.
`
执行`cd ~/.vim/plugged/YouCompleteMe/ & ./install.py` 全部显示 ok 再重启即可

上面的方法有时还是会有问题，`cd ~/.vim/plugged/YouCompleteMe/ & python3 install.py`即可
()[https://www.jb51.net/article/172382.htm]

markdown-preview.nvim 问题
原来的markdown-preview.vim 插件在文件较大时会导致vim卡死。
安装插件后`cd ~/.vim/plugged/markdown-preview.nvim/app & yarn install`
yarn没有的需要安装


## 问题
### vim 打开文件有时内容排序混乱，行内容中部有横穿的直线，可视化目录及标题栏异常等问题可以先尝试退出重新载入，有时候时插件未加载完全或者配置内容加载错误导致的。

### vim退出插入模式时自动将输入法切换为英文的
原来一直为这个问题苦恼，通常是使用来写markdown笔记，也就是内容偏中文多，在进入命令模式的时候一直忘记切换输入法，导致全角的冒号无法奇效，虽然说养成习惯就好了，但是总是很别扭，一直在找一些方法去解决。

也不要求如能够记忆前一次输入法这类的，单纯的实现退出插入模式能英文就可以。

现在的解决方案：
1、输入法框架必须为fcitx5，fcitx应该也可以，毕竟fcitx5是基于fcitx的，命令的使用也大致相同。
2、输入法里面必须要选择两个（一个英文的，一个中文的），有的习惯只有中文的，然后左shift切，不符合这个的要求。
3、如果要照搬配置的话，配置里面英文的输入法在中文的前面。
4、配置：在~/.vimrc最后插入即可
```
let w:input_toggle = 0
function Fcitx2en()
let s:input_status = system("fcitx5-remote")
if s:input_status == 2
let w:input_toggle = 1
let l:a = system("fcitx5-remote -c")
endif
endfunction

function Fcitx2zh()
let s:input_status = system("fcitx5-remote")
if s:input_status != 2 && w:input_toggle == 1
let l:a = system("fcitx5-remote -o")
let w:input_toggle = 0
endif
endfunction

set timeoutlen=150
autocmd! InsertLeave * call Fcitx2en()
autocmd! InsertEnter * call Fcitx2zh()
```

5、简单说下吧，如果有需要修改的给点思路。
定义切换至英文的函数Fcitx2en()，切换至中文的函数Fcitx2zh()，system("fcitx5-remote")会得到当前fcitx5输入法的一个状态信息，0表示为启用，这时需要先启用，1是第一个输入法，2表示第二个输入法，`fcitx5-remote -h`可以查看`fcitx-remote`命令的使用方法。`fcitx5-remote -c`会停用输入法，就会使用英文的，原来的是英文的使用这个命令不影响，`fcitx5-remote -o`则是激活输入法，原来的为中文再使用也不影响。
做个大胆猜测啊，懒得去深究了，英文的输入法为自带的，在fcitx5中导入的也是系统的，因为只有拼音是需要额外安装的，所以即使在正常使用去切换输入法的时候实际也是开启、关闭fcitx5去实现中英文的切换。
最后的autocmd! 告诉vim当InsertLeave、InsertEnter为退出、进入插入模式的时候自动去执行相关的函数。

6、额外注意的是进入插入模式只能是标准的`i`插入才能唤醒，`a`插入等本机测试无效。

7、英文的话建议ENGLISH(US).

8、如果安装的是fcitx而不是fcitx5，将文件中所有fcitx5改为fcitx即可。

### 打开文件出现‘--- Autocommands --- Press ENTER or type command to continue’
检查 `~/.vimrc` 文件的内容是否有语法不符合的内容，改正即可
