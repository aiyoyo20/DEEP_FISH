原来使用的单配置文件 ".vimrc" ，但是随着使用时间的增加，为了更方便，添加了越来越对的插件和配置，整个文件的代码量已经很大了，几百行，虽然自己做了文件内内容分类，并且使用了比较醒目的块注释来区分各板块，在需要修改的时候仍然还是费劲。所以进行了简单的模块化处理。

主板块有三部分。

    init.vim ： 基本配置（非插件配置）、自己定义的一些函数、一些自动完成命令（退出自动保存、自动格式化文件的调用等）
    plugin ： 插件设置
    plugins ： 详细的插件设置，一些配置文件较多的单独出来。其他的一些如快速注释、插入文档模板等小工具合为一个。
        单独插件配置：
            ctrlp.vim
            rainbow.vim
            vista.vim
            nerdtree.vim
            indentLine.vim
            airline.vim
            whichKey.vim
        主题配色：
            color.vim
        编程相关：
            code.vim
            markdown.vim
            vim-lsp.vim  主要是 vim-lsp 插件的配置项
        工具集合：
            tools.vim

    mappings ： 快捷键设置。[后期使用 vim-which-key 管理快捷键管理，留着做保留项]
    .vimrc : 原来的集合配置，保留项


暂时先这样，够用了，后续有其他的再更新。

