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
function! AutoSetFileHead()
    " 对于 shell 脚本文件
    if &filetype == 'sh'
        call setline(1, "#!/bin/bash")
        call append(1, "# Author: aiyoyo")
        call append(2,"# create time   : ".strftime("%Y-%m-%d %H:%M:%S"))
        call append(3,"# last modified : ".strftime("%Y-%m-%d %H:%M:%S"))
        call append(4, "")
        call append(5, "")
        "自动将光标定位到文件末尾"
        normal G
    endif

    " 对于 python3 文件
    if &filetype == 'python'
        call setline(1, "#!/usr/bin/env python3")
        call append(1, "# Author: aiyoyo")
        call append(2,"# create time   : ".strftime("%Y-%m-%d %H:%M:%S"))
        call append(3,"# last modified : ".strftime("%Y-%m-%d %H:%M:%S"))
        call append(4, "")
        call append(5, "")
        call append(6, "def main():")
        call append(7, "    pass")
        call append(8, "")
        call append(9, "")
        call append(10, "if __name__ == '__main__':")
        call append(11, "    main()")
        normal 6gg
    endif

    " 对于 golang 文件
    if &filetype == 'go'
        call setline(1, "#!/usr/bin/env go")
        call append(1, "// Author: aiyoyo")
        call append(2,"// create time   : ".strftime("%Y-%m-%d %H:%M:%S"))
        call append(3,"// last modified : ".strftime("%Y-%m-%d %H:%M:%S"))
        call append(4, "")
        call append(5, "package main")
        call append(6, "")
        call append(7, "")
        "自动将光标定位到文件末尾"
        normal G
    endif
endfunc

function SetLastModifiedTimes()
  let line = getline(3)
  let newtime = "# last modified : ".strftime("%Y-%m-%d %H:%M:%S")
  let repl = substitute(line,".*$",newtime,"g")
  let res = search("# last modified","w")
  if res
    call setline(3,repl)
  endif
endfunction
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
" fileHead 设置
autocmd BufNewFile *.sh,*.py,*.go exec ":call AutoSetFileHead()"
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" 更新文件修改时间
autocmd BufWrite *.sh,*.py call SetLastModifiedTimes()
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

