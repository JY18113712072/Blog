<template>
  <div class="welcome" @dblclick="$router.push('/home')">
    <div class="title"><span>欢迎来到Sauryの个人博客</span></div>
    <div class="intr"><span>新手上路,请多指教</span></div>
    <div class="go"><i class="el-icon-success"></i><span>任意双击开始</span></div>
  </div>
</template>

<script>
export default {
  name: "Welcome",
};
</script>

<style lang="scss" scoped>
.welcome {
  box-sizing: border-box;
  min-height: 92vh;
  margin: 4vh;
  background-color: rgba($color: #eee, $alpha: 0.1);
  border-radius: 20px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: flex-start;
  flex: 1;
  .title {
    padding: 100px 0;
    span {
      display: block;
      width: 600px;
      height: 100px;
      margin: 0 auto;
      border: 2px dotted #fff;
      border-radius: 10px;
      text-align: center;
      line-height: 100px;
      font-size: 40px;
      color: #fff;
      letter-spacing: 6px;
    }
  }
  .intr {
    font-size: 20px;
    color: #ddd;
  }
  .go {
    cursor: pointer;
    &:hover {
      color: gold;
    }
    margin: 50px;
    font-size: 50px;
    color: #ddd;
    display: flex;
    align-items: center;
    span {
      margin: 0 10px;
      font-size: 24px;
      line-height: 50px;
    }
  }
}
</style>
