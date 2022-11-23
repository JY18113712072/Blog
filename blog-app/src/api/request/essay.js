import request from "../request";

// 获取所有随笔
export const reqGetEssay = () => request.get("essay/getall");
// 添加一个随笔
export const reqAddEssay = data => request.post("essay/add", data);
// 添加一个随笔
export const reqDelEssay = eid => request.delete(`essay/delete?eid=${eid}`);
