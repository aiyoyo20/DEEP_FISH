陆陆续续使用了不少软件记录笔记，从最初的记事本，word 再到现在用过的各种 markdown 软件，各有特色，做个总结吧，希望对没有接触过的有个直观的了解。

有的软件是早期的时候使用的，所以可能会出现上面写的一些问题在下载的最新版本中解决了优化了的情况。仅为自己当时的主观感受，不代表产品的实际，毕竟，每个人的喜好不一样。

# Markdown

## 1. Typora

使用的第一款 markdown 编辑器，使用过程还是挺舒适的，在最开始不太熟悉 markdown 语法又想要 markdwon 格式的时候使用的，但也由于这样，在较长一段时间内才完全熟练 markdwon 的语法，可以说在一定程度上的依赖反而造成了拖累。

而且这种所见即所得的在其他的很多产品里都没有，最后还是放弃了。

<img src="images/Note_typora.png" alt="pic_1_typora" width=900px />

使用感受：
主题多样可切换，
'所见即所得'，写作时直接预览，这个各有看法吧，有的人说是简单主义，是个优点，而我更喜欢从代码编写。
只能创建md文件，主要阅读的是md文件和一些文本文件，其他的无法读取或打开为乱码。
可以打开多级文件夹，但是无法在软件内创建文件夹。

总结：如果单单作为一个 markdown 编辑器是很优秀的，大多数的功能都有，但是如果想要当作一个笔记，管理一个系列的文件显然是不够的，而这也正是我放弃的原因，后期的东西原来越多，日记，笔记等等，同步性等等，typora 已不能满足这些。

全平台：Windows、Mac、Linux
语言：多语言，中英日等
官网：[https://typora.io/](https://typora.io/)


## 2、Obsidian

> Obsidian 是一个功能强大的知识管理软件,是一款功能强大的带有关系图谱功能的双向链笔记。

<img src="images/Note_obsidian.png" alt="pic_2_obsidian" width=900px />

可以安装一些插件，比如字数统计啥的。
建立了社区进行交流，所以主题很多，各种使用也是满意的。
关键在同时打开代码模式和预览模式的时候，滑动是同步的，需要修改的话很方便。
但是某天我发现我在系统设置了利于编写代码的字体，里面却没有任何变化。仔细寻找了半天也没有发现可以自定义的地方。

全平台：Windows、Mac、Linux
语言：语言挺多的，主要的语言都有
官网：https://obsidian.md/ 
Github项目地址：[https://github.com/obsidianmd/obsidian-releases/releases](https://github.com/obsidianmd/obsidian-releases/releases)

## 3、Joplin

> Joplin 是一款全平台的开源且完全免费的笔记应用，同时也是一个高效的 To-Do 待办事项工具和生产力工具。你可以用标签或笔记本进行分类整理，笔记支持 Markdown，可实现全文搜索，并且你还可以使用自己喜欢的第三方外置编辑器如 Typora、VIM 来编辑笔记，以获得更好的写作体验。

<img src="images/Note_Joplin.png" alt="pic_3_joplin" width=900px />

商业产品，7、8个主题可切换，支持多种云，保存更方便。
可以免费使用，不影响。
看着都挺好的，但不知道为什么就是没有心动的感觉。

多平台：Windows、macOS、Linux、iOS、Android 等主流桌面平台和手机平台都提供有客户端，甚至还提供了命令行版本
语言：很多
官网：[https://joplinapp.org/](https://joplinapp.org/)

## 4、Marktext

有人将其称之为未来的 markdown 软件。

<img src="images/Note_marktext.png" alt="marktext" width=900px />


即可所见即所得，也可通过快捷键切换预览与编辑。
关键可在里面为其编辑与预览指定字体。

初使用是不错的，但是在 mac 和 windows 上没有测试，在现在的linux上会有卡顿的情况，快捷键的延迟很高，甚至于没有响应。只能期待于以后的优化了再使用。

全平台：Windows、Mac、Linux
语言：目前只有英语
官网：[https://marktext.app/](https://marktext.app/) 
Github项目地址：[https://github.com/marktext/marktext/releases](https://github.com/marktext/marktext/releases)

## 5. Vnote

免费的开源笔记软件。VNote 专注于 Markdown 的编辑与阅读，以提供舒适的编辑体验为设计目标。
Vnote是一个大神也是市面上找不到很满足于自己的需求的软件，利用自己的闲余时间自己做的。
作者自己也说了，借鉴了不少其他优秀的软件，所以整体的界面是很美观优雅的。

老版本：
<img src="images/Note_vnote_old.png" alt="pic_old_Vnote" width=900px />

新版本：
<img src="images/Note_vnote_new.png" alt="pic_new_Vnote" width=900px />

可定制性较强，界面支持小部件拖拽移动，放在自己喜欢的地方，调整为自己喜欢、习惯的布局。
支持图片预览，且插入图片的图片可以通过内定的方式设置大小。方式为在写入图片地址后添加一个空格后写上设置的大小，如（=900x），但是这种方式仅仅对于使用了相同内置环境的编辑器有效，为了更兼容，在后期将所有需要设置大小的图片都改为了使用`<img />`标签去设置。但是需要注意这种方式不是 它的默认检测图片的范围内，所以修改完之后提示有图片不再使用，是否放入回收站，而实际上是使用的。
  
整个使用过程从 typora 迁移过来并没有很费劲，反而觉得在使用中由于是从代码编写，所以对 markdown 的语法有了更深刻的理解，也为了一些排版啥的去逐渐学习使用一些更为高级的语法使得自己的笔记更加美观与实用。
如果有添加在目录下但是不使用的照片会提示是否删除，删除也不是直接删除，他自己会创建一个以日期为名的文件夹为回收站去另存，这个其实感觉可以定义为自己检查而不是自动检查，有时候由于编写打乱了图片链接的代码便会马上提示显得很麻烦，比较影响使用体验。

在后期版本更新的时候对界面做了大改，精简很多，但是这时自己的笔记已经较多了，最最最明显的一个问题暴露出来，早期的版本不支持目录，当较多的时候需要分类就不够用了，后期的版本可以了，但是在导入其他的笔记时，没有办法导入目录中的目录。

新版本修复了这个问题。所以又回来使用了。

全平台：Windows、Mac、Linux
语言：中英日三种语言可选择
官网:  [https://tamlok.github.io/vnote](https://tamlok.github.io/vnote)
Github项目地址:  [https://github.com/tamlok/vnote](https://github.com/tamlok/vnote)
# Others

## 1  . Gridea

Gridea 是一个静态博客写作客户端，帮助你更容易地构建并管理博客或任何静态站点。
想要体验博客那种感觉？没有服务器？懒得在本地搭建环境？这个软件可以让你在客户端写作然后在本地网页可以预览效果。

<img src="images/Note_Gridea.png" alt="pic_3_Gridea" width=900px />

Markdown：知道你钟爱 Markdown 写作，我们也是
快且安全：Gridea 所有文件都在你的本地，构建为更快更安全的静态网站，无需管理数据库，向 Wordpress 说拜拜
简而不凡：简单几步即可搭建网站。无论博客抑或企业站点，强大的自定义能力，轻松驾驭

全平台：Windows、Mac、Linux
语言：中英两种语言
Github项目地址:  [https://github.com/getgridea/gridea/](https://github.com/getgridea/gridea/)
官网地址:  [https://gridea.dev/docs/](https://gridea.dev/docs/)

## 2. Trilium

超高自由度的个人知识库

一开始自己看到他的演示文档中有目录存在，正常理解也应该是存在目录的，所以一开始尝试去添加一个自己的根文件夹，但是一直没找到，后来仔细去看了官方文档才了解到，他是没有明确指明目录结构的，但是构建的每一个（文档、代码、日记等等）都可以有无限的子节点，其实也就是相当于是有目录的，而且每个目录还都可以去详细的介绍是用来做什么的，更容易理解，去除了担心时间太久而忘记这个'目录是用来做什么的'，不用去多写一个介绍文档

<img src="images/Note_Trilium.png" alt="pic_4_Trilium" width=900px />

可加密，轻盈简洁，能让信息不受阻碍直接呈现在眼前，高自由度
并且有一个配套的插件可以在网页中截图保存、保存整个网页、即时创建文本写入想要记下的。
另外有一个服务器端的，有需要的可以布置到自己的服务器或者自己额外的电脑设备上，就可以通过网页访问了，在保障同步性的情况下完全不用担忧隐私安全问题。
插件地址：[https://github.com/zadam/trilium-web-clipper/](https://github.com/zadam/trilium-web-clipper/)
使用的人并不是很多，除官网有介绍外，目前只找到一片日文的教程，且为19年的，配合谷歌翻译插件基本能了解大概怎么使用。
[使用教程](https://gigazine.net/news/20190118-trilium/)
  
以前用 markdown 去记笔记什么的，即时快捷方便，
但是后期越来越多之后弊端也开始体验出来，单个文件不可能完整的去记录下所有的东西，而且不断的填充也不利于阅读，而不断的开新篇的话相互之间的关联很难做到完美
也用于写日记，但是由于种种原因加密这一块是必须的，单弄一个软件来加密显得很笨拙而且麻烦，每一次编写但得反复的解密加密
而 Trilium 很好的解决了上面的问题，且项目开源，安全性应该是有保障的。
打造一个个人的知识库，在写作时可以不断加深巩固，也利于查缺补漏。
可以记一些自己的临时想法，也可以随手贴上自己看到的一篇好文，自己对一部剧的理解，等等等等。

全平台：Windows、Mac、Linux
语言：目前只有英文的，有个人用户对win64的做了简单的汉化并打包了的，可以自行搜索
Github项目地址:  [https://github.com/zadam/trilium](https://github.com/zadam/trilium)
