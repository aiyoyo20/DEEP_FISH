# Git 的使用 并传送文件至github
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
![](images/git_tip.png)

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


git永久保存账号密码，免去git重复输入账号密码操作
方法一：
.gitconfig配置文件。用文档编辑工具打开该文件
添加：
```
[user]
	name = wb-ly409739  //你的用户名
	email = wb-ly409739@alibaba-inc.com  //你的git邮箱账号

[credential]
	helper = store
```
然后保存就可以了。

方法二：

直接在git bash 中执行命令：git config --global credential.helper store

在输入一次账号密码就可以保存了

方法三：只能单个项目
编辑项目下的 .git/config 文件 ,增加
```
[credential]
	helper = store
```
在使用一次用户名密码后即可保存。