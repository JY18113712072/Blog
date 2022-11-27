<template>
  <div class="add">
    <div class="info">
      <mavon-editor v-model="content" ref="md" @imgAdd="handleEditorImgAdd" style="z-index: 10000" />
      <el-button type="primary" size="default" @click="addEssay">提交</el-button>
    </div>
  </div>
</template>

<script>
import moment from "moment";
import axios from "axios";
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
    // md添加图片
    handleEditorImgAdd(pos, $file) {
      var formdata = new FormData();
      formdata.append("imgUpload", $file);
      axios
        .post(this.$url + "uploadPic", formdata, {
          headers: {
            "Content-Type": "multipart/form-data; boundary=----WebKitFormBoundaryBpq2BI1u5l04wDAq",
            // name: "imgUpload",
          },
        })
        .then(response => {
          console.log(response);
          // 第二步.将返回的url替换到文本原位置![...](0) -> ![...](url)
          if (response.status === 200) {
            var url = this.$url + response.data;
            this.$refs.md.$img2Url(pos, url);
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
