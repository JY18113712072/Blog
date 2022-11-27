import axios from "axios";
// 引入进度条,start()进度条开始  ，done()进度条结束
import nprogress from "nprogress";
// 引入进度条样式
import "nprogress/nprogress.css";

let request = axios.create({
  // baseURL: "http://127.0.0.1:3000",
  baseURL: "http://47.108.228.255:3000",
  timeout: 10000,
});

request.interceptors.request.use(config => {
  nprogress.start();
  return config;
});
request.interceptors.response.use(res => {
  nprogress.done();
  //相应成功做的事情
  return res;
});

export default request;
