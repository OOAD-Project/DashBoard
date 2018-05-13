# RESTful API 设计

## 目录

- [Product(用餐)](./product.md)
- [Order(订单)](./order.md)

## 注意事项和约定

API所有的返回值皆为`json`格式的数据，在接口的表示中，使用`TypeScript`的接口表示。

例如，美食列表接口：
```typescript
interface ICategory {
  id: string;
  category: string;
  description?: string;
  goods: IProduct[];
}
```

`interface`为接口关键字，接口名称通常约定为由字母`I`开头。

其中`description?: string`代表`description`是一个字符串，而且由符号`?`可知，该字段是**可选的**，
即`description`的类型是`undefined`、`null`、`string`三者其一。

`goods: IProduct[]`代表`goods`字段是一个元素类型为`IProduct`的数组，也可以写成`goods: Array<IProduct>`