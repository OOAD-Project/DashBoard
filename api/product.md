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
    description: string;
    imageUrl: string;
    salesPerMonth: number;
    rate: number;
    likes: number;
}
```

返回值
```json
{
    "id": "1",
    "name": "原味牛杂面",
    "price": 17,
    "description": "粉面自由选择，备注即可！",
    "imageUrl": "https://fuss10.elemecdn.com/3/a3/aed6124612ad38457e8e369d7e54bjpeg.jpeg",
    "salesPerMonth": 770,
    "rate": 4.5,
    "likes": 8
}
```

### GET /api/products

获取所有美食信息列表

#### Responses

接口
```typescript
interface ICategory {
  id: string;
  category: string;
  description?: string;
  goods: IProduct[];
}
```


返回值
```json
[{
    "id": "niuza",
    "category": "牛杂汤粉面",
    "description": "各种精选牛杂粉面，正宗广式和味道",
    "goods": [
        {
            "id": "1",
            "name": "原味牛杂面",
            "price": 17,
            "description": "粉面自由选择，备注即可！",
            "imageUrl": "https://fuss10.elemecdn.com/3/a3/aed6124612ad38457e8e369d7e54bjpeg.jpeg",
            "salesPerMonth": 770,
            "rate": 4.5,
            "likes": 8
        },
        {
            "id": "2",
            "name": "素粉面",
            "price": 15,
            "description": "粉面自由选择，备注即可！",
            "imageUrl": "https://fuss10.elemecdn.com/3/a3/aed6124612ad38457e8e369d7e54bjpeg.jpeg",
            "salesPerMonth": 430,
            "rate": 4.3,
            "likes": 83
        }
    ]
}]
```


