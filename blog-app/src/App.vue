<template>
  <!-- :style="{ backgroundImage: `url(${require(`@/assets/images/app/${img}.jpg`)})` }" -->
  <div class="app">
    <Header v-show="!$route.meta.hideHeader"></Header>
    <router-view></router-view>
  </div>
</template>

<script>
import Header from "@/components/Header";
export default {
  name: "App",
  components: {
    Header,
  },
  computed: {
    // 随机壁纸
    img() {
      return Math.ceil(Math.random() * 12);
    },
  },
};
</script>

<style lang="scss" scoped>
.app {
  box-sizing: border-box;
  overflow: hidden;
  background-image: url("./assets/images/app/1.jpg");
  background-size: cover;
  background-attachment: fixed;
  background-repeat: no-repeat;
  width: 100vw;
  // height: 100vh;
  // display: flex;
  // flex-direction: column;
}
</style>
