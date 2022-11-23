<template>
  <header class="header">
    <div class="left" @click="$router.push('/home')">Saury</div>
    <ul class="center">
      <li @click="goNav('/home', 0)" :class="{ active: active == 0 }">
        <i class="el-icon-s-home"></i><span>首页</span>
      </li>
      <li @click="goNav('/essay', 1)" :class="{ active: active == 1 }">
        <i class="el-icon-edit"></i><span>随笔</span>
      </li>
      <li @click="goNav('/project', 2)" :class="{ active: active == 2 }">
        <i class="el-icon-coin"></i><span>项目</span>
      </li>
      <li @click="goNav('/note', 3)" :class="{ active: active == 3 }">
        <i class="el-icon-chat-dot-round"></i><span>留言</span>
      </li>
      <li @click="goNav('/me/myInfo', 4)" :class="{ active: active == 4 }">
        <i class="el-icon-potato-strips"></i><span>关于我</span>
      </li>
    </ul>
    <div class="right">
      <a href="" @click.prevent="$router.push('/login')">Login</a>
    </div>
  </header>
</template>

<script>
export default {
  name: "Header",
  data() {
    return {
      active: null,
    };
  },
  watch: {
    $route() {
      switch (this.$route.path) {
        case "/home":
          this.active = 0;
          break;
        case "/essay":
          this.active = 1;
          break;
        case "/project":
          this.active = 2;
          break;
        case "/note":
          this.active = 3;
          break;
        // case "/me":
        //   this.active = 4;
        //   break;

        default:
          this.active = null;
          break;
      }
      if (this.$route.path.includes("/me")) {
        this.active = 4;
      }
    },
  },
  methods: {
    goNav(path, val) {
      this.active = val;
      this.$router.push(path);
    },
  },
};
</script>

<style lang="scss" scoped>
.header {
  z-index: 2000;
  height: 7vh;
  background-color: rgba($color: #aaa, $alpha: 0.5);
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0 70px 0 58px;
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  .left {
    color: gold;
    font-size: 24px;
    font-weight: bold;
    cursor: pointer;
  }
  .center {
    width: 600px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-size: 14px;
    font-weight: bold;
    color: #fff;
    li {
      &:hover {
        color: gold;
      }
      cursor: pointer;
      width: 80px;
      display: flex;
      align-items: center;
      i {
        margin-bottom: -2px;
        margin-right: 8px;
      }
    }
  }
  .right {
    width: 100px;
    height: 30px;
    background-color: rgba($color: #999, $alpha: 0.5);
    line-height: 30px;
    text-align: center;
    font-size: 16px;
    a {
      &:hover {
        color: gold;
      }
      color: rgb(213, 211, 211);
    }
  }
}
.active {
  color: gold;
}
</style>
