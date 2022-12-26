## （1）请按照这样的日期格式（xxxx-xx-xx）每日生成一个文件，例如今天生成的文件为2017-07-05.log， 并且把磁盘的使用情况写到到这个文件中，（不用考虑cron，仅仅写脚本即可）！

    #! /bin/bash
    d=`date +%F`
    logfile=$d.log
    df -h > $logfile

## (2)需求：--统计日志

有日志1.log，内容如下： 日志片段：
112.111.12.248 - \[25/Sep/2013:16:08:31 +0800]formula-x.haotui.com "/seccode.php?update=0.5593110133088248" 200"http://formula-x.haotui.com/registerbbs.php" "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1;)"
61.147.76.51 - \[25/Sep/2013:16:08:31 +0800]xyzdiy.5d6d.com "/attachment.php?aid=4554\&k=9ce51e2c376bc861603c7689d97c04a1\&t=1334564048\&fid=9\&sid=zgohwYoLZq2qPW233ZIRsJiUeu22XqE8f49jY9mouRSoE71" 301"http://xyzdiy.5d6d.com/thread-1435-1-23.html" "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)"
要求： 统计出每个IP的访问量有多少？
`awk '{print $1}' 1.log |sort -n|uniq -c`

## (3)需求：--统计内存使用

写一个脚本计算一下linux系统所有进程占用内存大小的和。（提示，使用ps或者top命令）

    #! /bin/bash
    sum=0
    for mem in `ps aux |awk '{print $6}' |grep -v 'RSS'`
    do
        sum=$[$sum+$mem]
    done
    echo "The total memory is $sum""k"

也可以使用awk 一条命令计算：
`ps aux | grep -v 'RSS TTY' |awk '{(sum=sum+$6)};END{print sum}'`

## (4)需求：--设计监控脚本

监控远程的一台机器(假设ip为123.23.11.21)的存活状态，当发现宕机时发一封邮件给你自己。 提示：
你可以使用ping命令 ping -c10 123.23.11.21
发邮件脚本可以参考 https://coding.net/u/aminglinux/p/aminglinux-book/git/blob/master/D22Z/mail.py
脚本可以搞成死循环，每隔30s检测一次

    #!/bin/bash
    ip=123.23.11.21
    ma=abc@139.com

    while 1
    do
            ping -c10 $ip >/dev/null 2>/dev/null
            if [ $? != "0" ]
            then
                    python /usr/local/sbin/mail.py $ma "$ip down" "$ip is down,plese check."
                    #假设mail.py已经编写并设置好了
            fi
            sleep 30
    done

## (5) 需求：--批量更改文件名

找到/123目录下所有后缀名为.txt的文件
批量修改.txt为.txt.bak
把所有.bak文件打包压缩为123.tar.gz
批量还原文件的名字，即把增加的.bak再删除

    #!/bin/bash
    # 查找txt文件
    find /123 -type f -name "*.txt" > /tmp/txt.list
    # 批量修改文件名
    for f in `cat /tmp/txt.list`
    do
        mv $f $f.bak
    done
    # 创建一个目录，为了避免目录已经存在，所以要加一个复杂的后缀名
    d=`date +%y%m%d%H%M%S`
    mkdir /tmp/123_$d
    # 把.bak文件拷贝到/tmp/123_$d
    for f in `cat /tmp/txt.list`
    do
        cp $f.bak /tmp/123_$d
    done
    # 打包压缩
    cd /tmp/
    tar czf 123.tar.gz 123_$d/
    # 还原
    for f in `cat /tmp/txt.list`
    do
        mv $f.bak $f
    done

## (6)需求：--监控80端口 写一个脚本，判断本机的80端口是否开启着，如果开启着什么都不做，如果发现端口不存在，那么重启一下httpd服务，并发邮件通知你自己。脚本写好后，可以每一分钟执行一次，也可以写一个死循环的脚本，30s检测一次。

    #! /bin/bash
    mail=123@123.com
    if netstat -lnp |grep ':80' |grep -q 'LISTEN'; then
        exit
    else
        /usr/local/apache2/bin/apachectl restart >/dev/null 2> /dev/null
        python mail.py $mail "check_80" "The 80 port is down."
        n=`ps aux |grep httpd|grep -cv grep`
        if [ $n -eq 0 ]; then
            /usr/local/apache2/bin/apachectl start 2>/tmp/apache_start.err
        fi
        if [ -s /tmp/apache_start.err ]; then
            python mail.py  $mail  'apache_start_error'   `cat /tmp/apache_start.err`
        fi
    fi

## (7) 需求：--域名代理

内网有一台机器不能连外网，所以没有办法使用yum，考虑过使用iptables nat 转发上网，但因为一些原因，放弃使用。所以想到nginx代理，原理很简单。 A 不能访问 1网站， B可以访问，A和B可以内网通信，所以可以让B作为A的代理。 并且可以限定访问的来源IP，配置文件如下：

    server {
        listen       80;
        server_name aaa.com bbb.com  ccc.com ddd.com eee.com;

        location / {
            resolver 119.29.29.29;
            proxy_pass       http://$host;
            proxy_set_header Host      $host;
            proxy_set_header X-Real-IP $remote_addr;
            allow 192.168.5.0/24;
            deny all;
        }
    }

说明：这里的119.29.29.29 为一个DNS的ip，用resolver来指定。
假如B机器内网ip为 192.168.5.11，只需要在A上加一条hosts
192.168.5.11 aaa.com bbb.com ccc.com ddd.com eee.com

## (8)需求：--备份数据库

设计一个shell脚本来备份数据库，首先在本地服务器上保存一份数据，然后再远程拷贝一份，本地保存一周的数据，远程保存一个月。 假定，我们知道mysql root账号的密码，要备份的库为discuz，本地备份目录为/bak/mysql, 远程服务器ip为192.168.123.30，远程提供了一个rsync服务，备份的地址是 192.168.123.30::backup . 写完脚本后，需要加入到cron中，每天凌晨3点执行。

    #! /bin/bash
    ### backup mysql data
    ### Writen by Aming.

    PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/mysql/bin
    d1=`date +%w`
    d2=`date +%d`
    pass="your_mysql_password"
    bakdir=/bak/mysql
    r_bakdir=192.168.123.30::backup

    exec 1>/var/log/mysqlbak.log 2>/var/log/mysqlbak.log

    echo "mysql backup begin at `date +"%F %T"`."
    mysqldump -uroot -p$pass --default-character-set=gbk discuz >$bakdir/$d1.sql
    rsync -az $bakdir/$d1.sql $r_bakdir/$d2.sql
    echo "mysql backup end at `date +"%F %T"`."

然后加入cron
0 3 \* \* \* /bin/bash /usr/local/sbin/mysqlbak.sh

## （9）需求：--自动重启nginx服务

服务器上跑的是LNMP环境，近期总是有502现象。502为网站访问的状态码，200正常，502错误是nginx最为普通的错误状态码。由于502只是暂时的，并且只要一重启php-fpm服务则502消失，但不重启的话，则会一直持续很长时间。所以有必要写一个监控脚本，监控访问日志的状态码，一旦发生502，则自动重启一下php-fpm。

我们设定：
access\_log /data/log/access.log
脚本死循环，每10s检测一次（假设每10s钟的日志条数为300左右）
重启php-fpm的方法是 /etc/init.d/php-fpm restart

    #! /bin/bash
    log=/data/log/access.log
    N=10
    while :; do
        ##因为10秒钟大概产生300条日志
        tail -n 300 $log &gt; /tmp/log
        n_502=`grep -c ' 502"' /tmp/log`
        if [ $n_502 -ge $N ]; then
            ##记录系统的状态
            top -bn1 >/tmp/`date +%H%M%S`-top.log
            vmstat 1 5 >/tmp/`date +%H%M%S`-vm.log
            /etc/init.d/php-fpm restart 2>/dev/null
            ##重启php-fpm服务后，应先暂缓1分钟，而后继续每隔10s检测一次
            sleep 60
        fi
        sleep 10
    done

## （10）需求：--删除文本中的字母

要求： 把一个文本文档的前5行中包含字母的行删除掉，同时把6到10行中的全部字母删除掉。
假设文本名字叫做1.txt，并且文本行数大于10，脚本如下

    #!/bin/bash
    # 先获取该文本的行数
    nu=`wc -l 1.txt |awk '{print $1}'`
    # 对前5行进程处理
    for i in `seq 1 5`
    do
        # 使用sed把每一行的内容赋值给变量
        l=`sed -n "$i"p 1.txt`
        # 用grep 判定是否匹配字母,-v取反，-q不输出内容
        if echo $l |grep -vq '[a-zA-Z]'
        then
    	echo $l
        fi
    done
    # 对6-10行做删除字母处理
    for i in `seq 6 10`
    do
        l=`sed -n "$i"p 1.txt`
        echo $l|sed 's/[a-zA-Z]//g'
    done
    # 剩余的直接输出
    for i in `seq 11 $nu`
    do
        sed -n "$i"p 1.txt
    done

若想把更改内容写入到1.txt，还需要把以上内容重定向到一个文本中，然后删除1.txt，再把刚刚重定向的文件更名为1.txt

## （11）需求：--查找字母数小于6的单词

用shell打印下面这句话中字母数小于6的单词。
Bash also interprets a number of multi-character options.

    #!/bin/bash
    for s in Bash also interprets a number of multi-character options
    do
        n=`echo $s|wc -c`
        if [ $n -lt 6 ]
            then echo $s
        fi
    done

## （12）需求：--输入数字执行对应命令

写一个脚本实现如下功能： 输入一个数字，然后运行对应的一个命令。显示命令如下： cmd meau\* 1---date 2--ls 3--who 4--pwd 当输入1时，会运行date, 输入2时运行ls, 依此类推。

```#! /bin/bash
echo "*cmd meau** 1---date 2--ls 3--who 4--pwd"
read -p "please input a number 1-4: " n
case $n in
    1)
        date
        ;;
    2)
        ls
        ;;
    3)
        who
        ;;
    4)
        pwd
        ;;
    *)
        echo "Please input a number: 1-4"
        ;;
esac
```

## （13）需求：--监控httpd进程

在服务器上，写一个监控脚本。
每隔10s去检测一次服务器上的httpd进程数，如果大于等于500的时候，就需要自动重启一下apache服务，并检测启动是否成功？
若没有正常启动还需再一次启动，最大不成功数超过5次则需要理解发邮件通知管理员，并且以后不需要再检测！
如果启动成功后，1分钟后再次检测httpd进程数，若正常则重复之前操作（每隔10s检测一次），若还是大于等于500，那放弃重启并需要发邮件给管理员，然后自动退出该脚本。假设其中发邮件脚本为之前咱们使用的 mail.py

    #!/bin/bash
    check_service()
    {
        n=0
        for i in `seq 1 5`
        do
            /usr/local/apache2/bin/apachectl restart 2>/tmp/apache.err
            if [ $? -ne 0 ]
            then
                n=$[$n+1]
            else
                break
            fi
        done
        if [ $n -eq 5 ]
        then
            ##下面的mail.py参考https://coding.net/u/aminglinux/p/aminglinux-book/git/blob/master/D22Z/mail.py
            python mai.py "123@qq.com" "httpd service down" `cat /tmp/apache.err`
            exit
        fi
    }

    while :
    do
        t_n=`ps -C httpd --no-heading |wc -l`
        if [ $t_n -ge 500 ]
        then
            /usr/local/apache2/bin/apachectl restart
            if [ $? -ne 0 ]
            then
                check_service
            fi
            sleep 60
        fi
        sleep 10
    done

\##（14）需求：--封ip
需求： 根据web服务器上的访问日志，把一些请求量非常高的ip给拒绝掉！
分析： 我们要做的，不仅是要找到哪些ip请求量不合法，并且还要每隔一段时间把之前封掉的ip（若不再继续请求了）给解封。 所以该脚本的关键点在于定一个合适的时间段和阈值。

比如， 我们可以每一分钟去查看一下日志，把上一分钟的日志给过滤出来分析，并且只要请求的ip数量超过100次那么就直接封掉。 而解封的时间又规定为每半小时分析一次，把几乎没有请求量的ip给解封！

参考日志文件片段：

157.55.39.107 \[20/Mar/2015:00:01:24 +0800] www.aminglinux.com "/bbs/thread-5622-3-1.html" 200 "-" "Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)"
61.240.150.37 \[20/Mar/2015:00:01:34 +0800] www.aminglinux.com "/bbs/search.php?mod=forum\&srchtxt=LNMP\&formhash=8f0c7da9\&searchsubmit=true\&source=hotsearch" 200 "-" "Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)"

    #! /bin/bash
    logfile=/home/logs/access.log
    d1=`date -d "-1 minute" +%H:%M`
    d2=`date +%M`
    ipt=/sbin/iptables
    ips=/tmp/ips.txt

    block(){
        grep "$d1:" $logfile|awk '{print $1}' |sort -n |uniq -c |sort -n >$ips
        for ip in `awk '$1>100 {print $2}' $ips`; do
            $ipt -I INPUT -p tcp --dport 80 -s $ip -j REJECT
            echo "`date +%F-%T` $ip" >> /tmp/badip.txt
        done
    }

    unblock(){
        for i in `$ipt -nvL --line-numbers |grep '0.0.0.0/0'|awk '$2<15 {print $1}'|sort -nr`; do
            $ipt -D INPUT $i
        done
        $ipt -Z
    }

    if [ $d2 == "00" ] || [ $d2 == "30" ]; then
        unblock
        block
    else
        block
    fi

## （15）需求：--找规律打印数字

请详细查看如下几个数字的规律，并使用shell脚本输出后面的十个数字。
10 31 53 77  105 141 .......

试题解析：
我想大多数人都会去比较这些数字的差值：
10  31  53  77  105  141
21   22   24   28   36
但是这个差值看，并没有什么规律，而我们再仔细看的时候，发现这个差值的差值是有规律的：
10  31  53  77  105  141
21   22   24   28   36
1      2     4     8

    #! /bin/bash
    x=21
    m=10
    echo $m
    for i in `seq 0 14`; do
        j=$[2**$i]
        m=$[$m+$x]
        echo $m
        x=$[$x+$j]
    done

## （16）需求：--统计普通用户

写个shell，看看你的Linux系统中是否有自定义用户（普通用户），若是有，一共有几个？并输出姓名！
假设所有普通用户都是uid大于1000的

    #!/bin/bash
    n=`awk -F ':' '$3>=1000' /etc/passwd|wc -l`
    if [ $n -gt 0 ]
    then
        echo "There are $n common users."
        uname=`awk -F ':' '$3>=1000' /etc/passwd | awk -F ':' '{print $1}'`
        echo "the user were $uname ."
    else
        echo "No common users."
    fi

## （17）需求：--监控磁盘使用率

写一个shell脚本，检测所有磁盘分区使用率和inode使用率并记录到以当天日期为命名的日志文件里，当发现某个分区容量或者inode使用量大于85%时，发邮件通知你自己。
思路：就是先df -h 然后过滤出已使用的那一列，然后再想办法过滤出百分比的整数部分，然后和85去比较，同理，inode也是一样的思路。

    #!/bin/bash
    # This script is for record Filesystem Use%,IUse% everyday and send alert mail when % is more than 85%.

    log=/var/log/disk/`date +%F`.log
    date +'%F %T' > $log
    df -h >> $log
    echo >> $log
    df -i >> $log

    for i in `df -h|grep -v 'Use%'|sed 's/%//'|awk '{print $5}'`; do
        if [ $i -gt 85 ]; then
            use=`df -h|grep -v 'Use%'|sed 's/%//'|awk '$5=='$i' {print $1,$5}'`
            echo "$use" >> use
        fi
    done
    if [ -e use ]; then
       # 这里可以使用咱们之前介绍的 mail.py 发邮件
        mail -s "Filesystem Use% check" root@localhost < use
        rm -rf use
    fi

    for j in `df -i|grep -v 'IUse%'|sed 's/%//'|awk '{print $5}'`; do
        if [ $j -gt 85 ]; then
            iuse=`df -i|grep -v 'IUse%'|sed 's/%//'|awk '$5=='$j' {print $1,$5}'`
            echo "$iuse" >> iuse
        fi
    done
    if [ -e iuse ]; then
        mail -s "Filesystem IUse% check" root@localhost < iuse
        rm -rf iuse
    fi

思路：
1、df -h、df -i 记录磁盘分区使用率和inode使用率，date +%F 日志名格式
2、取出使用率(第5列)百分比序列，for循环逐一与85比较，大于85则记录到新文件里，当for循环结束后，汇总超过85的一并发送邮件(邮箱服务因未搭建，发送本地root账户)。

此脚本正确运行前提：
该系统没有逻辑卷的情况下使用，因为逻辑卷df -h、df -i 时，使用率百分比是在第4列，而不是第5列。如有逻辑卷，则会漏统计逻辑卷使用情况。

## （18）需求：--获取文件列表

有一台服务器作为web应用，有一个目录（/data/web/attachment）不定时地会被用户上传新的文件，但是不知道什么时候会上传。所以，需要我们每5分钟做一次检测是否有新文件生成。
请写一个shell脚本去完成检测。检测完成后若是有新文件，还需要将新文件的列表输出到一个按年、月、日、时、分为名字的日志里。请不要想的太复杂，核心命令只有一个 find /data/web/attachment -mmin -5

思路： 每5分钟检测一次，那肯定需要有一个计划任务，每5分钟去执行一次。脚本检测的时候，就是使用find命令查找5分钟内有过更新的文件，若是有更新，那这个命令会输出东西，否则是没有输出的。固，我们可以把输出结果的行数作为比较对象，看看它是否大于0。

    #!/bin/bash
    d=`date -d "-5 min" +%Y%m%d%H%M`
    basedir=/data/web/attachment
    find $basedir/ -type f  -mmin -5 > /tmp/newf.txt
    n=`wc -l /tmp/newf.txt`
    if [ $n -gt 0 ]; then
        /bin/mv /tmp/newf.txt /tmp/$d
    fi

## （19）需求：--统计最常用命令

写一个shell脚本来看看你使用最多的命令是哪些，列出你最常用的命令top10。
思路：我们要用到一个文件就是.bash\_history，然后再去sort、uniq，剩下的就不用我多说了吧。很简单一个shell。

`sort /root/.bash_history |uniq -c |sort -nr |head`

## （20）需求：--统计日志大小

假如我们需要每小时都去执行你写的脚本。在脚本中实现这样的功能，当时间是0点和12点时，需要将目录/data/log/下的文件全部清空，注意只能清空文件内容而不能删除文件。而其他时间只需要统计一下每个文件的大小，一个文件一行，输出到一个按日期和时间为名字的日志里。 需要考虑/data/log/目录下的二级、三级、... 等子目录里面的文件。

    #!/bin/bash
    logdir="/data/log"
    t=`date +%H`
    d=`date +%F-%H`
    [ -d /tmp/log_size ] || mkdir /tmp/log_size

    for log in `find $logdir -type f`
    do
        if [ $t == "0" ] || [ $t == "12" ]
        then
        true > $log
        else
        du -sh $log >>/tmp/log_size/$d
        fi
    done

\##（21）需求：--统计数字并求和
计算文档a.txt中每一行中出现的数字个数并且要计算一下整个文档中一共出现了几个数字。例如a.txt内容如下： 12aa\*lkjskdj alskdflkskdjflkjj
我们脚本名字为 ncount.sh, 运行它时： bash ncount.sh a.txt 输入结果应该为： 2 0 sum:2

    #!/bin/bash
    n=`wc -l a.txt|awk '{print $1}'`
    sum=0
    for i in `seq 1 $n`
    do
        line=`sed -n "$i"p a.txt`
        n_n=`echo -n $line|sed 's/[^0-9]//g'|wc -c`
        echo line $i number: $n_n
        sum=$[$sum+$n_n]
    done
    echo sum is $sum

\##（22）需求：--检测文件改动

有两台Linux服务器A和B，假如A可以直接ssh到B，不用输入密码。A和B都有一个目录叫做/data/web/ 这下面有很多文件，当然我们不知道具体有几层子目录，假若之前A和B上该目录下的文件都是一模一样的。但现在不确定是否一致了。固需要我们写一个脚本实现这样的功能，检测A机器和B机器/data/web/目录下文件的异同，我们以A机器上的文件作为标准。比如，假若B机器少了一个a.txt文件，那我们应该能够检测出来，或者B机器上的b.txt文件有过改动，我们也应该能够检测出来（B机器上多了文件我们不用考虑）。
提示： 使用核心命令 md5sum a.txt 算出md5值，去和B机器上的比较。

    #!/bin/bash
    #假设A机器到B机器已经做了无密码登录设置
    dir=/data/web
    ##假设B机器的IP为192.168.0.100
    B_ip=192.168.0.100
    find $dir -type f |xargs md5sum >/tmp/md5.txt
    ssh $B_ip "find $dir -type f |xargs md5sum >/tmp/md5_b.txt"
    scp $B_ip:/tmp/md5_b.txt /tmp

    for f in `awk '{print $2}' /tmp/md5.txt`
    do
        if grep -q "$f" /tmp/md5_b.txt
        then
            md5_a=`grep $f /tmp/md5.txt|awk '{print $1}'`
            md5_b=`grep $f /tmp/md5_b.txt|awk '{print $1}'`
            if [ $md5_a != $md5_b ]
            then
                 echo "$f changed."
            fi
        else
            echo "$f deleted. "
        fi
    done

## （23）需求：--统计网卡流量

写一个脚本,检测你的网络流量，并记录到一个日志里。需要按照如下格式，并且一分钟统计一次（只需要统计外网网卡，假设网卡名字为eth0)：
2017-08-04 01:11 eth0 input: 1000bps eth0 output : 200000bps ################ 2017-08-04 01:12 eth0 input: 1000bps eth0 output : 200000bps

提示：使用sar -n DEV 1 59 这样可以统计一分钟的平均网卡流量，只需要最后面的平均值。另外，注意换算一下，1byt=8bit
查找并删除符合要求的文件
1、find / -name “test\*” | xargs rm -rf
2、find / -name “test\*” -exec rm -rf {} ;
3、rm -rf $(find / -name “test”)

Linux截取文件指定行数之间的内容
sed -n ‘开始行数，结束行数p’ 被截取文件 > 另存为文件

从ps aux的结果中提取pid
`ps aux | grep process_name | tr -s  | cut -d   -f 2`
首先应该使用tr命令压缩各个列之间的空格，将多个空格压缩为一个，接着使用cut命令根据空格对列进行分割并取出第二个位置的值，也就是PID

算法题： 一个长字符串，去除重复字符串，且保持字典序最小
