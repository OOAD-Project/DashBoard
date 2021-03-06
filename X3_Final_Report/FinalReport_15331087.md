# Final Report By 15331087

## 课程项目中我的工作

在这学期系统分析与设计课上，我学到了是UML各类型图的设计思想与绘制方法，并初步将其应用于项目的实际开发中以增强抽象逻辑的表达能力，从而更良好地与组员在系统的分析及设计上交流思想，统一观点，减少设计误差。

在本次课程项目EasyOrder扫码点餐系统中，我主要负责了
最初的项目主题的确立（扫码订餐项目及命名EasyOrder等），
项目早期的系统需求分析和实地调研（收集现有的餐馆扫码点餐产品的用例及流程），
参与了系统整体框架设计（顾客与餐馆两方与EasyOrder系统的交互界面）。
本来按初步计划我还将重点参与系统后端编码过程，后来学期末因为学业上其它事情耽搁，所以减少了这部分的工作量。在此感谢负责后端开发的其他几名同学的体谅与分担。

## 在实际项目开发中的经验与教训

1. 早期的需求分析很重要。第一阶段必须确定好系统用例和功能，切忌到了后期再修改需求。关于这点，UML图就能发挥大作用。组员之间对于系统的期望肯定会有不同意见，故初期就应该通过统一的语言把需求唯一化，避免模糊的需求分析导致后期的前后端以及数据库的设计实现出现偏差。
2. 编码未动，文档先行。实际开发中我们遇到了一个比较棘手的问题是前后端以及数据库的字段名和字段类型的不统一，导致三方的通信常常不能按预期被解析，表现为访问网站以及提交表单的结果返回为500系统错误。
我在此得到的教训是以后的项目开发应该要先由一方制定好API文档，文档中明确写清字段名和类型等细节，其它模块的设计者就严格遵守对方的文档来设计通信，避免再用口头表述等方式交流或者忽视设计文档。
3. 总之就是，我们不能再抱着以前一个人设计并实现一个小程序的心态去和团队完成大项目而埋头于敲代码，而应该重视分析与设计的里程碑图表和文档，并严格遵守确立的规范来开发项目。


------

## PSP

|         PSP 2.1          |               How to do                | Time(hours) |
| :----------------------: | :------------------------------------: | :---------: |
|         Planning         |                  计划                  |      5      |
|         Estimate         |         估计自己的任务所需时间         |      2      |
|       Development        |                  开发                  |     37    |
|         Analysis         |                分析需求                |     10      |
|       Design Spec        |              生成设计文档              |     10      |
|      Design Review       |     设计复审（和同事审核设计文档）     |      2      |
|     Coding Standard      | 代码规范（为目前的开发制定合适的规范） |      0      |
|          Design          |                具体设计                |      5      |
|          Coding          |                具体编码                |      2      |
|       Code Review        |                代码复审                |      0      |
|           Test           |  测试（包括自测，修改代码，提交修改）  |      0     |
|       Test Report        |                测试报告                |      0      |
|          Report          |                  报告                  |      5      |
|     Size Measurement     |               计算工作量               |      0      |
|        Postmortem        |                事后总结                |      2      |
| Process Improvement Plan |            提出过程改进计划            |      1      |
|           Sum            |                  合计                  |     44     |

### 苦劳工作清单

|         最有价值的工作         |              简短说明                   |
| :--------------------------: | :------------------------------------:|
| 分析系统用例并绘制了项目的用例图 | 顾客点餐过程中的用例以及商家管理过程中的用例  |
| 业务流程文档编写 | 实地调研获取市场上现有的扫码点餐系统的业务流程信息并写成文档  |
| 参与系统功能分析与创新点设计  | 在现有的众多扫码点餐产品中争取崭露头角   |
| 编写系统架构部署文档      | 分析系统架构，将前后端与数据库的关系转为文档展示   |

## Insights

![](./img_src/15331087_dashboard_graph.png)


## Git统计报告

commit数量代码如下：

```
git log --pretty=%aN | sort | uniq -c | sort -k1 -n -r | head -n 10
```

我主要负责需求分析与设计过程中，UML图与文档编写，故截图**DashBoard**（项目文档仓库）如下：

**DashBoard** commit数：

![](./img_src/15331087_dashboard_commit.png)

代码行数统计,代码如下：

```
git log --format='%aN' | sort -u | while read name; do echo -en "$name\t"; git log --author="$name" --pretty=tformat: --numstat | awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "added lines: %s, removed lines: %s, total lines: %s\n", add, subs, loc }' -; done
```

**DashBoard **代码行数：

![](./img_src/15331087_dashboard_codeline.png)
