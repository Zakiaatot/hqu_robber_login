# HQU_ROBBER_LOGIN

## 华侨大学场馆自动预约APP--登录模块

## example

POST:

```json
{
    "stunum":"212510XXXX",
    "password":"XXXXX"
}
```

RETURN:

```json
{
    "code": 200,
    "data": {
        "JSESSIONID":"xxxxxx"
    },
    "msg": "Ok"
}
```

or

```json
{
    "code": 500,
    "data": "模拟登录错误: 您提供的用户名或者密码有误",
    "msg": "Error"
}
```

`有了ecard的cookie：JSESSIONID 即可进行场馆预约相关操作`
