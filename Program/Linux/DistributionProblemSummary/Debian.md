# Debian XFCE
## xfce 桌面的启动程序不是
## 在登录页面不会记住用户名
## 添加源错误，不能添加源ppa源
## 同样的 awk 命令在 mint linux 有结果在 debian 中没有
在某些 Linux 发行版中，如 Ubuntu，Gawk 是默认的 awk 实现，而在其他发行版如 Debian，则默认使用 mawk。这意味着在不同的系统上，使用 awk 命令时实际上可能在使用不同的实现。


## fatal error: rpc/rpc.h: No such file or directory
类似的都是 `ntirpc` 包下的内容

如`rpc/types.h: No such file or directory`,`misc/abstract_atomic.h: No such file or directory`

解决方案`sudo cp /usr/include/ntirpc/rpc/rpc.h /usr/include/rpc/`

## pyenv 安装 python 3.6.0 3.7.0 报错

有点头疼，但不是全系列的。比如 3.6.15,3.7.15 就能正常安装。

<!-- 这里存两个异常日志，后续有空再研究研究。

[3.6.0 异常日志](./docs/python-build.20240226103312.272606.log)
[3.7.0 异常日志](./docs/python-build.20240226103303.269250.log)
[3.6.15正常日志](./docs/python-build.20240226103324.281957.log) -->

已经解决，不适用 `gcc11`编译即可。

例如 `CC=clang pyenv install 3.6.0` ,`clang` 需要提前安装 `sudo apt install clang -y`