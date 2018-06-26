---
sidebar: auto
---

# Reservation

## 获取订单信息

### GET /api/reservation?table_id

获取当前餐桌的订单信息(不确定是否用post更合适，或者直接用session不用table_id？)

#### Responses

接口

```typescript
interface Ireservation {
    id: string; //订单编号
    foods: Ifood[];
    reserve_time: string; //下单时间
    reserve_state: string; //订单状态
    //tbc.
}

//在IProduct的基础上加了一个counts字段， 记录单项数目
interface Ifood {
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
    counts: number;//订单中单项的数量
}
```

返回值

```json
[{
    "id": "1",
    "name": "原味牛杂面",
    "price": 17,
    "category": "粉面",
    "description": "粉面自由选择，备注即可！",
    "imageUrl": "https://fuss10.elemecdn.com/3/a3/aed6124612ad38457e8e369d7e54bjpeg.jpeg",
    "salesPerMonth": 770,
    "rate": 4.5,
    "likes": 8,
    "remain": 50,
    "count": 1
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
        "remain": 56,
        "count": 2
    }
]
```