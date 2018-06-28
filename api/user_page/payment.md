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
    reservation_id: string; //支付的订单编号
}

```

返回值

```json
{
	"id": "xxxxxxxxxx",//64位
    //时间格式：yyyy-MM-dd hh:mm:ss
    "payment_time": "2018-06-20 12:03:11", 
    "payment_way": "在线支付",
    "payment_amount": 47.0,
    "reservation_id": "1"

}

```
### GET /api/payments

获取所有支付订单

```typescript
interface Iallpayment {
    payments: Ipayment[];
}
```

返回值

```typescript
[
    {
	"id": "xxxxxxxxxx",//64位
    "payment_time": "2018-06-24 12:03:11", 
    "payment_way": "在线支付",
    "payment_amount": 47.0,
    "reservation_id": "1“
	},
	{
	"id": "xxxxxxxxxx",//64位
    "payment_time": "2018-06-25 10:40:33", 
    "payment_way": "在线支付",
    "payment_amount": 47.0,
    "reservation_id": "2"
	}
]
```





