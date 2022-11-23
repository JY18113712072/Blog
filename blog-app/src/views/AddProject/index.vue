<template>
  <div class="add">
    <div class="info">
      <el-form :model="form" ref="form" :rules="rules">
        <el-form-item label="">
          <el-input v-model="form.title" placeholder="请输入项目名称"></el-input>
        </el-form-item>
        <el-form-item>
          <el-input type="text" v-model="form.desc" placeholder="请输入项目技术栈"></el-input>
        </el-form-item>
        <el-form-item>
          <el-input type="textarea" v-model="form.desc" placeholder="简单描述一下吧"></el-input>
        </el-form-item>
        <el-form-item>
          <el-upload
            action="http://127.0.0.1:3000/uploadPic"
            list-type="picture-card"
            name="imgUpload"
            :on-preview="handlePictureCardPreview"
            :on-remove="handleRemove"
            :on-success="onSuccess"
          >
            <i class="el-icon-plus"></i>
          </el-upload>
          <el-dialog :visible.sync="dialogVisible">
            <img width="100%" :src="form.pid" alt="" />
          </el-dialog>
        </el-form-item>
      </el-form>

      <mavon-editor v-model="form.content" />
      <el-button type="primary" size="default" @click="">提交</el-button>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      form: {
        title: "",
        desc: "",
        technologyStack: "",
        createTime: "",
        content: "",
        pic: "",
      },
      dialogVisible: false,
    };
  },
  methods: {
    handleRemove(file, fileList) {
      console.log(file, fileList);
    },
    handlePictureCardPreview(file) {
      console.log(file);
      this.dialogImageUrl = file.url;
      this.dialogVisible = true;
    },
    onSuccess(response, file, fileList) {
      // 图片上传成功,将图片路径返回并保存
      console.log(response);
      this.form.pic = response;
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
    .el-form {
      width: 600px;
    }
    .el-button {
      display: block;
      margin-left: auto;
      margin-right: 20px;
      margin-top: 20px;
    }
  }
}
</style>
