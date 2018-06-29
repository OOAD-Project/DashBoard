# ooad部署文档

标签： 系统分析与设计


----------
郭柱明 15331094

----------
## 框架和依赖 ##
使用语言是python 版本为**python3.6+**

web后端框架 异步框架**aiohttp**
版本
![image_1ch5t4tip1bu65fi1iin1up1r789.png-4.4kB][1]

其他第三方依赖以及版本

aiohttp_session
![image_1ch5t9r2rmg1esaqge1f6i1semm.png-6.5kB][2]


aiohttp_cors
![image_1ch5tlboen2h3sj1v4f1qh71kla13.png-6.8kB][3]


aioredis
![image_1ch5tloe510ma1iic7ohdnl1qhv1g.png-5.8kB][4]


passlib
![image_1ch5tm4nq144lq9b6i1amt1o1f1t.png-5.9kB][5]


pyyaml
![image_1ch5tmki2lude8n1qg9n001i322a.png-5.9kB][6]


aiomysql
![image_1ch5tni4r1h4u60c1kpvj0t1n4j2n.png-6.5kB][7]


mysql.connector
![image_1ch5tnvds1fcf1okrepeg0sh2g34.png-7.3kB][8]


sqlalchemy
![image_1ch5tpbhve7sq7019iqufkj4r5h.png-4.8kB][9]



数据库使用mysql
![image_1ch5tv4tt7a91ela1vs7bu92op9.png-924.3kB][10]

----------
## 部署 ##
为什么选择nginx+supervisor这样的组合来部署 因为

优点

 - nginx是一个完美的前端服务器 可以防止基于畸形的http协议的攻击等等
 - 使用nginx运行几个aiohttp实例可以使用CPU多核
 - nginx对static静态文件的支持比aiohttp的内置的静态文件支持更快
 - supervisor主要是为了系统崩溃或者重启之后重新运行web app实例 怎么kill也kill不掉

缺点

 - 配置比其他组合方式麻烦一点

[参考链接][11]

 
由于选择使用nginx+superviosr的组合方式部署aiohttp 所以要先下载nginx和supervisor 这个没什么问题 自行谷歌即可 但是要注意点

> 因为aiohttp是只可以支持python3.5.3+的 但是好巧不巧ubuntu16.04的自带python版本是python3.5.2 这下有点蛋疼 我给的建议是保留python3.5 另外安装python3.6
> 
> 因为ubuntu系统以及很多像sublime等软件都是依赖py2或者py3.5的 一旦卸载或者修改了/use/bin/python的链接
> 会导致一系列版本不兼容的问题 我试过最严重的是卸载了python3.5 并且修改默认python版本为3.6 系统崩溃
> 折腾了很久最后只能重装系统
> 
> 为什么我要说这个呢 因为supervisor依赖于ubuntu的py2的
> 所以最好不要卸载任何版本python和修改系统默认的python版本 最好就另行安装python3.6 终端中使用python3.6调用即可


项目代码放置于/var/www/aio_ooad下
![image_1cff1giub10gmo07k6b16gjv339.png-71.6kB][12]


----------
## nginx配置 ##

 - nginx配置文件 /etc/nginx/nginx.conf
 - nginx日志文件 
  - /var/log/nginx/access.log
  - /var/log/nginx/error.log
   
/etc/nginx/nginx.conf
```java
http {
  server {
    listen 80;
    client_max_body_size 4G;

    server_name localhost;

    location / {
      proxy_set_header Host $http_host;
      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
      proxy_redirect off;
      proxy_buffering off;
      proxy_pass http://aiohttp;
    }

    location /static {
      # path for static files
      root /var/www/aio_ooad/static;
    }

  }
  upstream aiohttp {
    # fail_timeout=0 means we always retry an upstream even if it failed
    # to return a good HTTP response

    # Unix domain servers
    server unix:/var/www/aio_ooad/example_1.sock fail_timeout=0;
    server unix:/var/www/aio_ooad/example_2.sock fail_timeout=0;
    server unix:/var/www/aio_ooad/example_3.sock fail_timeout=0;
    server unix:/var/www/aio_ooad/example_4.sock fail_timeout=0;

    # Unix domain sockets are used in this example due to their high performance,
    # but TCP/IP sockets could be used instead:
    # server 127.0.0.1:8081 fail_timeout=0;
    # server 127.0.0.1:8082 fail_timeout=0;
    # server 127.0.0.1:8083 fail_timeout=0;
    # server 127.0.0.1:8084 fail_timeout=0;
  }
}
```
上面大部分内容都是常规的

指明静态文件路径 nginx提供静态文件的支持是很快的 这是选择nginx部署的原因之一
```java
    location /static {
      # path for static files
      root /var/www/aio_ooad/static;
    }
```
选择使用unix domian sockets文件的方式设置upstream 下面的注释也说到也可以使用TCP/IP sockets的方式 但是unix domain socket效果更好 一共配置了四个sockets文件 意味着后台一共有四个web app实例可以供nginx轮询选择
```java
  upstream aiohttp {
    # fail_timeout=0 means we always retry an upstream even if it failed
    # to return a good HTTP response

    # Unix domain servers
    server unix:/var/www/aio_ooad/example_1.sock fail_timeout=0;
    server unix:/var/www/aio_ooad/example_2.sock fail_timeout=0;
    server unix:/var/www/aio_ooad/example_3.sock fail_timeout=0;
    server unix:/var/www/aio_ooad/example_4.sock fail_timeout=0;

    # Unix domain sockets are used in this example due to their high performance,
    # but TCP/IP sockets could be used instead:
    # server 127.0.0.1:8081 fail_timeout=0;
    # server 127.0.0.1:8082 fail_timeout=0;
    # server 127.0.0.1:8083 fail_timeout=0;
    # server 127.0.0.1:8084 fail_timeout=0;
  }
```


----------
## supervisor配置 ##

 - supervisor默认配置文件 /etc/supervisor/supervisord.conf
 - 部署项目的配置文件 /etc/supervisor/conf.d/example.ini

修改/etc/supervisor/supervisord.conf 最后一行处为
```java
[include]
files = conf.d/*.ini    ; 
```
/etc/supervisor/conf.d/example.ini
```java
[program:aiohttp]
numprocs = 4
numprocs_start = 1
process_name = example_%(process_num)s

; Unix socket paths are specified by command line.
command=python3.6 /var/www/aio_ooad/test_main.py --path=/var/www/aio_ooad/example_%(process_num)s.sock --port=808%(process_num)s

; We can just as easily pass TCP port numbers:
; command=/path/to/aiohttp_example.py --port=808%(process_num)s

user=www-data
autostart=true
autorestart=true
```

    numprocs = 4
    numprocs_start = 1
    process_name = example_%(process_num)s


一共四个进程 进程号从1到4 进程名字由进程号决定 则为example\_1 example\_2 example\_3 example\_4

    command=python3.6 /var/www/aio_ooad/test_main.py --path=/var/www/aio_ooad/example_%(process_num)s.sock --port=808%(process_num)s
    user=www-data

后台运行此命令 也即是运行web app所在的py文件 执行用户为www-data

这里坑就比较多了

1.python模块问题
因为supervisor是由root用户运行的 所以在supervisor里面后台执行python命令也是在root用户下执行的

正如我开始所说 我一直依赖都是windows系统下进行开发的 对权限的意识不是很足

下面我们来看看一个模块安装问题
因为我是使用普通用户gzm进行安装aiohttp模块的 但是在部署之后日志显示没有安装aiohttp模块

让我们在普通用户gzm下打开python3终端 查看模块安装目录

![image_1ch5v66t51qgklht1v4rim1ajd9.png-40kB][13]

我们会发现里面有个路径为

    /home/gzm/.local/lib/python3.6/site-packages

进入之后发现aiohttp正是安装在这个路径下面

![此处输入图片的描述][14]

然后让我们切换为root用户 查看模块安装路径 发现没有/home/gzm/.local/lib/python3.6/site-packages 这个路径 这就解释了为什么即使我真的在gzm这个用户下安装了aiohttp等模块 但是运行supervisor还是会在日志中报错没有此模块 所以正确的方式是切换到root安装需要的模块

![此处输入图片的描述][15]

还有一个问题是

    --path=/var/www/aio_ooad/example_%(process_num)s.sock
意味着www-data用户需要在/var/www/aio_ooad目录下创建四个.socket文件 以支持nginx 所以/var/www/aio_ooad这个文件需要把所有权改为www-data 不然会在日志中报错permission denied

    sudo chown -R www-data:www-data /var/www/aio_ooad/


----------
## web app所在py ##
test_main.py
```python
#!/usr/bin/env python3
from aiohttp_polls import main
from aiohttp import web
import argparse

parser = argparse.ArgumentParser(description="aiohttp server example")
parser.add_argument('--path')
parser.add_argument('--port')

app = main.app
args = parser.parse_args()
web.run_app(app, host="0.0.0.0", port=args.port, path=args.path)
```

----------
## nginx supervisor重启命令 ##
```java
sudo /etc/init.d/nginx restart
sudo supervisorctl reload
```


----------
## 部署结果 ##
![image_1ch5v927710ni1ih1il1159o10kn14.png-89.6kB][16]

 


  [1]: http://static.zybuluo.com/gzm1997/aqgxm1xey0avv6dulwvlkyb7/image_1ch5t4tip1bu65fi1iin1up1r789.png
  [2]: http://static.zybuluo.com/gzm1997/ecw0ctjio6gzlo12zn7f14sr/image_1ch5t9r2rmg1esaqge1f6i1semm.png
  [3]: http://static.zybuluo.com/gzm1997/yvz876uk43ihswa50bqzdpcx/image_1ch5tlboen2h3sj1v4f1qh71kla13.png
  [4]: http://static.zybuluo.com/gzm1997/31v4ugt1lpppufznyhd8jjh4/image_1ch5tloe510ma1iic7ohdnl1qhv1g.png
  [5]: http://static.zybuluo.com/gzm1997/4754pchsze7z8efy6n76tu1s/image_1ch5tm4nq144lq9b6i1amt1o1f1t.png
  [6]: http://static.zybuluo.com/gzm1997/pip2tju6mzgdvtt6x90kfmpx/image_1ch5tmki2lude8n1qg9n001i322a.png
  [7]: http://static.zybuluo.com/gzm1997/ixexz65anin6x3za5seg1es3/image_1ch5tni4r1h4u60c1kpvj0t1n4j2n.png
  [8]: http://static.zybuluo.com/gzm1997/dh4590ia4lwrvc1gr6dttk4l/image_1ch5tnvds1fcf1okrepeg0sh2g34.png
  [9]: http://static.zybuluo.com/gzm1997/eeoo5hblwzyutl1hnah4uejz/image_1ch5tpbhve7sq7019iqufkj4r5h.png
  [10]: http://static.zybuluo.com/gzm1997/w6vk425amvol1q90661l03jh/image_1ch5tv4tt7a91ela1vs7bu92op9.png
  [11]: http://static.zybuluo.com/gzm1997/aqgxm1xey0avv6dulwvlkyb7/image_1ch5t4tip1bu65fi1iin1up1r789.png
  [12]: http://static.zybuluo.com/gzm1997/ecw0ctjio6gzlo12zn7f14sr/image_1ch5t9r2rmg1esaqge1f6i1semm.png
  [13]: http://static.zybuluo.com/gzm1997/ho09efwz0fq58pt5r5p2olw2/image_1ch5v66t51qgklht1v4rim1ajd9.png
  [14]: http://static.zybuluo.com/gzm1997/npxy5oetqeztqsxq16xr4t4b/image_1cff2pkee1quh1kbssklugl167p33.png
  [15]: http://static.zybuluo.com/gzm1997/clvu614mas8hh45xfdoxsgh3/image_1cff2sipucq2gtm1qid5141fvd4g.png
  [16]: http://static.zybuluo.com/gzm1997/0k1euik0f4j5pjjkk92wn1ho/image_1ch5v927710ni1ih1il1159o10kn14.png
