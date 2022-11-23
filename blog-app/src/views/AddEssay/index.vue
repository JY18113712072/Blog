<template>
  <div class="add">
    <div class="info">
      <mavon-editor v-model="content" />
      <el-button type="primary" size="default" @click="addEssay">提交</el-button>
    </div>
  </div>
</template>

<script>
import moment from "moment";
export default {
  data() {
    return {
      content: "",
    };
  },
  methods: {
    addEssay() {
      let form = { createTime: moment().format("YYYY-MM-DD"), content: this.content };
      this.$api.essay.reqAddEssay(form).then(res => {
        if (res.data.code == 200) {
          this.$message.success("添加成功");
          this.$router.back();
        }
      });
    },
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
