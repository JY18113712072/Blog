//引入express模块
const express = require("express");
//引入连接池模块
const pool = require("../pool.js");
//创建路由器对象
const router = express.Router();
//添加路由(接口)

// 获取所有标签
router.get("/getall", (req, res, next) => {
  //执行SQL命令，查询数据库中是否有用户名和密码同时满足的数据
  pool.query("select * from btag", (err, r) => {
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

// 添加一条标签
router.post("/add", (req, res, next) => {
  //获取post传递的参数
  var obj = req.body;
  //执行SQL命令，插入数据
  pool.query("insert into btag set ?", [obj], (err, r) => {
    if (err) {
      //如果SQL中出现错误，交给下一个错误处理中间件
      //阻止往后执行
      return next(err);
    }
    res.send({ code: 200, msg: "添加成功" });
  });
});

// 删除分类
router.delete("/delete", (req, res, next) => {
  //获取post传递的参数
  var tagName = req.query.tagName;
  //执行SQL命令，查询数据库中是否有用户名和密码同时满足的数据
  pool.query("delete from btag where tagName=?", [tagName], (err, r) => {
    if (err) {
      //如果SQL中出现错误，交给下一个错误处理中间件
      return next(err);
    }
    if (r.affectedRows > 0) {
      res.send({ code: 200, msg: "删除成功" });
    } else {
      res.send({ code: 400, msg: "删除失败" });
    }
  });
});

//暴露路由器对象
module.exports = router;
