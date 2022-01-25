# 介绍
DOM 是 Docmument Object Model（文档对象模型）的缩写。
HTML DOM 定义了所有 HTML 元素的对象和属性，以及访问它们的方法。

换言之，HTML DOM 是关于如何获取、修改、添加或删除 HTML 元素的标准。

# 节点
HTML 文档中的所有内容都是节点：

整个文档是一个文档节点
每个 HTML 元素是元素节点
HTML 元素内的文本是文本节点
每个 HTML 属性是属性节点
注释是注释节点

节点父、子和同胞
节点树中的节点彼此拥有层级关系。

我们常用父（parent）、子（child）和同胞（sibling）等术语来描述这些关系。父节点拥有子节点。同级的子节点被称为同胞（兄弟或姐妹）。

在节点树中，顶端节点被称为根（root）。
每个节点都有父节点、除了根（它没有父节点）。
一个节点可拥有任意数量的子节点。
同胞是拥有相同父节点的节点。

# 方法
HTML DOM 方法是我们可以在节点（HTML 元素）上执行的动作。

一些常用的 HTML DOM 方法：

getElementById(id) - 获取带有指定 id 的节点（元素）
appendChild(node) - 插入新的子节点（元素）
removeChild(node) - 删除子节点（元素）

# 属性
HTML DOM 属性是我们可以在节点（HTML 元素）设置和修改的值。

一些常用的 HTML DOM 属性：

innerHTML - 节点（元素）的文本值
parentNode - 节点（元素）的父节点
childNodes - 节点（元素）的子节点
attributes - 节点（元素）的属性节点

# 事件
HTML DOM 允许 JavaScript 对 HTML 事件作出反应。

HTML 事件的例子：

当用户点击鼠标时
当网页已加载时
当图片已加载时
当鼠标移动到元素上时
当输入字段被改变时
当 HTML 表单被提交时
当用户触发按键时

HTML 事件属性
如需向 HTML 元素分配事件，您可以使用事件属性
