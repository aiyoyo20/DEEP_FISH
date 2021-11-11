[MySQL优化插入数据速度](http://c.biancheng.net/view/8253.html)

在 MySQL 中，向数据表插入数据时，索引、唯一性检查、数据大小是影响插入速度的主要因素。本节将介绍优化插入数据速度的几种方法。

根据不同情况，可以分别进行优化。

对于 MyISAM 引擎的表，常见的优化方法如下：
1. 禁用索引
对非空表插入数据时，MySQL 会根据表的索引对插入的记录进行排序。插入大量数据时，这些排序会降低插入数据的速度。为了解决这种情况，可以在插入数据之前先禁用索引，等到数据都插入完毕后在开启索引。

禁用索引的语句为：
ALTER TABLE table_name DISABLE KEYS;

重新开启索引的语句为：
ALTER TABLE table_name ENABLE KEYS;

对于新创建的表，可以先不创建索引，等到数据都导入以后再创建索引，这样可以提高导入数据的速度。
2. 禁用唯一性检查
插入数据时，MySQL 会对插入的数据进行唯一性检查。这种唯一性检验会降低插入数据的速度。为了降低这种情况对查询速度的影响，可以在插入数据前禁用唯一性检查，等到插入数据完毕后在开启。

禁用唯一性检查的语句为：
SET UNIQUE_CHECKS=0;

开启唯一性检查的语句为：
SET UNIQUE_CHECKS=1;

3. 使用批量插入
在 MySQL 中，插入多条数据有 2 种方式。第一种是使用一个 INSERT 语句插入多条数据。INSERT 语句的情形如下：
INSERT INTO items(name,city,price,number,picture) VALUES ('耐克运动鞋','广州',500,1000,'001.jpg'),('耐克运动鞋2','广州2',500,1000,'002.jpg');


第二种是一个 INSERT 语句只插入一条数据，执行多个 INSERT 语句来插入多条数据。INSERT 语句的情形如下：
INSERT INTO items(name,city,price,number,picture)  VALUES('耐克运动鞋','广州',500,1000,'001.jpg');
INSERT INTO items(name,city,price,number,picture)  VALUES('耐克运动鞋2','广州',500,1000,'002.jpg');


一次性插入多条数据和多次插入数据所耗费的时间是不一样的。第一种方式减少了与数据库之间的连接等操作，其速度比第二种方式要快一些。所以插入大量数据时，建议使用第一种方法。

注意：如果能用 LOAD DATA INFILE 语句，就尽量用 LOAD DATA INFILE 语句。因为 LOAD DATA INFILE 语句导入数据的速度比 INSERT 语句的速度快。

对于 InnoDB 引擎的表，常见的优化方法如下：
1. 禁用唯一性检查
同 MyISAM 引擎相同，插入数据之前先禁用索引，等到数据都插入完毕后在开启索引。
2. 禁用外键检查
使用外键时，在子表中插入一条数据，首先会检查主表中是否有相应的主键值，然后锁定主表的记录，在插入值。相比较，使用外键多了2步操作，速度会慢一些。

所以我们可以在插入数据之前禁止对外键的检查，数据插入完成之后再恢复对外键的检查。不多对于数据完整性要求较高的系统不建议使用。

禁用外键检查语句为：
SET FOREIGN_KEY_CHECKS=0; 

恢复对外键的检查语句为：
SET FOREIGN_KEY_CHECKS=1;

3. 禁止自动提交
在《MySQL设置事务自动提交》一节我们提到 MySQL 的事务自动提交模式默认是开启的，其对 MySQL 的性能也有一定得影响。也就是说如果你插入了 1000 条数据，MySQL 就会提交 1000 次，这大大影响了插入数据的速度。而如果我们把自动提交关掉，通过程序来控制，只要一次提交就可以了。

所以插入数据之前可以先禁止事务的自动提交，待数据导入完成之后，再恢复自动提交操作。

禁止自动提交语句为：
SET AUTOCOMMIT=0; 

恢复自动提交语句为：
SET AUTOCOMMIT=1;



[索引到底对查询速度有什么影响？](http://c.biancheng.net/view/7956.html)
索引是数据库优化中最常用也是最重要的手段之一，通过索引可以帮助用户解决大多数的 SQL 性能问题。

多数情况下，查询速度很慢时，加上索引便能解决问题。但也并非总是如此，因为优化不是件简单的事情。但是如果你不使用索引，在许多情况下，尝试通过其它途径来提高性能都纯粹是在浪费时间。应该首先使用索引来最大程度的改善性能，然后再看看是否还有其它有用的技术。

索引提供了高效访问数据的方法，能够快速的定位表中的某条记录，加快数据库查询的速度，从而提高数据库的性能。

如果查询时不使用索引，那么查询语句将查询表中的所有字段。这样查询的速度会很慢。使用索引进行查询，查询语句不必读完表中的所有记录，而只查询索引字段。这样可以减少查询的记录数，达到提高查询速度的目的。

下面通过对比使用索引和不使用索引来分析索引对查询速度的影响。
例 1
为了便于读者更好的理解，分析之前，我们先查询一下 tb_students_info 数据表中的记录，SQL 语句和运行结果如下：
mysql> SELECT * FROM tb_students_info;
+----+------+
| id | name |
+----+------+
|  1 | 张三 |
|  2 | 李四 |
|  3 | 王五 |
|  4 | 赵六 |
|  5 | 周七 |
|  6 | 吴八 |
|  7 | 朱九 |
|  8 | 苏十 |
+----+------+
8 rows in set (0.02 sec)
使用 EXPLAIN 分析未使用索引时的查询情况，SQL 语句和运行结果如下：
mysql> EXPLAIN SELECT * FROM tb_students_info WHERE name='张三' \G
*************************** 1. row ***************************
           id: 1
  select_type: SIMPLE
        table: tb_students_info
   partitions: NULL
         type: ALL
possible_keys: NULL
          key: NULL
      key_len: NULL
          ref: NULL
         rows: 8
     filtered: 12.50
        Extra: Using where
1 row in set, 1 warning (0.00 sec)
由结果可以看到，rows 列的值是 8，说明查询语句扫描了表中的 8 条记录。
没有索引的表就相当于一组无序的行，如果我们想找到某条记录就必须检查表的每一行，看看它是否与那个期望值相匹配。这是一个全表扫描操作，其效率很低，如果表很大，而且仅有少数几条记录与搜索条件相匹配，那么整个扫描过程的效率将会超级低。

在 tb_students_info 表的 name 字段添加索引，SQL 语句和运行结果如下：
mysql> CREATE INDEX index_name ON tb_students_info(name);
Query OK, 8 rows affected (0.14 sec)
使用 EXPLAIN 再次执行上面的查询语句，SQL 语句和运行结果如下：
mysql> EXPLAIN SELECT * FROM tb_students_info WHERE name='张三' \G
*************************** 1. row ***************************
           id: 1
  select_type: SIMPLE
        table: tb_students_info
   partitions: NULL
         type: ref
possible_keys: index_name
          key: index_name
      key_len: 63
          ref: const
         rows: 1
     filtered: 100.00
        Extra: NULL
1 row in set, 1 warning (0.00 sec)
结果显示，rows 列的值为 1，表示这个查询语句只扫描了表中的 1 条记录。创建索引后访问的行由 8 行减少到 1 行，其查询速度自然比扫描 8 条记录快。而且 possible_keys 和 key 的值都是 index_name，这说明查询时使用了 index_name 索引。所以，在查询操作中，使用索引不仅能自动优化查询效率，还会降低服务器的开销。

注意：由于 tb_students_info 表中记录较少，所以在这没有分析运行时间。表中记录多时，运行时间的差异也会体现出索引对查询速度的影响。