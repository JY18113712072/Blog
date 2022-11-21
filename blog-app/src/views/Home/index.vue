<template>
  <div class="home">
    <div class="left">
      <header>
        <span class="title">全部博客</span>
        <div>
          <p>共&nbsp;<span>93</span>&nbsp;篇</p>
          <i class="el-icon-circle-plus-outline" @click="$router.push('/addBlog')"></i>
        </div>
      </header>
      <ul class="list">
        <li>
          <div class="pic"><img src="./images/1.jpg" alt="" /></div>
          <div class="content">
            <p class="title">##餐厅经营模拟实战游戏</p>
            <p class="spec">
              随机二次元背景，透明菜单栏，环绕边框动画，动态简介，动态下拉按钮。点击顶部半透明导航栏相应菜单可进行页面切换，博客搜索，用户登录和注册
            </p>
            <div class="about">
              <div class="left">
                <div class="autor"><img src="./images/a.jpg" alt="" /><span>Saury</span></div>
                <div class="date"><i class="el-icon-date"></i> <span>2022-11-11</span></div>
                <div class="see"><i class="el-icon-view"></i> <span>200</span></div>
              </div>
              <div class="right">
                <el-tag type="success">web钱盾</el-tag>
              </div>
            </div>
          </div>
        </li>
        <li>
          <div class="pic"><img src="./images/1.jpg" alt="" /></div>
          <div class="content">
            <p class="title">##餐厅经营模拟实战游戏</p>
            <p class="spec">
              随机二次元背景，透明菜单栏，环绕边框动画，动态简介，动态下拉按钮。点击顶部半透明导航栏相应菜单可进行页面切换，博客搜索，用户登录和注册
            </p>
            <div class="about">
              <div class="left">
                <div class="autor"><img src="./images/a.jpg" alt="" /><span>Saury</span></div>
                <div class="date"><i class="el-icon-date"></i> <span>2022-11-11</span></div>
                <div class="see"><i class="el-icon-view"></i> <span>200</span></div>
              </div>
              <div class="right">
                <el-tag type="success">web钱盾</el-tag>
              </div>
            </div>
          </div>
        </li>
        <li>
          <div class="pic"><img src="./images/1.jpg" alt="" /></div>
          <div class="content">
            <p class="title">##餐厅经营模拟实战游戏</p>
            <p class="spec">
              随机二次元背景，透明菜单栏，环绕边框动画，动态简介，动态下拉按钮。点击顶部半透明导航栏相应菜单可进行页面切换，博客搜索，用户登录和注册
            </p>
            <div class="about">
              <div class="left">
                <div class="autor"><img src="./images/a.jpg" alt="" /><span>Saury</span></div>
                <div class="date"><i class="el-icon-date"></i> <span>2022-11-11</span></div>
                <div class="see"><i class="el-icon-view"></i> <span>200</span></div>
              </div>
              <div class="right">
                <el-tag type="success">web钱盾</el-tag>
              </div>
            </div>
          </div>
        </li>
        <li>
          <div class="pic"><img src="./images/1.jpg" alt="" /></div>
          <div class="content">
            <p class="title">##餐厅经营模拟实战游戏</p>
            <p class="spec">
              随机二次元背景，透明菜单栏，环绕边框动画，动态简介，动态下拉按钮。点击顶部半透明导航栏相应菜单可进行页面切换，博客搜索，用户登录和注册
            </p>
            <div class="about">
              <div class="left">
                <div class="autor"><img src="./images/a.jpg" alt="" /><span>Saury</span></div>
                <div class="date"><i class="el-icon-date"></i> <span>2022-11-11</span></div>
                <div class="see"><i class="el-icon-view"></i> <span>200</span></div>
              </div>
              <div class="right">
                <el-tag type="success">web钱盾</el-tag>
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
          <li>
            <img src="./images/a.jpg" alt="" />
            <span>数据结构</span>
            <span>55</span>
          </li>
          <li>
            <img src="./images/a.jpg" alt="" />
            <span>数据结构</span>
            <span>55</span>
          </li>
          <li>
            <img src="./images/a.jpg" alt="" />
            <span>数据结构</span>
            <span>55</span>
          </li>
          <li>
            <img src="./images/a.jpg" alt="" />
            <span>数据结构</span>
            <span>55</span>
          </li>
        </ul>
      </div>
      <div class="tag">
        <div class="title">
          <span>标签</span> <i class="el-icon-circle-plus-outline" @click="addTag = true"></i>
        </div>
        <div class="content">
          <el-tag type="success" effect="dark"> web钱盾 </el-tag>
          <el-tag type="success" effect="dark"> 数据机构 </el-tag>
          <el-tag type="success" effect="dark"> Java开发 </el-tag>
          <el-tag type="success" effect="dark"> 数据库 </el-tag>
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
  </div>
</template>

<script>
export default {
  name: "Home",
  data() {
    return {
      addCategory: false,
      addTag: false,
      categoryName: "",
      tagName: "",
    };
  },
  methods: {
    handleAddC() {
      this.addCategory = false;
    },
    handleAddT() {
      this.addTag = false;
    },
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
        display: flex;

        .pic {
          cursor: pointer;
          display: flex;
          align-items: flex-start;
          > img {
            border-radius: 7px;

            width: 200px;
          }
        }
        .content {
          margin-left: 10px;
          .title {
            color: #333;
            cursor: pointer;
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

          padding: 10px 0;
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
}
</style>
