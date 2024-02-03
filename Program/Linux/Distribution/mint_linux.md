mysql 安装后的问题：

直接使用 apt 包管理器安装。安装后创建的默认用户、密码存放在 /etc/mysql/debian.cnf，不适用超级用户进入可以使用这个账号密码。超级用户 root 的管理方式是 auth_socket，所以如果是使用 `sudo mysql` 这样的方式进入，不输入密码，输入错误的密码，输入Linux的超级用户的密码都能进入，并且正常的修改密码并不起作用。

在没有修改超级用户的管理方式的情况下使用`mysql -u root -p`登录，不管输入什么密码都会提示`mysql: Access denied for user 'root'@'localhost' (using password: YES)`

用任意的方式登录mysql

`use mysql;`：选择相应的库
`select user,plugin from user;`：查询用户的情况，可以看到root用户有auth_socket权限
`update user set plugin = 'mysql_native_password' where user = 'root';`：修改mysql_native_password的权限
`select user,plugin from user;`：再次查询用户的情况，可以看到root用户有mysql_native_password权限
`flush privileges;`：刷新权限
`alter user 'root'@'localhost' identified by '密码';`：修改root用户的密码
如果报错`ERROR 1819 (HY000): Your password does not satisfy the current policy requirements`是因为密码太弱了，需要设置更长更复杂的密码
`show variables like 'validate_password%';`：查看密码强度，在 MySQL 8 中，默认的密码验证插件是 caching_sha2_password，但它不需要额外的 validate_password 变量来管理密码策略
`set global validate_password.policy=low;`：设置密码强度为低就可以设置短密码了
