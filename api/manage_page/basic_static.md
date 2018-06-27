---
sidebar: auto
---

# 基础统计信息

## 获取概要信息

### GET /api/basic_static

**Responses**

接口

```typescript
interface Ishop_static{
    total_turnover: number;  //总销售额
    total_reservation: number; //总订单数
    total_payment: number; //总完成订单数
    reservation_payment_ratio: number; // 支付数/订单数
    
}
```

返回值

```typescript
{
    "total_turnover": 2000,
    "total_reservation": 300,
    "total_payment": 180,
    "reservation_payment_ratio":0.6
}
```



