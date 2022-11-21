//引入express模块
const express = require("express");
//引入连接池模块
const pool = require("../pool.js");
//创建路由器对象
const router = express.Router();
//添加路由(接口)

// 获取所有项目
router.get("/getall", (req, res, next) => {
  //执行SQL命令，查询数据库中是否有用户名和密码同时满足的数据
  pool.query("select * from project", (err, r) => {
    if (err) {
      //如果SQL中出现错误，交给下一个错误处理中间件
      return next(err);
    }
    //结果是数组，如果是空数组登录失败，否则登录成功
    if (r.length === 0) {
      res.send({ code: 400, msg: "null", data: [] });
    } else {
      res.send({ code: 200, msg: "查询成功", data: r });
    }
  });
});
// 获取一条项目内容
router.get("/getProject", (req, res, next) => {
  let pid = req.query.pid;
  //执行SQL命令，查询数据库中是否有用户名和密码同时满足的数据
  pool.query("select * from project where pid=?", [pid], (err, r) => {
    if (err) {
      //如果SQL中出现错误，交给下一个错误处理中间件
      return next(err);
    }
    //结果是数组，如果是空数组登录失败，否则登录成功
    if (r.length === 0) {
      res.send({ code: 400, msg: "null", data: [] });
    } else {
      res.send({ code: 200, msg: "查询成功", data: r });
    }
  });
});

// 添加一条项目
router.post("/add", (req, res, next) => {
  //获取post传递的参数
  var obj = req.body;
  //执行SQL命令，插入数据
  pool.query("insert into project set ?", [obj], (err, r) => {
    if (err) {
      //如果SQL中出现错误，交给下一个错误处理中间件
      //阻止往后执行
      return next(err);
    }
    res.send({ code: 200, msg: "添加成功" });
  });
});

// 删除项目
router.delete("/delete", (req, res, next) => {
  //获取post传递的参数
  var pid = req.query.pid;
  //执行SQL命令，查询数据库中是否有用户名和密码同时满足的数据
  pool.query("delete from project where pid=?", [pid], (err, r) => {
    if (err) {
      //如果SQL中出现错误，交给下一个错误处理中间件
      return next(err);
    }
    res.send({ code: 200, msg: "删除成功" });
  });
});

// 修改项目
router.put("/update", (req, res, next) => {
  //获取post传递的参数
  var obj = req.body;
  //执行SQL命令，查询数据库中是否有用户名和密码同时满足的数据
  pool.query(`update project set ? where pid=${obj.pid}`, [obj], (err, r) => {
    if (err) {
      //如果SQL中出现错误，交给下一个错误处理中间件
      return next(err);
    }
    res.send({ code: 200, msg: "修改成功" });
  });
});

//暴露路由器对象
module.exports = router;
