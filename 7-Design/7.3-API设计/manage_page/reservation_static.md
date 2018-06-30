# Reservation static

## 获取订单统计信息

### 订单数月统计量

### get /api/reservation_count_by_month

```typescript
interface IReservation_month_static {
    static_permonth: Imonth_static[]; //实际后台实现是固定长度为12, 表示最近一年的统计
}
interface IRes_month_static {
    month_date: string;
    quantity: number;
}
```

返回值举例：(注意时间格式)

```typescript
[
  {
    "x": "2018-01",
    "y": 10
  },
  {
    "x": "2018-02",
    "y": 12
  },
  {
    "x": "2018-03",
    "y": 8
  },
  {
    "x": "2018-04",
    "y": 6
  },
  {
    "x": "2018-05",
    "y": 10
  },
  {
    "x": "2018-06",
    "y": 15
  }
]
```



### 订单数日统计量

### get /api/reservation_count_by_day

```typescript
interface IReservation_day_static {
    static_perday: Ires_day_static[]; //实际后台实现是固定长度为30, 表示接近最近一个月的统计
}
interface IRes_day_static {
    day_date: string;
    quantity: number;
}
```



返回值举例：

```typescript
[
    {
        "x": "2018-05-29",
        "y": 1
    },
    {
        "x": "2018-05-31",
        "y": 2
    },
    {
        "x": "2018-06-02",
        "y": 2
    },
    {
        "x": "2018-06-04",
        "y": 1
    },
    {
        "x": "2018-06-06",
        "y": 4
    },
    {
        "x": "2018-06-08",
        "y": 3
    },
    {
        "x": "2018-06-10",
        "y": 6
    },
    {
        "x": "2018-06-12",
        "y": 5
    },
    {
        "x": "2018-06-14",
        "y": 4
    },
    {
        "x": "2018-06-16",
        "y": 4
    },
    {
        "x": "2018-06-18",
        "y": 2
    },
    {
        "x": "2018-06-20",
        "y": 2
    },
    {
        "x": "2018-06-22",
        "y": 1
    },
    {
        "x": "2018-06-24",
        "y": 3
    },
    {
        "x": "2018-06-26",
        "y": 2
    },
    {
        "x": "2018-06-27",
        "y": 1
    },
    {
        "x": "2018-06-25",
        "y": 0
    },
    {
        "x": "2018-06-23",
        "y": 0
    },
    {
        "x": "2018-06-21",
        "y": 0
    },
    {
        "x": "2018-06-19",
        "y": 0
    },
    {
        "x": "2018-06-17",
        "y": 1
    },
    {
        "x": "2018-06-15",
        "y": 2
    },
    {
        "x": "2018-06-13",
        "y": 4
    },
    {
        "x": "2018-06-11",
        "y": 4
    },
    {
        "x": "2018-06-09",
        "y": 4
    },
    {
        "x": "2018-06-07",
        "y": 3
    },
    {
        "x": "2018-06-05",
        "y": 3
    },
    {
        "x": "2018-06-03",
        "y": 2
    },
    {
        "x": "2018-06-01",
        "y": 1
    },
    {
        "x": "2018-05-30",
        "y": 1
    }
]
```



### 订单数周统计量

### get /api/reservation_count_by_week

```typescript
interface IReservation_week_static {
    static_perweek: Ires_week_static[]; //实际后台实现是固定长度为10, 表示最近10周的统计
}
interface IRes_week_static {
    week_date: string;
    quantity: number;
}
```

返回值举例：(注意时间数据格式！)

```typescript
[
    {
        "x": "2018-04-18~2018-04-25",
        "y": 22
    },
    {
        "x": "2018-05-02~2018-05-09",
        "y": 12
    },
    {
        "x": "2018-05-16~2018-05-23",
        "y": 32
    },
    {
        "x": "2018-05-30~2018-06-06",
        "y": 34
    },
    {
        "x": "2018-06-13~2018-06-20",
        "y": 22
    },
    {
        "x": "2018-06-20~2018-06-27",
        "y": 29
    },
    {
        "x": "2018-06-06~2018-06-13",
        "y": 18
    },
    {
        "x": "2018-05-23~2018-05-30",
        "y": 41
    },
    {
        "x": "2018-05-09~2018-05-16",
        "y": 9
    },
    {
        "x": "2018-04-25~2018-05-02",
        "y": 16
    }
]
```



### 订单数

### get /api/reservation_quantity_pie_data

```typescript
/*按订单中包含的菜品   类别    的(成交)订单数统计占比*/
/*Ex: 订单中有菜品1,2,3分别属于kind1,2,3，那么这个订单统计时kind1,2,3均需+1*/
/**/
interface IReservation_kind_static {
    static_perweek: Ires_kind_static[]; //每个kind 一个种类
}
interface IRes_week_static {
    x: string;//kind 名称
    y: number; //具体数量
}
```







```typescript

[
  {
    "x": "kind1",
    "y": 20
  },
  {
    "x": "kind2",
    "y": 15
  },
  {
    "x": "kind3",
    "y": 40
  },
  {
    "x": "kind4",
    "y": 30
  },
  {
    "x": "kind5",
    "y": 20
  },
  {
    "x": "kind6",
    "y": 25
  }
]
```





