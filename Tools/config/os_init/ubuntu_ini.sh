#!/bin/bash

## update and upgrade
uname -a | grep -o fedora
function UpdateAndUpgrade(){
	echo "start update and fix dependence"
	sudo apt-get update -y && sudo apt upgrade -y
	sudo apt --fix-broken install
}

## inputMhthod
function inputMhthod(){
	sudo apt install  fcitx5 fcitx5-rime -y
	echo "run im-config select fcitx5"
	im-config

	echo "run fcitx5-configtool add rime or pinyin"
	fcitx5 && fcitx5-configtool

	echo "start configure rime"
	cp -r ./fcitx5/* /home/${uname}/.local/share/fcitx5
	cp fcitx5/.pam_environment  /home/${uname}
	ln -s /usr/share/applications/org.fcitx.Fcitx5.desktop /home/${uname}/.config/autostart/
}

## vim
function vi(){
	echo "isntall vim"
	sudo apt install vim -y
	cp vimrc /home/${uname}/
}


## git
function gitInstall(){
  sudo apt install git
  cp ./git/.git* /home/${uname}/
}


## zsh
function zshInstall(){
	sudo apt install zsh
	sudo chsh -s /bin/zsh
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash)"
	echo "configure zsh"
	cp -r ./zsh/zsh*  /home/${uname}/.oh-my-zsh/plugins/
}

function pythonEnv(){
	sudo apt install pip

	pip install --user flake8 isort virtualenvwrapper yapf
	echo "source $(find ~ -name virtualenvwrapper.sh)" >> ~/.zshrc
}

function AppImage(){
  sudo apt install libfuse2
  cp ./App/* /home/${uname}/Desktop/
}


function main(){
	uname=$(whoami)
	sudo apt install htop curl wget gcc make openssh-client openssh-server -y
	UpdateAndUpgrade
	typewritting
	gitInstall
	vi
	zshInstall
	tarInstall
}
