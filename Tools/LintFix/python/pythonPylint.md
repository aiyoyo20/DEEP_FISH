### pylint
通过 `pipdeptree -p pylint` 查看依赖树。（pipdeptree 需要安装）

```
pylint==2.17.0
  - astroid [required: >=2.15.0,<=2.17.0-dev0, installed: 2.15.0]
    - lazy-object-proxy [required: >=1.4.0, installed: 1.9.0]
    - wrapt [required: >=1.14,<2, installed: 1.15.0]
  - dill [required: >=0.3.6, installed: 0.3.6]
  - isort [required: >=4.2.5,<6, installed: 5.12.0]
  - mccabe [required: >=0.6,<0.8, installed: 0.7.0]
  - platformdirs [required: >=2.2.0, installed: 2.6.2]
  - tomlkit [required: >=0.10.1, installed: 0.11.6]
```

能够发现代码中的问题和潜在风险，如语法错误、格式问题、逻辑错误、代码重复、安全漏洞、类型错误、代码复杂度、命令规范、文档缺失、包引入问题等。通过使用Pylint，开发者可以提高代码的可读性、可维护性和可扩展性，减少代码错误和维护成本。

文档地址：[https://pylint.readthedocs.io/en/v2.17.0/index.html](https://pylint.readthedocs.io/en/v2.17.0/index.html)

而且支持配置，可以用默认支持的配置文件名，添加、修改自己需要的配置，其强化、弱化自己的检查需要，开启额外的拓展等；也可以自定义配置文件名，然后在使用的使用带参传入配置地址使用。

#### 配置
pylint 的所有配置都可以通过命令行传入参数覆盖，配置文件仅仅是在需要多次使用提供简化。

通过 `--rcfile` 可以指定配置的地址。如果不通过这个参数指定，会按照如下优先级查找配置文件。

1. `pylintrc`
2. `.pylintrc`
3. `pyproject.toml`
4. `setup.cfg`
5. `tox.ini`
6. 如果当前工作目录在 Python 包中，Pylint 会向上搜索 Python 包的层次结构，直到找到 `pylintrc` 文件。
7. 环境变量命名的文件 PYLINTRC
8. 在非 root 的家目录下
    1. `.pylintrc`
    2. `.config/pylintrc`
9. `/etc/pylintrc`

`pyproject.toml` 文件中 table 名应带有 `tool.pylint.`，如`[tool.pylint.main]` ,这种文件的内容格式可参考 `pylint --generate-toml-config` 的输出结果，即 toml 格式

`tox.ini`、`setup.cfg` 文件中 table 名应带有 `pylint.`，如`[pylint.main]`，这种文件的内容格式可参考`pylint --generate-rcfile`的输出结果，即 ini 格式格式

toml 格式和 ini 格式是不兼容的，需要注意。

举个例子：
 `setup.cfg` 中的内容：

 ```
 [pylint.main]
disable = import-error,
          invalid-name
 ```

`project.toml`  中的内容：

```
[tool.pylint.main]
disable = ["import-error" , "invalid-name"]
```

这里顺带提下吧，上面的`disable`参数在两种生成的配置文件中都是在`messages control`子项下的，但是改为`main`项下已经可以正常生效。

其余的没有明确说明，但是在 `pylintrc` 中测试，支持两种方案

#### 使用
##### 关闭某些异常输出
比如：

    1、问题 1、2 中的包导入问题，错误代码`E0401`，错误类型`import-error`
    2、变量命名不符合蛇形命名法，错误代码`C0103`，错误类型`invalid-name`

可通过`disable`参数关闭这类检查，在`setup.cfg`中配置：

```
[pylint.main]
disable = import-error,
		  invalid-name
```

也可以将错误类型换成错误代码：

```
[pylint.main]
disable = C0103,E0401
```

两种方式的效果是一样的，具体使用哪种可以根据自己的使用习惯，或者是使用的编辑器的插件的默认异常信息输出的结果，正常来说 pylint 的结果中是包括错误代码和错误类型两种信息的。

##### 命名风格的更换
pylint 有默认的命名风格，基本都是基于官方的，但是在其他语言的命名风格可能会不同，这些命名风格 python 本身没有太多限制，甚至是混用都是可以的，但是为了更好的阅读性，建议个人及团队使用统一的命名风格。

有以下集中命名方式：

    snake_case：蛇形命名法，字符全小写，中间以 `_` 连接
    camelCase： 小驼峰命名法，首个单词小写，后面的单词首字母大写
    PascalCase：大驼峰命名法，所有单词的首字母大写
    UPPER_CASE：所有单词大写，以 `_` 连接
    any：不做任何限制，只要符合变量名规范，不引发异常即可

可指定的部分：

    --module-naming-style=<style>
    Default: snake_case
    模块名

    --const-naming-style=<style>
    Default: UPPER_CASE
    常量名称

    --class-naming-style=<style>
    Default: PascalCase
    类名

    --function-naming-style=<style>
    Default: snake_case
    函数名

    --method-naming-style=<style>
    Default: snake_case
    方法名

    --attr-naming-style=<style>
    Default: snake_case
    属性名

    --argument-naming-style=<style>
    Default: snake_case
    参数名

    --variable-naming-style=<style>
    Default: snake_case
    变量名

    --class-attribute-naming-style=<style>
    Default: any
    类属性

    --class-const-naming-style=<style>
    Default: UPPER_CASE
    类常量

    --inlinevar-naming-style=<style>
    Default: any
    内联迭代名（我想应该是推导式中的参数名称）

也可以制定自定义正则表达式，比如某个子模块下的名称都应该有一定的前缀后缀什么的，支持上面提到的每个细节部分的名称定义，具体的参数就不一一列举类，但需要注意的是自定义正则表达式会覆盖重新指定的命名风格及默认命名风格。

可能存在情况就是不同的模块有不同的部门开发，在后期后并时就有多种命名风格，pylint 也提供了指定多个命名风格。通过特殊的自定义正则表达式可以实现。

比如：`--function-rgx='(?:(?P<snake>[a-z_]+)|(?P<camel>[a-z]+([A-Z][a-z]*)*))$'` 就支持蛇形表达式和小驼峰命名法两种

##### 命名风格问题的解决
两种方法：

    1、完全禁用`C0103`命令检查，disable 参数
    2、为其指定多个命名规范，--function-rgx 等参数

看需求是要关闭所有还是部分

##### 忽略某些长字串
比如 url、user-agent 这些整体没有明确语义，不要求可读性的，通常为超长的字符串，可以通过正则的方式去忽略提示，传统的会强制提示超出超度限制，而对这些类型去强行分行反而会增加阅读难度



#### 问题
目前使用过程中的一些问题：

1、在虚拟环境中使用 pylint，虚拟环境中未安装 pylint，如果每个虚拟环境都需要安装也不符合使用习惯，主环境中的 pylint 无法正确识别虚拟环境中的包，mypy 中的相同问题可通过参数`python_executable`解决，pylint 暂时没有什么好的解决方案

2、同样是包问题，对于自己定义的包在引用的时候提示未找到，但是程序是可以正常运行的，暂时不确定是自己的包定义不符合规范还是 pylint 的包定义要求太过于严苛
