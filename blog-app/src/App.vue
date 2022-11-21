<template>
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
};
</script>

<style lang="scss" scoped>
.app {
  // padding-top: 50px;
  background-image: url("./assets/images/app/bgc.jpg");
  background-size: cover;
  background-attachment: fixed;
  background-repeat: no-repeat;
  width: 100vw;
  // height: 100vh;
  display: flex;
  flex-direction: column;
}
</style>
