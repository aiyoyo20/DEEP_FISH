Docker安装、运行mysql

从docker hub的仓库中拉去mysql镜像
sudo docker pull mysql
查看镜像：
docker images
2.运行一个mysql容器

 docker run -p 3306:3306 --name qmm-mysql -v ~/mysql/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=669988  -d mysql:5.6
//创建容器时，最后mysql:5.6表示mysql镜像的版本，可以写，表示指定该版本；如果不写也可以，docker会自动在本地检测有没有最新的，如果没有会自动去docker hub上去下载。
上述命令各个参数的含义：

run                 运行一个docker容器
--name           后面这个是生成的容器的名字qmm-mysql
-p 3306:3306  表示这个容器中使用3306（第二个）映射到本机的端口号也为3306（第一个） 
-e MYSQL_ROOT_PASSWORD=123456  初始化root用户的密码
-d                   表示使用守护进程运行，即服务挂在后台
查看当前docker容器的运行状态：

docker ps   : 查看运行中的容器
或者docker ps -a ： 查看所有创建的容器
如果想要访问mysql ，需要在本机上装一个mysql-client。
本机装好mysql后，可以使用mysql命令访问本机的mysql服务器，密码就是上面创建容器时设置的密码为123456， 192.168.95.4 为现在我这台机器的ip， 3306为刚才所示的占用本物理机的端口（不是docker内部的端口）


mysql -h192.168.95.4 -p3306 -uroot -p123456


进入docker中mysql：

$ docker exec -it mysql bash
$ mysql -u root -p
数据数据库密码就可以进入docker中的mysql
创建容器注意事项：

端口映射唯一性：一个容器只能映射到本机的唯一一个端口，故如果创建了一个容器，该容器在运行中，该容器映射到本地的端口为3306， 那么就不能再创建一个容器映射在3306端口号上，因为该端口已经被分配给了第一个容器。
容器名字唯一性：创建的容器的名字不能与已经存在 的容器名字重复。
否则创建容器失败。
删除一个容器：

sudo docker rm 容器名字（如上容器名字就是：qmm-mysql）
重新再创建一个容器second-mysql，占用物理机的3307端口：

sudo docker run --name second-mysql -p 3307:3306 -e MYSQL\_ROOT\_PASSWORD=123456 -d mysql
现在两个容器（实例）都正常运行了，为了访问第二个容器，我们指定端口号3307登陆到这个mysql的client。

docker exec -it mysql bash // 想进入docker中，这里的mysql表示镜像的名字
mysql -h192.168.95.4 -P3307 -uroot -p123456  
还可以在别人的机器上访问我本机的mysql，这个就是-h参数的作用：
比如：


mysql -h192.168.95.4 -p3306 -uroot -p123456
如果在同一个局域网下，别人是可以通过ip地址来访问我的电脑的，如果在别人的机器上这
里的-h后面写上我本机的ip地址，以及我的mysql的端口号和密码，那么他就可以访问我电脑
上的数据库mysql，前提是在一个局域网下。


[Docker安装、运行mysql](https://www.jianshu.com/p/d9b6bbc7fd77)

