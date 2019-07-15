## SSM+Bootstrap框架整合实现分页效果的增删改查项目

## 使用技术
Spring+SpringMVC+Mybatis+Bootstrap

## 使用说明

1.首先你要安装git，并且具有github账号，在IDEA里面进行git和github的配置
2.下载代码 git clone https://github.com/pitt1997/SSMCRUD.git 下载到IDEA
具体步骤: File->New->Project From Version Control->Git->输入上方URL->clone
3. 新建数据库，运行sql文件夹下的sql文件，生成相应的员工表及部门表
4. 给项目配置启动配置，具体步骤如下：
Edit Configurations->添加Tomcat Server->Local->Deployment->添加Artifact(或者点Fix快速添加)
5. 到src/jdbc.properties下修改你的数据库链接用户名与密码(以及连接驱动、数据库名等信息)
6. 启动tomcat服务器，运行项目之后就可进入员工列表界面（或访问http://localhost:8080）

## 项目描述
可以进行简单的增删改查操作，具有美观的分页效果。

## 图片演示
主界面员工列表显示

![Image text](https://github.com/pitt1997/SSMCRUD/blob/master/showimgs/list.png)

员工增加

![Image text](https://github.com/pitt1997/SSMCRUD/blob/master/showimgs/add.png)

员工修改

![Image text](https://github.com/pitt1997/SSMCRUD/blob/master/showimgs/update.png)



## 更多知识
个人博客： https://blog.csdn.net/brad_pitt7


