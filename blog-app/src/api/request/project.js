import request from "../request";

// 添加项目
export const reqAddProject = data => request.post("project/add", data);
// 添加项目
export const reqUpdateProject = data => request.put("project/update", data);
// 删除项目
export const reqDeleteProject = pid => request.delete(`project/delete?pid=${pid}`);
// 获取所有项目
export const reqGetProAll = () => request.get("project/getall");
// 获取一条项目
export const reqGetAPro = pid => request.get(`project/getProject?pid=${pid}`);
