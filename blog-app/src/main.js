import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";

// 引入element
import ElementUI from "element-ui";
import "element-ui/lib/theme-chalk/index.css";
Vue.use(ElementUI);
// 引入md编辑器
import mavonEditor from "mavon-editor";
import "mavon-editor/dist/css/index.css";
Vue.use(mavonEditor);
// 引入api
import api from "@/api";
Vue.prototype.$api = api;
// 图片路径自定义指全局令
Vue.directive("src", (el, bindings) => {
  el.src = "http://47.108.228.255:3000/" + bindings.value;
});
Vue.prototype.$url = "http://47.108.228.255:3000/";

Vue.config.productionTip = false;

new Vue({
  router,
  store,
  render: h => h(App),
}).$mount("#app");
