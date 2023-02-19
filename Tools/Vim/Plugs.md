对使用的插件做一个更详细的说明，配置文件里面只备注了简单的用处，有些可能用到的配置，不用的插件，相类似的插件为何选择其中一个都没有说。

	'vim-airline/vim-airline'
	'vim-airline/vim-airline-themes'
        一个强大的信息栏和其主题


    'prabirshrestha/async.vim'
	'prabirshrestha/asyncomplete.vim'

	'prabirshrestha/asyncomplete-file.vim'  "
	    对文件路径的提示补全

	'dense-analysis/ale'
	    代码检查插件，如 python 的 flake8、pycodestyle 等，但是需要注意的是，如果和下面的插件一起用的话，会出现两个结果，且两个结果相同，因为`rhysd/vim-lsp-ale`是调用了 `ale` 的，但是自己又输出了一份，要么想办法解决双结果的问题，要么直接禁用`vim-lsp-ale`，差别个人感觉是 `vim-lsp-ale` 的结果是 `ale` 加配置后的结果，可读性更好，但是 `ale` 可以也可以实现，所以有点困惑这个插件的初衷是什么。

        支持多种语言的多种工具，同种语言的多种语言联合增强使用也是可以的

        可以指定要使用的 linter，以及 linter 在设备上的地址，就可以不用配置环境变量了

        支持多种 fixer，格式化插件，引入的模块调整，去除空行，行尾空格等，这样就是不用新增插件 `vim-autoformat`、`vim-trailing-whitespace`。

        目前看到还支持补全和很多 lsp 的功能，是否替换掉`vim-lsp`有空再仔细对比看看。

        通过打开文件后使用`ALEInfo`查看该文件类型可以使用的 linter，开启的 linter 等配置信息。但是一个方法比较麻烦如果是想要配置多种文件，官方文案中把 linter 和 fixer 一起写了，虽有说明，但是难免混淆，而且 fixer 中有特有的功能，这里指明下自己找到的捷径。linter 去`ale/tree/ale_linters`目录中查找，其中的子文件夹比如 python ，go 是按照语言命令的，里面的文件是各个 linter 的调用脚本，其名字也是 linter 名，而 fixer 的在`ale/autoload/ale/fix/registry.vim`文件中，搜索`suggested_filetypes`，后面的列表里就是适用的文件类型即支持的语言，有的工具是支持多种语言的，这样配置时减少安装次数也更方便。

	'rhysd/vim-lsp-ale'
        这个插件怎么说呢， ale 本身提供了检查的功能，这个插件感觉是是格式化 ale 的结果后再输出一次，反而会造成出现两个结果的问题，目前已经停用了

	'rafamadriz/friendly-snippets'
	'hrsh7th/vim-vsnip'
	'hrsh7th/vim-vsnip-integ'
	    语法片段补增强补全插件，三个需要联合使用，`friendly-snippets` 可选，也可以自己定义能够把内容集合到补全里面进行选择

        使用 LSP ,并没有提供支持格式化代码的功能，但是我们了解到一些比较好的规范并希望去遵循这些规范，这个插件的格式化程序较为全面，可以用作 lsp-format 的补充。

        这个插件还提供了去除行尾空格的功能，但好像不能高亮如果不需要高亮，可以替代`vim-trailing-whitespace` 插件


	'morhetz/gruvbox'
	    主题

	'mhinz/vim-startify'
	    一个可以在启动 vim 但是没有打开文件的时候在起始页显示一些信息，如历史打开文件，一个像素化的图等。

	'kien/ctrlp.vim'
	    文件搜索

	'Yggdroot/indentLine'
	    可视化缩进

	'dkarter/bullets.vim'  " automated bullet lists
	'iamcco/mathjax-support-for-mkdp'
	'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
        可在浏览器中预览 markdown 渲染结果，也是该作者对 markdown 预览的新插件，相较于老版本，感觉更快。而且老版本会因为文本太多而导致预览卡住，新版本没有这个问题

	'jistr/vim-nerdtree-tabs'
        可以使 nerdtree Tab 标签的名称更友好些

	'scrooloose/nerdtree'
        用来提供一个导航目录的侧边栏

	'kien/rainbow_parentheses.vim'
        括号匹配高亮,不同括号显示不同颜色

	'jiangmiao/auto-pairs'
	    自动补全括号的插件，包括小括号，中括号，以及花括号

	'godlygeek/tabular'
        文本对齐插件，如文本的根据 `=` 对齐，根据 `|` 对齐等等

	'Chiel92/vim-autoformat'
	    代码格式化插件

        同样也支持删除行尾空格，替换掉了`vim-trailing-whitespace`，后面了解到 `ale` 都有这些功能，而且默认是自动删除，就停止使用该插件了

    'bronson/vim-trailing-whitespace'
	    尾部空格高亮，删除

        暂时放弃了这个插件，使用 `vim-autoformat` 中类似的命令去删除行尾空格，并且实际中没有什么会特意在行尾增加空格，直接写成自动化命令，在保存的时候自取去执行命令，有就直接删除，没有也不影响，并且不使用这个插件还可以避免与 `vim-trailing-whitespace` 的冲突

	'joom/vim-commentary'
	    快速注释

        有另一个插件`preservim/nerdcommenter`也是快速注释，看文档提供了更多的注释方式，但是个人并不需要这么多，只需要一个轻量的注释插件能够注释和取消注释即可

	'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }
        在 python 文件中为函数插入函数文档，可修改风格

    'kkoomen/vim-doge'
        同样是代码文档插入插件，但是支持的语言更多，目前没有 go，有 python ，js等

        就针对 python 来说，速度有明显的延迟，安装的时候其插件的依赖是 npm 安装的，还涉及到编译，所以会比较麻烦，但能使用多种规范，这点不错，并且补全文档属于后期工作了，效率要求并不高，再使用一段时间再决定是否完全替换 vim-pydocstring

	'lilydjwg/fcitx.vim'
	    需要 fcitx 或 fcitx5 支持，新版本拓展到了其他输入法框架，如果使用 fcitx 系列需要特别开启某配置

	    没有使用 fcitx 系列的话使用这个插件有个问题，无法很好使用 python 的虚拟环境，大概原因是会调用本地的一个库，这个库是系统集成的，切换虚拟环境的话就找不着这个库，启动的时候报错。目前没有配置去指定该库的路径。

	    作用是在 vim 中不用费心于中英文的切换，比如在退出的时候需要输入命令`:q`，如果这时候是中文输入法就不行，必须是英文的。这时候就希望有个工具，确保在 normal 模式时是英文输入法。

	'prabirshrestha/vim-lsp'
	'prabirshrestha/asyncomplete-lsp.vim'
        为 lsp 提供补全等支持

	'liuchengxu/vista.vim'
        函数、变量标签栏


	'liuchengxu/vim-which-key',{ 'on': ['WhichKey', 'WhichKey!'] }

	    带提示的快捷键系统。自从使用了 SpaceVim，体验了其快捷键系统后就一直念念不忘，甚至想定制一个自己的，但是去看了下它的实现，因为不了解 VimScript 也懒于学习，就给鸽了。

	    直到发现这个插件，但是有点小问题，和我使用的另一款插件 `vim-trailing-whitespace` 有一些冲突。

	    这个问题起始花了不少时间，因为其表面呈现的是列表的形式，但是出现异常的是最后行的行尾。正常来说是把视觉上的一行当作实际文本的一行。正是这个误区困扰了很久。实际不是，是一个单行列表可能每一个单元的布局是`填充空格 + key：value + 填充空格`。

	    而 `vim-trailing-whitespace` 插件默认会高亮行尾多余空格，所以最后拖着个尾巴。
