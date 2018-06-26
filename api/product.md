---
sidebar: auto
---

# Product

## 获取美食信息

### GET /api/product/:id

获取某个美食信息

#### Parameters
| Name          | Description           |
| ------------- | --------------------- |
| id            | 美食标识               |

#### Responses

接口
```typescript
interface IProduct {
    id: string;
    name: string;
    price: number;
    category: string;
    description: string;
    imageUrl: string;
    salesPerMonth: number;
    rate: number;
    likes: number;
    remain: number;
}
```

返回值
```json
{
    "id": "1",
    "name": "原味牛杂面",
    "price": 17,
    "category": "粉面",
    "description": "粉面自由选择，备注即可！",
    "imageUrl": "https://fuss10.elemecdn.com/3/a3/aed6124612ad38457e8e369d7e54bjpeg.jpeg",
    "salesPerMonth": 770,
    "rate": 4.5,
    "likes": 8,
    "remain": 50
}
```

### GET /api/products

获取所有美食信息列表

#### Responses

返回值
```json
[
    {
        "id": "1",
        "name": "原味牛杂面",
        "price": 17,
        "category": "粉面",
        "description": "粉面自由选择，备注即可！",
        "imageUrl": "https://fuss10.elemecdn.com/3/a3/aed6124612ad38457e8e369d7e54bjpeg.jpeg",
        "salesPerMonth": 770,
        "rate": 4.5,
        "likes": 8,
        "remain": 50
    },
    {
        "id": "2",
        "name": "素粉面",
        "price": 15,
        "category": "粉面",
        "description": "粉面自由选择，备注即可！",
        "imageUrl": "https://fuss10.elemecdn.com/3/a3/aed6124612ad38457e8e369d7e54bjpeg.jpeg",
        "salesPerMonth": 430,
        "rate": 4.3,
        "likes": 83,
        "remain": 56
    }
]
```


