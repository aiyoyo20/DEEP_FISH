#!/bin/bash

## update and upgrade
UpdateAndUpgrade() {
    echo "start update and fix dependence"
    sudo dnf update -y && sudo dnf upgrade -y
    sudo dnf install gcc make gcc-c++ patch libffi-devel python-devel
        \ zlib-devel bzip2-devel openssl openssl-devel ncurses-devel
        \ sqlite-devel readline-devel tk-devel gdbm-devel libpcap-devel
        \ xz-devel expat-devel
}

## inputMhthod
inputMhthod() {
    sudo dnf install fcitx5 fcitx5-rime im-chooser -y
}

## vim
vi() {
    echo "isntall vim"
    sudo dnf install vim -y
}

## git
gitInstall() {
    sudo dnf install git -y
    cp ./git/.git* /home/${uname}/
}

## zsh
zshInstall() {
    sudo dnf install zsh -y
    sudo chsh -s /bin/zsh
    sh -c "$(curl -fsSL
        https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash)"
    echo "configure zsh"
    cp -r ./zsh/zsh* /home/${uname}/.oh-my-zsh/plugins/
}

pipInstall() {
    sudo apt install pip
    pip install virtualenvwrapper
    echo "source $(find ~ -name virtualenvwrapper.sh)" >>~/.zshrc
}

main() {
    uname=$(whoami)
    UpdateAndUpgrade
    inputMhthod
    gitInstall
    vi
    zshInstall
}

main
