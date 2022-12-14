<template>
  <div class="home">
    <keep-alive>
      <Weather />
    </keep-alive>
    <div class="left">
      <header>
        <span class="title">全部博客</span>
        <div>
          <p>
            共&nbsp;<span>{{ blogList.length }}</span
            >&nbsp;篇
          </p>
          <i
            class="el-icon-circle-plus-outline"
            @click="$router.push('/addBlog')"
            v-if="$store.state.token"
          ></i>
        </div>
      </header>
      <ul class="list">
        <li v-show="blogList.length == 0">此标签还没有数据哦~</li>
        <li v-for="item in blogList" :key="item.bid" @click="goDetail(item.bid)">
          <div class="content">
            <p class="title">## &nbsp; {{ item.title }}</p>
            <p class="spec">&nbsp;&nbsp;&nbsp;{{ item.desc }}</p>
            <div class="about">
              <div class="left">
                <div class="autor" @click="$router.push('/me/myInfo')">
                  <img src="./images/a.jpg" alt="" /><span>Saury</span>
                </div>
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
          <span>分类</span
          ><i class="el-icon-circle-plus-outline" @click="addCategory = true" v-if="$store.state.token"></i>
        </div>
        <ul>
          <li @click="blogList = $store.state.blogList">
            <div class="l1">
              <img src="./images/logo.png" alt="" />
              <span> 所有分类 </span>
            </div>
            <div class="l2">
              <span>{{ $store.state.blogList.length }}</span>
            </div>
          </li>
          <li v-for="item in categoryList" :key="item.cid">
            <div class="l1" @click="checkcategory(item.cid)">
              <img src="./images/logo1.png" alt="" />
              <span>{{ item.cname }}</span>
            </div>
            <div class="l2">
              <span>{{ item.count }}</span>
              <i class="el-icon-delete" @click="deleteCategory(item.cid)" v-if="$store.state.token"></i>
            </div>
          </li>
        </ul>
      </div>
      <div class="tag">
        <div class="title">
          <span>标签</span>
          <i class="el-icon-circle-plus-outline" @click="addTag = true" v-if="$store.state.token"></i>
        </div>
        <div class="content">
          <el-tag
            type="success"
            effect="light"
            :disable-transitions="false"
            @click="blogList = $store.state.blogList"
          >
            All
          </el-tag>
          <el-tag
            :type="tagColor[index % 4]"
            effect="light"
            v-for="({ tagName }, index) in tagList"
            :key="tagName"
            :closable="Boolean($store.state.token)"
            :disable-transitions="false"
            @close="deleteTag(tagName)"
            @click.native="checkTag(tagName)"
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
          <el-button @click="cancelAdd">取消</el-button>
          <el-button type="primary" @click="handleAddC">确定</el-button>
        </span>
      </el-dialog>
    </div>
    <div class="addTag">
      <el-dialog title="添加标签" :visible.sync="addTag" width="30%">
        <el-input v-model="tagName" placeholder="请输入标签名" size="normal" clearable></el-input>

        <span slot="footer">
          <el-button @click="cancelAdd">取消</el-button>
          <el-button type="primary" @click="handleAddT">确定</el-button>
        </span>
      </el-dialog>
    </div>
    <GoTop :isTop="isTop" />
  </div>
</template>

<script>
import moment from "moment";
import GoTop from "@/components/GoTop";
import Weather from "@/components/Weather";
export default {
  name: "Home",
  components: {
    GoTop,
    Weather,
  },
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
      blogList: this.$store.state.blogList,

      // 标签列表
      tagList: [],
      // 分类列表
      categoryList: [],
      // 是否在顶部
      isTop: true,
      // tag的颜色
      tagColor: ["", "info", "warning", "danger"],
    };
  },

  methods: {
    // 添加分类回调
    handleAddC() {
      this.addCategory = false;
      this.$api.blog.reqAddCategory({ cname: this.categoryName }).then(res => {
        if (res.data.code == 200) {
          this.$message.success("添加成功");
          this.categoryName = "";
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
          this.tagName = "";
          this.getTag();
        }
      });
    },
    // 取消添加
    cancelAdd() {
      this.addTag = false;
      this.addCategory = false;
      this.tagName = "";
      this.categoryName = "";
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
          do {
            item.tname = JSON.parse(item.tname);
          } while (!item.tname instanceof Array);
        }
      });
      this.$store.commit("SaveBlogList", data.data);
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
    // 删除分类
    deleteCategory(cid) {
      this.$confirm("确定删除分类吗?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(() => {
          this.$api.blog.reqDelCategory(cid).then(res => {
            if (res.data.code == 200) {
              this.$message({
                type: "success",
                message: "删除成功!",
              });
              this.getCategory();
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
    // 选择分类
    checkcategory(cid) {
      this.blogList = this.$store.state.blogList.filter(item => {
        return item.cid == cid;
      });
    },
    // 查看博客详情
    goDetail(bid) {
      this.$router.push(`blogDetail/${bid}`);
    },
    // 点击标签
    checkTag(tagName) {
      this.blogList = this.$store.state.blogList.filter(item => {
        return item.tname.includes(tagName);
      });
    },
    //
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

<
<style lang="scss" scoped>
.home {
  box-sizing: border-box;
  min-height: 100vh;
  background-color: transparent;
  width: 1300px;
  margin: 0 auto;
  display: flex;
  justify-content: space-between;
  padding-top: 100px;
  padding-bottom: 20px;
  position: relative;
  > .left {
    width: 56%;
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
        border-top: 1px solid rgba($color: #999, $alpha: 0.7);
        padding: 20px 10px;
        cursor: pointer;
        .content {
          margin-left: 10px;
          .title {
            color: #333;
            font-size: 18px;
            cursor: pointer;
            font-weight: bold;
            &:hover {
              color: gold;
            }
          }
          .spec {
            box-sizing: border-box;
            padding-right: 40px;
            margin: 20px 0;
            font-size: 16px;
            color: #555;
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
                  font-size: 16px;
                  margin-left: 5px;
                  color: rgb(59, 158, 197);
                  &:hover {
                    color: gold;
                  }
                }
              }
              .date {
                font-size: 14px;
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
                font-size: 14px;
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
    width: 20%;
    .category {
      background-color: rgba($color: #fff, $alpha: 0.8);
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
          cursor: pointer;
          display: flex;
          align-items: center;
          justify-content: space-between;
          padding: 10px;
          border-bottom: 1px solid rgba($color: #666, $alpha: 0.5);
          span {
            font-size: 14px;
          }
          img {
            width: 20px;
            margin-right: 10px;
            border-radius: 50%;
          }
          div {
            display: flex;
            align-items: center;
          }
          div:first-child {
            font-weight: bold;
            span:hover {
              color: orange;
            }
          }
          div:last-child {
            span {
              font-weight: bold;

              margin-right: 20px;
            }
            i {
              cursor: pointer;
              width: 30px;
              height: 30px;
              line-height: 30px;
              text-align: center;
              color: red;
              border-radius: 50%;
              background-color: #eee;
              &:hover {
                color: gold;
              }
            }
          }
        }
      }
    }
    .tag {
      background-color: rgba($color: #fff, $alpha: 0.8);
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
          font-weight: bold;
        }
      }
    }
  }
}
</style>
