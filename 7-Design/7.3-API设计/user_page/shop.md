---
sidebar: auto
---

# Shop

## 获取商家基本信息

### GET /api/shop

获取当前商家元数据信息

#### Responses

接口
```typescript
interface IShop {
    name: string;
    logoUrl: string;
    description: string;
    fields: IField[]; // 其他自定义字段
}

interface IField {
    key: string;
    value: string;
}
```

返回值
```json
{
    "name": "超级牛杂铺",
    "logoUrl": "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1530632075&di=5cf8e2599e91d5fc3b7ba9d77669f147&imgtype=jpg&er=1&src=http%3A%2F%2Fimg3.redocn.com%2Ftupian%2F20141024%2Fshiguoqugufengzhuameishi_3304597_small.jpg",
    "description": "本店有精选牛杂汤粉面，各种牛杂小吃和丸子，选择多多，惊喜多多！注：本店牛杂分两种：招牌牛杂（牛肠、牛肺），精品牛杂（牛肚、牛腩、牛筋），特别提醒萝卜干口味是特辣。",
    fields: [
        { "key": "联系电话", "value": "13588888888" },
        { "key": "联系邮箱", "value": "hezhiyu233@foxmail.com" }
    ]
}
```
