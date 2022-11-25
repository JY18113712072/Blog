<template>
  <div class="me">
    <div class="nav">
      <div class="pic"><img src="./images/a.jpg" alt="" /></div>
      <ul>
        <li @click="goNav('/me/myInfo', 0)" :class="{ active: active == 0 }">
          <i class="el-icon-notebook-2"></i> <span>资料</span>
        </li>
        <li @click="goNav('/me/skills', 1)" :class="{ active: active == 1 }">
          <i class="el-icon-news"></i> <span>技能</span>
        </li>
        <!-- <li @click="goNav('/me/works', 2)" :class="{ active: active == 2 }">
          <i class="el-icon-box"></i> <span>作品</span>
        </li> -->
        <li @click="goNav('/me/hobby', 3)" :class="{ active: active == 3 }">
          <i class="el-icon-basketball"></i> <span>爱好</span>
        </li>
        <li @click="goNav('/me/resume', 4)" :class="{ active: active == 4 }">
          <i class="el-icon-document"></i> <span>简历</span>
        </li>
      </ul>
    </div>

    <div class="content">
      <router-view></router-view>
    </div>
  </div>
</template>

<script>
export default {
  name: "Welcome",
  data() {
    return {
      active: 0,
    };
  },
  watch: {
    $route: {
      immediate: true,
      handler() {
        switch (this.$route.path) {
          case "/me/myInfo":
            this.active = 0;
            break;
          case "/me/skills":
            this.active = 1;
            break;
          case "/me/works":
            this.active = 2;
            break;
          case "/me/hobby":
            this.active = 3;
            break;
          case "/me/resume":
            this.active = 4;
            break;

          default:
            break;
        }
      },
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
.me {
  // padding: 40px 0 30px 0;
  min-height: 100vh;
  // display: flex;
  overflow: hidden;

  .nav {
    position: fixed;
    left: 0;
    top: 0;
    bottom: 0;
    box-sizing: border-box;
    background-color: rgba($color: #999, $alpha: 0.5);
    width: 180px;
    height: 100vh;
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 80px 0;
    .pic {
      width: 80px;
      img {
        width: 100%;
        border: 3px solid gold;
        border-radius: 50%;
      }
    }
    ul {
      li {
        &:hover {
          color: gold;
        }

        cursor: pointer;
        color: #fff;
        display: flex;
        align-items: center;
        padding: 10px 0;
        i {
          margin-right: 10px;
          margin-bottom: -2px;
        }
      }
    }
  }
  .content {
    box-sizing: border-box;
    padding: 80px 20px 20px 200px;
    min-height: 100vh;
  }
}
.active {
  color: gold !important;
}
</style>
