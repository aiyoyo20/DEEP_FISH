Broad Try 条款检查器

此检查器由 提供pylint.extensions.broad_try_clause。检查器的逐字名称是broad_try_clause。

另请参阅broad_try_clause 检查器的选项文档
Broad Try Clause 检查器消息

太多尝试语句 (W0717) ：

    Try 子句包含太多语句。

代码风格检查器

此检查器由 提供pylint.extensions.code_style。检查器的逐字名称是code_style。
代码风格检查器文档

可以提高代码一致性的检查器。因此，它们不一定会提供性能优势，而且常常是固执己见的。

另请参阅code_style 检查器的选项文档
代码风格检查器消息

考虑使用元组 (R6102) ：

    考虑使用就地元组而不是列表仅用于样式一致性！在就地定义的地方list可以用tuple. 由于 CPython 的优化，它没有性能优势。
考虑使用命名元组或数据类 (R6101) ：

    考虑对字典值使用 namedtuple 或 dataclass当字典值可以被 namedtuple 或 dataclass 实例替换时发出。
考虑使用赋值表达式 (R6103) ：

    当 if 赋值直接跟在 if 语句之后并且两者可以通过使用赋值表达式组合时，使用 '%s' 代替:=Emitted 。需要 Python 3.8 和.py-version >= 3.8
考虑使用增强分配（R6104）：

    使用“%s”直接执行扩充赋值当赋值引用它正在赋值的对象时发出。这可以更改为增强分配。默认禁用！

比较空字符串检查器

此检查器由 提供pylint.extensions.emptystring。检查器的逐字名称是compare-to-empty-string。
比较空字符串检查器消息

比较空字符串 (C1901) ：

    “%s”可以简化为“%s”，因为空字符串是错误的当 Pylint 检测到与空字符串常量的比较时使用。

比较零检查器

此检查器由 提供pylint.extensions.comparetozero。检查器的逐字名称是compare-to-zero。
比较零检查器消息

与零比较 (C2001) ：

    “%s”可以简化为“%s”，因为 0 是错误的当 Pylint 检测到与 0 常量的比较时使用。

比较-放置检查器

此检查器由 提供pylint.extensions.comparison_placement。检查器的逐字名称是comparison-placement。
比较-放置检查器消息

错位比较常数 (C2201) ：

    Comparison should be %s当常量位于比较的左侧时使用。将它放在比较的右侧通常意图更清楚。

混淆 Elif 检查器

此检查器由 提供pylint.extensions.confusing_elif。检查器的逐字名称是confusing_elif。
混淆 Elif 检查器消息

令人困惑的连续 elif (R5601) ：

    具有不同缩进级别的连续 elif，考虑创建一个函数来分隔内部 elif当 elif 语句紧跟在本身以 if 或 elif 结尾的缩进块之后时使用。如果 elif 语句被有意或错误地取消缩进，这可能并不令人讨厌。将缩进的 if 语句提取到单独的函数中可能会避免混淆并防止错误。

考虑使用任意或全部检查器

此检查器由 提供pylint.extensions.for_any_all。检查器的逐字名称是consider-using-any-or-all。
考虑使用任何或所有检查消息

考虑使用任何或全部 (C0501) ：

    `for` 循环可以是 `%s`检查条件并返回布尔值的 for 循环可以替换为 any 或 all。

考虑重构为 While 检查器

此检查器由 提供pylint.extensions.consider_refactoring_into_while_condition。检查器的逐字名称是consider_refactoring_into_while。
考虑重构为 While 检查消息

考虑重构为 while-condition (R3501) ：

    考虑使用 'while %s' 而不是 'while %s:' 一个 'if' 和一个 'break'当使用while True:循环并且第一个语句是中断条件时发出。如果检查被反转并移动到语句，则可以删除该构造。if / breakwhile

考虑三元表达式检查器

此检查器由 提供pylint.extensions.consider_ternary_expression。检查器的逐字名称是consider_ternary_expression。
考虑三元表达式检查器消息

考虑三元表达式 (W0160) ：

    考虑重写为三元表达式分布在 if/else 块中的多个赋值语句可以用单个赋值和三元表达式重写

弃用的内置检查器

此检查器由 提供pylint.extensions.bad_builtin。检查器的逐字名称是deprecated_builtins。
弃用的内置检查器文档

这曾经是bad-builtin核心检查器，但已移至扩展程序。它可用于查找禁止使用的内置函数，例如存在其他替代方法的map或。filter

如果你想控制检查器应该警告哪些内置函数，你可以使用该bad-functions选项：

$ pylint a.py --load-plugins=pylint.extensions.bad_builtin --bad-functions=apply,reduce
...

另请参阅deprecated_builtins 检查器选项的文档
弃用的内置检查器消息

坏内置（W0141）：

    Used builtin function %s在使用不允许的内置函数时使用（请参阅 bad-function 选项）。通常不允许使用的函数是 map 或 filter 之类的函数，Python 现在提供了一些更简洁的替代方法，例如列表理解。

设计检查器

此检查器由 提供pylint.extensions.mccabe。检查器的逐字名称是design。
设计检查器文档

您现在可以使用此插件查找代码库中的复杂性问题。

通过激活它。它引入了一个新的警告，当代码块的复杂性高于预先设定的值时发出，可以通过选项控制，例如在这个例子中：pylint --load-plugins=pylint.extensions.mccabetoo-complexmax-complexity

$ cat a.py
def f10():
    """McCabe rating: 11"""
    myint = 2
    if myint == 5:
        return myint
    elif myint == 6:
        return myint
    elif myint == 7:
        return myint
    elif myint == 8:
        return myint
    elif myint == 9:
        return myint
    elif myint == 10:
        if myint == 8:
            while True:
                return True
        elif myint == 8:
            with myint:
                return 8
    else:
        if myint == 2:
            return myint
        return myint
    return myint
$ pylint a.py --load-plugins=pylint.extensions.mccabe
R:1: 'f10' is too complex. The McCabe rating is 11 (too-complex)
$ pylint a.py --load-plugins=pylint.extensions.mccabe --max-complexity=50
$

另请参阅设计检查器选项的文档
设计检查器消息

太复杂（R1260）：

    %s 太复杂了。McCabe 评级为 %d当基于 McCabe Complexity Cyclomatic 的方法或函数过于复杂时使用

Dict-Init-Mutate 检查器

此检查器由 提供pylint.extensions.dict_init_mutate。检查器的逐字名称是dict-init-mutate。
Dict-Init-Mutate 检查器消息

dict-init-mutate (C3401) ：

    初始化字典时声明所有已知的键/值。字典可以使用字典文字语法用单个语句初始化。

文档样式检查器

此检查器由 提供pylint.extensions.docstyle。检查器的逐字名称是docstyle。
Docstyle 检查器消息

错误文档字符串引号 (C0198) ：

    %s 中错误的文档字符串引号，应为“””，给定 %s当文档字符串没有三重双引号时使用。
文档字符串第一行空（C0199）：

    First line empty in %s docstring当在文档字符串的开头发现空行时使用。

Dunder 检查器

此检查器由 提供pylint.extensions.dunder。检查器的逐字名称是dunder。

另请参阅dunder checker 的选项文档
Dunder 检查器消息

坏双打名称（W3201）：

    Dunder 方法名称 %s 错误或拼写错误。当 dunder 方法拼写错误或定义的名称不在预定义的 dunder 名称列表中时使用。

否则如果使用检查器

此检查器由 提供pylint.extensions.check_elif。检查器的逐字名称是else_if_used。
否则如果使用检查器消息

else-if-used (R5501) ：

    考虑使用“elif”而不是“else”然后使用“if”来删除一个缩进级别当 else 语句紧跟 if 语句并且不包含与其无关的语句时使用。

空评论检查器

此检查器由 提供pylint.extensions.empty_comment。检查器的逐字名称是empty-comment。
空注释检查器消息

空注释（R2044）：

    带空注释的行 当 # 符号出现在后面没有实际注释的行上时使用

Eq-Without-Hash 检查器

此检查器由 提供pylint.extensions.eq_without_hash。检查器的逐字名称是eq-without-hash。
Eq-Without-Hash 检查消息

eq-without-hash (W1641) ：

    在不实现 __hash__ 的情况下实现 __eq__当类实现 __eq__ 但不实现 __hash__ 时使用。如果对象还实现了 __eq__，则对象将 None 作为它们的默认 __hash__ 实现。

导入私人名称检查器

此检查器由 提供pylint.extensions.private_import。检查器的逐字名称是import-private-name。
Import-Private-Name 检查器消息

导入私有名称 (C2701) ：

    Imported private %s (%s)在导入以 _ 为前缀的私有模块或对象时使用。PEP8 命名约定指南指出，带有前导下划线的公共属性应被视为私有属性。

魔法值检查器

此检查器由 提供pylint.extensions.magic_value。检查器的逐字名称是magic-value。

另请参阅魔术值检查器的选项文档
魔法值检查器消息

魔法值比较（R2004）：

    考虑使用命名常量或枚举代替“%s”。使用命名常量而不是魔法值有助于提高代码的可读性和可维护性，在比较中尽量避免使用它们。

多类型检查器

此检查器由 提供pylint.extensions.redefined_variable_type。检查器的逐字名称是multiple_types。
多类型检查器消息

重新定义变量类型 (R0204) ：

    将 %s 类型从 %s 重新定义为 %s当变量类型在方法或函数内发生变化时使用。

没有自用检查器

此检查器由 提供pylint.extensions.no_self_use。检查器的逐字名称是no_self_use。
没有自用检查器消息

非自用 (R6301) :

    方法可以是函数当方法不使用其绑定实例时使用，因此可以写成函数。

重叠 - 除了检查器

此检查器由 提供pylint.extensions.overlapping_exceptions。检查器的逐字名称是overlap-except。
重叠-除了检查器消息

重叠（W0714）除外：

    Overlapping exceptions (%s)当处理程序中的异常重叠或相同时使用

参数文档检查器

此检查器由 提供pylint.extensions.docparams。检查器的逐字名称是parameter_documentation。
参数文档检查器文档

如果您在代码中系统地记录函数、方法和构造函数的参数及其类型，则此可选组件可能对您有用。支持 Sphinx 风格、Google 风格和 Numpy 风格。（有关示例，请参阅https://pypi.org/project/sphinxcontrib-napoleon/。）

您可以通过添加以下行来激活此检查器：

load-plugins=pylint.extensions.docparams

到MAIN你的部分.pylintrc。

此检查器验证所有函数、方法和构造函数文档字符串是否包含

    参数及其类型

    返回值及其类型

    引发异常

并且可以处理文档字符串

    狮身人面像样式 ( param, type, return, rtype, raise/ except):

    def function_foo(x, y, z):
        '''function foo ...

        :param x: bla x
        :type x: int

        :param y: bla y
        :type y: float

        :param int z: bla z

        :return: sum
        :rtype: float

        :raises OSError: bla
        '''
        return x + y + z

    或谷歌风格（Args:, Returns:, Raises:）：

    def function_foo(x, y, z):
        '''function foo ...

        Args:
            x (int): bla x
            y (float): bla y

            z (int): bla z

        Returns:
            float: sum

        Raises:
            OSError: bla
        '''
        return x + y + z

    或 Numpy 风格（Parameters, Returns, Raises）：

    def function_foo(x, y, z):
        '''function foo ...

        Parameters
        ----------
        x: int
            bla x
        y: float
            bla y

        z: int
            bla z

        Returns
        -------
        float
            sum

        Raises
        ------
        OSError
            bla
        '''
        return x + y + z

您将收到缺少参数文档的通知，以及签名和文档之间命名不一致的通知，这些不一致通常是在代码中自动重命名参数而不是在文档中重命名时出现的。注意：默认情况下不检查私有方法和魔术方法的文档字符串。要更改此行为（例如，还要检查__init__），no-docstring-rgx=^(?!__init__$)_请将.BASIC.pylintrc

构造函数参数可以记录在类文档字符串或__init__文档字符串中，但不能同时记录在两者中：

class ClassFoo(object):
    '''Sphinx style docstring foo

    :param float x: bla x

    :param y: bla y
    :type y: int
    '''
    def __init__(self, x, y):
        pass

class ClassBar(object):
    def __init__(self, x, y):
        '''Google style docstring bar

        Args:
            x (float): bla x
            y (int): bla y
        '''
        pass

在某些情况下，必须记录所有参数是一件麻烦事，例如，如果您的许多函数或方法仅遵循一个公共接口。为了消除这种负担，如果在文档字符串中发现以下短语之一，检查器将接受缺少的参数文档：

    其他参数见

    参数见

（单词之间有任意空格）。请在“查看”之后添加指向定义接口的文档字符串的链接，例如超类方法：

def callback(x, y, z):
    '''Sphinx style docstring for callback ...

    :param x: bla x
    :type x: int

    For the other parameters, see
    :class:`MyFrameworkUsingAndDefiningCallback`
    '''
    return x + y + z

def callback(x, y, z):
    '''Google style docstring for callback ...

    Args:
        x (int): bla x

    For the other parameters, see
    :class:`MyFrameworkUsingAndDefiningCallback`
    '''
    return x + y + z

仍然检测到现有参数及其类型文档中的命名不一致。

另请参阅parameter_documentation 检查器选项的文档
参数文档检查器消息

差异参数文档（W9017）：

    “%s”在参数文档中不同请检查声明中的参数名称。
不同类型文档 (W9018) ：

    “%s”在参数类型文档中不同请检查类型声明中的参数名称。
多构造函数文档（W9005）：

    “%s”在类和 __init__ 中记录了构造函数参数。请删除类或构造函数中的参数声明。
缺少参数文档（W9015）：

    参数文档中缺少“%s”请为所有参数添加参数声明。
缺少类型文件 (W9016) ：

    参数类型文档中缺少“%s”请为所有参数添加参数类型声明。
缺少加注文档 (W9006) ：

    “%s”未记录为引发请记录所有引发的异常类型的异常。
无用参数文档（W9019）：

    “%s”无用的忽略参数文档请删除忽略参数文档。
无用类型文档（W9020）：

    “%s”无用的忽略参数类型文档请删除忽略的参数类型文档。
缺少任何参数文档 (W9021) ：

    “%s”中缺少任何文档请添加参数和/或类型文档。
缺少返回文件 (W9011) ：

    缺少返回文档请添加有关此方法返回内容的文档。
缺少退货类型文件 (W9012) ：

    缺少返回类型文档请记录此方法返回的类型。
缺少产量文件 (W9013) ：

    缺少产量文档请添加有关此生成器产量的文档。
缺少收益类型文档 (W9014) ：

    缺少收益类型文档请记录此方法生成的类型。
冗余返回文档 (W9008) ：

    冗余退货文档请从此方法中删除 return/rtype 文档。
冗余收益文档 (W9010) ：

    冗余收益文档请从此方法中删除收益文档。

重新定义的循环名称检查器

此检查器由 提供pylint.extensions.redefined_loop_name。检查器的逐字名称是redefined-loop-name。
重新定义的循环名称检查器消息

重新定义循环名称（W2901）：

    Redefining %r from loop (line %s)在循环体中覆盖循环变量时使用。

设置会员检查器

此检查器由 提供pylint.extensions.set_membership。检查器的逐字名称是set_membership。
设置成员检查器消息

为成员使用设置 (R6201) ：

    考虑使用 set 进行成员测试成员测试在查找优化数据类型（如sets.

打字检查器

此检查器由 提供pylint.extensions.typing。检查器的逐字名称是typing。
键入检查器文档

查找与类型注释特别相关的问题。

另请参阅键入检查器选项的文档
输入检查器消息

破损不返航 (E6004) ：

    复合类型内部的“NoReturn”在 3.7.0 / 3.7.1 中被破坏 typing.NoReturn内部复合类型在 Python 3.7.0 和 3.7.1 中被破坏。如果不依赖于运行时自省，请改用字符串注释。例如。https://bugs.python.org/issue34921Callable[..., 'NoReturn']
损坏的集合可调用 (E6005) ：

    Optional 和 Union 中的 'collections.abc.Callable' 在 3.9.0 / 3.9.1 中被破坏（改为使用 'typing.Callable'） collections.abc.Callable在 Python 3.9.0 和 3.9.1 中 Optional 和 Union 中被破坏。请改用typing.Callable这些情况。https://bugs.python.org/issue42965
弃用的打字别名（W6001）：

    “%s”已弃用，请使用“%s”代替Emitted 当使用已弃用的键入别名时。
考虑使用别名 (R6002) ：

    PY39 将弃用“%s”，考虑使用“%s”代替%s仅当“runtime-typing=no”并且在 Python 3.7 或 3.8 的类型注释上下文中使用弃用的类型别名时才会发出。
考虑替代联合语法 (R6003) ：

    考虑使用替代的 Union 语法而不是“%s”%s当使用“typing.Union”或“typing.Optional”而不是替代的 Union 语法“int | 没有任何'。
冗余类型提示参数（R6006）：

    在联合类型注释中多次使用类型“%s”。删除多余的类型提示。mypy工具将跳过重复的类型参数，因此应将其删除以避免混淆。

While Used 检查器

此检查器由 提供pylint.extensions.while_used。检查器的逐字名称是while_used。
当使用检查器消息

使用时 (W0149) ：

    使用 `while` 循环无界while循环通常可以重写为有界for循环。可以为事件循环、侦听器等情况创建例外。

