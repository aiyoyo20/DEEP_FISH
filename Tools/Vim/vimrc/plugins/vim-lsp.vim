" +++++++++++++ Language Server Protocol +++++++++++++++++++++++++++++
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
let g:lsp_diagnostics_enabled = 0 " 关闭代码检查功能，使用 ale

" bash-language-server {
if executable('bash-language-server')
    au User lsp_setup call lsp#register_server({
          \ 'name': 'bash-language-server',
          \ 'cmd': {server_info->[&shell, &shellcmdflag, 'bash-language-server start']},
          \ 'allowlist': ['sh'],
          \ })
endif
" }

" docker-langserver {
if executable('docker-langserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'docker-langserver',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'docker-langserver --stdio']},
        \ 'whitelist': ['dockerfile'],
        \ })
endif
" }

" gppls {
if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls']},
        \ 'allowlist': ['go'],
        \ })
   let g:ale_linters = {
     \   'go': ['vim-lsp', 'golangci-lint'],
     \ }
endif
" }

" pylsp {
if executable('pylsp')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pylsp',
        \ 'cmd': {server_info->['pylsp']},
        \ 'allowlist': ['python'],
        \ })
endif
" }

" protobuf {
if executable('bufls')
    au User lsp_setup call lsp#register_server({
      \ 'name': 'bufls',
      \ 'cmd': {server_info->['bufls', 'serve']},
      \ 'whitelist': ['proto'],
      \ })
endif
" }

" marksman {
if executable('marksman')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'marksman',
        \ 'cmd': {server_info->['marksman']},
        \ 'allowlist': ['markdown'],
        \ })
endif
" }

" golangci-lint-langserver {
if executable('golangci-lint-langserver')
  au User lsp_setup call lsp#register_server({
      \ 'name': 'golangci-lint-langserver',
      \ 'cmd': {server_info->['golangci-lint-langserver']},
      \ 'initialization_options': {'command': ['golangci-lint', 'run', '--enable-all', '--disable', 'lll', '--out-format', 'json', '--issues-exit-code=1']},
      \ 'whitelist': ['go'],
      \ })
endif
" }


" rust-analyzer {
if executable('rustup')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rust-analyzer',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rust-analyzer']},
        \ 'allowlist': ['rust'],
        \ })
endif
" }

" yaml-language-server {
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
" }

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
" --------------------------------------------------------------------