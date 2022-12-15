## 插件
### 插件管理器vim-plug
`curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`

### 其他插件及配置
`.vimrc` 里面有详细的备注，就不一个个展开了。

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
set colorcolumn=72,80,100  " 行字符长度域，可设置多个参数
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


" 主题配色 ============================================================
set termguicolors  " 开启24bit的颜色，开启这个颜色会更漂亮一些
colorscheme gruvbox  " 主题
set background=dark  " 主题背景 dark-深色; light-浅色

" ===========================插件配置==================================
call plug#begin('~/.vim/plugged')  " 插件开始的位置

" 配色方案+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Plug 'morhetz/gruvbox'
" --------------------------------------------------------------------

" +++++++++++++Language Server Protocol+++++++++++++++++++++++++++++++
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'dense-analysis/ale'  " 代码检查
Plug 'rhysd/vim-lsp-ale'
" Plug 'mattn/vim-lsp-settings'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'thomasfaingnaert/vim-lsp-ultisnips'
Plug 'thomasfaingnaert/vim-lsp-snippets'


" ********bash-language-server*********
if executable('bash-language-server')
    au User lsp_setup call lsp#register_server({
          \ 'name': 'bash-language-server',
          \ 'cmd': {server_info->[&shell, &shellcmdflag, 'bash-language-server start']},
          \ 'allowlist': ['sh'],
          \ })
endif

" ********docker-langserver*********
if executable('docker-langserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'docker-langserver',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'docker-langserver --stdio']},
        \ 'whitelist': ['dockerfile'],
        \ })
endif

" ********gppls*********
if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls']},
        \ 'allowlist': ['go'],
        \ })
" "   let g:ale_linters = {
" "     \   'go': ['vim-lsp', 'golangci-lint'],
" "     \ }
endif


" ********pylsp*********
if executable('pylsp')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pylsp',
        \ 'cmd': {server_info->['pylsp']},
        \ 'allowlist': ['python'],
        \ })
endif


" ********golangci-lint-langserver*********
if executable('golangci-lint-langserver')
  au User lsp_setup call lsp#register_server({
      \ 'name': 'golangci-lint-langserver',
      \ 'cmd': {server_info->['golangci-lint-langserver']},
      \ 'initialization_options': {'command': ['golangci-lint', 'run', '--enable-all', '--disable', 'lll', '--out-format', 'json', '--issues-exit-code=1']},
      \ 'whitelist': ['go'],
      \ })
endif

" ********rust-analyzer*********
if executable('rustup')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rust-analyzer',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rust-analyzer']},
        \ 'allowlist': ['rust'],
        \ })
endif

" ********yaml-language-server*********
if executable('yaml-language-server')
   au User lsp_setup call lsp#register_server({
       \ 'name': 'yaml-language-server',
       \ 'cmd': {server_info->['yaml-language-server', '--stdio']},
       \ 'whitelist': ['yaml', 'yaml.ansible'],
       \ 'workspace_config': {
       \   'yaml': {
       \     'validate': v:true,
       \     'hover': v:true,
       \     'completion': v:true,
       \     'customTags': [],
       \     'schemas': {},
       \     'schemaStore': { 'enable': v:true },
       \   }
       \ }
       \})
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go,*.py call execute('LspDocumentFormatSync')  " 这些类似的文件保存时候自动格式化

endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" ----------------------------------------------------------------------

Plug 'junegunn/vim-easy-align'  " 可以快速对齐的插件

" ctrlp文件搜索 +++++++++++++ ++++++++++++++++++++++++++++++++++++++++++++++++
Plug 'kien/ctrlp.vim'  " 文件搜索

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
" --------------------------------------------------------------------




" vim显示相关插件 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Plug 'vim-airline/vim-airline'
Plug 'sjl/gundo.vim'  " 文件历史插件
Plug 'jistr/vim-nerdtree-tabs'  " 可以使 nerdtree Tab 标签的名称更友好些

Plug 'scrooloose/nerdtree'  " 用来提供一个导航目录的侧边栏
let NERDTreeShowLineNumbers=0  " 显示行号
let NERDTreeAutoCenter=0  " 打开文件时是否显示目录
let NERDTreeShowHidden=0  " 是否显示隐藏文件
let NERDTreeWinSize=31  " 设置宽度
let NERDTreeIgnore=['\.pyc','\~$','\.swp']  " 忽略一下文件的显示
let NERDTreeShowBookmarks=0  " 打开 vim 文件及显示书签列表
let g:nerdtree_tabs_open_on_console_startup=1  " 在终端启动vim时，共享NERDTree

" 打开和关闭NERDTree快捷键
map <leader>nt :NERDTreeToggle<CR>
" --------------------------------------------------------------------


" 自动括号匹配 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
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
" --------------------------------------------------------------------


" 可视化缩进 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Plug 'Yggdroot/indentLine'
let g:indentLine_setColors = 0
let g:indentLine_defaultGroup = 'SpecialKey'
" Vim
let g:indentLine_color_term = 239

" GVim
let g:indentLine_color_gui = '#A4E57E'

" none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)

" Background (Vim, GVim)
let g:indentLine_bgcolor_term = 202
let g:indentLine_bgcolor_gui = '#FF5F00'

let g:indentLine_char = 'c'

let g:indentLine_char_list = ['|', '¦', '┆', '┊']

let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_setConceal = 0
let g:vim_json_conceal=0
let g:markdown_syntax_conceal=0
" --------------------------------------------------------------------



" 大纲式导航 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" 查看当前代码文件中的变量和函数列表的插件，可以切换和跳转到代码中对应的变量和函数的位置
Plug 'preservim/tagbar'
" tagbar 插件打开关闭快捷键
nmap <Leader>tt :TagbarToggle<CR>
" --------------------------------------------------------------------


" markdown +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" markdwon 的快捷键
map <silent> <leader>mp :MarkdownPreview<CR>
map <silent> <Leader>ms :MarkdownPreviewStop<CR>
" --------------------------------------------------------------------



Plug 'preservim/nerdcommenter'
" 快速注释
" 注释<leader>cc
" 取消注释<leader>cu
Plug 'godlygeek/tabular'   " 对齐插件
Plug 'bronson/vim-trailing-whitespace' " 清除尾部空格


call plug#end()  " 插件结束的位置，插件全部放在此行上面
" --------------------------------------------------------------------




" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" 设置 Tab 长度
au BufNewFile,BufRead *.js, *.html, *.css
\ set tabstop=2 |
\ set softtabstop=2 |
\ set shiftwidth=2
" --------------------------------------------------------------------



" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" fileHead 设置
autocmd BufNewFile *.sh,*.py,*.go exec ":call AutoSetFileHead()"
autocmd BufWrite *.sh,*.py call SetLastModifiedTimes()
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
" --------------------------------------------------------------------


" 保存 .vimrc 文件后，配置立刻生效
autocmd! bufwritepost $HOME/.vimrc source %

" 退出插入模式指定类型的文件自动保存
au InsertLeave *.go,*.sh,*.py,*.md,*.js,*.css,*.html,*.txt write
```


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

### 输入*号看不见，其他编辑器打开能看见
indentLine 插件的配置造成的，要么根据官方文档调整配置，要么使用其他的类似插件。

### lsp 的 bash 问题
出现"SHELLCHECK_PATH" 或 "shellchcek"，原因是 shell 文本中没有shebang（hashbang）头导致的。
