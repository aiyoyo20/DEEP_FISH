### linter：

1. [pycodestyle ( pep8 )](https://github.com/PyCQA/pycodestyle)：

    pycodestyle 是一款简单的代码检查工具，之前名字叫 pep8，为了减少混淆改名成 pycodestyle

2. [PyFlakes](https://github.com/PyCQA/pyflakes)：

    一个简单的 python 错误检查工具,通过解析源代码而不是 import 来检测不同的错误，通常只能检查出一些逻辑错误

3. [flake8](https://github.com/PyCQA/flake8)：

    针对 PEPE8 进行代码规范提示，是对 PyFlakes，pycodestyle、mccabe 的封装
    依赖 PyFlakes，pycodestyle、mccabe

4. [flakehell](https://github.com/flakehell/flakehell)：

    基于 flake8，最近更新于 2021.1
    依赖 colorama, entrypoints, flake8, pygments, toml, urllib3

5. [pylint](https://github.com/PyCQA/pylint/)：

    pylint 是代码检查工具，不能自动修改代码，有对于的配置文件，可以参考 google 开源的 pylintrc 配置文件，

    依赖 astroid, dill, isort, mccabe, platformdirs, tomlkit

6. [autopep8](https://github.com/hhatto/autopep8)：

    autopep8 是一款将 python 代码自动排版为 PEP8 风格的工具，它使用 pycodestyle 来决定哪部分代码需要格式化

    依赖 pycodestyle, toml

7. [ruff](https://github.com/charliermarsh/ruff)：

    一个极快的 Python linter，用 Rust 编写

    支持超过 500 条 lint 规则 ，其中许多规则的灵感来自流行的工具，如 Flake8， isort、pyupgrade 等

8. [mypy](https://github.com/python/mypy)：

    官方的检查工具

9. [pyright](https://github.com/python/mypy)：

    微软开源的语法检查工具，同时也是一个 lsp 工具，安装需要 node 环境，不过不依赖于 python，补全、检查会更快

10. [pyre](https://github.com/facebook/pyre-check)：

    facebook Performant type-checking for python，需要其他依赖，比较麻烦

11. [pydocstyle](https://github.com/PyCQA/pydocstyle)：

    pydocstyle 是一个静态分析工具，用于文档字符串样式检查，不过 pylinter 集成了类似的功能

12. [pylama](https://github.com/klen/pylama)：

    代码审查工具，集合了 pycodestyle，pydocstyle，PyFlakes，Mccabe 	，Pylint，Radon，eradicate，Mypy，Vulture ，不过并不是强制绑定，可选安然后可通过配置启用

13. [prospector](https://github.com/PyCQA/prospector)：

    集成了 Pylint，pycodestyle，Pyflakes，Mccabe，Dodgy，Pydocstyle，Profile-validator 	等的工具，还可添加拓展工具 Pyroma，Vulture，Frosted，Mypy，Bandit

1. [bandit](https://github.com/PyCQA/bandit)：

    Bandit 是一款旨在查找 Python 代码中常见安全问题的工具，比如代码注入，文件 IO 操作、SQL 注入、XSS 攻击等

15. [yapf](https://github.com/google/yapf)：

    yapf 是 google 开源的一个用于格式化 Python 代码的工具，可以一键美化代码，支持两种规范：PEP8 和 Google Style

16. [refurb](https://github.com/dosisod/refurb)：

    会给出一些建议，让代码更优雅

17. [vulture](https://github.com/jendrikseipp/vulture)：

    查找无效的 Python 代码

18. [unimport](https://github.com/hakancelikdev/unimport)：

    用于查找和删除未使用的导入语句的 linter、格式化程序

19. [pycln](https://github.com/hadialqattan/pycln)：

    用于查找和删除未使用的导入语句的格式化程序

### fixer：

1. [autoflake](https://github.com/PyCQA/autoflake)  

    Fix flake issues with autoflake.

2. [autopep8](https://github.com/hhatto/autopep8)   

    Fix PEP8 issues with autopep8.

1. [black](https://github.com/psf/black)

    Fix PEP8 issues with black.

4. [ruff](https://github.com/charliermarsh/ruff)

    A python linter/fixer for Python written in Rust

5. [yapf](https://github.com/google/yapf)       

    Fix Python files with yapf.

6. [reorder-python-imports](https://github.com/asottile/reorder_python_imports)

    Sort Python imports with reorder-python-imports.
    
    自动重新排序 python 导入的工具，类似于 isort 但更多地使用静态分析

1. [isort](https://github.com/PyCQA/isort)    

    Sort Python imports with isort.

8. [pycln](https://github.com/hadialqattan/pycln)

    remove unused python import statements

9. [pyflyby](https://github.com/deshaw/pyflyby)

    Tidy Python imports with pyflyby.

10. [autoimport](https://github.com/lyz-code/autoimport)

    Fix import issues with autoimport.
