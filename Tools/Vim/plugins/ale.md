### 插件地址：

[dense-analysis/ale](https://github.com/dense-analysis/ale)

### 简单介绍

代码检查插件，如 python 的 flake8、pycodestyle 等，但是需要注意的是，如果和下面的插件一起用的话，会出现两个结果，且两个结果相同，因为`rhysd/vim-lsp-ale`是调用了 `ale` 的，但是自己又输出了一份，要么想办法解决双结果的问题，要么直接禁用`vim-lsp-ale`，差别个人感觉是 `vim-lsp-ale` 的结果是 `ale` 加配置后的结果，可读性更好，但是 `ale` 可以也可以实现，所以有点困惑这个插件的初衷是什么。

支持多种语言的多种工具，同种语言的多种语言联合增强使用也是可以的

可以指定要使用的 linter，以及 linter 在设备上的地址，就可以不用配置环境变量了

支持多种 fixer，格式化插件，引入的模块调整，去除空行，行尾空格等，这样就是不用新增插件 `vim-autoformat`、`vim-trailing-whitespace`。

目前看到还支持补全和很多 lsp 的功能，是否替换掉`vim-lsp`有空再仔细对比看看。

通过打开文件后使用 `ALEInfo` 查看该文件类型可以使用的 linter，开启的 linter 等配置信息。但是一个方法比较麻烦如果是想要配置多种文件，官方文案中把 linter 和 fixer 一起写了，虽有说明，但是难免混淆，而且 fixer 中有特有的功能，这里指明下自己找到的捷径。linter 去 `ale/tree/ale_linters` 目录中查找，其中的子文件夹比如 python ，go 是按照语言命令的，里面的文件是各个 linter 的调用脚本，其名字也是 linter 名，而 fixer 的在 `ale/autoload/ale/fix/registry.vim` 文件中，搜索 `suggested_filetypes`，后面的列表里就是适用的文件类型即支持的语言，有的工具是支持多种语言的，这样配置时减少安装次数也更方便。

### 功能介绍
在此之前先看个图
![视图页面介绍](./images/79i13ygewcl81.webp)

如图中所视按照功能划分为 5 个板块：
    
    1. location list
    2. command window
    3. signs
    4. statusline
    5. balloon

1. float window
    从图中可以看到，当屏幕长度不够，后续的显示就变成了 `...`, 使得无法了解到详细的异常信息，而如果在 command line 中查看，有多个异常结果，但是只显示一个，显然也是不对的。
    回去看了下好像是很早之前就有这个实现了，但是一直没发现，视频不多而且都没有这个效果，最先了解到还是在 nvim 中发现这样的实现，以为是 nvim 独有的。之前 ale 好像默认是不开启的，因为查资料看到有人问自己的配置为什么不能实现那样的效果，自己也是早早就安装了 ale，这次是新换了系统，对配置未修改只是更新了一下插件，打开就默认有这种效果了。
2. location list
    在命令行中执行`ALEPopulateLocList` 即可开启 location list，里面有所有的检查结果，而且无论是异常信息过长还是一行多个异常结果，都有详细的信息，而且是一行一条信息。
    虽然文档说可以通过设置`let g:ale_set_loclist = 0`实现自动开启，但我这样去试了并没有成功。
3. signs
    简单的标志提示，只能直到该行的最高级别的异常类型，是错误还是不符合规范等。
    默认开启，但是图标的样子可更换，下面的参数可设置
    `let g:ale_sign_error = '>>'`
    `let g:ale_sign_warning = '--'`
4. statusline
    这个看具体的插件，如果使用的是`airline`，会分别给出异常、错误的起始行。
    如果是使用`airline`，需要开启其服务`let g:airline#extensions#ale#enabled = 1`
5. balloon
    以一个气球弹窗的形式去显示异常，但也只显示一个。
6. 默认关闭，`let g:ale_set_balloons = 1`开启

### 可选参数详解

    g:ale_enabled = 1 " 是否开启插件服务
    g:ale_maximum_file_size  " Default: not set ，ALE 检查的最大文件大小（以字节为单位
    
    " ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    " shell
    
    g:ale_shell            " Default: not set ,设置执行命令的 shell 工具， bash，fish 等
    g:ale_shell_arguments  " Default: not set ,使用的 shell 使用的参数，没有实际例子，不太明白
    " --------------------------------------------------------------------
    
    
    " ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    " statusline
    
    g:airline#extensions#ale#enabled  " Default: `1` ，需要 airline 插件支持
    " --------------------------------------------------------------------
    
    
    " ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    " sign
    
    g:ale_change_sign_column_color = 0  " 为 1 时，可以和`ale_sign_column_always` 结合使用
    
    g:ale_sign_column_always       = 0  " Default: `0`，异常标签会在异常被修复后显示，设置为 `1` 则会一直存在
    
    g:ale_sign_priority            = 30 " sign 列使用优先级，如果有其他插件也使用则会显示优先级最高的
    
    g:ale_set_signs                = 1     " 是否启用 sign 处理进程，默认开启，开启后下面的选项的设置才有意义
    g:ale_sign_warning             = '--'  " 警告信息的标志设置
    g:ale_sign_error               = `>>`  " 异常信息的标志设置
    g:ale_sign_info                        " Default: `g:ale_sign_warning`"
    g:ale_sign_style_error                 " Default: `g:ale_sign_error`
    g:ale_sign_style_warning               " Default: `g:ale_sign_warning`
    
    g:ale_max_signs = -1
    " 设置为 0 时，sign 会在后台处理但结果不再显示出来；
    " 正整数将最多显示该数量的 sign;
    " 其他的数则不会进行数量限制（包括默认值 -1）
    
    g:ale_sign_offset              = 1000000
    " 偏移量，当两个插件都会使用 sign 时，可以通过调节偏移量，让两个 sign 同时显示而不会冲突
    
    g:ale_sign_highlight_linenrs = 0  " 是否高亮 sign 存在的行
    " --------------------------------------------------------------------
    
    " ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    " location list
    
    g:ale_set_loclist = 1
    " 默认在打开文件时开启该服务，也可以设为 0 ，在需要的 buffer 中以命令 `ALEPopulateLocList` 开启
    
    g:ale_open_list             = 0   " 设置为 1 ，会在打开文件后自动打开 local list 窗口
    g:ale_keep_list_window_open = 0   " 设置为 1 ，当所有的错误异常被消除后仍然保持窗口的开启，不进行关闭
    g:ale_list_window_size      = 10  " local list 的窗口高度设置
    g:ale_list_vertical         = 0   " 设置为 1 时窗口将会以垂直方式打开窗口
    g:ale_loclist_msg_format  " local list 的输出格式，默认和 `ale_echo_msg_format` 的输出格式相同
    " --------------------------------------------------------------------
    
    
    " ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    virtualtext
    
    g:ale_virtualtext_cursor   = 'all'
    `'all'`, `'2'`, or `2`         - Show problems for all lines.
    `'current'`, `'1'`, or `1`     - Show problems for the current line.
    `'disabled'`, `'0'`, or `0`    - Do not show problems with virtual-text.
    
    g:ale_virtualtext_delay    = 10
    g:ale_virtualtext_prefix   = '%comment% %type%: '
    g:ale_virtualenv_dir_names = ['.env', '.venv', 'env', 've-py3', 've', 'virtualenv', 'venv']
    " --------------------------------------------------------------------
    
    
    " ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    " command line (echo line)
    
    g:ale_echo_cursor           = 1             " 跟随关闭信息更新
    g:ale_echo_delay            = 10            " 输出延迟
    g:ale_echo_msg_error_str    = 'Error'       " 错误提示标志
    g:ale_echo_msg_format       = '%code: %%s'  " 输出结果格式
    g:ale_echo_msg_info_str     = 'Info'        " 信息提示标志
    g:ale_echo_msg_log_str      = 'Log'         " 日志提示标志
    g:ale_echo_msg_warning_str  = 'Warning'     " 警告提示标志
    " --------------------------------------------------------------------
    
    " ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    " popupwin
    
    g:ale_floating_preview = 0
    " 是否开启浮动预览，需要 `ale_cursor_detail` 是开启状态
    
    let g:ale_detail_to_floating_preview = 0
    "  设置为 1 ，效果同 `g:ale_detail_to_floating_preview = 1`
    
    g:ale_floating_window_border = ['|', '-', '+', '+', '+', '+', '|', '-']
    " 为浮动预览窗口的信息周围添加环绕填充字符，让其像一个显式方框
    
    g:ale_close_preview_on_insert = 0
    " 默认情况下当进入插入模式后，preview-window 、popupwin 会自动关闭
    " 设置为 1 ，进入插入模式但光标未移动、内容未增删，popupwin 会保持预览窗口，有变化则自动关闭（因为 popupwin   是在当前光标的附近，一直存在会干扰输入），而 preview-window 是独立其外的窗口，会一直存在
    
    let g:ale_floating_preview_popup_opts
    "  需要开启`ale_floating_preview` "
    
    " g:ale_hover_cursor = 1
    " g:ale_hover_to_preview = 1
    " g:ale_hover_to_floating_preview = 1
     " 这三个参没试出效果，后续再研究研究
    " --------------------------------------------------------------------
    
    
    " ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    " ale preview window
    " 跟随光标的信息显示
    
    g:ale_cursor_detail = 0
    " 是否开启预览窗口，设置为 1 时，当’光标移动到异常行时会自动弹出详情窗口
    " --------------------------------------------------------------------
    
    " ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    " balloon
    " 跟随鼠标焦点的信息显示
    
    g:ale_set_balloons = has('balloon_eval') && has('gui_running')
    " 设置为 1 时，会悬浮显示信息
    
    g:ale_set_balloons_legacy_echo  " Default: not set，用于在旧版本中开启 balloons
    " --------------------------------------------------------------------
    
    
    " ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    " fix
    g:ale_set_quickfix       = 0   " 开启修复功能
    g:ale_fixers             = {}  " 指定使用的修复工具
    g:ale_fix_on_save        = 0   " 在保存时自动修复
    g:ale_fix_on_save_ignore = {}  " 在自动保存时不使用一些工具
    
    g:ale_warn_about_trailing_blank_lines = 1  " 显示有多余空行的警告信息
    g:ale_warn_about_trailing_whitespace  = 1  " 显示行尾有多余空格的警告信息
    " --------------------------------------------------------------------
    
    
    " ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    " linter
    
    g:ale_linters          = {} "
    g:ale_linters_explicit = 1  "
    g:ale_linters_ignore   = {} "
    
    g:ale_lint_delay               = 200  " 文本改动后实施检查的间隔时间
    g:ale_lint_on_enter            = 1    " 在回车后检查
    g:ale_lint_on_filetype_changed = 1    " 在文件类型
    g:ale_lint_on_save             = 1    " 在文件保存后检查
    g:ale_lint_on_text_changed     = 'normal'  "
    g:ale_lint_on_insert_leave     = 1    " 在退出插入模式后检查
    g:ale_linter_aliases           = {}
    " --------------------------------------------------------------------
    
    
    
    
    " ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    " complete
    
    g:ale_completion_delay                    = 100   " 延迟
    g:ale_completion_enabled                  = 0     " 是否开启补全
    g:ale_completion_tsserver_remove_warnings = 0     " 设置为 1 时 排除警告
    g:ale_completion_autoimport               = 1     " 自动引入开关
    g:ale_completion_excluded_words           = []    "
    g:ale_completion_symbols                  = {}    "
    g:ale_completion_max_suggestions          = 50
    " --------------------------------------------------------------------
    
    
    
    
    " ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    " others
    " 包括一些没弄明白或者一般不会用到的配置
    g:ale_disable_lsp               = 0  " 禁用 LSP linters 和 `tsserver`
    g:ale_lsp_show_message_format   = '%severity%:%linter%: %s'  " 此变量定义从 LSP 收到的消息的格式
    g:ale_lsp_show_message_severity = 'error'  " 此变量定义 LSP 消息需要显示的最低级别
    g:ale_lsp_suggestions           = 0
    " 如果设置为 `1` ，则显示来自 LSP 或 tsserver 的提示建议，除了警告和错误
    
    g:ale_root
    g:ale_filename_mappings
    
    g:ale_pattern_options
    g:ale_pattern_options_enabled
    
    g:ale_popup_menu_enabled
    g:ale_rename_tsserver_find_in_comments
    g:ale_rename_tsserver_find_in_strings
    
    g:ale_update_tagstack
    g:ale_command_wrapper
    g:ale_default_navigation
    g:ale_use_neovim_diagnostics_api
    g:ale_use_global_executables
    
    g:ale_type_map
    
    g:ale_set_highlights
    
    g:ale_history_enabled
    g:ale_history_log_output
    g:ale_max_buffer_history_size
    
    g:ale_cache_executable_check_failures
    " Default: not set，默认只缓存成功的，设置为 `1`，失败的也会缓存
    " TODO 这有点疑惑，executable checks 和 failing executable 不知道指的什么
    
    g:ale_exclude_highlights = []
    " 用于匹配要删除的突出显示消息的正则表达式列表
    
    
    g:ale_windows_node_executable_path
    g:ale_alex_executable
    g:ale_alex_use_global
    g:ale_cspell_executable
    g:ale_cspell_options
    g:ale_cspell_use_global
    g:ale_dprint_executable
    g:ale_dprint_config
    g:ale_dprint_options
    g:ale_dprint_use_global
    g:ale_languagetool_executable
    g:ale_languagetool_options
    g:ale_writegood_executable
    g:ale_writegood_options
    g:ale_writegood_use_global
    g:ale_want_results_buffer
    " --------------------------------------------------------------------






Todo
图片需要换成自己的图片，内容也还没有写完全

后续验证这几个建议
CtrlP 性能差的要死 (虽然后面也支持了异步模式)，建议用 leaderf、fzf.vim、denite 替代。
Airline 中规中距，要是追求速度可用 lightline。
Ale 倒没啥问题，作为一款 lint 插件很是优秀，不过更推荐使用 LSP 提供的语法检查。
