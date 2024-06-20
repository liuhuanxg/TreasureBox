1. 渐进式rehash是什么？

   >字典的结构：
   >
   >type、privdate、ht[2]、trehashindex，其中在ht[2]的位置放置的就是hash表
   >
   >redis所有的key-value存储在hash表中，这个hash表包含4部分
   >
   >数组——存储数据
   >
   >size—— hash表的大小
   >
   >sizemask——hash表大小掩码，用于计算索引值，等于size-1
   >
   >used——hash表中已有的节点数量
   >
   >如果一个key1请求来的时候(写入、查询、修改)，首先计算这个key的hash值，然后再根据hash值模sizemask得到在hash表数组中的下标，多个key在数组中的下标相同时，使用链表存储这多个数据。rehash是指当hash表中的值太多，需要hash冲突的数据过多情况下，重建一个新的hash表将旧hash表中的数据迁移到新的hash表中的过程。渐进式是指在迁移的过程中逐渐迁移。
   >
   >hash表扩展伸缩判断条件：
   >
   >负载因子：ht[0].used/ht[1].size
   >
   >扩展：
   >
   >​	1.服务器目前没有执行BGSAVE或者BGREWRITEAOF命令，并且hash表的负载因子大于等于1
   >
   >​	2.服务器正在执行BGSAVE或者BGREWRITEAOF命令，并且hash表的负载因子大于等于5
   >
   >收缩：扩展因子<0.1时，自动执行伸缩
   >
   >
   >
   >扩容标准：第一个大于等于ht[0].used*2的2的n次幂。
   >
   >所以如果一个hash结构中有4096个key时，下一次扩容时要扩容到8192。逐渐增大，hash 越大，扩容消耗的代价越大，所以推荐单个hash结构中元素个数不超过4096个。
   >
   >
   >
   >缩容标准：第一个大于等于ht[0].used的2的n次幂
   >
   >
   >
   >渐进式rehash过程：
   >
   >首先将rehashindex设置为0，默认为1，表示开始执行rehash操作，这个过程中对字典的所有操作（添加、删除、更新、修改），除了执行指定操作之外，还会将ht[0]中对应索引上的所有键值对rehash到新的ht[1]中，当rehash工作完成之后，将rehashindex的属性+1， ht[0]的所有值全部转移到ht[1]之后，rehashindex值置为-1。
   >
   >hash迁移之后，释放ht[0]，并将ht[1]设置为ht[0]，在ht[1]位置创建一个新的空白hash表。

2. redis在什么场景执行AOF文件重写

   >1. AOF文件大小超过预设阈值：AOF文件大小超过配置文件中设置的阈值(`auto-aof-rewrite-min-size`)以及增长率(`auto-aof-rewrite-percentage`)时，Redis会触发AOF重写。为了避免AOF文件过大，影响Redis性能和数据恢复速度
   >2. 手动触发：用户可以通过发送`BGREWRITEAOF`命令来手动触发AOF重写，这在AOF文件过大时，可以帮助减小文件大小，提高Redis性能

3. Redis启动加载AOF文件时

   >从 AOF 文件中加载数据时，如果 AOF 文件在末尾出现不完整的命令，会根据配置文件中的 `aof-load-truncated` 选项来决定如何处理：
   >
   >1. 如果 `aof-load-truncated` 设置为 `yes`（默认值），Redis 会忽略这个不完整的命令，继续加载 AOF 文件中的其他命令。这样，Redis 启动时可以加载尽可能多的数据，但可能会丢失一部分数据。
   >2. 如果 `aof-load-truncated` 设置为 `no`，Redis 会拒绝启动，并在日志中报告 AOF 文件的问题。

   z