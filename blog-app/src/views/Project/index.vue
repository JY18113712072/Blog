<template>
  <div class="project">
    <header>
      <span>我的项目</span
      ><i
        class="el-icon-circle-plus-outline"
        @click="$router.push('/addProject')"
        v-if="$store.state.token"
      ></i>
    </header>

    <div
      class="pro"
      v-for="item in projectList"
      :key="item.pid"
      @click="$router.push(`/projectDetail/${item.pid}`)"
    >
      <div class="pic"><img v-src="item.pic" alt="" /></div>
      <div class="content">
        <header>
          <span>{{ item.title }}</span>
          <span>{{ item.createTime }}</span>
        </header>
        <p class="desc">&nbsp;&nbsp;{{ item.desc }}</p>
        <p class="tech">{{ item.techStack }}</p>
      </div>
    </div>

    <GoTop :isTop="isTop"></GoTop>
  </div>
</template>

<script>
import GoTop from "@/components/GoTop";
import moment from "moment";
export default {
  name: "Welcome",
  components: {
    GoTop,
  },
  data() {
    return {
      isTop: true,
      // 项目列表
      projectList: [],
    };
  },
  methods: {
    async getProject() {
      let res = await this.$api.project.reqGetProAll();
      res.data.data.forEach(item => {
        item.createTime = moment(item.createTime).format("YYYY-MM-DD");
      });
      this.projectList = res.data.data.reverse();
    },
  },
  mounted() {
    // 获取项目
    this.getProject();
    // 监听滚轮事件
    window.onscroll = () => {
      if (window.scrollY === 0) {
        this.isTop = true;
      } else {
        this.isTop = false;
      }
    };
  },
};
</script>

<style lang="scss" scoped>
.project {
  box-sizing: border-box;
  width: 800px;
  min-height: 100vh;
  margin: 0 auto;
  padding-top: 70px;
  > header {
    padding: 10px 20px;
    font-weight: bold;
    color: #fff;
    background-color: rgba($color: #333, $alpha: 0.1);
    margin: 20px 0;
    display: flex;
    justify-content: space-between;
    align-items: center;
    i {
      &:hover {
        color: gold;
      }
      font-size: 24px;
      cursor: pointer;
      margin-right: 20px;
    }
  }

  .pro {
    margin-bottom: 20px;
    background-color: #fff;
    cursor: pointer;
    &:hover {
      box-shadow: 0 0 5px 5px #aaa;
    }
    display: flex;
    .pic {
      height: 180px;
      margin-right: 15px;
      img {
        height: 100%;
      }
    }
    .content {
      flex: 1;
      word-wrap: break-word;
      // table-layout: fixed;
      word-break: break-all;
      padding: 10px 20px 10px 0;
      > header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        > span:first-child {
          font-size: 20px;
          color: #333;
          font-weight: bold;
        }
        > span:last-child {
          font-size: 14px;
          color: #999;
        }
      }
      .desc {
        font-size: 16px;
        color: #333;
        margin: 10px 0;
        display: -webkit-box;
        -webkit-line-clamp: 3;
        -webkit-box-orient: vertical;
        overflow: hidden;
      }
      .tech {
        font-size: 16px;
        color: #999;
      }
    }
  }
}
</style>
