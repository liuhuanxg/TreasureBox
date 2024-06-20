1. 现象

   mysql中有一张表，10分钟删除一次4天之前的数据，如当前2023-11-13，删除2023-11-09 00:00:00之前的数据。理论上删除只有一次会生效，删除一次之后数据表中已经没有符合条件的数据，但是每次执行删除还需要4.5s左右。

   >MySQL [xxxx]> select count(*) from  `test` where update_time<="2023-11-09 00:00:00" ;
   >+----------+
   >| count(*) |
   >+----------+
   >|        0 |
   >+----------+
   >1 row in set (0.19 sec)
   >
   >
   >
   >MySQL [xxxx]> delete from  `test` where update_time<="2023-11-09 00:00:00";
   >Query OK, 0 rows affected (4.31 sec)

   >**explain 分析结果：**
   >
   >MySQL [xxxx]> explain delete from  `test` where update_time<="2023-11-09 00:00:00" \G;
   >           id: 1
   >  select_type: SIMPLE
   >        table: test
   >         type: ALL  # 没有命中索引，进行了全表扫描
   >possible_keys:update_time
   >          key: NULL
   >      key_len: NULL
   >          ref: NULL
   >         rows: 3341162
   >        Extra: Using where
   >1 row in set (0.00 sec)

2. 处理

   >因为没有命中索引，所以修改方式，根据主键索引进行删除，有两种方式
   >
   >1. 根据 update_time>"2023-11-09 00:00:00"条件取min(id)，每次把<min(id)的数据删除
   >2. 根据update_time<="2023-11-09 00:00:00"取max(id)，每次把<=max(id)的数据删除，这种方式第一次删除之后，后续查询已经取不到max的值，可以根据查询不到max(id)时不执行删除操作

   执行效率对比：

   >1. 先查询min(id)，然后根据id删除数据
   >
   >MySQL [xxxx]> select min(id) from  `test` where update_time>"2023-11-09 00:00:00" limit 1;
   >+-----------+
   >| min(id)   |
   >+-----------+
   >| 794908834 |
   >+-----------+
   >1 row in set (0.87 sec)
   >
   >再执行删除操作：
   >
   >MySQL [xxxx]> delete from `test` where id<794908835;
   >Query OK, 0 rows affected (1.50 sec)
   >
   >
   >
   >总耗时大概在2.3s左右，比之前减少2秒左右

   >2. 查询max(id)，再根据id删除
   >
   >MySQL [xxx]> select max(id) from  `teet` where update_time<="2023-11-09 00:00:00" limit 1;
   >+---------+
   >| max(id) |
   >+---------+
   >|    NULL |
   >+---------+
   >1 row in set (0.16 sec)
   >
   >因为数据已经被删除，这时没有max(id)，可以不执行删除操作，从4.3s优化至0.16s

   

3. 分析

   >首先看表结构：
   >
   >CREATE TABLE `test` (
   >  `id` int(11) NOT NULL AUTO_INCREMENT,
   >  `c1` varchar(255) NOT NULL,
   >  `c2` int(11) NOT NULL,
   >  `c3` int(11) NOT NULL,
   >  `c4` varchar(255) NOT NULL,
   >  `c5` varchar(255) NOT NULL,
   >  `c6` float NOT NULL,
   >  `update_time` datetime NOT NULL,
   >  `c7` smallint(6) DEFAULT '0',
   >  `c8` int(11) DEFAULT '0',
   >  `c9` int(11) DEFAULT '0' ,
   >  `c10` int(11) DEFAULT '0',
   >  `c11` int(11) DEFAULT '0',
   >  PRIMARY KEY (`id`),
   >  KEY `c1` (`c1`),
   >  KEY `c2` (`c2`),
   >  KEY ``update_time`` (`update_time`)
   >) ENGINE=InnoDB AUTO_INCREMENT=798500333 DEFAULT CHARSET=utf8;
   >
   >索引情况
   >MySQL [qc_cbs]> show index from  `test` \G;
   >*************************** 1. row ***************************
   >        Table: test
   >   Non_unique: 0
   >     Key_name: PRIMARY
   > Seq_in_index: 1
   >  Column_name: id
   >    Collation: A
   >  Cardinality: 3351759
   >     Sub_part: NULL
   >       Packed: NULL
   >         Null:
   >   Index_type: BTREE
   >      Comment:
   >Index_comment:
   >*************************** 2. row ***************************
   >        Table: test
   >   Non_unique: 1
   >     Key_name: c1
   > Seq_in_index: 1
   >  Column_name: c1
   >    Collation: A
   >  Cardinality: 2
   >     Sub_part: NULL
   >       Packed: NULL
   >         Null:
   >   Index_type: BTREE
   >      Comment:
   >Index_comment:
   >*************************** 3. row ***************************
   >        Table: test
   >   Non_unique: 1
   >     Key_name: c2
   > Seq_in_index: 1
   >  Column_name: c2
   >    Collation: A
   >  Cardinality: 2
   >     Sub_part: NULL
   >       Packed: NULL
   >         Null:
   >   Index_type: BTREE
   >      Comment:
   >Index_comment:
   >*************************** 4. row ***************************
   >        Table: test
   >   Non_unique: 1
   >     Key_name: update_time
   > Seq_in_index: 1
   >  Column_name: update_time
   >    Collation: A
   >  Cardinality: 1344
   >     Sub_part: NULL
   >       Packed: NULL
   >         Null:
   >   Index_type: BTREE
   >      Comment:
   >Index_comment:
   >4 rows in set (0.00 sec)

   

   >**update_time字段有684个不同值，每个值下边对应5299条数据索引选择性很低，这种情况下索引失效**
   >
   >MySQL [xxxx]> select count(distinct update_time) from  `test` \G;
   >*************************** 1. row ***************************
   >count(distinct update_time): 684
   >1 row in set (0.11 sec)
   >
   >MySQL [xxxx]> select count(*) from  `test` \G;
   >*************************** 1. row ***************************
   >count(*): 3623292
   >1 row in set (0.76 sec)

   