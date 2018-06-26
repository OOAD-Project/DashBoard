---
sidebar: auto
---

# Payment

## 获取支付信息

### GET /api/payment_detail

获取当前餐桌的订单支付信息(session)

#### Responses

接口

```typescript
interface Ipayment {
    id: string; //支付编号（后端最好随机生成64位码， 之后可以作为凭据一类的东西）
    payment_time: string; //支付时间
    //reserve_state: string; 
    //本来需要订单状态，但是考虑到reservation里面包含了就不再加了
    payment_way: string; //支付方式
    payment_amount: number; //支付金额
    reservation: Ireservation; //支付的订单
}

//Ireservation结构同reservation.md 中的api设计
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
{
	"id": "2",
    //时间格式：yyyy-MM-dd hh:mm:ss
    "payment_time": "2018-06-20 12:03:11", 
    "payment_way": "在线支付",
    "payment_amount": 47.0,
    //下面这个reservation的例子和订单api中的例子一样
    reservation: 
    {
        "reservation_id": "3",
        "foods": [{
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
        ],
        //时间格式：yyyy-MM-dd hh:mm:ss
        "reserve_time": "2018-06-20 12:00:00",
        "reserve_state": "商家已接单" //这里可以做一个简单的检查， 如果state是"未支付"应该是出错了
    }
}

```