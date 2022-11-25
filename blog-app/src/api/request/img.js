import request from "../request";

export const reqAddimg = data => request.post("/uploadPic", data);
