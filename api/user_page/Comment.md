---
sidebar: auto
---

# Comment

## 评论有关的API 

### GET /api/comments

获取所有评论信息

#### Responses

接口

单条评论

```typescript
interface Icomment {
    food_id: string; //标识种类
    food_name:string; //便于显示（不用再次发请求确定name）
    rating：number;
    content:string;
    //likes: number; //评论点赞数
    comment_time: string; //评论时间
}
```

评论列表

```typescript
interface ICommentList{
    comments: Icomment[];
}
```



为评论点赞通过前端向后端Post一个`Icomment`对象实现。



返回值

```json
{
    [{
        "food_id": "1",
        "food_name": "原味牛杂面",
        "rating": 4,
        "content" :"怎么只有这一个菜啊",
        "likes": 0,
        //时间格式：yyyy-MM-dd hh:mm:ss
        "comment_time":"2018-06-20 12:00:00"
    },
    {
         "food_id": "2",
         "food_name": "素粉面",
         "rating": 3,
         "content" :"随便写写",
         "likes": 2,
         //时间格式：yyyy-MM-dd hh:mm:ss
         "comment_time":"2018-06-23 12:10:00"
    }]
}
```













