<template>
  <div class="welcome">
    <!-- <weather class="weather" /> -->

    <div>
      <div class="title"><span>欢迎来到Sauryの个人博客</span></div>
      <div class="intr"><span>不会打球的前端开发不是一个好摄影师</span></div>
      <div class="go">
        <div @click="$router.push('/me/resume')"><i class="el-icon-tickets"></i><span>查看简历</span></div>

        <div @click="$router.push('/home')"><i class="el-icon-success"></i><span>点击开始</span></div>
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
      letter-spacing: 3px;
      font-size: 20px;
      color: #fff;
    }
    .go {
      cursor: pointer;
      div:hover {
        color: gold;
      }
      margin: 70px;
      font-size: 50px;
      color: #fff;
      display: flex;
      align-items: center;
      justify-content: space-between;
      span {
        margin: 0 10px;
        font-size: 24px;
        line-height: 50px;
      }
      div {
        display: flex;
        justify-content: center;
        align-items: center;
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
