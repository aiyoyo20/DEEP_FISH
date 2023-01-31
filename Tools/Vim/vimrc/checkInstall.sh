#!/bin/bash
# Author: aiyoyo
# last modified : 2022-12-25 06:47:11
# last modified : 2022-12-20 06:38:04

checkEnv() {
    for i in "$@"; do
        if command -v "${i}" >/dev/null 2>&1; then
            echo "exists ${i}"
        else
            echo "no exists ${i}"
            echo "if you need ${i} support,please install"
        fi
    done
}

installEnv ()
{
    sudo npm i -g bash-language-server
    sudo npm install -g yaml-language-server
    sudo npm install -g dockerfile-language-server-nodejs

    pip install "python-lsp-server[all]"

    go get github.com/nametake/golangci-lint-langserver
    go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.50.1
    go install golang.org/x/tools/gopls@v0.10.1
    go install mvdan.cc/sh/v3/cmd/shfmt@latest

    git clone https://github.com/rust-lang/rust-analyzer.git \
        && cd rust-analyzer && cargo xtask install --server
}

main() {
    echo "check software"
    if [[ $(checkEnv "vim") =~ "no" ]]; then
        echo "must install vim"
        sudo dnf install vim
        echo "add vim configuration .vimrc"
        mv ~/.vimrc ~/.vimrc_bak && cp vimrc ~/.vimrc
    fi


    installEnv

    echo "check language environment"
    checkEnv "python3" "go" "node" "rustc" "npm"

    echo " "
    echo "check language server protocol"
    checkEnv "gopls" "pylsp" "bash-language-server" \
        "docker-langserver" "golangci-lint-langserver" \
        "rust-analyzer" "marksman"

    echo " "
    echo "check linter"
    checkEnv "golangci-lint" "shfmt"
}
