1. 启动zookeeper

   ```shell
   bash bin/zookeeper-server-start.sh config/zookeeper.properties
   ```

2. 启动kafka

   ```
   bash bin/kafka-server-start.sh config/server.properties
   ```

3. 创建一个分区一个副本的topic

   ```
   bash bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test
   ```

4. 查看当前所有的topic

   ```shell
   bash bin/kafka-topics.sh --list --zookeeper localhost:2181
   ```

5. 启动生产者

   ```shell
   bash bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test
   ```

6. 启动消费者：--from-beginning从最开始消费消息

   ```
   bash bin/kafka-console-consumer.sh  --bootstrap-server localhost:9092 --topic test --from-beginning
   ```

7. describe查看topic详细信息

   ```shell
   bash bin/kafka-topics.sh --describe --zookeeper localhost:2181 --topic test
   Topic: test	TopicId: VuAyydMYT1idQx9QAm-a_w	PartitionCount: 1	ReplicationFactor: 1	Configs:
   	Topic: test	Partition: 0	Leader: 0	Replicas: 0	Isr: 0
   ```

8. 创建多个分区的topic

   ```shell
   bash bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic topic-3-partions
   >Created topic topic-3-partions.
   ```

9. 查看分区提交点

   ```shell
   cat /tmp/kafka-logs/replication-offset-checkpoint
   ```

10. 消费指定分区

    ```shell
    bash bin/kafka-console-consumer.sh  --bootstrap-server localhost:9092 --topic topic-3-partion --partition 0 --from-beginning
    ```

11. 指定消费者组

    ```shell
    bash bin/kafka-console-consumer.sh  --bootstrap-server localhost:9092 --topic topic-3-partion --from-beginning --consumer.config config/consumer.properties
    ```

12. 查看消费者组详细信息

    ```shell
    bin/kafka-consumer-groups.sh --bootstrap-server localhost:9092 --describe --all-groups
    ```