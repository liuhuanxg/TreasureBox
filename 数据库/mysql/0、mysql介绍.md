mysql是一种关系型数据库



分为server曾和存储层，server层主要用于建立连接，存储层用于数据存储、索引维护等

存储引擎主要有Mysisam和innodb两种，其中5.5之前默认使用mysisam，mysisam支持表级锁，不支持事务，innodb支持行级锁。

