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

" 自动更新文件的最后更新时间
function! AutoUpdateTheLastUpdateInfo()
	let s:original_pos = getpos(".")
	let s:regexp = "# last modified : "
	let s:lu = search(s:regexp)
	if s:lu != 0
		let s:update_str = matchstr(getline(s:lu), s:regexp)
		call setline(s:lu, s:update_str . strftime("%Y-%m-%d %H:%M:%S"))
		call setpos(".", s:original_pos)
	endif
endfunction

" fileHead 设置
autocmd BufNewFile *.sh,*.py,*.go exec ":call AutoSetFileHead()"

" 更新最后修改时间
autocmd InsertLeave *.{py,c,js,css},*vimrc call AutoUpdateTheLastUpdateInfo()

