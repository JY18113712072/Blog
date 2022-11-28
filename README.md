# 项目介绍
## 项目开源地址：https://github.com/JY18113712072/Blog

实现了一个简单的个人博客系统，技术栈为后端Node+Express+MySQL,前端Vue+ElementUI。主要分为了引导页，登录页，首页，随笔，项目，留言和关于我页面。
## 1、项目技术栈
### 前端项目
- Vue全家桶
- axios
- elementUI
- moment
- mavon-editor 
### 后端接口
- Node.js
- Express
- MySQL
- Multer
## 2、页面及其功能介绍
### 首页
首页实现了天气预报的展示，个人博客概要内容的展示及添加，分类和标签的展示、添加以及点击对应分类或者标签进行筛选对应类别的博客。点击博客跳转到对应博客的详情页，登录后可以对其进行修改或者删除。

### 随笔
此页面实现了随笔记录按照时间线展示以及删除，点击添加跳转到添加随笔页面，使用markdown文档编辑器，添加随笔。

### 项目
项目页面实现了项目该概要的展示，且项目描述只显示三行，多余文字用省略号代替。点击跳转到项目详情页面，登陆后可以对项目进行修改和删除等操作。

### 留言
访问者可以通过留言页面给我留言，且其他访问者也可以看到，登录后可以删除留言。


### 关于我
关于我的页面中有我个人的简要介绍以及基本信息、兴趣爱好、简历、掌握技能等信息的展示

### 登录页
登录页面实现用户的登录，对表单进行了验证，登录后可解锁对应操作的权限
