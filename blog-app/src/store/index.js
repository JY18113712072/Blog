import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    token: JSON.parse(localStorage.getItem("token")),
    blogList: [],
  },
  mutations: {
    // 修改用户名
    Login(state, value) {
      state.token = { uname: "saury" };
    },
    Logout(state, value) {
      state.token = null;
    },
    SaveBlogList(state, value) {
      state.blogList = value;
    },
  },
  actions: {},
  modules: {},
});
