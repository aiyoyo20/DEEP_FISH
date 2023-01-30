" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Plug 'jistr/vim-nerdtree-tabs'  " 可以使 nerdtree Tab 标签的名称更友好些
Plug 'scrooloose/nerdtree'  " 用来提供一个导航目录的侧边栏

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['node_modules','\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']  " 忽略以下文件的显示
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let NERDTreeShowBookmarks=0  " 打开 vim 文件及显示书签列表
let NERDTreeShowLineNumbers=0  " 显示行号
let NERDTreeAutoCenter=0  " 打开文件时是否显示目录
let NERDTreeShowHidden=0  " 是否显示隐藏文件
let NERDTreeWinSize=31  " 设置宽度
let g:nerdtree_tabs_open_on_console_startup=1  " 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite,*node_modules/
" --------------------------------------------------------------------