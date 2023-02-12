"*********************************************************************
"" base
" {
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
set colorcolumn=72,80,100  " 行字符长度域，可设置多个参数
set autoread  " 表示如果当前文件在 Vim 外被修改且未在 Vim 里面重新载入的话，则自动重新读取。
set title  " 设置 Vim 窗口标题。
set noerrorbells  " 关闭错误提示的响铃
set mouse=nv

syntax enable
syntax on  " 开启文件类型侦测
filetype plugin indent on  " 启用自动补全
filetype off

" 加载子模块
let $VIM = "/home/aiyoyo/vimrc"
source $VIM/plugin.vim

" }
"*********************************************************************



"*********************************************************************
"" Functions
" {
"
" }
"*********************************************************************



"*********************************************************************
"" Commands
" {
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" 保存 .vimrc 文件后，配置立刻生效
autocmd! bufwritepost $HOME/.vimrc source %
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" 退出插入模式指定类型的文件自动保存
au InsertLeave *.go,*.sh,*.py,*.md,*.js,*.css,*.html,*.txt write
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Python runner:
autocmd FileType python nnoremap <buffer> <C-i> :w <RETURN> :!python % <RETURN>
" }
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" 设置 Tab 长度
au BufNewFile,BufRead *.js, *.html, *.css
\ set tabstop=2 |
\ set softtabstop=2 |
\ set shifidth=2
"*********************************************************************



"*********************************************************************
"" Abbreviations
" {
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
" }
"*********************************************************************

