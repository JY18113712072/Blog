import request from "../request";

// 获取博客
export const reqGetBlog = () => request.get("blog/getall");
// 获取一条博客
export const reqGetABlog = bid => request.get(`blog/getblog?bid=${bid}`);
// 获取标签
export const reqGetTag = () => request.get("btag/getall");
// 添加标签
export const reqAddTag = data => request.post("btag/add", data);
// 删除标签
export const reqDeleteTag = tname => request.delete(`btag/delete/?tagName=${tname}`);
// 获取分类
export const reqGetCategory = () => request.get("bcategory/getall");
// 获取分类
export const reqAddCategory = data => request.post("bcategory/add", data);
// 删除分类
export const reqDelCategory = cid => request.delete("bcategory/delete?cid=" + cid);
// 添加博客
export const reqAddBlog = data => request.post("blog/add", data);
// 删除blog
export const reqDelBlog = bid => request.delete(`blog/delete?bid=${bid}`);
// 更新blog
export const reqUpdataBlog = data => request.put(`blog/update`, data);
