# 简单说明

起因：在普通用户中配置了环境变量，并且能够正常访问和执行，但是使用`sudo command`则提示命令不存在

`echo $PATH`查看普通用户的环境变量,`sudo echo $PATH`查看sudo 命令后的环境变量（这不一定准确，但开始想到是这样测试），两者的结果是一样的，在将环境变量中的文件创建软链接到`/usr/local/bin`中后，再执行`sudo command`能正常执行。

为超级用户添加环境变量结果还是一样。

sudo 是一种特殊的权限管理机制，作用是允许普通用户临时地获得root权限，但并不所有的权限。为了安全考虑使用，当使用 sudo 去执行一个程序时，这个程序将在一个新的、最小化的环境中执行，这个环境由`/etc/sudoers`进行管理。而环境变量PATH的值也会被改变。在`/etc/sudoers`文件的`secure_path`中。在mint-linux 中这个默认值是`secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"`，而这将会替换掉你的环境变量。所以用 sudo 去执行，你就会得到 “command not found” 的错误提示。

## sudoer 文件的详细内容说明

只能以超级用户（root）身份使用`visudo`命令来编辑该文件，以确保语法正确性和避免意外问题。在mint-minux中visudo 实际编辑的是/etc/sudoers文件。在不知道具体文件的情况下，可以使用`sudo visudo`命令。并且会帮你校验文件配置是否正确，如果不正确，在保存退出时就会提示你哪段配置出错的。

建议将本地内容添加到`/etc/sudoers.d/`目录中，而不是直接修改此文件。这是为了更好地组织和管理`sudoers`配置。

默认配置如下：

`Defaults	env_reset`：这是一个默认设置，指示在执行`sudo`命令时重置环境变量，以提供一个干净的环境。

`Defaults	mail_badpass`：这是一个默认设置，使得在用户输入错误密码时，系统会通过邮件通知有关的信息。

`Defaults	secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"`：这是一个默认设置，定义了一个安全的路径，`sudo`命令将使用此路径来查找可执行文件。

`Defaults	use_pty`：这是一个默认设置，指示`sudo`命令使用伪终端（pty）。

以下规则将保留与根用户等效用户（sudo组）的代理设置。

`#Defaults:%sudo env_keep += "http_proxy https_proxy ftp_proxy all_proxy no_proxy"`：这是一个示例规则，展示了如何使用`env_keep`选项来保留特定的环境变量。

以下规则允许运行任意命令，但`ALL`同样也能实现这个目的，并且它意味着不同的`sudoers`可以选择他们喜欢的编辑器。

`#Defaults:%sudo env_keep += "EDITOR"`：这是一个示例规则，展示了如何使用`env_keep`选项来保留特定的环境变量。

以下规则是为了完全保留用户的偏好设置。

`#Defaults:%sudo env_keep += "GREP_COLOR"`：这是一个示例规则，展示了如何使用`env_keep`选项来保留特定的环境变量。

以下规则是为了使用`etckeeper`需要以root身份运行`git`命令。

`#Defaults:%sudo env_keep += "GIT_AUTHOR_* GIT_COMMITTER_*"`：这是一个示例规则，展示了如何使用`env_keep`选项来保留特定的环境变量。

以下规则是为了每个用户的个人偏好设置，因为根用户（root）对于这些设置可能没有合适的值。

`#Defaults:%sudo env_keep += "EMAIL DEBEMAIL DEBFULLNAME"`：这是一个示例规则，展示了如何使用`env_keep`选项来保留特定的环境变量。

以下规则允许`sudo scp`或`sudo rsync`命令使用您的SSH代理。

`#Defaults:%sudo env_keep += "SSH_AGENT_PID SSH_AUTH_SOCK"`：这是一个注释和示例规则，展示了如何使用`env_keep`选项来保留特定的环境变量。

以下规则是为了让GPG代理也能够正常工作。

`#Defaults:%sudo env_keep += "GPG_AGENT_INFO"`：这是一个注释和示例规则，展示了如何使用`env_keep`选项来保留特定的环境变量。

`# Host alias specification`：这是一个注释，指示下面可以定义主机别名。

`# User alias specification`：这是一个注释，指示下面可以定义用户别名。

`# Cmnd alias specification`：这是一个注释，指示下面可以定义命令别名。

`# User privilege specification`：这是一个注释，指示下面可以定义用户权限规则。

`root	ALL=(ALL:ALL) ALL`：这是一个用户权限规则，指示root用户可以在任何主机上以任何用户的身份执行任何命令。

`%admin ALL=(ALL) ALL`：这是一个用户权限规则，指示`admin`组的成员可以在任何主机上以任何用户的身份执行任何命令。

`%sudo	ALL=(ALL:ALL) ALL`：这是一个用户权限规则，指示`sudo`组的成员可以在任何主机上以任何用户的身份执行任何命令。

`# See sudoers(5) for more information on "@include" directives:`：这是一个注释，指示您可以在`sudoers(5)`中了解有关`@include`指令的更多信息。

`@includedir /etc/sudoers.d`：这是一个`@include`指令，指示系统从`/etc/sudoers.d`目录中包含其他的`sudoers`配置文件。

## 执行流程

from: [在 Linux 中设置 sudo 的十条 sudoers 实用配置](https://linux.cn/article-8145-1.html)

```txt
1. sudo 会读取和解析 /etc/sudoers 文件，查找调用命令的用户及其权限。
2. 然后提示调用该命令的用户输入密码 (通常是用户密码，但也可能是目标用户的密码，或者也可以通过 NOPASSWD 标志来跳过密码验证)。
3. 这之后， sudo 会创建一个子进程，调用 setuid() 来切换到目标用户。
4. 接着，它会在上述子进程中执行参数给定的 shell 或命令。
```

## sudo 命令的参数说明

```txt
1. -S: 以非交互模式运行。
2. -g: 指定要切换的组。
```
