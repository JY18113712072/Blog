<template>
  <div class="home">
    <div class="left">
      <header>
        <span class="title">全部博客</span>
        <div>
          <p>
            共&nbsp;<span>{{ blogList.length }}</span
            >&nbsp;篇
          </p>
          <i class="el-icon-circle-plus-outline" @click="$router.push('/addBlog')"></i>
        </div>
      </header>
      <ul class="list">
        <li v-for="item in blogList" :key="item.bid" @click="goDetail(item.bid)">
          <div class="content">
            <p class="title">## &nbsp; {{ item.title }}</p>
            <p class="spec">
              {{ item.desc }}
            </p>
            <div class="about">
              <div class="left">
                <div class="autor"><img src="./images/a.jpg" alt="" /><span>Saury</span></div>
                <div class="date">
                  <i class="el-icon-date"></i> <span>{{ item.createTime }}</span>
                </div>
                <div class="see">
                  <i class="el-icon-view"></i> <span>{{ item.watch }}</span>
                </div>
              </div>
              <div class="right">
                <el-tag style="margin-right: 5px" type="success" v-for="item in item.tname" :key="item">{{
                  item
                }}</el-tag>
              </div>
            </div>
          </div>
        </li>
      </ul>
    </div>
    <div class="right">
      <div class="category">
        <div class="title">
          <span>分类</span><i class="el-icon-circle-plus-outline" @click="addCategory = true"></i>
        </div>
        <ul>
          <li v-for="item in categoryList" :key="item.cid">
            <img src="./images/a.jpg" alt="" />
            <span>{{ item.cname }}</span>
            <span>{{ item.count }}</span>
          </li>
        </ul>
      </div>
      <div class="tag">
        <div class="title">
          <span>标签</span> <i class="el-icon-circle-plus-outline" @click="addTag = true"></i>
        </div>
        <div class="content">
          <el-tag
            type="success"
            effect="dark"
            v-for="{ tagName } in tagList"
            :key="tagName"
            closable
            :disable-transitions="false"
            @close="deleteTag(tagName)"
          >
            {{ tagName }}
          </el-tag>
        </div>
      </div>
    </div>
    <div class="addCategory">
      <el-dialog title="添加分类" :visible.sync="addCategory" width="30%">
        <el-input v-model="categoryName" placeholder="请输入分类名" size="normal" clearable></el-input>

        <span slot="footer">
          <el-button @click="addCategory = false">取消</el-button>
          <el-button type="primary" @click="handleAddC">确定</el-button>
        </span>
      </el-dialog>
    </div>
    <div class="addTag">
      <el-dialog title="添加标签" :visible.sync="addTag" width="30%">
        <el-input v-model="tagName" placeholder="请输入标签名" size="normal" clearable></el-input>

        <span slot="footer">
          <el-button @click="addTag = false">取消</el-button>
          <el-button type="primary" @click="handleAddT">确定</el-button>
        </span>
      </el-dialog>
    </div>
    <a href="#" class="el-icon-top gotop" v-show="!isTop"></a>
  </div>
</template>

<script>
import moment from "moment";
export default {
  name: "Home",
  data() {
    return {
      // 添加分类弹出表示
      addCategory: false,
      // 添加标签弹出标识
      addTag: false,
      // 添加分类名字
      categoryName: "",
      // 添加标签名字
      tagName: "",
      // 博客列表
      blogList: [],
      // 标签列表
      tagList: [],
      // 分类列表
      categoryList: [],

      // 是否在顶部
      isTop: true,
    };
  },
  methods: {
    // 添加分类回调
    handleAddC() {
      this.addCategory = false;
      this.$api.blog.reqAddCategory({ cname: this.categoryName }).then(res => {
        if (res.data.code == 200) {
          this.$message.success("添加成功");
          this.getCategory();
        }
      });
    },
    // 添加标签回调
    handleAddT() {
      this.addTag = false;
      this.$api.blog.reqAddTag({ tagName: this.tagName }).then(res => {
        if (res.data.code == 200) {
          this.$message.success("添加成功");
          this.getTag();
        }
      });
    },
    // 删除标签的回调
    deleteTag(tname) {
      this.$confirm("真的要删除标签吗?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(() => {
          // 发送请求删除博客
          this.$api.blog.reqDeleteTag(tname).then(res => {
            if (res.data.code == 200) {
              // 删除成功跳转回首页
              this.$message.success("删除成功啦");
              this.getTag();
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
    // 获取博客数据回调
    async getBlog() {
      let { data } = await this.$api.blog.reqGetBlog();
      data.data.forEach(item => {
        item.createTime = moment(item.createTime).format("YYYY-MM-DD");
        if (item.tname) {
          item.tname = JSON.parse(item.tname);
        }
      });
      this.blogList = data.data.reverse();
    },
    // 获取标签
    async getTag() {
      let { data } = await this.$api.blog.reqGetTag();
      this.tagList = data.data;
    },
    // 获取分类
    async getCategory() {
      let { data } = await this.$api.blog.reqGetCategory();
      this.categoryList = data.data;
    },
    // 查看博客详情
    goDetail(bid) {
      this.$router.push(`blogDetail/${bid}`);
    },
  },
  mounted() {
    this.getBlog();
    this.getTag();
    this.getCategory();

    // 绑定滚动监听事件，滚动到顶部时不显示按钮
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
.home {
  box-sizing: border-box;
  min-height: 100vh;
  background-color: transparent;
  width: 1000px;
  margin: 0 auto;
  display: flex;
  justify-content: space-between;
  padding-top: 100px;
  padding-bottom: 20px;
  position: relative;
  > .left {
    width: 75%;
    background-color: rgba($color: #fff, $alpha: 0.8);
    border-radius: 10px;

    header {
      padding: 10px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      height: 30px;
      font-weight: bold;
      div {
        display: flex;
        align-items: center;
        p {
          span {
            color: rgb(214, 183, 6);
          }
        }
        i {
          &:hover {
            color: gold;
          }
          cursor: pointer;
          font-size: 24px;
          color: #999;
          margin-left: 10px;
          margin-bottom: -2px;
        }
      }
    }
    .list {
      li {
        border-top: 1px solid rgba($color: #999, $alpha: 0.5);
        padding: 20px 10px;
        cursor: pointer;
        .content {
          margin-left: 10px;
          .title {
            color: #333;
            cursor: pointer;
            font-weight: bold;
            &:hover {
              color: gold;
            }
          }
          .spec {
            margin: 20px 0;
            font-size: 14px;
            color: #666;
          }
          .about {
            width: 100%;
            display: flex;
            justify-content: space-between;
            .left {
              display: flex;
              align-items: center;
              .autor {
                cursor: pointer;

                display: flex;
                align-items: center;
                margin-right: 10px;
                > img {
                  border-radius: 50%;
                  width: 20px;
                }
                span {
                  font-size: 14px;
                  margin-left: 5px;
                  color: rgb(59, 158, 197);
                  &:hover {
                    color: gold;
                  }
                }
              }
              .date {
                font-size: 12px;
                color: #666;
                margin-right: 10px;
              }
              .see {
                font-size: 12px;
                color: #666;
                margin-right: 10px;
              }
            }
            .right {
              .el-tag {
                cursor: pointer;
                &:hover {
                  color: gold;
                }
              }
            }
          }
        }
      }
    }
  }
  > .right {
    width: 23%;
    .category {
      background-color: rgba($color: #fff, $alpha: 0.7);
      border-radius: 10px;
      padding: 10px;
      margin-bottom: 20px;
      .title {
        font-weight: bold;
        display: flex;
        align-items: center;
        justify-content: space-between;
        i {
          cursor: pointer;
          font-size: 22px;
          color: #999;
          &:hover {
            color: gold;
          }
        }
      }
      ul {
        li {
          &:hover {
            color: gold;
          }
          cursor: pointer;
          display: flex;
          align-items: center;

          padding: 10px 10px;
          border-bottom: 1px solid rgba($color: #666, $alpha: 0.5);
          span {
            font-size: 14px;
          }
          img {
            width: 20px;
            margin-right: 10px;
            border-radius: 50%;
          }
          span:last-child {
            margin-left: auto;
          }
        }
      }
    }
    .tag {
      background-color: rgba($color: #fff, $alpha: 0.7);
      border-radius: 10px;
      padding: 10px;
      .title {
        font-weight: bold;
        display: flex;
        align-items: center;
        justify-content: space-between;
        i {
          cursor: pointer;
          font-size: 22px;
          color: #999;
          &:hover {
            color: gold;
          }
        }
      }
      .content {
        display: flex;
        flex-wrap: wrap;
        margin-top: 10px;
        .el-tag {
          &:hover {
            color: gold;
          }
          cursor: pointer;
          margin: 0 10px 10px 0;
        }
      }
    }
  }
  .gotop {
    position: fixed;
    bottom: 50px;
    right: 50px;
    cursor: pointer;
    width: 50px;
    height: 50px;
    text-align: center;
    line-height: 50px;
    background-color: #fff;
    border-radius: 50%;
    font-size: 28px;
    color: #999;
    &:hover {
      color: rgb(255, 180, 6);
      background-color: #999;
    }
  }
}
</style>
