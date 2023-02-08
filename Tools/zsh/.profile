#!/bin/bash

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# 环境变量
# python 虚拟环境
export PATH=/opt/python/python3.7.15/bin:$PATH
export PATH=/opt/python/python3.8.15/bin:$PATH
export PATH=/opt/python/python3.9.15/bin:$PATH
export WORKON_HOME=$HOME/Documents/vir
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/home/aiyoyo/.local/bin/virtualenv
source /home/aiyoyo/.local/bin/virtualenvwrapper.sh
export PYTHONDONTWRITEBYTECODE=False

# rust
export PATH=/home/aiyoyo/.cargo/bin:$PATH

## go 环境
export PATH=/opt/go/bin:$PATH
export GOROOT="/opt/go"
export GOPATH="/home/aiyoyo/go"
export GOPROXY="https://goproxy.cn,direct"
export PATH=/home/aiyoyo/go/bin:$PATH

## java 环境
export JAVA_HOME=/opt/jdk8
export PATH=$JAVA_HOME/bin:$PATH


# 数据库相关
export PATH=/opt/dbeaver:$PATH
export PATH=/opt/mongodb-linux-x86_64-4.0.9/bin:$PATH

export PATH=/opt/node-v16.18.0-linux-x64/bin:$PATH
export PATH=/opt/charles/bin:$PATH
export PATH=/opt/Telegram:$PATH
export PATH=/opt/protoc-21.10-linux-x86_64/bin:$PATH
export PATH=/opt/platform-tools:$PATH
# --------------------------------------------------------------------


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# 函数

#终端代理设置
#设置socks5代理
function setsocks5() {
    export ALL_PROXY="socks5://127.0.0.1:1080"
}

#设置http代理
function sethttp() {
    export ALL_PROXY="http://127.0.0.1:12333"
}

# 取消终端代理
function unsetProxy() {
    unset ALL_PROXY
}
# 测试终端代理
function testProxy() {
    curl -i 'http://ip.cn'
}

#通常端口号是固定的，不过如果有需要随时变换的参考如下脚本
function setProxy() {
    export ALL_PROXY="${1}://${2}:${3}"
}
# --------------------------------------------------------------------


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# 别名 设置

# 为youtube_dl指定别名
alias yl="youtube-dl --proxy socks5://127.0.0.1:1080"

# kill 所有 v2ray 相关的进程
alias kqv="ps -aux | grep  'v2ray' | tr -s ' '| cut -d ' ' -f 2 |xargs kill -9"
# --------------------------------------------------------------------