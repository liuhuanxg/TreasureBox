## hadoop03机器启动hdfs，hbase

> bash /opt/module/hadoop-3.1.3/sbin/start-dfs.sh
> bash /opt/module/hadoop-3.1.3/sbin/start-yarn.sh
> /opt/module/apache-zookeeper-3.7.0/bin/zkServer.sh start
> bash /opt/module/hbase-2.4.12/bin/start-hbase.sh
> bash /opt/module/hbase-2.4.12/bin/hbase-daemons.sh --config $HBASE_HOME/conf start thrift --infoport 9096 -p 9097

