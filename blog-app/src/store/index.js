import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    token: JSON.parse(localStorage.getItem("token")),
  },
  mutations: {
    // 修改用户名
    Login(state, value) {
      state.token = { uname: "saury" };
    },
    Logout(state, value) {
      state.token = null;
    },
  },
  actions: {},
  modules: {},
});
