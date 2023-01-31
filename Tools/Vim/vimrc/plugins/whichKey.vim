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
      \ 'N'      : ['tabNext'     ,'tabN[ext] (跳到前一个标签页)'          ],
      \ 'c'      : ['tabclose'    ,'tabc[lose](关闭当前标签页)'            ],
      \ 'd'      : ['tabdo'       ,'tabdo(为每个标签页执行命令)'           ],
      \ 'e'      : ['tabedit'     ,'tabe[dit](在新标签页里编辑文件)'       ],
      \ 'f'      : ['tabfirst'    ,'tabfir[st](转到首个标签页)'            ],
      \ 'l'      : ['tablast'     ,'tabl[ast](转到末个标签页)'             ],
      \ 'm'      : ['tabmove'     ,'tabm[ove](把标签页移到别的位置)'       ],
      \ 'x'      : ['tabnew'      ,'tabnew(在新标签页里编辑文件)'          ],
      \ 'n'      : ['tabnext'     ,'tabn[ext](转到后一个标签页)'           ],
      \ 'o'      : ['tabonly'     ,'tabo[nly](关闭其他所有标签页)'         ],
      \ 'p'      : ['tabprevious' ,'tabp[revious](转到前一个标签页)'       ],
      \ 'r'      : ['tabrewind'   ,'tabr[ewind](转到首个标签页)'           ],
      \ 's'      : ['tabs'        ,'tabs(列出标签页以及里面包含的内容)'    ],
      \ }

let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ '1' : ['b1' ,  'buffer-1'         ] ,
      \ '2' : ['b2' ,  'buffer-2'         ] ,
      \ '3' : ['b3' ,  'buffer-3'         ] ,
      \ '4' : ['b4' ,  'buffer-4'         ] ,
      \ '5' : ['b5' ,  'buffer-5'         ] ,
      \ '6' : ['b6' ,  'buffer-6'         ] ,
      \ '7' : ['b7' ,  'buffer-7'         ] ,
      \ '8' : ['b8' ,  'buffer-8'         ] ,
      \ '9' : ['b9' ,  'buffer-9'         ] ,
      \ 'f' : ['bf' ,  'first-buffer'     ] ,
      \ 'd' : ['bl' ,  'last-buffer'      ] ,
      \ 'n' : ['bn' ,  'next-buffer'      ] ,
      \ 'p' : ['bp' ,  'previous-buffer'  ] ,
      \ }

let g:which_key_map.w = {
      \ 'name' : '+windows' ,
      \ 'w' : ['<C-W>w'     , 'other-window'          ] ,
      \ 'd' : ['<C-W>c'     , 'delete-window'         ] ,
      \ '-' : ['<C-W>s'     , 'split-window-below'    ] ,
      \ '|' : ['<C-W>v'     , 'split-window-right'    ] ,
      \ '2' : ['<C-W>v'     , 'layout-double-columns' ] ,
      \ 'h' : ['<C-W>h'     , 'window-left'           ] ,
      \ 'j' : ['<C-W>j'     , 'window-below'          ] ,
      \ 'l' : ['<C-W>l'     , 'window-right'          ] ,
      \ 'k' : ['<C-W>k'     , 'window-up'             ] ,
      \ 'H' : ['<C-W>5<'    , 'expand-window-left'    ] ,
      \ 'J' : [':resize +5' , 'expand-window-below'   ] ,
      \ 'L' : ['<C-W>5>'    , 'expand-window-right'   ] ,
      \ 'K' : [':resize -5' , 'expand-window-up'      ] ,
      \ '=' : ['<C-W>='     , 'balance-window'        ] ,
      \ 's' : ['<C-W>s'     , 'split-window-below'    ] ,
      \ 'v' : ['<C-W>v'     , 'split-window-below'    ] ,
      \ }

" vim-trailing-whitespace
" Vista
let g:which_key_map.f = {
      \ 'name' : '+find/format/fix',
      \ 'f' : ['CtrlP'          , 'search file'            ],
      \ 'r' : ['FixWhitespace'  , 'remove trailing spaces' ],
      \ 'v' : ['Vista!!'        , 'View and search symbols'],
      \ }

let g:which_key_map.c = {
      \ 'name' : '+commenter',
      \ 'i' : ['NERDCommenterInvert'     ,  '切换注释'  ],
      \ 'c' : ['NERDCommenterComment'    ,  '注释'      ],
      \ 'u' : ['NERDCommenterUncomment'  ,  '取消注释'  ],
      \ }

" vim-autoformat
" terminal emulation
let g:which_key_map.t = {
      \ 'name' : '+find/format',
      \ 'n' : ['NERDTreeToggle', 'open/close file tree' ],
      \ 's' : ['terminal'      , 'terminal emulation'   ],
      \ 'f' : ['autoformat'    , 'format file'          ],
      \ }

let g:which_key_map.l = {
      \ 'name' : '+LSP/Language' ,
      \ 'h' : ['LspHover'                   , 'hover'                  ] ,
      \ 'g' : ['LspDefinition'              , 'go definition'          ] ,
      \ 'f' : ['LspDocumentFormat'          , 'Format entire document' ] ,
      \ 'S' : ['LspStatus'                  , 'workspace-symbol'       ] ,
      \ 'r' : ['LspRename'                  , 'Rename symbol'          ] ,
      \ 'd' : ['LspDocumentDiagnostics'     , 'diagnostics information'] ,
      \ 'n' : ['LspNextError'               , 'next error'             ] ,
      \ 'p' : ['LspPreviousError'           , 'previous error'         ] ,
      \ 'm' : {
        \ 'name' : '+markdown',
        \ 'p' : ['MarkdownPreview'     , 'Markdown-Preview'       ],
        \ 's' : ['MarkdownPreviewStop' , 'Markdown-Preview-Stop'  ],
        \ },
      \ }

" Register which key map
autocmd! User vim-which-key call which_key#register('<Space>', "g:which_key_map")
"*********************************************************************

