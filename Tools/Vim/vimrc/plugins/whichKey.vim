"*********************************************************************
" KEY MAPS
" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Plug 'liuchengxu/vim-which-key',{ 'on': ['WhichKey', 'WhichKey!'] }

set nocompatible

let g:mapleader="\<Space>"
let g:which_key_map =  {}  " Create map to add keys to
let g:which_key_sep = '→'  " Define a separator
" set timeoutlen=100

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

let g:which_key_map.t =  {
      \ 'name': '+tab' ,
      \ 'N'      : ['tabNext'     ,'tabN[ext](跳到前一个标签页)'               ] ,
      \ 'c'      : ['tabclose'    ,'tabc[lose](关闭当前标签页)'                ] ,
      \ 'd'      : ['tabdo'       ,'tabdo(为每个标签页执行命令)'               ] ,
      \ 'e'      : ['tabedit'     ,'tabe[dit](在新标签页里编辑文件)'           ] ,
      \ 'f'      : ['tabfirst'    ,'tabfir[st](转到首个标签页)'                ] ,
      \ 'l'      : ['tablast'     ,'tabl[ast](转到末个标签页)'                 ] ,
      \ 'm'      : ['tabmove'     ,'tabm[ove](把标签页移到别的位置)'           ] ,
      \ 'x'      : ['tabnew'      ,'tabnew(在新标签页里编辑文件)'              ] ,
      \ 'n'      : ['tabnext'     ,'tabn[ext](转到后一个标签页)'               ] ,
      \ 'o'      : ['tabonly'     ,'tabo[nly](关闭所有除了当前标签页以外的所有标签页)'] ,
      \ 'p'      : ['tabprevious' ,'tabp[revious](转到前一个标签页)'           ] ,
      \ 'r'      : ['tabrewind'   ,'tabr[ewind](转到首个标签页)'               ] ,
      \ 's'      : ['tabs'        ,'tabs(列出标签页以及里面包含的内容)'        ] ,
      \ }


" Register which key map
autocmd! User vim-which-key call which_key#register('<Space>', "g:which_key_map")
"*********************************************************************
