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


Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9



call plug#end()  " 插件结束的位置，插件全部放在此行上面



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
