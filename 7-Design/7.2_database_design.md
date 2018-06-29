# 系分大作业数据库相关

标签： 系认同分析与设计


----------

 - 7.2 database design
  - 7.2.1 用户及权限系统数据库设计
  - 7.2.2 点餐系统数据库设计


----------
## 7.2.1 用户及权限系统数据库设计 ##
创建应用账户ooad，密码ooad
```mysql
create user 'ooad'@'localhost' identified by 'ooad';
```

创建应用数据库restaurant
```mysql
create database restaurant;
```

为应用账号ooad设置对数据库restaurant的所有权限
```mysql
grant all on restaurant.* to 'ooad'@'localhost';
```


----------
## 7.2.2 点餐系统数据库设计 ##
参考的数据库建表图表
![image_1cdcvj1al1qv5hrr16dv1919c2o1m.png-32.1kB][1]


----------
## 数据库表 ##

> 数据库初始化使用ORM sqlalchemy，一共4个表

 - tag标签
 - food菜
 - comment评论
 - reservation订单

创建一个名为model的包来创建数据结构和初始化数据库，包结构为

 - model
  - \__init__.py
  - base.py
  - tag.py
  - food.py
  - comment.py
  - reservation.py
  - db_setting.py
  - init_db.py

model包测试文件test_model.py
```python
from model import init_db
if __name__ == "__main__":
	init_db.init_database()
```

数据库初始化成功
![image_1cdcuqh4iku11qts4201f2q1lch19.png-67.8kB][2]
----------


tag标签
```python
class Tag(base.Base):
    __tablename__ = "Tag"
    id = Column(Integer, primary_key = True)
    description = Column(String(50))
    picture = Column(String(50))
```

food菜
```python
class Food(base.Base):
    __tablename__ = "Food"
    id = Column(Integer, primary_key = True)
    name = Column(String(50), unique = True, nullable = False)
    picture = Column(String(50))
    price = Column(Integer, nullable = False)
    description = Column(String(50))
    rating = Column(Integer)
    amount = Column(Integer, nullable = False)
    tag_id = Column(Integer, ForeignKey('Tag.id'), nullable = False)
```

comment评论
```python
class Comment(base.Base):
    __tablename__ = "Comment"
    comment_id = Column(Integer, primary_key = True)
    content = Column(String(50), nullable = False)
    food_id = Column(Integer, ForeignKey('Food.id'))
```

reservation订单
```python
class Reservation(base.Base):
    __tablename__ = "Reservation"
    reserve_id = Column(Integer, primary_key = True)
    reserve_datetime = Column(DateTime, default = datetime.datetime.now())
    pay_datetime = Column(DateTime, default = datetime.datetime.now())
    table_num = Column(Integer, nullable = False)
    food_list = Column(JSON)
```


  [1]: http://static.zybuluo.com/gzm1997/jkxxl2pljvr1axm3ztu94de9/image_1cdcvj1al1qv5hrr16dv1919c2o1m.png
  [2]: http://static.zybuluo.com/gzm1997/q3zwvfp5w9ybxknx7773hm49/image_1cdcuqh4iku11qts4201f2q1lch19.png