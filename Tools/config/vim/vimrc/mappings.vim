"*********************************************************************
" KEY MAPS
" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

"*********************************************************************
"" Mappings
" {
" 定义快捷键的前缀，即<Leader> , 默认为 \
let mapleader = "\<Space>"
let maplocalleader= "\<Space>"
set hidden
set ttimeout
set ttimeoutlen=50


"" vim-lsp
" nmap <buffer> gd <plug>(lsp-definition)
" nmap <buffer> gs <plug>(lsp-document-symbol-search)
" nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
" nmap <buffer> gr <plug>(lsp-references)
" nmap <buffer> gi <plug>(lsp-implementation)
" nmap <buffer> gt <plug>(lsp-type-definition)
" nmap <buffer> <leader>rn <plug>(lsp-rename)
" nmap <buffer> [g <plug>(lsp-previous-diagnostic)
" nmap <buffer> ]g <plug>(lsp-next-diagnostic)
" nmap <buffer> K <plug>(lsp-hover)
" nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
" nnoremap <buffer> <expr><c-d> lsp#scroll(-4)


"" markdown-preview.nvim
nmap <leader>mp <Plug>MarkdownPreview
nmap <Leader>ms <Plug>MarkdownPreviewStop


"" nerdtree
" 打开和关闭NERDTree快捷键
nmap <leader>nt :NERDTreeToggle<CR>


"" ctrlp.vim
" let g:ctrlp_map = '<leader>ff'
" let g:ctrlp_cmd = 'CtrlP'

"" Vista
nmap <leader>vs :Vista!!<CR>

" tabular   " 对齐
if exists(":Tabularize")
      nmap <Leader>te :Tabularize /=<CR>
      vmap <Leader>te :Tabularize /=<CR>
      nmap <Leader>aa :Tabularize /:\zs<CR>
      vmap <Leader>aa :Tabularize /:\zs<CR>
      nmap <Leader>td :Tabularize<CR>
      vmap <Leader>td :Tabularize<CR>
    endif

"" vim-trailing-whitespace
" remove trailing whitespaces
nmap <Leader>fs  :FixWhitespace<CR>

" terminal emulation
nnoremap <silent> <leader>sh :terminal<CR>

"" nerdcommenter 快速注释
" <leader>ca          <Plug>NERDCommenterAltDelims  " 切换到另一组分隔符。
" <leader>cu          <Plug>NERDCommenterUncomment  " 取消注释所选行。"
" <leader>cb          <Plug>NERDCommenterAlignBoth  " 与 cc 相同 除了分隔符在左侧 ( <leader>cl) 下对齐。
" <leader>cl          <Plug>NERDCommenterAlignLeft  " 与 cc 相同 除了分隔符在两侧 ( <leader>cb) 下对齐。
" <leader>cA          <Plug>NERDCommenterAppend  " 将注释定界符添加到行尾并在它们之间进入插入模式。
" <leader>cy          <Plug>NERDCommenterYank  " 与 cc 相同，只是注释行首先被抽出。
" <leader>cs          <Plug>NERDCommenterSexy  " 使用漂亮的块格式布局注释掉选定的行。
" <leader>ci          <Plug>NERDCommenterInvert  " 单独切换所选行的注释状态。
" <leader>c$          <Plug>NERDCommenterToEOL  " 注释当前行从光标到行尾。
" <leader>cn          <Plug>NERDCommenterNested  " 与 cc 相同，但强制嵌套。
" <leader>cm          <Plug>NERDCommenterMinimal  " 仅使用一组多部分定界符注释给定的行。
" <leader>c<leader>    <Plug>NERDCommenterToggle  " 切换所选行的注释状态。如果最上面的选定行被注释，则所有选定行都将取消注释，反之亦然。
" <leader>cc          <Plug>NERDCommenterComment  " 注释掉在可视模式下选择的当前行或文本。

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
" }
"*********************************************************************