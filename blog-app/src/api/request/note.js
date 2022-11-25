import request from "../request";

// 获取留言
export const reqGetNote = () => request.get("/note/getAll");
// 添加留言
export const reqAddNote = data => request.post("/note/add", data);
// 添加删除
export const reqDelNote = nid => request.delete("/note/delete?nid=" + nid);
