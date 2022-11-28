import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";

// 引入element
import "element-ui/lib/theme-chalk/index.css";
import {
  Dialog,
  Dropdown,
  DropdownMenu,
  DropdownItem,
  Input,
  Checkbox,
  CheckboxGroup,
  Select,
  Option,
  Button,
  Form,
  FormItem,
  Tag,
  Row,
  Col,
  Icon,
  Upload,
  Card,
  Timeline,
  TimelineItem,
  MessageBox,
  Message,
} from "element-ui";
Vue.use(Dialog);
Vue.use(Dropdown);
Vue.use(DropdownMenu);
Vue.use(DropdownItem);
Vue.use(Input);
Vue.use(Icon);
Vue.use(Checkbox);
Vue.use(CheckboxGroup);
Vue.use(Select);
Vue.use(Option);
Vue.use(Button);
Vue.use(Form);
Vue.use(FormItem);
Vue.use(Tag);
Vue.use(Row);
Vue.use(Col);
Vue.use(Upload);
Vue.use(Card);
Vue.use(Timeline);
Vue.use(TimelineItem);

Vue.prototype.$confirm = MessageBox.confirm;
Vue.prototype.$message = Message;
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
