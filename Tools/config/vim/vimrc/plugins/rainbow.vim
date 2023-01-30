" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Plug 'kien/rainbow_parentheses.vim'  " 括号匹配高亮,不同括号显示不同颜色
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