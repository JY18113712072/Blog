<template>
  <div class="add">
    <div class="info">
      <mavon-editor v-model="content" />
      <el-button type="primary" size="default" @click="">提交</el-button>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      content: "",
    };
  },
};
</script>

<style lang="scss" scoped>
.add {
  padding-top: 60px;
  box-sizing: border-box;
  width: 1200px;
  min-height: 100vh;
  margin: 0 auto;
  .info {
    border-radius: 10px;
    background-color: rgba($color: #fff, $alpha: 0.7);
    padding: 30px;

    .el-button {
      display: block;
      margin-left: auto;
      margin-right: 20px;
      margin-top: 20px;
    }
  }
}
</style>
