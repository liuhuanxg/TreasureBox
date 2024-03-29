---
title: 笔记 (copy)
---

## 分词器

### 1	normalization：文档规范化,提高召回率

### 2	字符过滤器（character filter）：分词之前的预处理，过滤无用字符

- [HTML Strip Character Filter](https://www.elastic.co/guide/en/elasticsearch/reference/current/analysis-htmlstrip-charfilter.html)：html_strip
  - 参数：escaped_tags  需要保留的html标签
- [Mapping Character Filter](https://www.elastic.co/guide/en/elasticsearch/reference/current/analysis-mapping-charfilter.html)：type mapping
- [Pattern Replace Character Filter](https://www.elastic.co/guide/en/elasticsearch/reference/current/analysis-pattern-replace-charfilter.html)：type pattern_replace

### 3	令牌过滤器（token filter）：停用词、时态转换、大小写转换、同义词转换、语气词处理等。比如：has=>have  him=>he  apples=>apple  the/oh/a=>干掉

### 4	分词器（tokenizer）：切词

### 5	常见分词器：

- standard analyzer：默认分词器，中文支持的不理想，会逐字拆分。
- pattern tokenizer：以正则匹配分隔符，把文本拆分成若干词项。
- simple pattern tokenizer：以正则匹配词项，速度比pattern tokenizer快。
- whitespace analyzer：以空白符分隔	Tim_cookie

### 6	自定义分词器：custom analyzer

- char_filter：内置或自定义字符过滤器 。
- token filter：内置或自定义token filter 。
- tokenizer：内置或自定义切词器。

### 7	中文分词器：ik分词

1. #### 安装和部署

   - ik下载地址：https://github.com/medcl/elasticsearch-analysis-ik
   - Github加速器：https://github.com/fhefh2015/Fast-GitHub
   - 创建插件文件夹 cd your-es-root/plugins/ && mkdir ik
   - 将插件解压缩到文件夹 your-es-root/plugins/ik
   - 重新启动es

2. ####  IK文件描述

   - IKAnalyzer.cfg.xml：IK分词配置文件
- 主词库：main.dic
   - 英文停用词：stopword.dic，不会建立在倒排索引中
   - 特殊词库：
     - quantifier.dic：特殊词库：计量单位等
     - suffix.dic：特殊词库：行政单位
     - surname.dic：特殊词库：百家姓
     - preposition：特殊词库：语气词
   - 自定义词库：网络词汇、流行词、自造词等
   
3. #### ik提供的两种analyzer:

   1.  ik_max_word会将文本做最细粒度的拆分，比如会将“中华人民共和国国歌”拆分为“中华人民共和国,中华人民,中华,华人,人民共和国,人民,人,民,共和国,共和,和,国国,国歌”，会穷尽各种可能的组合，适合 Term Query；
   2. ik_smart: 会做最粗粒度的拆分，比如会将“中华人民共和国国歌”拆分为“中华人民共和国,国歌”，适合 Phrase 查询。

4. #### 热更新

   1. 远程词库文件
      1. 优点：上手简单
      2. 缺点：
         1. 词库的管理不方便，要操作直接操作磁盘文件，检索页很麻烦
         2. 文件的读写没有专门的优化性能不好
         3. 多一层接口调用和网络传输
   2. ik访问数据库
      1. MySQL驱动版本兼容性
         1. https://dev.mysql.com/doc/connector-j/8.0/en/connector-j-versions.html
         2. https://dev.mysql.com/doc/connector-j/5.1/en/connector-j-versions.html
      2. 驱动下载地址
         1. https://mvnrepository.com/artifact/mysql/mysql-connector-java

