
# Vim
## 安装
win：gvim
没有去window下折腾的想法，比较麻烦，但还是放一个介绍安装的[网址](https://zhuanlan.zhihu.com/p/64856646)吧，如果挂了网上找找，很多的

linux：  
manjaro下安装`yay -S vim` or `sudo pacman -S vim`

mac：  
 自带了，升级`brew install vim --with-lua --with-override-system-vi`
 方法也挺多样的，从源码编译，覆盖安装，保留版本安装都有，自行搜索

## 配置
不知道是版本的问题还是系统的问题，~/下没有.vim文件夹， 也没有.vimrc文件，无奈只能自己创建
.vim主要用于插件或者主题等文件，.vimrc是写入配置，读取.vim里面的文件

新建补齐没有的文件夹以及文件
```
mkdir ~/.vim
mkdir ~/.vim/autoload
touch ~/.vimrc
```

## 插件
### 包管理器
#### vim_plug
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
我的安装失败
![](vim_error.png)

所以通过浏览器打开https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim保存为plug.vim文件后复制到~/.vim/autoload下
#### vundle

### NERDTree
这个插件是几乎所有研发人员都会安装的一个插件——目录树，可以支持在不退出vim的编辑器的前提下，在文件中快速切换，同时能让开发人员快速掌握项目目录结构，是提升开发效率必不可少的工具。


```Plug 'preservim/nerdtree'```
NERDTree默认无须配置即可直接使用，当然更改部分映射后，可以使得目录树试用起来更加得心应手。最常见的配置在~/.vimrc添加如下命令，即可使用Ctrl+n快速开启目录树。

```
map <C-n> :NERDTreeToggle<CR>
```
### auto-pairs

这个就是插件的功能简单而实用：在输入/删除左括号时，能自动补上/删除右括号。
1.安装

Plug 'jiangmiao/auto-pairs'

2.使用

开箱即用的插件，无需过多的配置。
`au Filetype FILETYPE let b:AutoPairs = {"(": ")"}au FileType php      let b:AutoPairs = AutoPairsDefine({'<?' : '?>', '<?php': '?>'})`

-----

# NeoVim


github项目：[https://github.com/neovim/neovim/releases](https://github.com/neovim/neovim/releases)
官网：[https://neovim.io/](https://neovim.io/)



目前没有去使用过Nvim,但是根据看到的资料，很多人在对比其两个软件。

对于nvim来说，代码更简洁，后期的维护会方便很多，新增的各种语言的接口为一些想要为其提供插件的作者有了更多的选择，而不是去学习制作nvim的语言，插件的增加可以使得这个软件更加方便和人性化，现在的大多数人就目前的版本来说nvim的口碑会更好一些，不可否认的是nvim引入了很多新的东西，做了一些很大胆的尝试，也有不完善的地方，但是它还很年轻，未来可期

后期vim作者也感受到了压力，接受了更多的建议，使得其发展逐渐跟上时代的发展




# Vim 和 Neovim 的前世今生

<div class="post-content">
      <h1 id="引子"><a href="#引子" class="headerlink anchor"><i class="iconfont icon-link"></i></a>引子</h1>
<p>从完全使用 <a href="https://neovim.io/">Neovim</a> 进行日常<a href="https://jdhao.github.io/2018/12/24/centos_nvim_install_use_guide_en/">代码开发</a>与<a href="https://jdhao.github.io/2019/01/15/markdown_edit_preview_nvim/">文档编写</a>到现在，已经过去了大约一年半的时间，一年半以前，我对 Vim 的了解还处在非常初级的阶段，经过长时间的<a href="https://jdhao.github.io/categories/Nvim/">使用与学习</a>，已经达到了熟练使用的程度。当然，Vim 的知识过于庞大，即便我已经使用了一年半的时间，还有很多 Vim/Neovim 的特性或者知识仍然有待了解与发掘。</p>
<p>在使用 Neovim 的过程中，我对 Neovim 和 Vim 的历史以及它们之间的<em>恩怨情仇</em>也产生了兴趣，散布在互联网上各处的博客、视频以及论坛讨论让我对过去的历史有了一定了解。</p>
<h1 id="vim-的历史"><a href="[[vim]]-的历史" class="headerlink anchor"><i class="iconfont icon-link"></i></a>Vim 的历史</h1>
<p>想要了解 Vim 的历史，一个很好的资料是 Vim 创始人 <a href="https://en.wikipedia.org/wiki/Bram_Moolenaar">Bram Moolenaar</a> 在 VimConf<sup id="fnref:1"><a href="[[fn]]:1" class="footnote-ref" role="doc-noteref">1</a></sup> 2018 上的专题演讲，他在演讲中回顾了 Vim 的发展以及 Vim 即将添加的一些新特性。出于兴趣，我把他的 <a href="https://www.youtube.com/watch?v=ES1L2SPgIDI">原始演讲视频</a> 从 YouTube 上扒了下来，添加了英文字幕，<a href="https://www.bilibili.com/video/av79242778">上传到了 B 站</a>。另外一个很好的视频是 Bram 在 <a href="https://www.youtube.com/watch?v=ayc_qpB-93o">Vim 25 周年活动上发表的演讲</a>。</p>
<p>简单来说，Vim 于 1991 年由 Bram 发布，最初 Vim 模仿了 <a href="https://en.wikipedia.org/wiki/Vi">Vi 编辑器</a>的特性，后面加以扩展，逐步添加了很多新功能。今年距离 Vim 首次发布已经快要 30 年了，Vim 这个强大的编辑器仍然在<a href="https://github.com/vim/vim/commits/master">不断更新</a>，并且被许多人所使用和讨论，这也从侧面说明了 Vim 的魅力 (Vim 被网友们尊称为<a href="https://www.google.com/search?q=vim+%E7%BC%96%E8%BE%91%E5%99%A8%E4%B9%8B%E7%A5%9E&amp;oq=vim+%E7%BC%96%E8%BE%91%E5%99%A8%E4%B9%8B%E7%A5%9E&amp;aqs=chrome..69i57.8927j0j4&amp;sourceid=chrome&amp;ie=UTF-8">「编辑器之神」</a>)。刚开始，Vim 完全由 Bram 独立开发维护，后来有开发者不断加入 Vim 的开发，并把 Vim 移植到了不同的系统平台上。有一段时间，Bram 甚至辞去了工作，全力投入到 Vim 的开发中，靠着网友的捐助维持基本生活。2006 年 Bram 加入了 Google 位于苏黎世的分部，Google 出于对 Bram 的尊重以及对开源文化的认同，同意 Bram 每周可以花 20% 的工作时间用于和 Vim 相关的工作，谷歌真是一家开明的公司。</p>
<h1 id="vim-开发模式与弊端"><a href="[[vim]]-开发模式与弊端" class="headerlink anchor"><i class="iconfont icon-link"></i></a>Vim 开发模式与弊端</h1>
<p>Vim 最初开发的年代，虽然已经兴起了<a href="https://en.wikipedia.org/wiki/Open-source-software_movement">开源运动</a>，例如大名鼎鼎的 <a href="https://en.wikipedia.org/wiki/GNU">GNU</a> 项目，但是开源项目的组织与运行还不像现在这样方便，Git 和 GitHub 要在十几年后才会出现。其他开发者向 Bram 贡献 Vim 源代码的方式是通过邮件，向 Bram 提交 <a href="https://en.wikipedia.org/wiki/Patch_(computing)">patch</a>，如果 Bram 觉得这个 patch 不错，就会把 patch 加入到 Vim 的源代码中。20 多年过去了，开源项目的协作方式由于 <a href="https://git-scm.com/">Git</a> 和 GitHub 的出现发生很大变化。很多顶级开源项目都选择使用 GitHub 进行代码的开发和管理，开发者通过 Git 提交 pull request 方式贡献自己的代码，如果项目的维护者觉得代码的质量 OK，就会合并这个请求，将代码并入主线代码中。</p>
<h2 id="是否可持续发展的隐忧"><a href="#是否可持续发展的隐忧" class="headerlink anchor"><i class="iconfont icon-link"></i></a>是否可持续发展的隐忧</h2>
<p>Vim 代码曾托管在 <a href="https://code.google.com/archive/">Google Code</a>，随着 Google Code 于 2015 年关闭，Vim 源代码被<a href="https://www.vim.org/movetogithub.php">迁移到 GitHub</a>。虽然表面上看起来 Vim 的开发模式遵循了开源项目的范式，实际上并不是，因为 Vim 并没有采用 GitHub pull request 的方式。关于 Vim 开发相关的讨论，都在 <a href="https://groups.google.com/forum/#!forum/vim_dev">vim-dev</a> 进行，开发者仍然要向 Bram 提交 patch，如果 patch 通过，再由 Bram 本人提交到 GitHub 上<sup id="fnref:2"><a href="[[fn]]:2" class="footnote-ref" role="doc-noteref">2</a></sup>，和之前的开发方式并没有本质区别。所以 Vim 虽然看起来也有很多贡献者，但是只有 Bram 才有权力决定什么代码可以合并入 Vim，什么样的代码不行。Bram 对于添加新功能非常谨慎，导致之前有很多开发者提交的 patch 都没有被合并，引起了一些开发者对 Vim 开发模式的不满。这也引发了很多人对 Vim 项目未来能否可持续发展的<a href="https://joshtronic.com/2018/08/12/will-vim-die-with-bram-moolenaar/">担忧</a>，当 Bram 去世以后，Vim 的未来会怎样？甚至 Bram 本人在采访中被问到，如何确保 Vim 项目可持续发展，他的回答是</p>
<blockquote>
<p>Keep me alive.</p>
</blockquote>
<p>不知是开玩笑，还是他真正想法如此？也正是因为 Bram 的这种对新功能的「审慎」态度，Vim 7.0 版本于 2006 发布，一直到了<a href="https://www.linuxbabe.com/vim/install-vim-8-0-debian-ubuntu-linux-mint-fedora-centos-arch-linux">十年之后的 2016 年</a>，Vim 才发布了有重大更新的 8.0 版本，增加了开发者期待已久的异步操作等新特性。</p>
<h1 id="neovim-的诞生"><a href="[[neovim]]-的诞生" class="headerlink anchor"><i class="iconfont icon-link"></i></a>Neovim 的诞生</h1>
<p>Neovim 之所以诞生，就与 Vim 这种「怪异」的开发模式有关。Vim 在版本 8.0 之前是没有异步执行功能的，这意味着，如果你运行一个命令，必须等到命令执行完毕，才可以继续操作当前 buffer，命令执行过程，会阻断当前的 UI，用户只能等着。Neovim 项目的发起人 <a href="https://github.com/tarruda">tarruda</a><sup id="fnref:3"><a href="[[fn]]:3" class="footnote-ref" role="doc-noteref">3</a></sup> 曾经给 Vim <a href="https://groups.google.com/forum/#!msg/vim_dev/QF7Bzh1YABU/02-YGr7_sCwJ">提了一个 patch</a>，为 Vim 增加了 job 功能，可以帮助 Vim 异步执行操作。不过遗憾的是，该 patch 不知为什么没有被 Bram 接受。因此 Tarruda 在 2014 年 fork 了 Vim，发起了 <a href="https://github.com/neovim/neovim">Neovim 项目</a>，开始改变 Vim 的开发模式，遵循现代开源项目的开发流程，同时对 Vim 的代码进行了大的清理和重构，去掉了对老旧系统的支持，同时添加了新的特性。</p>
<h2 id="neovim-特性"><a href="[[neovim]]-特性" class="headerlink anchor"><i class="iconfont icon-link"></i></a>Neovim 特性</h2>
<p>经过几年的发展，Neovim 没有陷入凋亡，目前来看，项目很活跃，开发者众多。Neovim 实现了很多新特性，例如内置 terminal 和异步功能都是 Neovim 率先实现，然后 Vim 才跟进实现的，可能是 Bram 也感受到了来自 Neovim 竞争的压力，不希望自己的项目失去开发者的青睐，加快了开发的步伐。遗憾的是，Vim 重新实现的异步功能，方法命名上选择了与 Neovim 不兼容，在 Neovim 中，发起和停止 job 的方法是 <code>jobstart()</code> 和 <code>jobstop()</code>，但是 Vim 使用的是 <code>job_start()</code> 和 <code>job_stop()</code>，这也给<a href="https://github.com/vim/vim/issues/904">开发者和用户</a><a href="https://github.com/neovim/neovim/issues/8547">造成了不必要的麻烦</a>，在使用异步功能的时候，需要面对两套不同的 API<sup id="fnref:4"><a href="[[fn]]:4" class="footnote-ref" role="doc-noteref">4</a></sup>。</p>
<p>在用户层面来看，使用 Neovim 或者 Vim，区别不明显，Neovim 主要改变在软件架构方面，例如 Neovim 增加了 RPC 通信功能，插件可以通过 <a href="https://neovim.io/doc/user/api.html#API">messagepack</a> 协议与 Neovim 进行通信，控制 Neovim 的行为。这种方式的好处是插件不必使用原生的 Vim script 编写，大部分的功能都可以通过更加强大的编程语言来实现，例如 Python，或者 JavaScript，利用这个特性的最典型的插件如 <a href="https://github.com/Shougo/deoplete.nvim">deoplete</a> 和 <a href="https://github.com/neoclide/coc.nvim">coc.nvim</a>，特别是 coc.nvim 插件，利用 JavaScript 实现了非常强大的代码自动补全功能，可以媲美 VS code 提供的代码补全功能。</p>
<p>由于 Neovim 支持 RPC，在此基础上可以有<a href="https://github.com/neovim/neovim/wiki/Related-projects#gui">很多 GUI 的实现</a>，GUI <a href="https://neovim.io/doc/user/ui.html#UI">通过 RPC 与 Neovim 进行通信</a>。一些优秀的 GUI 客户端有 <a href="https://github.com/equalsraf/neovim-qt">nvim-qt</a>，<a href="https://github.com/qvacua/vimr">vimR</a>，<a href="https://github.com/yatli/fvim">fvim</a> (19 年刚出来的客户端，还不错)。同时，Neovim 可以充当一个 server，被嵌入到其他编辑器或者程序中，因此你不必使用蹩脚的 Vim 按键模拟插件，可以使用真正的 Vim，例如 <a href="https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim">vscode-neovim</a> 把 Neovim 嵌入到了 VS code 中，<a href="https://github.com/glacambre/firenvim">firenvim</a> 把 Neovim 嵌入到了网页的 textarea 中，非常酷的插件，firenvim 的使用可以参考我之前的 <a href="https://jdhao.github.io/2020/01/01/firenvim_nvim_inside_browser/">博文</a>。</p>
<h1 id="vim-与-neovim-最新进展"><a href="[[vim-与-neovim]]-最新进展" class="headerlink anchor"><i class="iconfont icon-link"></i></a>Vim 与 Neovim 最新进展</h1>
<h2 id="vim-新进展"><a href="[[vim]]-新进展" class="headerlink anchor"><i class="iconfont icon-link"></i></a>Vim 新进展</h2>
<p>Bram 在 2018 年做了<a href="https://github.com/vim/vim/issues/3573">一个调查</a>，希望了解 Vim 插件开发者目前最需要 Vim 实现哪些功能，其中呼声比较高的是 <a href="https://github.com/vim/vim/issues/3573#issuecomment-433731148">floating windows</a>，也就是在当前窗口的任意位置再建立一个悬浮窗口，用来显示额外的信息。2019 年 12 月，在 <a href="https://www.vim.org/vim-8.2-released.php">Vim 8.2</a> 版本中，正式加入了 floating window 功能。</p>
<p>同时 Bram 已经在考虑 <a href="https://groups.google.com/forum/#!topic/vim_dev/__gARXMigYE">Vim 9.0</a> 的开发事宜，目前主要考虑的是加快 vim script 执行的速度，逐渐去掉 vim 的 Python，perl 等 interface，以及新的定义函数的方式等。Bram 已经在 GitHub 上创建了 <a href="https://github.com/brammool/vim9">vim9 仓库</a>，开始 Vim 9 的开发工作。</p>
<h2 id="neovim-新进展"><a href="[[neovim]]-新进展" class="headerlink anchor"><i class="iconfont icon-link"></i></a>Neovim 新进展</h2>
<p>Neovim 团队在 19 年 9 月份，先于 Vim ，在 Neovim <a href="https://github.com/neovim/neovim/commit/e2cc5fe09d98ce1ccaaa666a835c896805ccc196">0.4 版本</a>中正式推出了 <a href="https://github.com/neovim/neovim/pull/6619">floating window 特性</a>，马上就有一批插件利用 floating window 做了一些功能，例如 <a href="https://github.com/Yggdroot/LeaderF">leaderf</a> 利用 floating window 显示文件模糊查找的窗口，coc.nvim 利用 floating window 显示函数方法的签名等，整体感觉炫酷而实用，给人一种 IDE 的既视感。</p>
<p>另外，Neovim 已经合并了 <a href="https://microsoft.github.io/language-server-protocol/">Language Server Protocol</a> 的<a href="https://github.com/neovim/neovim/issues/5522">客户端实现</a>，并且专门<a href="https://github.com/neovim/nvim-lsp">开了一个仓库</a>帮助用户配置 LSP，对于不喜欢使用第三方 LSP 插件的用户，多了一种选择。</p>
<p>Neovim 开发者正在开发的一个功能是 <a href="https://github.com/neovim/neovim/pull/9219">tree-sitter 集成</a>，目前 Neovim 和 Vim 的语法高亮都是通过正则表达式实现的，效率不高，复杂的正则表达式可能会造成卡顿。<a href="https://github.com/tree-sitter/tree-sitter">Tree-sitter</a> 是一个用 C 语言实现的源代码解析工具，等该功能合并进 Neovim 以后，能够进一步提高 Neovim 的速度，解决基于正则表达式的语法高亮的卡顿问题。</p>
<h1 id="参考"><a href="#参考" class="headerlink anchor"><i class="iconfont icon-link"></i></a>参考</h1>
<ul>
<li><a href="https://news.ycombinator.com/item?id=9263193">Hacker New 对 Vim 迁移到 GitHub 的讨论</a>.</li>
<li><a href="https://www.youtube.com/watch?v=yv6KAzRPHkc">The history of Vim</a>.</li>
<li><a href="http://www.free-soft.org/FSM/english/issue01/vim.html">Vim, an open-source editor.</a></li>
<li><a href="https://github.com/vim/vim-history">Vim 各个版本发布信息</a>.</li>
<li><a href="https://lwn.net/Articles/713114/">Vim 8 version release</a>.</li>
<li><a href="https://news.ycombinator.com/item?id=21772223">Hacker News 上对 Vim 8.2 的讨论</a>.</li>
<li>Tarruda
<ul>
<li><a href="https://www.reddit.com/r/neovim/comments/85vj86/what_happened_to_tarruda/">What happened to tarruda</a>.</li>
<li><a href="https://www.reddit.com/r/neovim/comments/3knzem/what_exactly_does_tarruda_do/">What exactly does tarruda do?</a></li>
</ul>
</li>
<li><a href="https://www.reddit.com/r/neovim/comments/b2tc1g/what_i_am_looking_forward_to_builtin_lsp/">Reddit 上对 Neovim LSP 和 tree-sitter 功能的讨论</a>.</li>
<li><a href="https://www.reddit.com/r/vim/comments/d4xjuv/neovim_v040_released_multigrid_floating_windows/">Neovim 0.4 版本的讨论</a>.</li>
<li><a href="https://www.reddit.com/r/vim/comments/ebz0cj/vim_9/">/r/vim 关于 Vim 9.0 的讨论</a>.</li>
<li><a href="https://www.reddit.com/r/neovim/comments/ebz0p1/vim_9/">/r/neovim 上关于 Vim 9.0 的讨论</a>.</li>
<li><a href="https://geoff.greer.fm/2015/01/15/why-neovim-is-better-than-vim/">Why Neovim is better than Vim</a>.</li>
<li><a href="https://groups.google.com/forum/#!searchin/vim_dev/neovim/vim_dev/x0BF9Y0Uby8/Xse9Bvyza0AJ">Bram 对 Neovim 的看法</a>.</li>
<li><a href="https://www.hostingadvice.com/blog/vim-creator-champions-charityware/">https://www.hostingadvice.com/blog/vim-creator-champions-charityware/</a></li>
</ul>
<section class="footnotes" role="doc-endnotes">
<ol>
<li id="fn:1" role="doc-endnote">
<p><a href="https://vimconf.org/">VimConf</a> 是由日本的 Vim 使用与爱好者举办的一年一度的会议，迄今为止已举办了七届。 <a href="[[fnref]]:1" class="footnote-backref" role="doc-backlink">↩︎</a></p>
</li>
<li id="fn:2" role="doc-endnote">
<p>所以查看 <a href="https://github.com/vim/vim/graphs/contributors">Vim 项目的贡献者</a>，就会发现很奇葩的现象：贡献者只有两人，并且几乎所有的 commit 作者都是 Bram。 <a href="[[fnref]]:2" class="footnote-backref" role="doc-backlink">↩︎</a></p>
</li>
<li id="fn:3" role="doc-endnote">
<p>Tarruda 目前已经不再担任 Neovim 的维护者，目前 Neovim 项目的<a href="https://gitter.im/neovim/neovim?at=5588a8951c3ba5ef5bff811a">负责人</a>是 <a href="https://github.com/justinmk">Justin M. Keyes</a>. <a href="[[fnref]]:3" class="footnote-backref" role="doc-backlink">↩︎</a></p>
</li>
<li id="fn:4" role="doc-endnote">
<p>有开发者专门开发了<a href="https://github.com/prabirshrestha/async.vim">一个插件</a>，用来抹平 Neovim 和 Vim 异步特性的差异。 <a href="[[fnref]]:4" class="footnote-backref" role="doc-backlink">↩︎</a></p>
</li>
</ol>
</section>
    </div>


| 转自： [https://jdhao.github.io/2020/01/12/vim_nvim_history_development/](https://jdhao.github.io/2020/01/12/vim_nvim_history_development/) |
| :-----------------------------------------------------------------------------------------------------------------------------------------: |

------






# Why Neovim is Better than(15 Jan 2015) 
<article>

</div>
<div class="post">
<p>I know Vim better than most. Vim was my first real text editor.<sup><a href="[[ref_1]]">[1]</a></sup> I used it for years. I helped write the <a href="https://github.com/Floobits/floobits-vim">Floobits plugin for Vim</a>. I’ve delved into Vim’s source code to figure out its workings. I even <a href="https://groups.google.com/d/msg/vim_dev/-4pqDJfHCsM/LkYNCpZjQ70J">helped write a patch</a> (though it was rejected). Considering these credentials, I hope you’ll accept that I know what I’m talking about.</p>

<p>It may come as a shock when I say: The only good part of Vim is its user interface.</p>

<p>Every other aspect of Vim is irredeemable. The codebase is atrocious. The plugin API is cumbersome and restrictive. The dev community is apathetic. The benevolent dictator is averse to change. There is no chance of fixing these problems.</p>

<p>I wish it were otherwise, but it isn’t.</p>

<p>Considering the degree of these criticisms, I should back them up with specific examples.</p>

<h3 id="the-plugin-api">The Plugin API</h3>

<p>Vim’s plugin API is just plain bad. First, all plugin code runs synchronously. That means if any plugin’s code is executing, Vim’s UI is frozen. This makes many types of plugins difficult or impossible to implement. Linters have to finish in milliseconds or risk annoying the user. External commands (such as <code class="highlighter-rouge">make</code>) can’t be cancelled, and they must finish before the user can resume editing.</p>

<p>Another annoyance is that writing plugins requires knowledge of Vim’s special language: vimscript. This is true even if you’re using a Vim compiled with support for other languages. Yes, <code class="highlighter-rouge">+python</code> gives you access to Python’s libraries and syntax. But your code will be littered with calls to <code class="highlighter-rouge">vim.eval()</code> and <code class="highlighter-rouge">vim.command()</code>. Here’s an example:</p>

<figure class="highlight"><pre><code class="language-python" data-lang="python"><span class="kn">import</span> <span class="nn">vim</span>

<span class="c1"># Show current directory in Vim
</span><span class="n">cwd</span> <span class="o">=</span> <span class="n">vim</span><span class="o">.</span><span class="nb">eval</span><span class="p">(</span><span class="s">'getcwd()'</span><span class="p">)</span>
<span class="n">vim</span><span class="o">.</span><span class="n">command</span><span class="p">(</span><span class="s">':Explore </span><span class="si">%</span><span class="s">s | redraw'</span> <span class="o">%</span> <span class="n">cwd</span><span class="p">)</span></code></pre></figure>

<p>You might notice that issues could arise from failing to properly escape variables in calls to <code class="highlighter-rouge">eval()</code> and <code class="highlighter-rouge">command()</code>. You’d be right. It’s not uncommon for special character inputs to cause Vim plugins to crash or misbehave.</p>

<h3 id="the-codebase">The Codebase</h3>

<p>I started programming in C almost 20 years ago. Vim is, without question, the worst C codebase I have seen. Copy-pasted but subtly changed code abounds. Indentation is haphazard. Lines contain tabs mixed with spaces. Source files are <em>huge</em>. There are almost 25,000 lines in <code class="highlighter-rouge">eval.c</code>. That file contains over 500 <code class="highlighter-rouge">[[ifdef]]</code>s and references globals defined in the 2,000 line <code class="highlighter-rouge">globals.h</code>.</p>

<p>Some of Vim’s source code isn’t even valid text. It’s not ASCII or UTF-8. The venerable <a href="http://en.wikipedia.org/wiki/File_%28command%29"><code class="highlighter-rouge">file</code></a> can’t figure out the encoding.</p>

<div class="highlighter-rouge"><div class="highlight"><pre class="highlight"><code>ggreer@carbon:~/code/vim% file -I src/digraph.c 
src/digraph.c: text/x-c; charset=unknown-8bit
</code></pre></div></div>

<p>Thankfully, <code class="highlighter-rouge">eval.c</code> is pure ASCII.</p>

<p>Many of Vim’s <code class="highlighter-rouge">[[ifdef]]</code>s are for platforms that became irrelevant decades ago: BeOS, VMS, Amiga, Mac OS Classic, IRIX. These preprocessor statements may seem innocuous, but they slow development and inhibit new features. Also, Vim doesn’t even work on most of these platforms anymore. It’s just that nobody has an ancient system with which to test Vim. Neovim developers analyzed many of the preprocessor statements and <a href="https://github.com/neovim/neovim/pull/814">found a significant number that could never be included</a> in a working Vim.</p>

<p>Complexity stemming from cross-platform support may be excusable, but even something as simple as reading keyboard input is a nightmare in Vim. Stepping through with a debugger will result in call stacks such as <code class="highlighter-rouge">inchar()</code> in <code class="highlighter-rouge">getchar.c</code> calling <code class="highlighter-rouge">ui_inchar()</code> in <code class="highlighter-rouge">ui.c</code>, which calls <code class="highlighter-rouge">mch_inchar()</code> in <code class="highlighter-rouge">os_unix.c</code>, which calls <code class="highlighter-rouge">WaitForChar()</code>, which calls <code class="highlighter-rouge">RealWaitForChar()</code>. This call stack can be completely different on different platforms. It also differs when running in command line versus GUI mode.</p>

<p>Figuring out Vim’s control flow is harrowing. Even when you hit paydirt in <code class="highlighter-rouge">RealWaitForChar()</code>, the code is extremely hard to follow. Here’s a snippet. You can view the whole function at my <a href="/vim/[[realwaitforchar]]">Vim Hall of WTF</a>.</p>

<figure class="highlight"><pre><code class="language-c" data-lang="c"><span class="cp"># if defined(HAVE_GETTIMEOFDAY) &amp;&amp; defined(HAVE_SYS_TIME_H)
</span>    <span class="cm">/* Remember at what time we started, so that we know how much longer we
     * should wait after being interrupted. */</span>
<span class="cp">#  define USE_START_TV
</span>    <span class="k">struct</span> <span class="n">timeval</span>  <span class="n">start_tv</span><span class="p">;</span>

    <span class="k">if</span> <span class="p">(</span><span class="n">msec</span> <span class="o">&gt;</span> <span class="mi">0</span> <span class="o">&amp;&amp;</span> <span class="p">(</span>
<span class="cp">#  ifdef FEAT_XCLIPBOARD
</span>        <span class="n">xterm_Shell</span> <span class="o">!=</span> <span class="p">(</span><span class="n">Widget</span><span class="p">)</span><span class="mi">0</span>
<span class="cp">#   if defined(USE_XSMP) || defined(FEAT_MZSCHEME)
</span>        <span class="o">||</span>
<span class="cp">#   endif

</span>        <span class="n">xsmp_icefd</span> <span class="o">!=</span> <span class="o">-</span><span class="mi">1</span>
<span class="cp">#   ifdef FEAT_MZSCHEME
</span>        <span class="o">||</span>
<span class="cp">#   endif

</span>    <span class="p">(</span><span class="n">mzthreads_allowed</span><span class="p">()</span> <span class="o">&amp;&amp;</span> <span class="n">p_mzq</span> <span class="o">&gt;</span> <span class="mi">0</span><span class="p">)</span>
<span class="cp">#  endif
</span>        <span class="p">))</span>
    <span class="n">gettimeofday</span><span class="p">(</span><span class="o">&amp;</span><span class="n">start_tv</span><span class="p">,</span> <span class="nb">NULL</span><span class="p">);</span>
<span class="cp"># endif</span></code></pre></figure>

<p>That <code class="highlighter-rouge">if</code> statement’s conditions span 17 lines and 4 different <code class="highlighter-rouge">[[ifdef]]</code>s. All to call <code class="highlighter-rouge">gettimeofday()</code>. Amusingly, even the body of that statement has a bug: times returned by <code class="highlighter-rouge">gettimeofday()</code> are not guaranteed to increase. User intervention or ntpd can cause the system clock to go back in time. The correct solution is to use a monotonically increasing time function, such Linux’s <code class="highlighter-rouge">clock_gettime()</code> or OS X’s <code class="highlighter-rouge">mach_absolute_time()</code>.</p>

<h3 id="the-developer-community">The Developer Community</h3>

<p><a href="https://github.com/kans">Matt</a> and I worked for months to <a href="https://news.floobits.com/2013/09/17/adding-settimeout-to-vim/">add asynchronous functionality to Vim</a>. From that experience, I have few good things to say about Vim’s dev community. In fact, out of all the developer communities I’ve encountered, Vim’s is the most hostile to change. Anything that isn’t a bug fix is frowned upon.</p>

<p>Patches are often criticized for ridiculous reasons. After we <a href="https://groups.google.com/d/msg/vim_dev/-4pqDJfHCsM/LkYNCpZjQ70J">posted our patch to the Vim-dev mailing list</a>, the first reply was:</p>

<blockquote>
  <p>NOTE: Don’t use ANSI style function declarations. A few people still have to use a compiler that doesn’t support it.</p>
</blockquote>

<p>Seriously? C89 is a quarter-century old. The number of people stuck on older compilers can be counted on one hand. This is a non-concern. Still, I acquiesced. It was easier to make the change than argue with the critic.</p>

<p>The rest of that thread is me being as civil as possible, despite discouragement at every turn. The replies might as well be a paint-by-numbers guide on how to alienate new contributors.</p>

<p>On a more general note: After reading random posts on the Vim-dev mailing list, I get the impression that the developer community is fragmented. Some want Vim to be similar to <a href="http://www.sublimetext.com/">Sublime Text</a>: A flexible, extensible text editor for developers. Some (including <a href="http://en.wikipedia.org/wiki/Benevolent_dictator_for_life">BDFL</a> Bram Moolenaar) are afraid of Vim becoming an IDE.</p>

<h3 id="the-overly-cautious-dictator-for-life">The Overly Cautious Dictator for Life</h3>

<p>Speaking of Bram Moolenaar: His merge criteria are inscrutable. Some patches he ignores. Some, he attacks. Others, he merges.</p>

<p>Take a look again at <a href="https://groups.google.com/d/msg/vim_dev/-4pqDJfHCsM/LkYNCpZjQ70J">the thread where Matt and I submitted our patch</a>. We did our best to cater to Bram’s every whim, but it was a waste of time. Had he immediately told us to give up, it would have been a better outcome for all involved. Instead, we were given hope and strung along, working on a patch that had no chance of getting merged.</p>

<h3 id="the-alternative">The Alternative</h3>

<p>A couple of months after my disillusionment with Vim, <a href="https://github.com/tarruda">Thiago de Arruda</a> <a href="https://groups.google.com/d/msg/vim_dev/QF7Bzh1YABU/02-YGr7_sCwJ">submitted a similar patch</a>. It was likewise rejected. But unlike me, Thiago didn’t give up. He started <a href="http://neovim.org/">NeoVim</a> and <a href="https://www.bountysource.com/teams/neovim">created a Bountysource for it</a>.</p>

<p>Neovim is exactly what it claims to be. It fixes every issue I have with Vim: The plugin API. The codebase. The community. The BDFL.</p>

<p>Neovim’s plugin API is backwards-compatible with Vim, but it also allows asynchronous execution. Users have already made plugins that Vim can never have. For example, <a href="https://github.com/benekastah/neomake">Neomake</a> allows async linters. That feature alone is worth making the switch for.</p>

<p>Neovim’s codebase is a substantial improvement. They’ve <a href="https://github.com/neovim/neovim/wiki/Porting-OS-layer-to-libuv">replaced much of the hacky, platform-specific code with libuv</a>. They’ve fixed the problems with indentation, style, and bad file encodings. They’ve removed old code for ancient, unused platforms. They’ve drastically increased test quality and coverage. There’s still much to be done, but the difference is already worlds better.</p>

<p>Neovim’s development community is excellent. They respond to issues. They merge pull requests. They give quality feedback. And most importantly, they’re nice to newbies.</p>

<p>In fact, they’re nice to everyone. The main dev team holds no enmity toward Bram Moolenaar. They recognize Vim’s failings, but they don’t feel the need to criticize it.</p>

<p>The only thing Neovim is missing is a tagged stable release. But there’s no need to wait. Right now you can clone Neovim, compile it, and have an editor that works with all your existing plugins.</p>

<p>If you are a Vim user, I strongly recommend switching to Neovim. It’s the Vim you’re used to, but with plugins you never knew you wanted.</p>



<p>Thanks to both <a href="http://bjorn.tipling.com/">Bjorn Tipling</a> and <a href="https://github.com/kans">Matt Kaniaris</a> for their help with this post.</p>

<ol>
  <li><span id="ref_1"></span><a href="https://en.wikipedia.org/wiki/MS-DOS_Editor">Edit</a> and <a href="http://en.wikipedia.org/wiki/Pico_%28text_editor%29">pico</a> don’t count.</li>
</ol>

</div>
</article>

-----
## 翻译

<article>
<div class="post-header">
<div class="post-title" itemprop="title"><a href="/2015/01/15/why-neovim-is-better-than-vim/"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">为什么Neovim比Vim更好</font></font></a></div>
<div class="post-date" itemprop="pubdate"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">2015年1月15日</font></font></div>
</div>
<div class="post">
<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">我比大多数人更了解Vim。</font><font style="vertical-align: inherit;">Vim是我的第一个真实文本编辑器。</font></font><sup><a href="[[ref_1]]"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">[1]</font></font></a></sup><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">我使用了多年。</font><font style="vertical-align: inherit;">我帮助编写了</font></font><a href="https://github.com/Floobits/floobits-vim"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Vim</font></font></a><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">的</font><a href="https://github.com/Floobits/floobits-vim"><font style="vertical-align: inherit;">Floobits插件</font></a><font style="vertical-align: inherit;">。</font><font style="vertical-align: inherit;">我已经研究了Vim的源代码以弄清其工作原理。</font><font style="vertical-align: inherit;">我什至</font></font><a href="https://groups.google.com/d/msg/vim_dev/-4pqDJfHCsM/LkYNCpZjQ70J"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">帮助写了一个补丁</font></font></a><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">（尽管被拒绝了）。</font><font style="vertical-align: inherit;">考虑到这些凭据，希望您会接受我知道我在说什么。</font></font></p>

<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">当我说：Vim唯一好的方面就是它的用户界面时，可能会感到震惊。</font></font></p>

<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Vim的所有其他方面都是不可挽回的。</font><font style="vertical-align: inherit;">该代码库是残酷的。</font><font style="vertical-align: inherit;">插件API繁琐且受限。</font><font style="vertical-align: inherit;">开发人员社区无动于衷。</font><font style="vertical-align: inherit;">仁慈的独裁者不愿改变。</font><font style="vertical-align: inherit;">没有机会解决这些问题。</font></font></p>

<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">我希望不是这样，但事实并非如此。</font></font></p>

<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">考虑到这些批评的程度，我应该用具体的例子来支持它们。</font></font></p>

<h3 id="the-plugin-api"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">插件API</font></font></h3>

<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Vim的插件API很糟糕。</font><font style="vertical-align: inherit;">首先，所有插件代码均同步运行。</font><font style="vertical-align: inherit;">这意味着，如果任何插件的代码正在执行，Vim的用户界面将被冻结。</font><font style="vertical-align: inherit;">这使得许多类型的插件难以实现或无法实现。</font><font style="vertical-align: inherit;">短绒必须在毫秒内完成，否则有可能惹恼用户。</font><font style="vertical-align: inherit;">外部命令（例如</font></font><code class="highlighter-rouge">make</code><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">）不能取消，它们必须先完成，用户才能继续编辑。</font></font></p>

<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">另一个烦人的问题是编写插件需要了解Vim的特殊语言：vimscript。</font><font style="vertical-align: inherit;">即使您正在使用支持其他语言的Vim编译，也是如此。</font><font style="vertical-align: inherit;">是的，</font></font><code class="highlighter-rouge">+python</code><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">您可以访问Python的库和语法。</font><font style="vertical-align: inherit;">但是，您的代码会被调用</font></font><code class="highlighter-rouge">vim.eval()</code><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">和</font><font style="vertical-align: inherit;">所困扰</font></font><code class="highlighter-rouge">vim.command()</code><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">。</font><font style="vertical-align: inherit;">这是一个例子：</font></font></p>

<figure class="highlight"><pre><code class="language-python" data-lang="python"><span class="kn">import</span> <span class="nn">vim</span><font></font>
<font></font>
<span class="c1"># Show current directory in Vim
</span><span class="n">cwd</span> <span class="o">=</span> <span class="n">vim</span><span class="o">.</span><span class="nb">eval</span><span class="p">(</span><span class="s">'getcwd()'</span><span class="p">)</span>
<span class="n">vim</span><span class="o">.</span><span class="n">command</span><span class="p">(</span><span class="s">':Explore </span><span class="si">%</span><span class="s">s | redraw'</span> <span class="o">%</span> <span class="n">cwd</span><span class="p">)</span></code></pre></figure>

<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">您可能会注意到，如果无法正确调用</font></font><code class="highlighter-rouge">eval()</code><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">和</font><font style="vertical-align: inherit;">，则可能会引起问题</font></font><code class="highlighter-rouge">command()</code><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">。</font><font style="vertical-align: inherit;">没错 </font><font style="vertical-align: inherit;">特殊字符输入导致Vim插件崩溃或行为异常的情况并不少见。</font></font></p>

<h3 id="the-codebase"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">代码库</font></font></h3>

<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">大约20年前，我开始用C编程。</font><font style="vertical-align: inherit;">毫无疑问，Vim是我所见过的最糟糕的C代码库。</font><font style="vertical-align: inherit;">复制粘贴但微妙更改的代码比比皆是。</font><font style="vertical-align: inherit;">缩进是偶然的。</font><font style="vertical-align: inherit;">行包含带有空格的制表符。</font><font style="vertical-align: inherit;">源文件</font></font><em><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">很大</font></font></em><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">。</font><font style="vertical-align: inherit;">大约有25,000行</font></font><code class="highlighter-rouge">eval.c</code><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">。</font><font style="vertical-align: inherit;">该文件包含500 </font></font><code class="highlighter-rouge">[[ifdef]]</code><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">多个</font><font style="vertical-align: inherit;">文件，</font><font style="vertical-align: inherit;">并引用了2,000行中定义的全局变量</font></font><code class="highlighter-rouge">globals.h</code><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">。</font></font></p>

<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Vim的某些源代码甚至不是有效的文本。</font><font style="vertical-align: inherit;">不是ASCII或UTF-8。</font><font style="vertical-align: inherit;">尊者</font></font><a href="http://en.wikipedia.org/wiki/File_%28command%29"><code class="highlighter-rouge">file</code></a><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">无法弄清楚编码。</font></font></p>

<div class="highlighter-rouge"><div class="highlight"><pre class="highlight"><code>ggreer@carbon:~/code/vim% file -I src/digraph.c <font></font>
src/digraph.c: text/x-c; charset=unknown-8bit<font></font>
</code></pre></div></div>

<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">幸运的是，它</font></font><code class="highlighter-rouge">eval.c</code><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">是纯ASCII。</font></font></p>

<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Vim的许多</font></font><code class="highlighter-rouge">[[ifdef]]</code><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">平台都是数十年前变得无关紧要的平台：BeOS，VMS，Amiga，Mac OS Classic，IRIX。</font><font style="vertical-align: inherit;">这些预处理器语句看似无害，但它们减慢了开发速度并抑制了新功能。</font><font style="vertical-align: inherit;">而且，Vim甚至不能在大多数这些平台上运行。</font><font style="vertical-align: inherit;">只是没有人拥有可以测试Vim的古老系统。</font><font style="vertical-align: inherit;">Neovim开发人员分析了许多预处理器语句，</font></font><a href="https://github.com/neovim/neovim/pull/814"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">发现大量永远无法包含</font></font></a><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">在工作中的Vim中。</font></font></p>

<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">跨平台支持所带来的复杂性可能是可以原谅的，但是即使像读取键盘输入这样简单的事情也是Vim的噩梦。</font><font style="vertical-align: inherit;">用调试器逐句通过将导致调用栈作为这样</font></font><code class="highlighter-rouge">inchar()</code><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">在</font></font><code class="highlighter-rouge">getchar.c</code><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">通话</font></font><code class="highlighter-rouge">ui_inchar()</code><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">中</font></font><code class="highlighter-rouge">ui.c</code><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">，它调用</font></font><code class="highlighter-rouge">mch_inchar()</code><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">的</font></font><code class="highlighter-rouge">os_unix.c</code><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">，这就要求</font></font><code class="highlighter-rouge">WaitForChar()</code><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">，这就要求</font></font><code class="highlighter-rouge">RealWaitForChar()</code><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">。</font><font style="vertical-align: inherit;">在不同平台上，此调用堆栈可以完全不同。</font><font style="vertical-align: inherit;">在命令行模式和GUI模式下运行时，它也有所不同。</font></font></p>

<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">弄清楚Vim的控制流程令人痛苦。</font><font style="vertical-align: inherit;">即使您在中输入paydirt </font></font><code class="highlighter-rouge">RealWaitForChar()</code><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">，代码也极难遵循。</font><font style="vertical-align: inherit;">这是一个片段。</font><font style="vertical-align: inherit;">您可以在我</font></font><a href="/vim/[[realwaitforchar]]"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">的WTF Vim大厅中</font></font></a><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">查看整个功能</font><font style="vertical-align: inherit;">。</font></font></p>

<figure class="highlight"><pre><code class="language-c" data-lang="c"><span class="cp"># if defined(HAVE_GETTIMEOFDAY) &amp;&amp; defined(HAVE_SYS_TIME_H)
</span>    <span class="cm">/* Remember at what time we started, so that we know how much longer we
     * should wait after being interrupted. */</span>
<span class="cp">#  define USE_START_TV
</span>    <span class="k">struct</span> <span class="n">timeval</span>  <span class="n">start_tv</span><span class="p">;</span><font></font>
<font></font>
    <span class="k">if</span> <span class="p">(</span><span class="n">msec</span> <span class="o">&gt;</span> <span class="mi">0</span> <span class="o">&amp;&amp;</span> <span class="p">(</span>
<span class="cp">#  ifdef FEAT_XCLIPBOARD
</span>        <span class="n">xterm_Shell</span> <span class="o">!=</span> <span class="p">(</span><span class="n">Widget</span><span class="p">)</span><span class="mi">0</span>
<span class="cp">#   if defined(USE_XSMP) || defined(FEAT_MZSCHEME)
</span>        <span class="o">||</span>
<span class="cp">#   endif

</span>        <span class="n">xsmp_icefd</span> <span class="o">!=</span> <span class="o">-</span><span class="mi">1</span>
<span class="cp">#   ifdef FEAT_MZSCHEME
</span>        <span class="o">||</span>
<span class="cp">#   endif
</span>    <span class="p">(</span><span class="n">mzthreads_allowed</span><span class="p">()</span> <span class="o">&amp;&amp;</span> <span class="n">p_mzq</span> <span class="o">&gt;</span> <span class="mi">0</span><span class="p">)</span>
<span class="cp">#  endif
</span>        <span class="p">))</span>
    <span class="n">gettimeofday</span><span class="p">(</span><span class="o">&amp;</span><span class="n">start_tv</span><span class="p">,</span> <span class="nb">NULL</span><span class="p">);</span>
<span class="cp"># endif</span></code></pre></figure>

<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">该</font></font><code class="highlighter-rouge">if</code><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">语句的条件跨越17行和4个不同的</font></font><code class="highlighter-rouge">[[ifdef]]</code><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">s。</font><font style="vertical-align: inherit;">所有人都可以打电话</font></font><code class="highlighter-rouge">gettimeofday()</code><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">。</font><font style="vertical-align: inherit;">有趣的是，即使是该语句的主体也存在一个错误：</font></font><code class="highlighter-rouge">gettimeofday()</code><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">不能保证</font><font style="vertical-align: inherit;">返回的时间</font><font style="vertical-align: inherit;">会增加。</font><font style="vertical-align: inherit;">用户干预或ntpd可能导致系统时钟倒退。</font><font style="vertical-align: inherit;">正确的解决方案是使用单调递增的时间函数，例如Linux </font></font><code class="highlighter-rouge">clock_gettime()</code><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">或OSX </font></font><code class="highlighter-rouge">mach_absolute_time()</code><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">。</font></font></p>

<h3 id="the-developer-community"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">开发者社区</font></font></h3>

<p><a href="https://github.com/kans"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Matt</font></font></a><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">和我工作了几个月，以为</font></font><a href="https://news.floobits.com/2013/09/17/adding-settimeout-to-vim/"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Vim添加异步功能</font></font></a><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">。</font><font style="vertical-align: inherit;">从这些经验来看，关于Vim的开发人员社区，我几乎无话可说。</font><font style="vertical-align: inherit;">实际上，在我遇到的所有开发人员社区中，Vim是最讨厌改变的。</font><font style="vertical-align: inherit;">任何不是错误修复的东西都被皱眉了。</font></font></p>

<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">补丁经常由于荒唐的原因而受到批评。</font><font style="vertical-align: inherit;">在</font></font><a href="https://groups.google.com/d/msg/vim_dev/-4pqDJfHCsM/LkYNCpZjQ70J"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">将补丁发布到Vim-dev邮件列表之后</font></font></a><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">，第一个答复是：</font></font></p>

<blockquote>
  <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">注意：不要使用ANSI样式函数声明。</font><font style="vertical-align: inherit;">仍然有一些人不得不使用不支持它的编译器。</font></font></p>
</blockquote>

<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">认真吗 </font><font style="vertical-align: inherit;">C89已有25年的历史了。</font><font style="vertical-align: inherit;">卡在旧版编译器上的人数可以一方面计算。</font><font style="vertical-align: inherit;">这是无关紧要的。</font><font style="vertical-align: inherit;">我还是默许了。</font><font style="vertical-align: inherit;">进行更改要比与批评者争论容易。</font></font></p>

<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">尽管不时感到沮丧，但剩下的话题是我尽可能地保持文明。</font><font style="vertical-align: inherit;">答复也可能是有关如何疏远新贡献者的数字指南。</font></font></p>

<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">概括地说：在阅读Vim-dev邮件列表上的随机帖子后，我感到开发人员社区支离破碎。</font><font style="vertical-align: inherit;">有些人希望Vim与</font></font><a href="http://www.sublimetext.com/"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Sublime Text</font></font></a><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">类似</font><font style="vertical-align: inherit;">：为开发人员提供了一种灵活，可扩展的文本编辑器。</font><font style="vertical-align: inherit;">有些人（包括</font></font><a href="http://en.wikipedia.org/wiki/Benevolent_dictator_for_life"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">BDFL</font></font></a><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"> Bram Moolenaar）担心Vim成为IDE。</font></font></p>

<h3 id="the-overly-cautious-dictator-for-life"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">对生活过于谨慎的独裁者</font></font></h3>

<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">说到布拉姆·摩尔纳尔：他的合并标准是难以理解的。</font><font style="vertical-align: inherit;">他忽略了一些补丁。</font><font style="vertical-align: inherit;">一些，他攻击。</font><font style="vertical-align: inherit;">其他人，他合并。</font></font></p>

<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">再次查看</font></font><a href="https://groups.google.com/d/msg/vim_dev/-4pqDJfHCsM/LkYNCpZjQ70J"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Matt和我提交补丁的线程</font></font></a><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">。</font><font style="vertical-align: inherit;">我们竭尽所能迎合布拉姆的每一次异想天开，但这是浪费时间。</font><font style="vertical-align: inherit;">如果他立即告诉我们放弃，那对所有参与者来说都是一个更好的结果。</font><font style="vertical-align: inherit;">取而代之的是，我们被寄予了希望，并努力前进，致力于一个不可能合并的补丁程序。</font></font></p>

<h3 id="the-alternative"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">另类</font></font></h3>

<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">在我对Vim失望之后的几个月，</font></font><a href="https://github.com/tarruda"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Thiago de Arruda </font></font></a> <a href="https://groups.google.com/d/msg/vim_dev/QF7Bzh1YABU/02-YGr7_sCwJ"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">提交了一个类似的补丁</font></font></a><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">。</font><font style="vertical-align: inherit;">它同样被拒绝了。</font><font style="vertical-align: inherit;">但是与我不同，Thiago并没有放弃。</font><font style="vertical-align: inherit;">他启动了</font></font><a href="http://neovim.org/"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">NeoVim</font></font></a><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">并</font><a href="http://neovim.org/"><font style="vertical-align: inherit;">为此</font></a></font><a href="https://www.bountysource.com/teams/neovim"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">创建了Bountysource</font></font></a><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">。</font></font></p>

<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Neovim正是它声称的那样。</font><font style="vertical-align: inherit;">它解决了我与Vim有关的每个问题：插件API。</font><font style="vertical-align: inherit;">代码库。</font><font style="vertical-align: inherit;">社区。</font><font style="vertical-align: inherit;">BDFL。</font></font></p>

<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Neovim的插件API与Vim向后兼容，但它也允许异步执行。</font><font style="vertical-align: inherit;">用户已经制作了Vim无法拥有的插件。</font><font style="vertical-align: inherit;">例如，</font></font><a href="https://github.com/benekastah/neomake"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Neomake</font></font></a><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">允许异步linters。</font><font style="vertical-align: inherit;">仅此功能值得进行切换。</font></font></p>

<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Neovim的代码库是一个重大改进。</font><font style="vertical-align: inherit;">他们已经</font></font><a href="https://github.com/neovim/neovim/wiki/Porting-OS-layer-to-libuv"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">用libuv替换了许多有针对性的，特定于平台的代码</font></font></a><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">。</font><font style="vertical-align: inherit;">他们解决了缩进，样式和错误文件编码的问题。</font><font style="vertical-align: inherit;">他们已删除了古老的未使用平台的旧代码。</font><font style="vertical-align: inherit;">他们大大提高了测试质量和覆盖范围。</font><font style="vertical-align: inherit;">仍有很多工作要做，但是区别已经比世界更好。</font></font></p>

<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Neovim的开发社区非常出色。</font><font style="vertical-align: inherit;">他们回应问题。</font><font style="vertical-align: inherit;">它们合并拉取请求。</font><font style="vertical-align: inherit;">他们提供质量反馈。</font><font style="vertical-align: inherit;">而且最重要的是，它们对新手很好。</font></font></p>

<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">实际上，它们对每个人都很好。</font><font style="vertical-align: inherit;">主要的开发团队对Bram Moolenaar毫无敌意。</font><font style="vertical-align: inherit;">他们认识到Vim的失败，但是他们并不需要批评它。</font></font></p>

<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Neovim唯一缺少的是标记的稳定版本。</font><font style="vertical-align: inherit;">但无需等待。</font><font style="vertical-align: inherit;">现在，您可以克隆Neovim并对其进行编译，并拥有可与所有现有插件一起使用的编辑器。</font></font></p>

<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">如果您是Vim用户，强烈建议切换到Neovim。</font><font style="vertical-align: inherit;">这是您惯用的Vim，但是使用插件却从未想过要。</font></font></p>


<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">感谢</font></font><a href="http://bjorn.tipling.com/"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Bjorn Tipling</font></font></a><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">和</font></font><a href="https://github.com/kans"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Matt Kaniaris</font></font></a><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">对本文的帮助。</font></font></p>

<ol>
  <li><span id="ref_1"></span><a href="https://en.wikipedia.org/wiki/MS-DOS_Editor"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">编辑</font></font></a><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">和</font></font><a href="http://en.wikipedia.org/wiki/Pico_%28text_editor%29"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">微微</font></font></a><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">不计算在内。</font></font></li>
</ol>

</div>
</article>


| 转自：https://geoff.greer.fm/2015/01/15/why-neovim-is-better-than-vim/ |
| :--------------------------------------------------------------------: |


但是这篇文章发表在15 Jan 2015，现在已经过去五年了，在此期间vim也做了大版本的更新，没有就文中的和现在的进行详细的对比，但就得到的资料来看应该很多问题是解决了的，vim有压力才会有动力