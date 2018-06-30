DELETE FROM `food` WHERE TRUE;
LOCK TABLES `food` WRITE;
INSERT INTO `food` VALUES 
(1,'pork','https://i8.meishichina.com/attachment/recipe/2014/07/18/20140718114832312460803.jpg?x-oss-process=style/p800',53,'this is a pork',0.8,100,0,1),
(2,'fish','https://www.jucanw.com/UploadFiles/2013-05/admin/2013051715282196795.jpg',32,'this is a fish',0.4,10,0,1),
(3,'qqq','qqq',12312,'qqq',2.2,22,22,1),
(6,'qq','qqq',12312,'qqq',2.2,22,22,1),
(10,'ss','ss',33,'qq',4.4,19,19,1),
(24,'qkq','qqq',12312,'qqq',2.2,22,22,1),
(66,'qhq','qqq',12312,'qqq',2.2,22,22,1);
UNLOCK TABLES;
