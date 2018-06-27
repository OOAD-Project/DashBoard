# RESTful API 设计

## 目录

- [Shop(商家)](./user_page/shop.md)
- [Product(用餐)](./user_page/product.md)
- [Order(订单)](./user_page/order.md)
- [Comment(评论)](./user_page/comment.md)
- [Payment(支付)](./user_page/payment.md)

## 注意事项和约定

API所有的返回值皆为`json`格式的数据，在接口的表示中，使用`TypeScript`的接口表示。

例如，美食列表接口：
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

`interface`为接口关键字，接口名称通常约定为由字母`I`开头。
