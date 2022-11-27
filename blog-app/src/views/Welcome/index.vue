<template>
  <div class="welcome">
    <!-- <weather class="weather" /> -->

    <div>
      <div class="title"><span>欢迎来到Sauryの个人博客</span></div>
      <div class="intr"><span>新手上路,请多指教</span></div>
      <div class="go" @click="$router.push('/home')">
        <i class="el-icon-success"></i><span>点击开始</span>
      </div>
    </div>
  </div>
</template>

<script>
import Weather from "@/components/Weather";
export default {
  name: "Welcome",
  components: {
    Weather,
  },
};
</script>

<style lang="scss" scoped>
.welcome {
  animation: go 2s infinite;
  box-sizing: border-box;
  min-height: 92vh;
  margin: 4vh;
  background-color: rgba($color: #eee, $alpha: 0.1);
  border-radius: 20px;
  display: flex;
  justify-content: center;
  flex: 1;
  position: relative;
  > div {
    text-align: center;
    // margin-right: 100px;
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
      justify-content: center;
      span {
        margin: 0 10px;
        font-size: 24px;
        line-height: 50px;
      }
    }
  }

  .weather {
    padding-top: 70px;
    padding-left: 30px;
  }
}

@keyframes go {
  from {
    transform: translate(0);
  }
  to {
    transform: translateY(-10px);
  }
}
</style>
