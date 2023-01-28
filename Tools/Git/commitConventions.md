这个问题其实来源已久了。公司是新发展的，都是一群小年轻，很多东西都是慢慢发现再一步步去改的，包括大家的文档格式要求、编码要求、注释要求等等。自己在一开始有这方面的考虑，但是没去研究，以自己的一些关键词去作为依据，比如，新增了什么、修改了什么、格式的调整、删除了什么等等。虽说不上规范，相对一些无意义的信息还是具有一定的参考意义的。

这次能重视这个也是因为之前有个内容觉着不用了给删除了，但是现在又觉得很需要。好在自己的`commit message` 有包含一定的操作逻辑关键词，才没有很费劲找到了当时删除的内容。

大公司有自己的规范，比如 google ，都是相对严谨标准的规范，可以借鉴或直接使用。但看了不少的开源项目，如果以公司为主导，是有规范的，社区为主的项目相对宽松很多，比如通用的都是`<type>(<scope>): <subject>`，但可以省略前两个，让`subject`遵循规范，如以动词开头，使用第一人称现在时，第一个字母小写，结尾不加句号。

### Commit message 的作用
每次 git 提交 commit message 是必不可少的内容，可见其重要性。

规范的 commit 能带来这些优势：

    （1）提供更多的历史信息，方便快速浏览。
    （2）可以过滤某些commit（比如文档改动），便于快速查找信息。
    （3）可以直接从commit生成Change log。

### Commit message 的格式

格式模板：
```
<type>(<scope>): <short summary>

<body>

<footer>
```

从上到下分三部分（Header、Body、Footer），其中 Header 是必须的，其余两项则是可选的。

* Commit Message Header

（1）type : 表明 commit 的操作属性。是 Header 中的必须项。目前看到的几个版本有些许的出入。这里以最新版本 [angular 15.1.2 (2023-01-25)](https://github.com/angular/angular/releases/tag/15.1.2)

    build: 影响构建系统或外部依赖关系的更改
    ci: 对 ci（“Configuration Item”的缩写来使用,中文中表示:“配置项”）配置文件和脚本的更改
    docs: 仅文档更改
    feat: 一项新功能
    fix: 错误修复
    perf: 提高性能的代码更改
    refactor: 既不修复 bug 也不添加功能的代码更改
    test: 添加缺少的测试或更正现有测试

**重大变更**:进行重大更改的提交应在提交类型后面附加 !。重大更改可能会破坏开发者在其应用中使用 Blockly 的行为，进而导致他们必须执行额外的操作。

（2）scope ： 受影响的范围。如果是原项目 angular 就是指受影响的npm包的名称，其他如后端项目的话就可以是数据层、控制层、视图层等。

（3）short summary ： Summary in present tense. Not capitalized. No period at the end.（必选项，最为重要）

    1) 使用祈使式，现在时：“change”不是“changed”也不是“changes”
    2) 不要将第一个字母大写
    3) 结尾没有点（.）

**Commit Message Body**

正如在总结中一样，使用祈使式现在时：“fix”而不是“fixed”或“fixes”。

在提交消息正文中解释更改的动机。此提交消息应解释进行更改的原因。可以将先前行为与新行为进行比较，以说明更改的影响。

**Commit Message Footer**

页脚可以包含有关中断更改和弃用的信息，也是引用 GitHub issues, Jira tickets以及此提交关闭或与之相关的其他 PR 的地方。

例如：
```
BREAKING CHANGE: <breaking change summary>
<BLANK LINE>
<breaking change description + migration instructions>
<BLANK LINE>
<BLANK LINE>
Fixes #<issue number>
```

或

```
DEPRECATED: <what is deprecated>
<BLANK LINE>
<deprecation description + recommended update path>
<BLANK LINE>
<BLANK LINE>
Closes #<pr number>
```

中断更改部分应以短语 "BREAKING CHANGE: " 开头，然后是中断更改的摘要、空白行和中断更改的详细描述，其中还包括迁移说明。

类似地，弃用部分应以  "DEPRECATED: " 开头，然后是弃用内容的简短描述、空白行和弃用的详细描述，其中还提到了建议的更新路径。

**Revert commits**

如果提交还原了以前的提交，则应以return:开头，后跟还原提交的标头。

提交消息正文的内容应包含：

有关正在还原的提交的SHA的信息，格式如下：This restores commit＜SHA＞，

明确说明恢复提交消息的原因。



#### 可参考文章推荐
[google angular CONTRIBUTING](https://github.com/angular/angular/blob/main/CONTRIBUTING.md)

[AngularJS Git Commit Message Conventions](https://docs.google.com/document/d/1QrDFcIiPjSLDn3EL15IJygNPiHORgU1_OOAqWjiDU5Y/edit#heading=h.uyo6cb12dt6w)

[Commit message 和 Change log 编写指南](https://www.ruanyifeng.com/blog/2016/01/commit_message_change_log.html)

[GitCommit规范(reprint))](GitCommit规范(reprint).md)
