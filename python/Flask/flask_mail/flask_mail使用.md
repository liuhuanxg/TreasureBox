---
title: flask_mail使用
---

## flask-mail

1、安装

`pip install flask-mail`

2、配置项

| 配置          | 默认值    | 说明                                            |
| ------------- | --------- | ----------------------------------------------- |
| MAIL_SERVER   | localhost | 电子邮件服务器的主机名或IP地址                  |
| MAIL_PORT     | 25        | 电子邮件服务器的端口                            |
| MAIL_USE_TLS  | False     | 启用传输层安全(TransportLayer Security,TLS)协议 |
| MAIL_USE_SSL  | False     | 启用安全套接层(Secure SocketsLayer,SSL)协议     |
| MAIL_USERNAME | None      | 邮件账户的用户名                                |
| MAIL_PASSWORD | None      | 邮件账户的密码                                  |

