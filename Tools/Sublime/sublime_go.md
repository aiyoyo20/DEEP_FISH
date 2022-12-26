#### Golang Build

The official Sublime Text package for Go build system integration.

安装后需要配置后使用，比如

    {
        "PATH": "/opt/go/bin",
        "GOPATH": "/home/aiyoyo/go"
    }

#### GoSublime

如果没法通过包管理器安装，可以选择下载安装
`cd /~.config/sublime-text/Packages && git clone https://margo.sh/GoSublime`

依赖：`go get golang.org/x/tools/cmd/goimports`

     {
        "env": {
            "GOPATH": "/home/aiyoyo/go",
            "GOROOT": "/opt/go"
        }
        ,
        "gscomplete_enabled": true,
        "fmt_enabled": true,
        "fmt_tab_indent": false,
        "fmt_tab_width": 4,
        "autocomplete_snippets": true,
        "autocomplete_tests": true,
        "autocomplete_builtins": true,
        "autocomplete_closures": true,
        "autocomplete_suggest_imports": true,
        "calltips": true,
        "use_named_imports": true,
        "autoinst": true,
        "ipc_timeout": 1,
        "fmt_cmd": ["goimports"],
        "on_save": [
            {"cmd": "gs_comp_lint"},
            {"cmd": "goimports"}
        ],
        "lint_enabled": true,
        "linters": [
            {"cmd": ["go", "run"]}
        ],
        "comp_lint_enabled": true,
        "comp_lint_commands": [
            {"cmd": ["go", "install"]}
        ],
    }
