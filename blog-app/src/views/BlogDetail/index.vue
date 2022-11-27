<template>
  <div class="detail">
    <nav>
      <a href="#" class="el-icon-top" v-show="!isTop"></a>

      <i class="el-icon-back" @click="$router.push('/home')"></i>
      <i
        class="el-icon-edit"
        @click="$router.push(`/addBlog/${blogDetail.bid}`)"
        v-show="$store.state.token"
      ></i>
      <i class="el-icon-delete" @click="deleteBlog" v-show="$store.state.token"></i>
    </nav>
    <header>
      <i class="el-icon-back" @click="$router.push('/home')"></i><span>{{ blogDetail.title }}</span>
    </header>
    <mavon-editor
      v-if="blogDetail"
      :value="blogDetail.content"
      defaultOpen="preview"
      :boxShadow="false"
      :editable="false"
      :subfield="false"
      :toolbarsFlag="false"
    >
    </mavon-editor>
  </div>
</template>

<script>
export default {
  data() {
    return {
      blogDetail: null,
      isTop: true,
    };
  },
  methods: {
    // 删除blog
    deleteBlog() {
      this.$confirm("真的要删除这个项目吗?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(() => {
          // 发送请求删除博客
          this.$api.blog.reqDelBlog(this.blogDetail.bid).then(res => {
            if (res.data.code == 200) {
              // 删除成功跳转回首页
              this.$message.success("删除成功啦");
              this.$router.back();
            } else {
              this.$message.error("删除失败");
            }
          });
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "已取消删除",
          });
        });
    },
  },
  mounted() {
    this.$api.blog.reqGetABlog(this.$route.params.bid).then(res => {
      this.blogDetail = res.data.data[0];
      // 发送请求访问量+1
      this.$api.blog.reqUpdataBlog({ bid: this.blogDetail.bid, watch: this.blogDetail.watch + 1 });
    });

    // 绑定滚动监听事件，滚动到顶部时不显示按钮
    window.onscroll = () => {
      if (window.scrollY === 0) {
        this.isTop = true;
      } else {
        this.isTop = false;
      }
    };
  },
  beforeDestroy() {
    window.onscroll = null;
  },
};
</script>

<style lang="scss" scoped>
.detail {
  box-sizing: border-box;
  padding-top: 80px;
  width: 1000px;
  margin: 0 auto;
  min-height: 100vh;
  position: relative;
  transition: 0.5s;
  nav {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    align-items: center;
    width: 50px;
    position: fixed;
    bottom: 50px;
    right: 5vw;
    i,
    a {
      cursor: pointer;
      width: 50px;
      height: 50px;
      text-align: center;
      line-height: 50px;
      background-color: #fff;
      border-radius: 50%;
      font-size: 28px;
      color: #999;
      margin-bottom: 10px;
      &:hover {
        color: rgb(255, 180, 6);
        background-color: #999;
      }
    }
    i.el-icon-back {
      background-color: #ddd;
      &:hover {
        color: orange;
      }
    }
    i.el-icon-edit {
      background-color: rgb(13, 215, 212);
      color: #fff;
      &:hover {
        color: #999;
      }
    }
    i.el-icon-delete {
      background-color: tomato;
      color: #fff;
      &:hover {
        color: #999;
      }
    }
  }
  > header {
    padding: 10px 20px;
    font-weight: bold;
    font-size: 18px;
    color: #fff;
    background-color: rgba($color: #333, $alpha: 0.1);
    margin: 20px 0;
    display: flex;
    justify-content: flex-start;
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
}
</style>
