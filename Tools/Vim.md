
# Vim
## 安装
win：gvim
没有去window下折腾的想法，比较麻烦，但还是放一个介绍安装的[网址](https://zhuanlan.zhihu.com/p/64856646)吧，如果挂了网上找找，很多的

linux：  
manjaro下安装`yay -S vim` or `sudo pacman -S vim`

mac：  
 自带了，升级`brew install vim --with-lua --with-override-system-vi`
 方法也挺多样的，从源码编译，覆盖安装，保留版本安装都有，自行搜索

## 配置
二、插件

　标签导航（tagbar和ctags）、语法检测（syntastic）、文件搜索（ctrlp）、目录树导航（nerdtree）、状态栏美化（vim-powerline）、主题风格（solarized）、

　python相关（jedi-vim和python-mode）、括号匹配高亮（rainbow_parentheses）、可视化缩进（vim-indent-guides），还有一个最重要的就是插件管理工具vundle。

1、安装vundle
`git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle` 

　2、.vimrc配置文件

　　~/.vimrc是VIM的配置文件，如果这个配置文件不存在，我们可以自行创建。安装好了vundle，需要在~/.vimrc配置文件中添加vundle支持。所以，在~/.vimrc中添加代码如下：
```
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
  
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif
```

为了防止配置文件太乱，我们可以通过~/.vimrc.bundles管理我们安装的插件。

 

3、.vimrc.bundles配置文件
首先创建文件~/.vimrc.bundles，然后添加代码如下：
```
if &compatible
  set nocompatible
end
  
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
  
" Let Vundle manage Vundle
Bundle 'gmarik/vundle'
  
" Define bundles via Github repos
" 标签导航
Bundle 'majutsushi/tagbar'
Bundle 'vim-scripts/ctags.vim'
" 静态代码分析
Bundle 'scrooloose/syntastic'
" 文件搜索
Bundle 'kien/ctrlp.vim'
" 目录树导航
Bundle "scrooloose/nerdtree"
" 美化状态栏
Bundle "Lokaltog/vim-powerline"
" 主题风格
Bundle "altercation/vim-colors-solarized"
" python自动补全
Bundle 'davidhalter/jedi-vim'
Bundle "klen/python-mode"
" 括号匹配高亮
Bundle 'kien/rainbow_parentheses.vim'
" 可视化缩进
Bundle 'nathanaelkane/vim-indent-guides'
if filereadable(expand("~/.vimrc.bundles.local"))
  source ~/.vimrc.bundles.local
endif
  
filetype on
```

如上述代码所示，我们通过Bundle指定各个插件在Github的地址，填写规则是"用户名/仓库名"。书写规则有三种，这里使用的是最常见的一种

 

4、安装插件
我们已经指定好了各个插件的路径，接下里就是安装各个插件了。在shell中输入vim，进入命令行模式输入：BundleInstall，然后回车



 

 

运行这个命令就开始自行安装我们之前指定的各个插件了。这个过程需要连网，下载并安装好各个插件之后会提示 Done！

注意：由于tagbar依赖于ctags，所以我们还需要用指令安装ctags：`sudo apt-get`（或者yum，不同的Linux系统） install ctags

如果某个插件下载失败，可以去~/.vim/bundle路径下将相应的插件删除，重新执行上面的BundleInstall即可

 

三、插件配置
1、基础配置

已经安装好了各个插件，接下里就可以直接用了吗？答案是否定的，我们还需要继续对自己安装的插件进行配置。配置这里也很简单，下面是我的配置，编写~/.vimrc：
（如果粘贴下面的内容到vimrc中出现格式混乱，可以选择新建任意名字的文件，粘贴，然后采用mv重命名为.vimrc）
```
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
  
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

  
" tagbar标签导航
nmap <Leader>tb :TagbarToggle<CR>
let g:tagbar_ctags_bin='/usr/bin/ctags'
let g:tagbar_width=30
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
let g:jedi#auto_initialization = 1
  
" 主题 solarized
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
" 配色方案
set background=dark
set t_Co=256
colorscheme solarized
  
" 目录文件导航NERD-Tree
" \nt 打开nerdree窗口，在左侧栏显示
nmap <leader>nt :NERDTree<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
let g:netrw_home='~/bak'
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end
  
" ctrlp文件搜索
" 打开ctrlp搜索
let g:ctrlp_map = '<leader>ff'
let g:ctrlp_cmd = 'CtrlP'
" 相当于mru功能，show recently opened files
map <leader>fp :CtrlPMRU<CR>
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux"
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz)$',
    \ }
"\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
  
" vim-powerline美化状态
" let g:Powerline_symbols = 'fancy'
let g:Powerline_symbols = 'unicode'
  
" 括号匹配高亮
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
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 40
let g:rbpt_loadcmd_toggle = 0
  
" 可视化缩进
let g:indent_guides_enable_on_vim_startup = 0  " 默认关闭
let g:indent_guides_guide_size            = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level           = 2  " 从第二层开始可视化显示缩进
```

你可以根据自己的喜好设置快捷键，<leader>是按键\，根据我的配置。在VIM的正常模式下：

依次按键\tb，就会调出标签导航；
依次按键\ff，就会调出文件搜索；
依次按键\nt，就会调出目录导航。

 

2、运行配置
这些基础配置已经完成，但是我想在VIM下像在IDE中一样，按一个键就运行当前编辑的python文件，并查看运行结果，这可以做到吗？没问题！

在~/.vimrc最后一行追击代码如下：
```
" 运行文件
map <F5> :w<cr>:r!python3 %<cr>
```
上述代码的意思就是，在VIM的正常模式下，按F5就会保存文件并使用python3运行当前文件，并将结果输出到当前界面。
注意，:!python3表示运行系统命令python3，如果你没有安装python2和python3共存，此处只写python即可。

这样我们就可以边编辑边查看运行结果了：
	运行完之后，依然可以在VIM的正常模式下按u，撤回这个输出操作，这样输出结果就撤回了，我们就可以继续编写自己的代码了。


