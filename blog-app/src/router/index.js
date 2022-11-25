import Vue from "vue";
import VueRouter from "vue-router";

Vue.use(VueRouter);

const routes = [
  {
    path: "/welcome",
    name: "Welcome",
    meta: {
      hideHeader: true,
    },
    component: () => import("@/views/Welcome"),
  },
  {
    path: "/home",
    name: "Home",
    component: () => import("@/views/Home"),
  },
  {
    path: "/addBlog/:bid?",
    name: "addBlog",
    component: () => import("@/views/AddBlog"),
  },
  {
    path: "/blogDetail/:bid",
    name: "blogDetail",
    component: () => import("@/views/BlogDetail"),
  },
  {
    path: "/essay",
    name: "Essay",
    component: () => import("@/views/Essay"),
  },
  {
    path: "/addEssay",
    name: "addEssay",
    component: () => import("@/views/AddEssay"),
  },
  {
    path: "/note",
    name: "Note",
    component: () => import("@/views/Note"),
  },
  {
    path: "/project",
    name: "Project",
    component: () => import("@/views/Project"),
  },
  {
    path: "/projectDetail/:pid",
    name: "projectDetail",
    component: () => import("@/views/ProjectDetail"),
  },
  {
    path: "/addProject/:pid?",
    name: "addProject",
    component: () => import("@/views/AddProject"),
  },
  {
    path: "/me",
    name: "Me",
    component: () => import("@/views/Me"),
    children: [
      {
        path: "myInfo",
        name: "myInfo",
        component: () => import("@/views/Me/MyInfo"),
      },
      {
        path: "resume",
        name: "resume",
        component: () => import("@/views/Me/Resume"),
      },
      {
        path: "hobby",
        name: "Hobby",
        component: () => import("@/views/Me/Hobby"),
      },
      {
        path: "skills",
        name: "Skills",
        component: () => import("@/views/Me/Skills"),
      },
      {
        path: "works",
        name: "Works",
        component: () => import("@/views/Me/Works"),
      },
    ],
  },
  {
    path: "/login",
    name: "login",
    meta: {
      hideHeader: true,
    },
    component: () => import("@/views/Login"),
  },

  {
    path: "/",
    redirect: "/welcome",
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;
