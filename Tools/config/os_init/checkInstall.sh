#!/bin/bash
# Author: aiyoyo
# creat time    : 2022-12-25 06:47:11
# last modified : 2023-03-18 05:57:10


language() {
    # 编程语言相关软件的安装

	# install lua
	tar -zxf "${archiveDir}/${luaVersionName}" -C "${temporaryDir}"
	sudo mv "${temporaryDir}/lua-*" /opt
	cd /opt/lua-* || exit
	sudo make linux test
	sudo make install

	# install luarocks
	cd "${currentDir}" || exit
	tar -zxpf "${archiveDir}/${luarocksVersionName}" -C "${temporaryDir}"
	sudo mv "${temporaryDir}/luarocks*" /opt
	cd "/opt/${luarocksVersionName}" || exit
	sudo ./configure --with-lua-include=/usr/local/include
	sudo make
	sudo make install

    # install lua-language-server
    cd "${currentDir}" || exit
    mkdir "${temporaryDir}/lua-language-server"
    tar -xzvf "${archiveDir}/${luaLanguageServerName}" -C "${temporaryDir}/lua-language-server"
    mv "${temporaryDir}/lua-language-server" /opt

	# install python
	# python3.7
	cd "${currentDir}" || exit
	tar -xzvf "${temporaryDir}/${python37Name}" -C "${temporaryDir}"
	cd "${temporaryDir}/Python-3.9.15" || exit
	./configure --prefix=/opt/python/python3.9.15
	make && make install

	cd "${currentDir}" || exit
	tar -xzvf "${temporaryDir}/${python38Name}" -C "${temporaryDir}"
	cd "${temporaryDir}/Python-3.8.15" || exit
	./configure --prefix=/opt/python/python3.8.15
	make && make install

	cd "${currentDir}" || exit
	tar -xzvf "${temporaryDir}/${python39Name}" -C "${temporaryDir}"
	cd "${temporaryDir}/Python-3.7.15" || exit
	./configure --prefix=/opt/python/python3.7.15
	make && make install

    # install go
    sudo tar -zxvf "${temporaryDir}/${goVersionName}" -C /opt

    # install jdk
    sudo tar -zxvf "${temporaryDir}/${JDKName}*" -C /opt

    # install node、npm、npx
    sudo tar -xvf "${temporaryDir}/${nodeVersionName}" -C /opt

    # install rust
}

soft() {
	# 其他软件的安装

	# dbeaver
	sudo tar -zxvf "${temporaryDir}/dbea*gz" -C /opt
	sudo cp "${temporaryDir}/dbeaver-agent.jar" /opt/dbeaver
	echo "-javaagent:/opt/dbeaver/dbeaver-agent.jar" >> /opt/dbeaver/dbeaver.ini

	# mongodb
	sudo tar -zxvf "${temporaryDir}/mongo*" -C /opt

	# sublime
	sudo tar -zxvf "${temporaryDir}/sub*" -C /opt
	cp /opt/sub*/sublime_text.desktop "/home/${userName}/.local/share/applications/"

	# Jetbrains
	sudo tar -zxvf "${temporaryDir}/gol*" -C  /opt
	sudo tar -zxvf "${temporaryDir}/pyc*" -C  /opt

	# charles
	sudo tar -zxvf "${temporaryDir}/char*" -C /opt
}

installEnv() {
	# python
	echo "install packages about python"
	pip install "python-lsp-server[all]"
	pip install refurb vulture bandit mypy pylint pyflyby isort bandit

	# shell
	echo "install packages about shell"
	sudo npm install -g bash-language-server
	sudo dnf install ShellCheck
	go install mvdan.cc/sh/v3/cmd/shfmt@latest

	# markdown
	echo "install packages about markdown"
	sudo npm install -g remark-cli remark-preset-lint-consistent remark-preset-lint-recommended remark-lint-list-item-indent

	# yaml
	echo "install packages about yaml"
	sudo npm install -g yaml-language-server

	# dockerfile
	echo "install packages about dockerfile"
	sudo npm install -g dockerfile-language-server-nodejs
	sudo npm install -g dockerfile_lint

	# lua
	echo "install packages about lua"
	luarocks install luacheck

	# frontend
	echo "install packages about frontend"
	sudo npm install -g dprint
	sudo npm install -g prettier
	sudo npm install -g vls
	sudo npm install -g htmlhint

	# sql
	echo "install packages about sql"
	pip install sqlfluff
	pip install sqlparse

	# go
	echo "install packages about go"
	go get github.com/nametake/golangci-lint-langserver
	go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.50.1
	go install golang.org/x/tools/gopls@v0.10.1
	go install github.com/bufbuild/buf/cmd/buf@v1.15.1
	go install github.com/yoheimuta/protolint/cmd/protolint@latest
}

check() {
    for i in "$@"; do
        if command -v "${i}" >/dev/null 2>&1; then
            echo "${i} not installed"
        else
            echo "${i}  installed"
        fi
    done
}

checkEnv() {
	echo "check language environment"
	check "python3" "go" "node" "pip" "npm" "lua" "luarocks"

	echo "check language server protocol"
	check "gopls" "pylsp" "bash-language-server" \
		"docker-langserver" "golangci-lint-langserver" \

	echo "check linter and fixer"
	check "golangci-lint" "shfmt" "shellcheck"
}

main() {
	userName=$(whoami)
    currentDir=$(pwd)
    archiveDir="apps"
    temporaryDir="applications"

    luaVersionName="lua-5.3.5.tar.gz"
    luarocksVersionName="luarocks-3.8.0.tar.gz"
    luaLanguageServerName="lua-language-server-3.6.17-linux-x64.tar.gz"

    python37Name="Python-3.7.15.tgz"
    python38Name="Python-3.8.15.tgz"
    python39Name="Python-3.9.15.tgz"

    goVersionName="go1*"

    JDKName="Open*"

    nodeVersionName="node*"


	mdkir ${temporaryDir}
	language
	soft
}
