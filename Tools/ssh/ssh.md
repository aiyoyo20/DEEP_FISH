记录一个问题：

在配置、启动 ssh 服务后连接报错，Permission denied (publickey,gssapi-with-mic,password).

在两边的基本用户都生成了密钥。

后来发现是由于连接成了根用户而不是基本用户。
