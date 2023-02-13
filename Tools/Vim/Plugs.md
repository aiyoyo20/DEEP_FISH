对使用的插件做一个更详细的说明，配置文件里面只备注了简单的用处，有些可能用到的配置，不用的插件，想类似的插件为何选择某都没有说。

标题名是文件名，里面是该文件包括的插件。有类似功能的为一组，或者插件配置多的就单插件单配置，强制一插件一配置有点多余了，而且分类管理起来也方便，有的插件就好几个联合使用才有效果的，分开反而要备注。

比较特殊的是`markdown.vim`，因为其本身不需要太多配置，像代码检查，格式校对等常规编程语言的要求并没有强制型要求，当然也有一些规范，但基本都是个人去维护，怎么方便怎么来吧，且都会被加载成 html 页面的样子。但可拓展性，比如公式等功能可通过插件实现，就单文件了。

### airline.vim:

	'vim-airline/vim-airline'
	'vim-airline/vim-airline-themes'

### code.vim

	'prabirshrestha/async.vim'

	'prabirshrestha/asyncomplete.vim'

	'prabirshrestha/asyncomplete-file.vim'  "
	对文件路径的提示补全

	'dense-analysis/ale'
	代码检查插件，如 python 的 flake8、pycodestyle 等，但是需要注意的是，如果和下面的插件一起用的话，会出现两个结果，且两个结果相同，因为`rhysd/vim-lsp-ale`是调用了 `ale` 的，但是自己又输出了一份，要么想办法解决双结果的问题，要么直接禁用`vim-lsp-ale`，差别个人感觉是 `vim-lsp-ale` 的结果是 `ale` 加配置后的结果，可读性更好，但是 `ale` 可以也可以实现，所以有点困惑这个插件的初衷是什么。
	" Plug 'rhysd/vim-lsp-ale'

	'rafamadriz/friendly-snippets'
	'hrsh7th/vim-vsnip'
	'hrsh7th/vim-vsnip-integ'
	" 语法片段补增强补全插件，三个需要联合使用，`friendly-snippets` 可选，也可以自己定义能够把内容集合到补全里面进行选择

	'Chiel92/vim-autoformat'
	代码格式化插件
    使用 LSP ,并没有提供支持格式化代码的功能，但是我们了解到一些比较好的规范并希望去遵循这些规范，这个插件的格式化程序较为全面，可以用作 lsp-format 的补充。

### color.vim

	'morhetz/gruvbox'
	主题

	'mhinz/vim-startify'
	一个可以在启动 vim 但是没有打开文件的时候在起始页显示一些信息，如历史打开文件，一个像素化的图等。

### ctrlp.vim

	'kien/ctrlp.vim'
	文件搜索

### indentLine.vim

	'Yggdroot/indentLine'
	可视化缩进

#### markdown.vim

	'dkarter/bullets.vim'  " automated bullet lists
	'iamcco/mathjax-support-for-mkdp'
	'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
    可在浏览器中预览 markdown 渲染结果，也是该作者对 markdown 预览的新插件，相较于老版本，感觉更快。而且老版本会因为文本太多而导致预览卡住，新版本没有这个问题

### nerdtree.vim

	'jistr/vim-nerdtree-tabs'
    可以使 nerdtree Tab 标签的名称更友好些

	'scrooloose/nerdtree'
    用来提供一个导航目录的侧边栏

### rainbow.vim

	'kien/rainbow_parentheses.vim'
    括号匹配高亮,不同括号显示不同颜色

### tools.vim

	'jiangmiao/auto-pairs'
	自动补全括号的插件，包括小括号，中括号，以及花括号

	'godlygeek/tabular'
    文本对齐插件，如文本的根据 `=` 对齐，根据 `|` 对齐等等

	'bronson/vim-trailing-whitespace'
	尾部空格高亮，删除
    暂时放弃了这个插件，使用 `vim-autoformat` 中类似的命令去删除行尾空格，并且实际中没有什么会特意在行尾增加空格，直接写成自动化命令，在保存的时候自取去执行命令，有就直接删除，没有也不影响，并且不使用这个插件还可以避免与 `vim-trailing-whitespace` 的冲突

	'joom/vim-commentary'
	快速注释
    有另一个插件`preservim/nerdcommenter`也是快速注释，看文档提供了更多的注释方式，但是个人并不需要这么多，只需要一个轻量的注释插件能够注释和取消注释即可

	'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }
    在 python 文件中为函数插入函数文档，可修改风格

	'lilydjwg/fcitx.vim'
	需要 fcitx 或 fcitx5 支持，新版本拓展到了其他输入法框架，如果使用 fcitx 系列需要特别开启某配置
	没有使用 fcitx 系列的话使用这个插件有个问题，无法很好使用 python 的虚拟环境，大概原因是会调用本地的一个库，这个库是系统集成的，切换虚拟环境的话就找不着这个库，启动的时候报错。目前没有配置去指定该库的路径。

	作用是在 vim 中不用费心于中英文的切换，比如在退出的时候需要输入命令`:q`，如果这时候是中文输入法就不行，必须是英文的。这时候就希望有个工具，确保在 normal 模式时是英文输入法。

### vim-lsp.vim

	'prabirshrestha/vim-lsp'
	'prabirshrestha/asyncomplete-lsp.vim'

### vista.vim:

	'liuchengxu/vista.vim'

### whichKey.vim

	'liuchengxu/vim-which-key',{ 'on': ['WhichKey', 'WhichKey!'] }

	带提示的快捷键系统。自从使用了 SpaceVim，体验了其快捷键系统后就一直念念不忘，甚至想定制一个自己的，但是去看了下它的实现，因为不了解 VimScript 也懒于学习，就给鸽了。

	直到发现这个插件，但是有点小问题，和我使用的另一款插件 `vim-trailing-whitespace` 有一些冲突。

	这个问题起始花了不少时间，因为其表面呈现的是列表的形式，但是出现异常的是最后行的行尾。正常来说是把视觉上的一行当作实际文本的一行。正是这个误区困扰了很久。实际不是，是一个单行列表可能每一个单元的布局是`填充空格 + key：value + 填充空格`。

	而 `vim-trailing-whitespace` 插件默认会高亮行尾多余空格，所以最后拖着个尾巴。
