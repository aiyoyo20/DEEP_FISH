#!/bin/bash

## update and upgrade
function UpdateAndUpgrade(){
	echo "start update and fix dependence"
	sudo dnf update -y && sudo dnf upgrade -y
	sudo dnf install gcc make gcc-c++ patch libffi-devel python-devel
		\ zlib-devel bzip2-devel openssl openssl-devel ncurses-devel
		\ sqlite-devel readline-devel tk-devel gdbm-devel libpcap-devel xz-devel expat-devel
}

## inputMhthod
function inputMhthod(){
	sudo dnf install  fcitx5 fcitx5-rime im-chooser -y
}

## vim and neovim
function vi(){
	echo "isntall vim"
	sudo dnf install vim -y
}

## git
function gitInstall(){
  sudo dnf install git -y
  cp ./git/.git* /home/${uname}/
}

## zsh
function zshInstall(){
	sudo dnf install zsh -y
	sudo chsh -s /bin/zsh
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash)"
	echo "configure zsh"
	cp -r ./zsh/zsh*  /home/${uname}/.oh-my-zsh/plugins/
}

function tarInstall(){
	# language
	## go
	sudo tar -zxvf ./tars/go1* -C /opt

	## jdk
	sudo tar -zxvf ./tars/Open* -C /opt

	## node
	sudo tar -xvf ./tars/node* -C /opt

	# 数据库相关
	## dbeaver
	sudo tar -zxvf ./tars/dbea*gz -C /opt
	sudo cp ./tars/dbeaver-agent.jar /opt/dbeaver
	echo "-javaagent:/opt/dbeaver/dbeaver-agent.jar" >> /opt/dbeaver/dbeaver.ini

	## mongodb
	sudo tar -zxvf ./tars/mongo* -C /opt

	# editor
	## sublime
	sudo tar -zxvf ./tars/sub* -C /opt
	cp /opt/sub*/sublime_text.desktop /home/${uname}/.local/share/applications/

	## Jetbrains
	sudo tar -zxvf ./tars/gol* -C  /opt
	sudo tar -zxvf ./tars/pyc* -C  /opt

	# 其他
	## charles
	sudo tar -zxvf ./tars/char* -C /opt
}

function pythonEnv(){
	sudo apt install pip

	# python3.7
	wget https://www.python.org/ftp/python/3.9.15/Python-3.9.15.tgz /home/${uname}/Downloads
	tar -xzvf Python-3.9.15.tgz -C /home/${uname}/Downloads
	cd Python-3.9.15/configure --prefix=/opt/python/python3.9.15 && make && make install

	cd /home/${uname}/Downloads
	wget https://www.python.org/ftp/python/3.8.15/Python-3.8.15.tgz
	tar -xzvf Python-3.8.15.tgz
	cd Python-3.8.15 && ./configure --prefix=/opt/python/python3.8.15 && make && make install 

	cd /home/${uname}/Downloads
	wget https://www.python.org/ftp/python/3.7.15/Python-3.7.15.tgz
	tar -xzvf Python-3.7.15.tgz
	cd Python-3.7.15 && ./configure --prefix=/opt/python/python3.7.15 && make && make install 

	pip install --user flake8 isort virtualenvwrapper yapf
	echo "source $(find ~ -name virtualenvwrapper.sh)" >> ~/.zshrc
}

function main(){
	uname=$(ls /home)
	UpdateAndUpgrade
	inputMhthod
	gitInstall
	vi
	zshInstall
	tarInstall
}

main
