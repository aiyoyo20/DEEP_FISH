# 数据库操作
## 创建数据库
`create database database_name;`  # 创建一个数库，数据库的名字为 database_name

## 查看数据库
`show databases;`  # 显示当前服务器的所有数据库

## 选中数据库
`use database_name;`  # 使用数据库 database_name

## 查看数据库中的表
`show tables;`  # 使用 use 进入到某个数据库后可以使用 show tables 显示当前数据库下所有的表

## 删除数据库
`drop database database_name;`  # 删除一个数库，数据库的名字为 database_name

# 数据表操作
## 创建表
### 数据类型
#### 1、数值类型（整型、浮点）
##### 整型
|MySQL    |数据类型| 所占字节	值范围|
|----|----|----|
|tinyint	 |1字节	  |   -128~127|
|smallint |2字节|-32768~32767|
|mediumint|	3字节|-8388608~8388607|
|int	     |4字节	  |范围-2147483648~2147483647|
|bigint	 | 8字节	  |  +-9.22*10的18次方|

整型的长度不同，在实际使用过程也就不同。

MySQL 以一个可选的显示宽度指示器的形式对 SQL 标准进行扩展，这样当从数据库检索一个值时，可以把这个值加长到指定的长度。例如，指定一个字段的类型为 INT(6)，
就可以保证所包含数字少于 6 个的值从数据库中检索出来时能够自动地用空格填充。需要注意的是，使用一个宽度指示器不会影响字段的大小和它可以存储的值的范围。

注意：
	在创建表字段时，性别我们可以使用无符号的微小整型（tinyint）来表示。用0表示女、用1表示男。用2表示未知。
	同样人类年龄也是，在创建表字段时可用用无符号的整型。因为人类的年龄还没有负数
	在实际使用过程中。我们业务中最大需要存储多大的数值。我们创建表时，就选择什么样的类型来存储这样的值。

##### 浮点类型
|MySQL数据类型	|所占字节	|值范围|
||----|----|----|
|float(m, d)	|4字节	|单精度浮点型，m总个数，d小数位|
|double(m, d)|8字节	|双精度浮点型，m总个数，d小数位|
|decimal(m, d)|		|decimal是存储为字符串的浮点数|

注意：
	浮点是非精确值，会存在不太准确的情况
	而decimal叫做定点数。在MySQL内部，本质上是用字符串存储的。实际使用过程中如果存在金额、钱精度要求比较高的浮点数存储，建议使用decimal（定点数）这个类型。
|
#### 2、字符串类型|
|MySQL数据类型|	所占字节					|	值范围|
|----|----|----|
|CHAR		|	0-255字节				|	定长字符串|
|VARCHAR	|	0-255字节				|	变长字符串|
|TINYBLOB	|	0-255字节				|	不超过255个字符的二进制字符串|
|TINYTEXT	|	0-255字节				|	短文本字符串|
|BLOB		|	0-65535字节				|	二进制形式的长文本数据|
|TEXT		|	0-65535字节				|	长文本数据|
|MEDIUMBLOB	|	0-16 777 215字节			|	二进制形式的中等长度文本数据|
|MEDIUMTEXT	|	0-16 777 215字节			|	中等长度文本数据|
|LOGNGBLOB	|	0-4 294 967 295字节		|	二进制形式的极大文本数据|
|LONGTEXT	|	0-4 294 967 295字节		|	极大文本数据|
|VARBINARY(M)|	允许长度0-M个字节的定长字节符串|	值的长度+1个字节|
|BINARY(M)	|	M						|	允许长度0-M个字节的定长字节符串|

*CHAR * 类型用于定长字符串，并且必须在圆括号内用一个大小修饰符来定义。这个大小修饰符的范围从 0-255。比指定长度大的值将被截短，而比指定长度小的值将会用空格作填补。
*VARCHAR * 把这个大小视为值的大小，在长度不足的情况下就用空格补足。而 VARCHAR 类型把它视为最大值并且只使用存储字符串实际需要的长度
类型不会被空格填补，但长于指示器的值仍然会被截短。
因为 VARCHAR 类型可以根据实际内容动态改变存储值的长度，所以在不能确定字段需要多少字符时使用 VARCHAR 类型可以大大地节约磁盘空间、提高存储效率。

text类型与blob类型 对于字段长度要求超过 255 个的情况下，MySQL 提供了 TEXT 和 BLOB 两种类型。根据存储数据的大小，它们都有不同的子类型。这些大型的数据用于存储文本块或图像、
声音文件等二进制数据类型。
TEXT 和 BLOB 类型在分类和比较上存在区别。BLOB 类型区分大小写，而 TEXT 不区分大小写。大小修饰符不用于各种 BLOB 和 TEXT 子类型。
#### 3、日期时间类型

|MySQL数据类型	|所占字节	|值范围|
|----|----|----|
|date			|3字节	|日期，格式：2014-09-18|
|time			|3字节	|时间，格式：08:42:30|
|datetime		|8字节	|日期时间，格式：2014-09-18 08:42:30|
|timestamp		|4字节	|自动存储记录修改的时间|
|year			|1字节	|年份|

注意：
	时间类型在web系统中用的比较少，很多时候很多人喜欢使用int来存储时间。插入时插入的是unix时间戳，因为这种方式更方便计算。在前端业务中用date类型的函数，再将unix时间戳转成人们可识别的时间。
	上面的类型你可以根据实际情况实际进行选择
	有些人为了在数据库管理中方便查看，也有人使用datetime类型来存储时间。
#### 4、复合类型
|MySQL数据类型	|说明		|举例|
|----|----|----|
|set			|集合类型	|set(“member”, “member2″, … “member64″)|
|enum		|枚举类型	|enum(“member1″, “member2″, … “member65535″)|

一个 ENUM 类型只允许从一个集合中取得一个值；而 SET 类型允许从一个集合中取得任意多个值。

ENUM 类
	ENUM 类型因为只允许在集合中取得一个值，有点类似于单选项。在处理相互排拆的数据时容易让人理解，比如人类的性别。ENUM 类型字段可以从集合中取得一个值或使用null值，除此之外的输入将会使 MySQL 在这个字段中插入一个空字符串。另外如果插入值的大小写与集合中值的大小写不匹配，MySQL会自动使用插入值的大小写转换成与集合中大小写一致的值。
	ENUM 类型在系统内部可以存储为数字，并且从1开始用数字做索引。一个 ENUM 类型最多可以包含 65536 个元素，其中一个元素被 MySQL 保留，用来存储错误信息，这个错误值用索引 0 或者一个空字符串表示。
	MySQL 认为 ENUM 类型集合中出现的值是合法输入，除此之外其它任何输入都将失败。这说明通过搜索包含空字符串或对应数字索引为 0 的行就可以很容易地找到错误记录的位置。

SET 类型 
	SET 类型与 ENUM 类型相似但不相同。SET类型可以从预定义的集合中取得任意数量的值。并且与 ENUM 类型相同的是任何试图在 SET 类型字段中插入非预定义的值都会使MySQL插入一个空字符串。如果插入一个即有合法的元素又有非法的元素的记录，MySQL 将会保留合法的元素，除去非法的元素。
	一个 SET 类型最多可以包含 64 个元素。在 SET 元素中值被存储为一个分离的“位”序列，这些“位”表示与它相对应的元素。“位”是创建有序元素集合的一种简单而有效的方式。
	并且它还去除了重复的元素，所以SET类型中不可能包含两个相同的元素。
	希望从 SET 类型字段中找出非法的记录只需查找包含空字符串或二进制值为 0 的行。
#### 5、空间类型（非科学性工作基本不用，不做讲解）
#### 字段其他属性设置
##### UNSIGNED（无符号） 
主要用于整型和浮点类型，使用无符号。即，没有前面面的-（负号）。
存储位数更长。tinyint整型的取值区间为，-128~127。而使用无符号后可存储0-255个长度。

创建时在整型或浮点字段语句后接上：`unsigned`

##### ZEROFILL（0填充） 
0（不是空格）可以用来真补输出的值。使用这个修饰符可以阻止 MySQL 数据库存储负值。

创建时在整型或浮点字段语句后接上：`zerofill`

##### default 
default属性确保在没有任何值可用的情况下，赋予某个常量值，这个值必须是常量，因为 MySQL 不允许插入函数或表达式值。此外，此属性无法用于 BLOB 或 TEXT 列。如果已经为此列指定了 NULL 属性，没有指定默认值时默认值将为 NULL，否则默认值将依赖于字段的数据类型。

创建时在整型或浮点字段语句后接上：`default` '值'

##### not null 
如果将一个列定义为not null，将不允许向该列插入 null 值。建议在重要情况下始终使用 not null 属性，因为它提供了一个基本验证，确保已经向查询传递了所有必要的值。

创建时在整型或浮点字段语句后接上：`not null`



##### null 
为列指定 null 属性时，该列可以保持为空，而不论行中其它列是否已经被填充。记住，null 精确的说法是“无”，而不是空字符串或0。

创建时在整型或浮点字段语句后不要声明 not null 即可。

### 字符集
字符集是什么？
为了更好的识别中文、日文、英文、希腊语。对于常用的符号进行了编码，这个编码就是字符集。

字符集确定了文字的存储方式。

字符集相当于是计算机中人类的语言。

举个例子：

我说的是英文，所以我存储的时候要用英文文字来存储。
如果我说的是中文，用英文字符来存储的话。那么人们就看不懂也看不明白，就是我们所说的乱码。

因为字符集太多了，足够有几十种上百种之多。所以我们不需要了解太多的字符集的知识，甚至不需要了解字符集到底是如何编成人类可见字符的。
### 表引擎
MySQL的强大之处在于它的插件式存储引擎，我们可以基于表的特点使用不同的存储引擎，从而达到最好的性能。

如果你足够熟悉，并且有一定工作经验后。你还可以使用阿里巴巴和网易开源出来的MySQL引擎在自己的服务器中使用。

大家在后面的一节《数据库结构定义语句》中可以学到创建表的语句。mysql在创建表的时候，可以指定对应的引擎。

在mysql命令中使用：`show engines;`

可以查看到当前服务器支持的所有引擎。

我们介绍几种常用的引擎和了解几个不常用的引擎。避免未来在实际工作中看到一些引擎不知道概念。

|引擎名称	|特别|
|----|----|
|MyISAM	|常用。读取效率很高的引擎|
|InnoDB	|常用。写入，支持事处等都支持|
|Archive	|不常用。归档引擎，压缩比高达1:10，用于数|据归档
|NDB	不常用。主要在MySQL 集群服务器中使用，不做介绍|

MyISAM
	不支持事务，表锁(表级锁，加锁会锁住整个表)，支持全文索引,操作速度快。常用于读取多的业务。
	myisam存储引擎表由 myd 和 myi 组成。.myd 用来存放数据文件，.myi 用来存放索引文件。
	对于 myisam 存储引擎表，mysql 数据库只缓存其索引文件，数据文件的缓存由操作系统本身来完成。

InnoDB
	支持事务，主要面向在线事务处理(OLTP)方面的应用。
	行锁设计，支持外键，即默认情况下读取操作不加锁。
	InnoDB 是为处理巨大数据量时的最大性能设计。

注：
	行锁：写入、更新操作的时候将这一行锁起来，不让其他人再操作了。
	表锁：写入、更新操作时，将表给锁起来不让其他人再操作了。
	事务：同时操作多个数据，若其中的一个数据操作失败。可回滚到操作之前。常用于银行、电商、金融等系统中。
### 索引
索引用于快速找出在某个列中有一特定值的行。

不使用索引，MySQL必须从第1条记录开始然后读完整个表直到找出相关的行。表越大，花费的时间越多。如果表中查询的列有一个索引，MySQL能快速到达一个位置去搜寻到数据文件的中间，没有必要看所有数据。

当然索引也不易过多，索引越多写入，修改的速度越慢。因为，写入修改数据时，也要修改索引。

MySQL的索引类型
|索引类型	|功能说明|
|普通索引	|最基本的索引，它没有任何限制|
|唯一索引	|某一行企用了唯一索引则不准许这一列的行数据中有重复的值。针对这一列的每一行数据都要求是唯一的|
|主键索引	|它是一种特殊的唯一索引，不允许有空值。一般是在建表的时候同时创建主键索引，常用于用户ID。类似于书中的页码|
|全文索引	|对于需要全局搜索的数据，进行全文索引|

普通索引
	类型	详细说明
	基本语法	alter table 表 add index(字段)
	示例	ALTER TABLE money ADD INDEX(username);
	示例解释	为money表的username字段增加索引
唯一索引
	类型	详细说明
	基本语法	alter table 表 add UNIQUE(字段)
	示例	ALTER TABLE money ADD UNIQUE(email);
	示例解释	为money表的email字段增加唯一索引
全文索引
	类型	详细说明
	基本语法	alter table 表 add FULLTEXT(字段)
	示例	ALTER TABLE money ADD FULLTEXT(content);
	示例解释	为money表的content字段增加唯一索引
主键索引
	类型	详细说明
	基本语法	alter table 表 add PRIMARY KEY(字段)
	示例	ALTER TABLE money ADD PRIMARY KEY(id);
	示例解释	为money表的id字段增加主键索引

## 插入数据
插入基本语法一
|类别		|详细解示|
|基本语法	|insert into 表 values(值1,值2,值n);|
|示例		|insert into user values(2,'李文凯','男')|
|示例说明	|向user表中插入值id为2，姓名为李文凯，性别为男|

插入基本语法二
|类别		|详细解示|
|基本语法		|insert into 表(字段1,字段2,字段n) values(值1,值2,值n);|
|示例		|insert into user(id,username,sex) values(213,'小沈阳',1);|
|示例说明		|向user表中插入id为213，username为小沈阳，性别为1|

基本语法1和基本语法2的区别是：
	基本语法1的插入语句，表中有多少个字段就必须要插入多少个值。一个不能多，一个也不能少。若有默认值，不想传，可以写上null。
	基本语法2中，除非有必填字段必须要写入值外。如果有默认值的不想写可以忽略不写。mysql会自动补主默认值。
	基本语法2中，以user(id,username,sex)字段顺序为值的顺序。

基本语法变形：一次插入多条记录
insert into user(username,password,sex)
values('黄晓明', 'abcdef', 1),
( 'angelababy', 'bcdeef', 0),
( '陈赫', '123456', 1),
('王宝强', '987654', 1);

## 删除数据
使用 delete 删除记录
|类别		|详细解示|
|基本语法	|delete from 表 [where 条件];|
|示例		|delete from user where id > 10;|
|示例说明	|删除掉用户表中id大于10的所有用户|

清空表记录
delete和truncate是一样的，但它们有一点不同，那就是DELETE可以返回被删除的记录数，而TRUNCATE TABLE返回的是0。

如果一个表中有自增字段，使用truncate table 这个自增字段将起始值恢复成1.
|
|类别		|说明|
|基本语法	|TRUNCATE TABLE 表名;|
|示例		|TRUNCATE TABLE user;|
|示例说明	|清空表的数据，并且让自增的id从1开始自增|

## 修改数据
|类别		|详细解示|
|基本语法	|update 表名 set 字段1=值1,字段2=值2,字段n=值n where 条件|
|示例		|update money set balance=balance-500 where userid = 15;|
|示例说明	|修改money表，将balance余额减500。要求userid为15|

同时对两个表进行更新
|类别		|详细解示
|基本语法	|update 表1,表2 set 字段1=值1,字段2=值2,字段n=值n where 条件|
|示例		|update money m,user u m.balance=m.balance*u.age where m.userid=u.id;|
示例说明	修改money，将money表的别名设置为m；user表的别名设置为u；将m表的余额改为m表的balance*用户表的age。执行条件是：m.userid = u.id|
## 单表查|询数据
语法：
	select
		字段列表
	from
		表名列表
	where
		条件列表
	group by
		分组字段
	having
		分组之后的条件
	order by
		排序
	limit
		分页限定

### 基础查询
`select * from table_name;`  # 查询该表中的所有数据
`select name1 from table_name；`  # 查询该表中的字段名1列的所有数据
`select distinct name1 from table_name；`  # 查询该表中的字段名1列的所有数据并过滤
`select name1 from table_name as t1；`  # 查询该表中的字段名1列的所有数据并为该表建立别名
`select t1.name1 from table_name as t1；`  # 结果同上，如果给表起了别名t1，就应该使用name1或t1.name1而不能使用table_name.name1
`select name1,name2.. from table_name；`  # 查询该表中的name1、name2列的所有数据
`select name1 as n1,name2 as n2.. from table_name；`  # 查询该表中的name1、name2列的所有数据并给name1,name2创建别名


### 条件查询
where子句后跟条件
#### 比较运算符
>  	# 大于
`select name from table_name where age>18；`  # 查询年龄大于18的用户
>= 	# 大于等于
`select name from table_name where age>=18；`  # 查询年龄大于等于18的用户
<   # 小于
`select name from table_name where age<18；`  # 查询年龄小于18的用户
<=  # 小于等于
`select name from table_name where age<=18；`  # 查询年龄小于等于18的用户
!=  # 不等于
`select name from table_name where age!=18；`  # 查询年龄不等于18的用户
<>  # 不等于
`select name from table_name where age<>18；`  # 查询年龄不等于18的用户
=   # 等于
`select name from table_name where age=18；`  # 查询年龄等于18的用户

#### 逻辑运算符
and、
`select name from table_name where age>18 and high>180；`  # 查询年龄大于18且身高大于180的用户
or、
`select name from table_name where age>18 or high>180；`  # 查询年龄大于18或身高大于180的用户
not
`select name from table_name where not (age>18 and high>180)；`  # 查询年龄不在大于18且身高大于180范围的用户
#### 模糊查询
like
	`%`  # 替换一个或者多个
	`select name from table_name where name like 李%；`  # 查询姓李的用户
	`_`  # 替换一个
	`select name from table_name where name like __%；`  # 查询名字长度大于等于3的用户


rlike
	接正则表达式

#### 范围查询
in
`select name from table_name where age in (18,19,21,22)；`  # 查询年龄在该范围的用户
not in
`select name from table_name where age not in (18,19,21,22)；`  # 查询年龄不在该范的的用户
between and
`select name from table_name where age between 18 and 25；`  # 查询年龄在18-25的用户
`select name from table_name where age not between 18 and 25；`  # 不在18-25的用户
错误的例子：
	`select name from table_name where age not (between 18 and 25)；`
但是可以这样用：
	`select name from table_name where not age between 18 and 25；`  # 不在18-25的用户

#### 空判断
is NULL  # 判断空
is not NULL  # 判断非空

### 排序
语法：
	select 查询列表 from 表 【where 筛选条件】 order by
特点：
	asc 代表的是升序，desc 代表的降序，不写默认为升序；
	order by 子句中可以支持单个字段，多个字段，表达式，函数，别名；
	order by子句一般是放在查询语句的最后面，limit 子句除外；

`select name from table_name where age between 18 and 25 order by age ASC;`  # 查询年龄在18-25的用户并按照年龄排序

`select name from table_name where age between 18 and 25 order by age ASC，name DESC;`  # 查询年龄在18-25的用户并按照年龄排序，年龄相同按照名字排序

### 函数
count  # 总数
`select name1 from table_name；`  # 统计查询出了多少条数据
`select name1 as 总数 from table_name；`  # 统计查询出了多少条数据并以新名总数显示
max  # 求最大值
`select max(age) from table_name；`  # 查询最大年龄
min  # 求最小值
`select min(age) from table_name；`  # 查询最大年龄
avg  # 求平均值
`select avg(age) from table_name；`  # 求平均年龄
sum  # 求和
`select sum(age) from table_name；`  # 求所有人的年龄总和

### 分组
语法：`group by`
`select gender,count(*) from table_name group by gender`  # table_name 中的数据按照性别分组，并统计各个性别的总数
`select gender,count(*) from table_name where gender=1 group by gender`  # table_name 中的数据按照性别分组，并统计男生的总数

group_concat() 查看分组信息
`select gender,group_concat(name,age) from table_name where gender=1 group by gender`  # table_name 中的数据按照性别分组，并展示详细的姓名、年龄
group_concat(name,age) 会把显示的信息拼接在一起输出 ，可以使用一些方法获得更适合阅读的 group_concat(name,'  '，age)

having 过滤分组
`select gender,group_concat(name,age) from table_name group by gender having avg(age)>18`  # table_name 中的数据按照性别分组，并过滤出平均年龄大于18岁的分组并展示详细的姓名、年龄

with rollup
在对分组使用函数的时候也可以对全表用函数，但是使用后不能进行排序了
coalesce(a,b,c); 配合 with rollup 使用，增加显示字段，更宜读
参数说明：如果a==null,则选择b；如果b==null,则选择c；如果a!=null,则选择a；如果a b c 都为null ，则返回为null（没意义）。

where 的判断是针对原表的，having 是针对分组的

### 结果集限制/分页
`select name from table_name where age>18 limit 5；`  # 查询年龄大于18的用户,只显示查询结果的前五个
`select name from table_name where age>18 limit 1,5；`  # 查询年龄大于18的用户,只显示查询的第1位往后走五个

## 多表联合查询
### 内连接
取交集
基本语法一：
|类别		|详细解示|
|基本语法	|select 表1.字段 [as 别名],表n.字段 from 表1 [别名],表n where 条件;|
|示例		|select user.uid ,user.username as username,order_goods.oid,order_goods.uid,order_goods.name as shopname from user,order_goods where user.uid = order_goods.uid;|
|示例说明	|查询商品表中哪些用户购买过商品，并将用户信息显示出来|

基本语法二：
|类别	|详细解示|
|基本语法	|select 表1.字段 [as 别名],表n.字段 from 表1 INNER JOIN 表n on 条件;|
|示例	|select user.uid ,user.username as username,order_goods.oid,order_goods.uid,order_goods.name as shopname from user inner join order_goods on user.uid = order_goods.uid;|
|示例说明	|查询商品表中哪些用户购买过商品，并将用户信息显示出来|
### 外连接
外连接又分为左连接和右链接

左连接：包含所有的左边表中的记录甚至是右边表中没有和它匹配的记录
|说明		|详解|
|基本语法		|select 表1.字段 [as 别名],表n.字段 from 表1 LEFT JOIN 表n on 条件;|
|示例		|select * from user left join order_goods on user.uid = order_goods.uid;|
|示例说明		|以左边为主，查询哪些用户未购买过商品，并将用户信息显示出来|

右连接：包含所有的右边表中的记录甚至是右边表中没有和它匹配的记录
|类别		|详细解示|
|基本语法		|select 表1.字段 [as 别名],表n.字段 from 表1 right JOIN 表n on 条件;|
|示例		|select * from user right join order_goods on user.uid = order_goods.uid;|
|示例说明		|查询商品表中哪些用户购买过商品，并将用户信息显示出来|

### 子查询
有时候，当我们查询的时候，需要的条件是另外一个select语句的结果，这时就需要使用子查询。用于子查询的关键字包括in、not in、=、!=、exists、not exists等。

类别	详细解示
|基本语法	|select 字段 from 表 where 字段 in(条件)|
|示例1	|select * from user where uid in (1,3,4);|
|示例1说明|	按照id 查询指定用户|
|示例2	|select * from user where uid in (select uid from order_goods);|
|示例2说明|	将购买过商品的用户信息显示出来|

### 记录联合
使用 union 和 union all 关键字，将两个表的数据按照一定的查询条件查询出来后，将结果合并到一起显示。两者主要的区别是把结果直接合并在一起，而 union 是将 union all 后的结果进行一次distinct，去除重复记录后的结果。

### 自关联：
表中的某一列，通过外键引用了本表的另外一列（主键），但是它们的业务逻辑含义又是不一样的，这就是自关联
物理上一张表，逻辑上是多张表，必须通过取别名来区分，能够节省表的开销

自关联的应用场景：
	我们设计了省(provinces)信息的表结构（id,ptitle）和市（cities）信息的表结构（id,ctitle,pid）这两张表，其中pid对应着provices表的id。通过比较发现，cities表比provinces表多一个列pid，其它列的类型都是一样的，存储的都是地区信息，而且每种信息的数据量有限，因此没必要增加一个新表，或者将来还要存储区、乡镇信息，都增加新表的开销太大。我们可以重新设计一个地区(areas)信息的结构（id,atitle,pid），因为省没有所属的省份，所以pid可以填写null，城市所属的省份pid可以填写省所对应的id。在这个表中，结构不变，还可以添加区县、乡镇街道、村社区等信息。
	或者是公司的部门表等。
	拥有一定的丛属关系深度的。

查询山西省有哪些市
`select city.atitle from areas as province inner join areas as city on province.id = city.pid where province.atitle = '山西省';`


[3天入门MySQL](https://www.shouce.ren/api/view/a/13994)