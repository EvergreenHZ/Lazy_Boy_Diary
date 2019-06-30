TOC
====

1. [Introduction](#introduction)

2. [Details](#details)

2.1 [Register](#register)

2.2 [Login](#login)

2.3 [AddFriend](#add-friend)

2.4 [PersonalChat](#personal-chat)

2.5 [FileTransfer](#file-transfer)

2.6 [GroupChat](#group-chat)


# Introduction <a name="introduction"></a>
This is the first Draft of dh_caht Protocal and we use json to communicate between client and server.


# Details <a name="details"></a>
We have to make sure that the json data format will never be empty, which means the "cmd" field always exists.

## Register <a name="register"></a>
```javascript
{
        "cmd" : "REGISTER_GRP4",
        "account" : "...",
        "username" : "...",
        "passwd" : "..."
}
```
or

```javascript
{
        "cmd" : "REGISTER_GRP1",
        "username" : "...",
        "passwd" : "..."
}
```

## Login <a name="login"></a>
```javascript
{
        "cmd" : "LOGIN",
        "account" : "...",
        "passwd" : "..."
}
```

## AddFriend <a name="add-friend"></a>
```javascript
{
        "cmd" : "ADDFRIEND",
        "peer_account" : "..." ,
}
```

## PersonalChat <a name="personal-chat"></a>
```javascript
{
        "cmd" : "PERSONALCHAT",
        "peer_account" : "...",
        "message" : "...",
}
```

## FileTransfer <a name="file-transfer"></a>
```javascript
{
        "cmd" : "FILETRANSFER",
        "filename" : "...",
        "content" : "..." ,
}
```

## GroupChat <a name="group-chat"></a>
```javascript
{
        "cmd" : "GROUPCHAT",
        "group_id": "...",
        "message" : "...",
}
```

P.S. 

*All* the data types are _strings_.
