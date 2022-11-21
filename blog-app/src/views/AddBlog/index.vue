<template>
  <div class="add">
    <div class="info">
      <el-form :model="form" ref="form" :rules="rules">
        <el-form-item label="">
          <el-input v-model="form.title" placeholder="请输入博客标题"></el-input>
        </el-form-item>

        <el-form-item>
          <el-input type="textarea" v-model="form.desc" placeholder="简单描述一下吧"></el-input>
        </el-form-item>
        <el-form-item>
          <el-select v-model="form.category" placeholder="请选择分类">
            <el-option :label="Vue" :value="vue"> Vue</el-option>
            <el-option :label="aa" :value="aa"> aa</el-option>
            <el-option :label="aa" :value="aa"> aa</el-option>
          </el-select>
        </el-form-item>
        <el-form-item>
          <el-upload
            action="https://jsonplaceholder.typicode.com/posts/"
            list-type="picture-card"
            :on-preview="handlePictureCardPreview"
            :on-remove="handleRemove"
          >
            <i class="el-icon-plus"></i>
          </el-upload>
          <el-dialog :visible.sync="dialogVisible">
            <img width="100%" :src="dialogImageUrl" alt="" />
          </el-dialog>
        </el-form-item>
        <el-form-item>
          <el-checkbox-group v-model="form.tag">
            <el-checkbox label="Vue" name="type"></el-checkbox>
            <el-checkbox label="React" name="type"></el-checkbox>
            <el-checkbox label="Javascript" name="type"></el-checkbox>
            <el-checkbox label="html" name="type"></el-checkbox>
          </el-checkbox-group>
        </el-form-item>
      </el-form>

      <mavon-editor v-model="content" />
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
        category: "",
        tag: [],
        createTime: "",
        content: "",
      },
      dialogImageUrl: "",
      dialogVisible: false,
    };
  },
  methods: {
    handleRemove(file, fileList) {
      console.log(file, fileList);
    },
    handlePictureCardPreview(file) {
      this.dialogImageUrl = file.url;
      this.dialogVisible = true;
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
