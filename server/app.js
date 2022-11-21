//引入express模块
const express = require("express");
const multer = require("multer");
const cors = require("cors");
const bodyParser = require("body-parser");

//引入用户路由器模块
const blog = require("./routes/blog.js");
const bcategory = require("./routes/bcategory");
const btag = require("./routes/btag");
const essay = require("./routes/essay");
const project = require("./routes/project");
const note = require("./routes/note");
const comment = require("./routes/comment");

//创建WEB服务器
const app = express();
app.use(
  cors({
    origin: "*",
  })
);

//设置端口
app.listen(3000, () => {
  console.log("服务器启动在3000端口");
});

app.use(express.static("public"));
// 将所有post传参转为对象(一定放在路由器的前边);
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

//挂载blog路由器，
app.use("/blog", blog);
//挂载bcategory路由器，
app.use("/bcategory", bcategory);
//挂载btag路由器，
app.use("/btag", btag);
//挂载essay路由器，
app.use("/essay", essay);
//挂载project路由器，
app.use("/project", project);
//挂载note路由器，
app.use("/note", note);
//挂载comment路由器，
app.use("/comment", comment);

// 上传图片接口
var storage = multer.diskStorage({
  destination: function (req, res, cb) {
    cb(null, "./public/upload");
  },
  filename: function (req, file, cb) {
    cb(null, Date.now() + "." + file.originalname.split(".")[1]);
  },
});
var upload = multer({
  storage: storage,
  limits: {
    fieldNameSize: "10M",
  },
});
app.post("/uploadPic", upload.single("imgUpload"), (req, res) => {
  let imgUrl = req.file.path.slice(7);
  res.send(imgUrl);
});

//添加错误处理中间件，拦截所有的错误
app.use((err, req, res, next) => {
  //err 传递过来的错误
  console.log(err);
  //响应内部错误
  res.send({ code: 500, msg: "服务器内部错误" });
});
