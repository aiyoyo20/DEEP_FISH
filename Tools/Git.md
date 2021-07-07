# Git 的使用 并传送文件至github
## 注册github帐号
github.com 去注册一个自己的帐号

## 安装Git
```
yay -S git
```
## 初始化配置GIT
### 配置用户信息
```
git config --global user.name "your name"
git config --global user.email "your email"
```

## 上传文件
进入要传送的文件夹内，
### 初始化本地仓库
```
git init
```
### 添加拟上传的对象
```
//上传文件夹1
git add f1

//上传指定文件
git add *.*

//上传所有修改的文件
git add .
or
Git add -A
```

### 将修改后的文件提交到本地仓库
```
git commit -m ‘增加README.md说明文档’
```
![](git_tip.png)

### 连接到远程仓库
```
git remote add origin 远程仓库地址
```
### 推送
```
git push -u origin master
```

ssh-keygen -t rsa -C "aiyoyo20@gmail.com@github.com"  
生成.ssh 文件夹
进入打开其 id_rsa.pub 复制其送有内容，github 打开设置找到 'Add SSH Key' 添加即可

## Git

```
git config --global user.name "Michael728"
git config --global user.email "649168982@qq.com"
ssh-keygen -t rsa -C "649168982@qq.com"
复制代码
```

[fish@fish-pc** **etc****]$** ssh-keygen -t rsa -C "aiyoyo2729@gmail.com"  
Generating public/private rsa key pair. 
Enter file in which to save the key (/home/fish/.ssh/id_rsa):  
Created directory '/home/fish/.ssh'. 
Enter passphrase (empty for no passphrase):  
Enter same passphrase again:  
Your identification has been saved in /home/fish/.ssh/id_rsa 
Your public key has been saved in /home/fish/.ssh/id_rsa.pub 
The key fingerprint is: 
SHA256:lspSTHzElY/EvDXaxmGHw7je12DCQI4cGu6S/Cx4H68 aiyoyo2729@gmail.com 
The key's randomart image is: 
+---[RSA 3072]----+ 
|    ..o=o+ .  | 
|   o =.+B O .  | 
|    = +..& =  | 
|  . = . .= B o  | 
|   + + S. o o o | 
|  . * o  . . . .| 
|  . + *    .  | 
|  . + o     | 
|    E..     | 
+----[SHA256]-----+