#### 方案一
```
Virtualenv  # 虚拟环境切换,需要 `virtualenv` 包支持，还可通过设置中的 `"virtualenv_directories"=[] // virtualenvwrapper $WORKON_HOME` 配置自己的虚拟环境目录，这样可调用在外设置的虚拟环境
Jedi - Python autocompletion  # 语法补全，而且与 Virtualenv 无冲突，也可以手动配置虚拟环境，但麻烦些
AutoPEP8 # 快捷方式快速对文件格式进行调整
SublimeLinter # 语法检查框架，不能单独使用
SublimeLinter-flake8 # 需要安装 `flake8` ，配合 SublimeLinter 实现对语法的检查
```

##### SublimeLinter + SublimeLinter-flake8
语法检查工具，支持多个检查工具，可自己配置，`SublimeLinter-flake8` 需要安装相应的 python 包。

如果使用 Anaconda 插件需要关闭其自带的语法检查，否则会有冲突

##### Jedi - Python autocompletion
通过修改 Jedi 配置中的"python_virtualenv"， "python_interpreter" 也可以实现对 python 版本及外部创建的虚拟环境的使用

Anaconda 有虚拟环境管理，但是以前用 Anaconda 作为包管理器创建的环境不是很纯净，这个就默认没有去尝试了。
SublimeCodeIntel 初初使用了一下，可能是没有配置好，使用时会提供很多的其他的不需要的可选项。

##### AutoPEP8：
>Automatically formats Python code to conform to the PEP 8 style guide using autopep8 and pep8 modules

快速完成对代码的格式化，让代码更优雅。

##### Virtualenv
在 sublime 4 中安装后无法正常使用，查看加载有如下报错：
```
reloading python 3.3 plugin Virtualenv.commands
Traceback (most recent call last):
  File "/opt/sublime_text/Lib/python33/sublime_plugin.py", line 308, in reload_plugin
    m = importlib.import_module(modulename)
  File "./python3.3/importlib/__init__.py", line 90, in import_module
  File "<frozen importlib._bootstrap>", line 1584, in _gcd_import
  File "<frozen importlib._bootstrap>", line 1565, in _find_and_load
  File "<frozen importlib._bootstrap>", line 1532, in _find_and_load_unlocked
  File "/opt/sublime_text/Lib/python33/sublime_plugin.py", line 1692, in load_module
    exec(compile(source, source_path, 'exec'), mod.__dict__)
  File "/home/aiyoyo/.config/sublime-text/Installed Packages/Virtualenv.sublime-package/commands.py", line 126, in <module>
AttributeError: 'module' object has no attribute 'exec'
reloading python 3.3 plugin Virtualenv.integrations
Traceback (most recent call last):
  File "/opt/sublime_text/Lib/python33/sublime_plugin.py", line 308, in reload_plugin
    m = importlib.import_module(modulename)
  File "./python3.3/importlib/__init__.py", line 90, in import_module
  File "<frozen importlib._bootstrap>", line 1584, in _gcd_import
  File "<frozen importlib._bootstrap>", line 1565, in _find_and_load
  File "<frozen importlib._bootstrap>", line 1532, in _find_and_load_unlocked
  File "/opt/sublime_text/Lib/python33/sublime_plugin.py", line 1692, in load_module
    exec(compile(source, source_path, 'exec'), mod.__dict__)
  File "/home/aiyoyo/.config/sublime-text/Installed Packages/Virtualenv.sublime-package/integrations.py", line 5, in <module>
  File "<frozen importlib._bootstrap>", line 1565, in _find_and_load
  File "<frozen importlib._bootstrap>", line 1532, in _find_and_load_unlocked
  File "/opt/sublime_text/Lib/python33/sublime_plugin.py", line 1692, in load_module
    exec(compile(source, source_path, 'exec'), mod.__dict__)
  File "/home/aiyoyo/.config/sublime-text/Installed Packages/Virtualenv.sublime-package/commands.py", line 126, in <module>
AttributeError: 'module' object has no attribute 'exec'
```

解决方法是在包中添加一个文件`.python-version `并在其中指明其他版本的 python 即可。
```
cd ~
echo "3.8" > .python-version
# 如果是包管理器安装的如下将文件合进去即可
zip -u ~/.config/sublime-text/Installed\ Packages/Virtualenv.sublime-package .python-version
# 下载手动安装的话
cp .python-version ~/.config/sublime-text/Packages/Virtualenv/
rm .python-version
```

这样加载 Virtualenv 时会使用`python3.8`而不是默认的`python3.3`就能正常使用了。

因该是`sublime 4`考虑了兼容新增的`python3.8`。其他插件如果有类似的异常也可以试试这种方法。不过不建议替换之前版本的python内核，可能与sublime程序本身不兼容。


#### 方案二
```
Virtualenv
LSP # Client implementation of the Language Server Protocol for Sublime Text
LSP-pylsp # 搭配 LSP 使用，可以实现代码补全，检查等功能，需要`python-lsp-server`包
```

不支持虚拟环境，`Virtualenv`插件是用来切换运行时的环境。

对于其他环境的包应用补全可以通过设置`"pylsp.plugins.jedi.environment":`来实现，但是代码检查时还是不能识别其他环境的包。

下面的配置根据自己的喜好可进行调整
LSP-pylsp.sublime-settings:
```
{
    // "command": ["$server_path"],
    // "env": {
    //     "PYTHONPATH": "${sublime_py_files_dir}${pathsep}${packages}",
    //     "MYPYPATH": "${sublime_py_files_dir}${pathsep}${packages}"
    // },
    "settings": {
        // --- JEDI configuration ---------------------------------------------
        "pylsp.plugins.jedi.extra_paths": ["$sublime_py_files_dir", "$packages"],
        "pylsp.plugins.jedi.environment": null,
        "pylsp.plugins.jedi.env_vars": null,
        "pylsp.plugins.jedi.auto_import_modules": ["numpy"],
        "pylsp.plugins.jedi_completion.enabled": true,
        "pylsp.plugins.jedi_completion.cache_for": ["pandas", "numpy", "tensorflow", "matplotlib"],
        "pylsp.plugins.jedi_completion.eager": false,
        "pylsp.plugins.jedi_completion.fuzzy": true,
        "pylsp.plugins.jedi_completion.include_class_objects": false,
        "pylsp.plugins.jedi_completion.include_function_objects": false,
        "pylsp.plugins.jedi_completion.include_params": true,
        "pylsp.plugins.jedi_completion.resolve_at_most": 25,
        "pylsp.plugins.jedi_definition.enabled": true,
        "pylsp.plugins.jedi_definition.follow_builtin_imports": true,
        "pylsp.plugins.jedi_definition.follow_imports": true,
        "pylsp.plugins.jedi_hover.enabled": true,
        "pylsp.plugins.jedi_references.enabled": true,
        "pylsp.plugins.jedi_signature_help.enabled": true,
        "pylsp.plugins.jedi_symbols.all_scopes": true,
        "pylsp.plugins.jedi_symbols.enabled": true,
        "pylsp.plugins.jedi_symbols.include_import_symbols": true,
        "pylsp.rope.extensionModules": null,
        "pylsp.rope.ropeFolder": null,

        // --- Linters --------------------------------------------------------
        "pylsp.configurationSources": ["pycodestyle"],
        "pylsp.plugins.flake8.enabled": false,
        "pylsp.plugins.pycodestyle.enabled": true,
        "pylsp.plugins.pydocstyle.enabled": false,
        "pylsp.plugins.pyflakes.enabled": false,
        "pylsp.plugins.pylint.enabled": false,
        "pylsp.plugins.pylsp_mypy.enabled": false,

        // --- flake8 settings ---
        "pylsp.plugins.flake8.config": null,
        "pylsp.plugins.flake8.exclude": null,
        "pylsp.plugins.flake8.executable": "flake8",
        "pylsp.plugins.flake8.filename": null,
        "pylsp.plugins.flake8.hangClosing": null,
        "pylsp.plugins.flake8.ignore": null,
        "pylsp.plugins.flake8.maxLineLength": null,
        "pylsp.plugins.flake8.perFileIgnores": null,
        "pylsp.plugins.flake8.select": null,

        // --- mccabe settings ---
        "pylsp.plugins.mccabe.enabled": true,
        "pylsp.plugins.mccabe.threshold": 15,

        // --- preload settings ---
        "pylsp.plugins.preload.enabled": true,
        "pylsp.plugins.preload.modules": null,

        // --- pycodestyle settings ---
        "pylsp.plugins.pycodestyle.aggressive": null,
        "pylsp.plugins.pycodestyle.exclude": null,
        "pylsp.plugins.pycodestyle.filename": null,
        "pylsp.plugins.pycodestyle.hangClosing": null,
        "pylsp.plugins.pycodestyle.ignore": null,
        "pylsp.plugins.pycodestyle.maxLineLength": null,
        "pylsp.plugins.pycodestyle.select": null,

        // --- pydocstyle settings ---
        "pylsp.plugins.pydocstyle.addIgnore": null,
        "pylsp.plugins.pydocstyle.addSelect": null,
        "pylsp.plugins.pydocstyle.convention": null,
        "pylsp.plugins.pydocstyle.ignore": null,
        "pylsp.plugins.pydocstyle.match": "(?!test_).*\\.py",
        "pylsp.plugins.pydocstyle.matchDir": "[^\\.].*",
        "pylsp.plugins.pydocstyle.select": null,

        // --- pylint settings ---
        "pylsp.plugins.pylint.args": null,
        "pylsp.plugins.pylint.executable": "",

        // --- pylsp_mypy settings ---
        "pylsp.plugins.pylsp_mypy.dmypy": false,
        "pylsp.plugins.pylsp_mypy.live_mode": true,
        "pylsp.plugins.pylsp_mypy.strict": false,

        // --- rope_completion settings ---
        "pylsp.plugins.rope_completion.eager": false,
        "pylsp.plugins.rope_completion.enabled": false,

        // --- Formatters -----------------------------------------------------
        // By default, autopep8 is enabled
        "pylsp.plugins.autopep8.enabled": true,
        "pylsp.plugins.yapf.enabled": false,
        "pylsp.plugins.pyls_isort.enabled": false,

        // Enabling black disables the autopep8 and yapf plugins.
        "pylsp.plugins.pylsp_black.enabled": false,
        "pylsp.plugins.pylsp_black.cache_config": false,
        "pylsp.plugins.pylsp_black.line_length": 88,
        "pylsp.plugins.pylsp_black.preview": false,
    },
    "selector": "source.python",
}
```

#### 方案三
```
Virtualenv
LSP # Client implementation of the Language Server Protocol for Sublime Text
LSP-pyright # LSP-pylsp 类似，但更快，且补全检查不依赖 python ，支持虚拟环境
```

虚拟环境配置：name.sublime-project
```
{
  "folders": [
    {
      // "folder_exclude_patterns": ["Backup/"],
      "path": ".",
    }
  ],
  "settings": {
    "LSP": {
      "LSP-pyright": {
        "enabled": true,
        "settings": {
          "pyright.dev_environment": "sublime_text_38",
          // python 包的查找路径
          "python.analysis.extraPaths": [
            "/home/aiyoyo/Documents/vir/flask_b/lib/python3.8/site-packages",
          ],
          "python.analysis.logLevel": "Information",
          "python.venvPath": "",
        },
      },
    },
  },
  // 虚拟环境路径，最初可以不用指定,使用 `virtualenv`插件进行环境切换时会自动创建、切换，注释
  "virtualenv": "/home/aiyoyo/Documents/vir/flask_b",
}

```

`Project > Edit Project`会打开相应的项目配置文件编辑即可。为灰色则是没有项目配置文件，`Project > Save Project As`会创建相应的文件，再去编辑即可。

使用了一段时间还是换回`lsp-pylsp`了，补全的响应速度快些但是并不是刚需，对于代码检查的不准确，英文的逗号`,`写成中文的`，`提示为括号未正确关闭，而且代码检查的工具不能切换或增加，对于包的补全，在针对protobuf项目时虽然都不能正常补全，但是pyright在引用后因为不是基于python的仍然会提示异常实际却是可以正常使用，自然也就不能跳转到相应的定义处了。
