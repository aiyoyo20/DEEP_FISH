"*********************************************************************
" 代码补全
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'  " 对文件路进的提示补全
" 需要进行注册
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'whitelist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))

" 代码检查
Plug 'dense-analysis/ale'
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰', '│', '─']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" Plug 'rhysd/vim-lsp-ale'

"" Snippets
Plug 'rafamadriz/friendly-snippets'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'  " 能够把内容集合到补全里面进行选择

" 代码格式化，比如 bash-language-server 不支持代码格式化但代码检查有强制要求
" 支持的语言很多,而且默认会自动删除尾部多余空格
Plug 'Chiel92/vim-autoformat'
let g:formatterpath = ['/home/aiyoyo/go/bin']  " 格式化命令的位置，可添加多个
