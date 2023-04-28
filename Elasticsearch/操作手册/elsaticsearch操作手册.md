---
title: elsaticsearch操作手册
---

# ES操作手册

1. ### 集群

   1. ##### 集群异常情况`GET _cluster/allocation/explain`

      1. 可选参数：

         1. **include_disk_info**：bool，可选，如果为true，返回有关磁盘使用情况和分片大小的情况，默认为false。
         2. **include_yes_decisions**：可选，布尔值）如果`true`，则在解释中返回*YES*决定

         ```python
         # 查看集群状态异常
         GET _cluster/allocation/explain
         ```

   2. ##### 集群配置`GET /_cluster/settings`

      1. 查询参数
         1. **`flat_settings`**:（可选，布尔值）如果`true`，则以平面格式返回设置。默认为 `false`.
         2. **`include_defaults`**:（可选，布尔值）如果`true`，返回所有默认集群设置。默认为`false`.
         3. **`master_timeout`**:（可选，[时间单位](https://www.elastic.co/guide/en/elasticsearch/reference/current/api-conventions.html#time-units)）等待连接到主节点的时间。如果在超时到期之前未收到响应，则请求失败并返回错误。默认为 `30s`.
         4. **`timeout`**:（可选，[时间单位](https://www.elastic.co/guide/en/elasticsearch/reference/current/api-conventions.html#time-units)）等待响应的时间。如果在超时到期之前未收到响应，则请求失败并返回错误。默认为`30s`.

   3. ##### 集群健康度：`GET /_cluster/health/<target>`

   4. ##### 集群state：`GET _cluster/state`

   5. ##### 集群stats：

      1. `GET _cluster/stats`
      2. `GET /_cluster/stats/nodes/<node_filter>`

   6. ##### 更新集群配置

      1. `PUT _cluster/settings`，persistent表示永久更新，transient表示临时更新

      2. 修改集群恢复时每秒的大小

         ```
         PUT /_cluster/settings
         {
           "persistent" : {
             "indices.recovery.max_bytes_per_sec" : "50mb"
           }
         }
         ```

      3. 修改集群允许通配符删除

         ```python
         # 修改集群配置，允许使用通配符删除
         PUT _cluster/settings
         {
           "persistent":{
             "action.destructive_requires_name":false
           },
           "transient":{
             "action.destructive_requires_name":false
           }
         }
         ```

   7. ##### 节点功能查询，获取集群中每个节点的作用

      1. `GET /_nodes/usage`
      2. `GET /_nodes/<node_id>/usage`
      3. `GET /_nodes/usage/<metric>`
      4. `GET /_nodes/<node_id>/usage/<metric>`
      5. 

   8. ##### 节点热线程：获取每个选定节点上的热线程情况

      1. `GET /_nodes/hot_threads`
      2. `GET /_nodes/<node_id>/hot_threads`
      3. 查询参数：
         1. **ignore_idle_threads**：可选，布尔值，如果为真，则过滤掉已知空闲县城
         2. **`interval`**：（可选，[时间单位](https://www.elastic.co/guide/en/elasticsearch/reference/current/api-conventions.html#time-units)）对线程进行第二次采样的时间间隔。默认为`500ms`.
         3. **`snapshots`**：（可选，整数）线程堆栈跟踪的样本数。默认为 `10`.
         4. **`threads`**：（可选，整数）指定要为其提供信息的热线程数。默认为`3`.
         5. **`master_timeout`**：（可选，[时间单位](https://www.elastic.co/guide/en/elasticsearch/reference/current/api-conventions.html#time-units)）等待连接到主节点的时间。如果在超时到期之前未收到响应，则请求失败并返回错误。默认为 `30s`.
         6. **`timeout`**：（可选，[时间单位](https://www.elastic.co/guide/en/elasticsearch/reference/current/api-conventions.html#time-units)）等待响应的时间。如果在超时到期之前未收到响应，则请求失败并返回错误。默认为`30s`.**`type`**（可选，字符串）要采样的类型。可用选项有`block`、`cpu`和 `wait`。默认为`cpu`.

      ```python
      # 示例
      GET  /_nodes/hot_threads 
      GET /_nodes/nodeId1,nodeId2/hot_threads
      GET /_nodes/hot_threads 
      ```

   9. ##### 查询节点信息：检索一个或集群全部节点信息。

      1. `GET /_nodes`
      2. `GET /_nodes/<node_id>`
      3. `GET /_nodes/<metric>`
      4. `GET /_nodes/<node_id>/<metric>`
      5. metric可选的参数
         1. **`aggregations`**：有关可用聚合类型的信息。
         2. **`http`**：有关此节点的 HTTP 接口的信息。
         3. **`indices`**：与索引相关的节点级配置：
            - `total_indexing_buffer`: 此节点上索引缓冲区的最大大小。
         4. **`ingest`**：有关摄取管道和处理器的信息。
         5. **`jvm`**：JVM 信息，包括其名称、版本和配置。
         6. **`os`**：操作系统信息，包括其名称和版本。
         7. **`plugins`**：有关每个节点安装的插件和模块的详细信息。以下信息适用于每个插件和模块：
            - `name`: 插件名称
            - `version`: 构建插件的 Elasticsearch 版本
            - `description`: 插件用途的简短描述
            - `classname`: 插件入口点的完全限定类名
            - `has_native_controller`: 插件是否有一个本地控制器进程
         8. **`process`**：进程信息，包括数字进程 ID。
         9. **`settings`**：列出文件中定义的所有正在使用的节点设置`elasticsearch.yml`。
         10. **`thread_pool`**：有关每个线程池的配置信息。
         11. **`transport`**：有关节点传输接口的信息。

   10. ##### 验证节点是否可以删除`POST /_internal/prevalidate_node_removal`

      1. 此 API 检查尝试从集群中删除指定节点是否可能成功。对于没有未分配分片的集群，删除任何节点都被认为是安全的，这意味着删除节点很可能会成功。如果集群的[`red`集群健康状况](https://www.elastic.co/guide/en/elasticsearch/reference/current/cluster-health.html)为 ，它会验证节点的移除不会冒移除未分配分片的最后剩余副本的风险。

         响应包括删除指定节点的整体安全性，以及每个节点的详细响应。响应的特定于节点的部分还包括有关为什么删除该节点可能不成功的更多详细信息。

   11. ##### 节点重新加载安全设置

   12. ##### 节点统计

   13. ##### 挂起的集群任务

   14. ##### 远程集群信息

   15. ##### 任务管理

   16. ##### 投票配置排除

   17. ##### 创建或更新所需的节点

   18. ##### 获取所需的节点

   19. ##### 删除节点

   20. ##### 获取剩余的节点

2. ### 分片

   1. ##### 查看索引分片:`GET _cat/shards?v`

3. ### 索引

   1. ##### 查看所有索引

      ```json
      # 查看索引按照大小排序
      GET _cat/indices?s=store.size:desc&v
      
      #创建索引
      curl -XPUT "http://127.0.0.1:9200/test1/" -d
      '{
        "settings":{
          "number_of_shards" : "1",
          "number_of_replicas" : "1"
        }
      }' -H"content-type:application/json"
      
      #删除索引
      DELETE test
      
      # 批量删除索引
      DELETE test_*
      
      ```

   2. ##### 创建索引指定mapping

      ```json
      curl -XPUT "127.0.0.1:9200/test1" -H"content-type:application/json" -d'{"mappings":{"properties":{"field1":{"type":"keyword","copy_to":"field_all"},"field2":{"type":"text"},"field_all":{"type":"text"}}}}'
      ```

   3. ##### 查看索引mapping

      ```json
      $ curl -XGET '127.0.0.1:9200/test/_mapping?pretty'
      # ignore_above 表示最长存储的长度，超过时会被丢弃
      {
        "test" : {
          "mappings" : {
            "properties" : {
              "desc" : {
                "type" : "text",
                "fields" : {
                  "keyword" : {
                    "type" : "keyword",
                    "ignore_above" : 256
                  }
                }
              },
              "name" : {
                "type" : "text",
                "fields" : {
                  "keyword" : {
                    "type" : "keyword",
                    "ignore_above" : 256
                  }
                }
              },
              "price" : {
                "type" : "long"
              },
              "tags" : {
                "type" : "text",
                "fields" : {
                  "keyword" : {
                    "type" : "keyword",
                    "ignore_above" : 256
                  }
                }
              }
            }
          }
        }
      }
      ```

4. ### 文档操作

   1. ##### 插入数据

      ```json
      curl -XPOST "http://127.0.0.1:9200/test/_doc" -d'{
              "name": "iphone11",
              "desc": "256G",
              "price": 20,
               "tags":["shouji", "fangshui", "nfc"]
      }' -H"content-type:application/json"
      ```

   2. ##### 修改数据

      ```json
      curl -XPOST "http://127.0.0.1:9200/test/_update/1" -d'{"doc":{"name": "iphone14"}}' -H"content-type:application/json"
      ```

      

