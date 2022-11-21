<template>
  <div class="project">
    <header>
      <span>我的项目</span><i class="el-icon-circle-plus-outline" @click="$router.push('/addProject')"></i>
    </header>
    <div class="pros">
      <div class="pic"><img src="./images/1.jpg" alt="" /></div>
      <div class="content">
        <div class="title">Vue后台管理</div>
        <div class="spec">
          实现了一个简单的个人博客系统，技术栈为后端SpringBoot+JPA+MySQL,前端Vue+ElementUI+Echarts系统分为前台展示和后台管理两个部分，前台部分主要分为了引导页，首页，随笔，项目，留言和关于我页面，使用响应式布局，能够自适应移动端，后台有首页，博客管理，撰写博客，用户管理，分类管理，标签管理，评论管理，随笔管理，项目管理，个人中心，图片管理。
        </div>
        <div class="tech">vue、vue-router、vuex</div>
      </div>
    </div>

    <header><span>小练习</span><i class="el-icon-circle-plus-outline"></i></header>
    <div class="practice">
      <div class="card">
        <img src="./images/3.png" alt="" />
        <p class="title">个人简历</p>
      </div>
      <div class="card">
        <img src="./images/3.png" alt="" />
        <p class="title">个人简历</p>
      </div>

      <div class="card">
        <img src="./images/3.png" alt="" />
        <p class="title">个人简历</p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Welcome",
};
</script>

<style lang="scss" scoped>
.project {
  box-sizing: border-box;
  width: 800px;
  min-height: 100vh;
  margin: 0 auto;
  padding-top: 50px;
  header {
    padding: 10px 20px;
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
  .pros {
    width: 600px;
    height: 160px;
    margin: 0 auto 15px;
    background-color: #fff;
    display: flex;

    .pic {
      margin-right: 20px;
      height: 160px;
      img {
        height: 100%;
      }
    }
    .content {
      padding: 15px 10px 10px 0;
      font-size: 12px;
      color: #555;
      .title {
        font-size: 16px;
        font-weight: bold;
      }
      .spec {
        margin: 15px 0;

        display: -webkit-box; //将对象作为弹性伸缩盒子模型显示
        -webkit-box-orient: vertical; //设置或检索伸缩盒对象的子元素的排列方式
        -webkit-line-clamp: 3; //一个块元素显示的文本的行数
        overflow: hidden;
      }
    }
  }
  .practice {
    width: 600px;
    margin: 0 auto;
    display: flex;
    padding-bottom: 20px;
    flex-wrap: wrap;
    justify-content: space-between;
    .card {
      width: 150px;
      height: 170px;
      position: relative;
      margin-right: 20px;
      margin-bottom: 20px;
      img {
        width: 100%;
      }
      .title {
        box-sizing: border-box;
        background-color: rgba($color: #999, $alpha: 0.7);
        color: gold;
        font-size: 14px;
        padding: 7px;
        position: absolute;
        bottom: 0;
        left: 0;
        right: 0;
      }
    }
  }
}
</style>
