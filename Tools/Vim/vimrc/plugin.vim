" ===========================插件开始==================================
call plug#begin('~/.vim/plugged')  " 插件开始的位置

source $VIM/plugins/airline.vim
source $VIM/plugins/code.vim
source $VIM/plugins/color.vim
source $VIM/plugins/ctrlp.vim
source $VIM/plugins/indentLine.vim
source $VIM/plugins/markdown.vim
source $VIM/plugins/nerdtree.vim
source $VIM/plugins/rainbow.vim
source $VIM/plugins/tools.vim
source $VIM/plugins/vim-lsp.vim
source $VIM/plugins/vista.vim
source $VIM/plugins/whichKey.vim

" 自己的插件
source $VIM/plugins/fileHeader.vim

call plug#end()  " 插件结束的位置，插件全部放在此行上面
" ===========================插件结束==================================

