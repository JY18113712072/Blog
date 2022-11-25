<template>
  <a href="#" class="el-icon-top gotop" v-show="!isTop"></a>
</template>

<script>
export default {
  props: ["isTop"],
};
</script>

<style lang="scss" scoped>
.gotop {
  position: fixed;
  bottom: 50px;
  right: 150px;
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
</style>
