# By 15331050

### 自我总结

需求分析和设计是整个软件开发过程的基石，文档的清晰和完备是降低沟通成本的最有效方法，合理的文档结构和成员分工是项目进度的保证。

特别鸣谢：前端大佬、后端伙伴以及我们的架构工程师、产品经理和项目经理。

### PSP 2.1 统计表

|         PSP 2.1          |               How to do                | Time(hours) |
| :----------------------: | :------------------------------------: | :---------: |
|         Planning         |                  计划                  |      4      |
|         Estimate         |         估计自己的任务所需时间         |      4      |
|       Development        |                  开发                  |    47.5     |
|         Analysis         |                分析需求                |     15      |
|       Design Spec        |              生成设计文档              |     12      |
|      Design Review       |     设计复审（和同事审核设计文档）     |      4      |
|     Coding Standard      | 代码规范（为目前的开发制定合适的规范） |     0.5     |
|          Design          |                具体设计                |      0      |
|          Coding          |                具体编码                |      4      |
|       Code Review        |                代码复审                |      2      |
|           Test           |  测试（包括自测，修改代码，提交修改）  |      2      |
|       Test Report        |                测试报告                |      0      |
|          Report          |                  报告                  |      4      |
|     Size Measurement     |               计算工作量               |      0      |
|        Postmortem        |                事后总结                |      2      |
| Process Improvement Plan |            提出过程改进计划            |      2      |
|           Sum            |                  合计                  |    55.5     |

### 个人 GIT 统计报告

### 苦劳工作清单

|         最有价值的工作         |              简短说明                   |
| :--------------------------: | :------------------------------------:|
| 编写了项目的详细用例            | 主成功场景以及各种扩展场景的编写            |
| 各种用例图、领域模型状态模型的绘制 | 使用UMLet工具把具体需求和业务流程可视化  |
| 完成了用户评论API的代码编写      | 使用restful方式接收和返回用户对菜品的评论   |

### 个人博客清单

[UMLet 使用说明之绘制用例图](https://blog.csdn.net/jack_cjz/article/details/79934805)



--------------



# By 15331092

## 课程学习自我总结

在系统分析设计这门课上， 我学到的最多的部分应该是各种UML图的设计与绘制。我觉得一个好的设计必然也能美观的体现在一个UML图上。

在这个大作业中我主要负责的也是设计部分， 所以就主要总结一下设计的一些心得。



#### 项目设计需要包含的部分

1. 数据库表的设计。这个设计主要依赖的是数据库的领域模型。领域模型是在项目初期建立的。所以在具体写代码的时候，会常常发现之前建立的领域模型并不合适。然后需要修改，花费的时间，人力成本都挺大的，但是一开始又的确想不出完整的方案。

2. 前后端交互数据设计（API设计）

   这部分是我这次项目中主要完成的部分。但是这之中也遇到了一个问题： 究竟应该是前端来定义交互的数据结构还是后端？ 这次的的方案中我们采用的是前后端都各自定义自己使用较为频繁的数据。

#### 项目设计需要注意的一些点

1. 不要怕开始的设计有问题。因为基本上一定会有问题。。。需要做的就是和开发者（前端和后端）保持沟通， 然后修改自己的数据库表项&API。
2. API设计必须先于前后端的开发设计。这次项目中我犯得一个比较大的错误就是API设计完成的比较晚， 导致前后端似乎分别采用了一套API—— 这样在对接的时候十分麻烦， 必然有一边需要改。

#### 一些体会

- 设计没有想象的那么轻松，甚至比编码累。因为设计的时候必须想清楚整个过程需要哪些量，数据类型应该定义为什么比较合适。
- 设计的时候最好先画图，即课上所学过的UML图。 这样可以使设计的时候思路保持清晰而不至于太混乱。

------

## 

|         PSP 2.1          |               How to do                | Time(hours) |
| :----------------------: | :------------------------------------: | :---------: |
|         Planning         |                  计划                  |      4      |
|         Estimate         |         估计自己的任务所需时间         |      2      |
|       Development        |                  开发                  |    59.5     |
|         Analysis         |                分析需求                |     15      |
|       Design Spec        |              生成设计文档              |      5      |
|      Design Review       |     设计复审（和同事审核设计文档）     |      3      |
|     Coding Standard      | 代码规范（为目前的开发制定合适的规范） |      0      |
|          Design          |                具体设计                |     15      |
|          Coding          |                具体编码                |     12      |
|       Code Review        |                代码复审                |      0      |
|           Test           |  测试（包括自测，修改代码，提交修改）  |     3.5     |
|       Test Report        |                测试报告                |      0      |
|          Report          |                  报告                  |      3      |
|     Size Measurement     |               计算工作量               |      0      |
|        Postmortem        |                事后总结                |      1      |
| Process Improvement Plan |            提出过程改进计划            |      2      |
|           Sum            |                  合计                  |    65.5     |

## Git统计报告

由于我们组采用的是建立Organization然后共同commit的方式，因此统计只能分别截图。

首先是代码行数统计,代码如下：

```shell
git log --format='%aN' | sort -u | while read name; do echo -en "$name\t"; git log --author="$name" --pretty=tformat: --numstat | awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "added lines: %s, removed lines: %s, total lines: %s\n", add, subs, loc }' -; done
```

然后是commit数量，代码如下：

```shell
git log --pretty=%aN | sort | uniq -c | sort -k1 -n -r | head -n 10
```

我主要负责的是设计与开发文档编写以及部分后端开发工作，截图**DashBoard**（文档repository）和**EasyOrder_BE**（后端repository）如下：

**DashBoard **代码行数：

![](.\X3_Final_Report\img_src\15331092_DashBoard_codeline.png)

**DashBoard** commit数：

![](.\X3_Final_Report\img_src\15331092_DashBoard_commit.png)

**EasyOrder_BE **代码行数：

![](.\X3_Final_Report\img_src\15331092_EasyOrder_BE_codeline.png)

**EasyOrder_BE** commit数：

![](.\X3_Final_Report\img_src\15331092_EasyOrder_BE_commit.png)



## 工作清单 & 博客地址

##### 工作介绍（一句话）：主要负责了这次项目的大部分api接口设计， 部分后端的api实现以及文档编写。

##### 博客地址：[15331092_项目工作经验总结](https://blog.csdn.net/guo15331092/article/details/79952894)





---------------



# By 15331097 [@HeskeyBaozi](https://github.com/HeskeyBaozi)

## 苦劳工作清单

|         最有价值的工作         |              简短说明                   |
| :--------------------------: | :------------------------------------:|
| 前端代码的编写与维护      | 负责对接前端后台接口，负责前端代码编写，负责前端代码质量维护，负责前端功能增量更新，拥抱变化   |
| 项目基础设施搭建            | 建立持续集成工作流、维护网站文档            |
| 前端数据流的设计 | 包括`Redux`和`Mobx-State-Tree`状态树的设计  |
| 用户UI界面的设计      | 包括各个页面的设计、参考各大点餐软件案例   |

## 个人博客清单

[自制主题技术博客](https://heskeybaozi.github.io/#/)

## 个人软件过程

|         PSP 2.1          |               How to do                | Time(hours) |
| :----------------------: | :------------------------------------: | :---------: |
|         Planning         |                  分析前端数据流，预想`API`实现                  |      4      |
|         Estimate         |         评估前端代码数据结构使用复杂度         |      2      |
|         Analysis         |                分析需求                |     15      |
|       Design Spec        |              生成设计文档              |      5      |
|      Design Review       |     设计复审（单人复审）     |      0      |
|     Coding Standard      | 代码规范（为目前的开发制定合适的规范） |      0      |
|          Design          |                具体设计                |     15      |
|       Development        |                  前端开发（`React`技术栈）   |    80.5     |
|       Code Review        |                代码复审（前端持续集成，包括风格检查、代码复用检查、模块化检查）                |      0      |
|           Test           |  测试（主要是接口调用的测试）  |     3.5     |
|     Size Measurement     |               计算工作量               |      0      |
|        Postmortem        |                事后总结                |      1      |
| Process Improvement Plan |            提出过程改进计划            |      2      |