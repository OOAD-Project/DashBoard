---
sidebar: auto
---

# Order

## 获取订单信息

### GET /api/order/:id

获取某个订单信息

#### Parameters
| Name          | Description           |
| ------------- | --------------------- |
| id            | 订单标识               |

#### Responses

接口
```typescript
interface IOrder {
    id: string;
    create_time: string;
    pay_time: string;
    table: string; // 桌号
    list: IOrderItem[];
    total: number; // 合计消费价格
    isPaid: boolean; // 是否已支付
}

interface IOrderItem {
    id: string;
    name: string;
    count: number;
    price: number;
}
```

返回值
```json
{
    "id": "1080",
    "create_time": "2018-06-08 04:58:51",
    "pay_time": "2018-06-09 04:58:51",
    "table": "8",
    "list": [
        {
            "id": "1",
            "name": "牛杂汤粉面",
            "count": 2,
            "price": 17
        }
    ],
    "total": 34,
    "isPaid": true
}
```

## 创建订单

### POST /api/order

创建一个未支付的订单，通常由客户端发起

#### Body
| Name          | Type                        | Description           |
| ------------- | ----------------            | --------------------- |
| table         | string                      | 桌号信息               |
| list          | Array< IOrderBodyListItem > | 点餐列表               |

接口
```typescript
interface IOrderBodyListItem {
    id: string;
    count: number;
}
```

#### Responses

返回一个对应创建好的订单信息

返回值
```json
{
    "id": "1090",
    "create_time": "2018-06-08 04:58:51",
    "pay_time": "None",
    "table": "8",
    "list": [
        {
            "id": "1",
            "name": "牛杂汤粉面",
            "count": 2,
            "price": 17
        }
    ],
    "total": 34,
    "isPaid": false
}
```