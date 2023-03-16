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

`pyproject.toml` 文件中 table 名应带有 `tool.pylint.`，如`[tool.pylint.main]`

`tox.ini`、`setup.cfg` 文件中 table 名应带有 `pylint.`，如`[pylint.main]`

其余的没有明确说明，但是在 `pylintrc` 中测试，支持两种方案

#### 使用
简单使用

使用拓展

妙用：
忽略某些长字串，比如 url、user-agent 这些整体没有明确语义，不要求可读性的，通常为超长的字符串，可以通过正则的方式去忽略提示，传统的会强制提示超出超度限制，而对这些类型去强行分行反而会增加阅读难度。
