<template>
  <div class="add">
    <div class="info">
      <el-form :model="form" ref="form" :rules="rules">
        <el-form-item label="" prop="title">
          <el-input v-model="form.title" placeholder="请输入项目名称"></el-input>
        </el-form-item>
        <el-form-item prop="techStack">
          <el-input type="text" v-model="form.techStack" placeholder="请输入项目技术栈"></el-input>
        </el-form-item>
        <el-form-item prop="desc">
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
            <img width="100%" v-src="form.pic" alt="" />
          </el-dialog>
        </el-form-item>
      </el-form>

      <mavon-editor ref="md" v-model="form.content" @imgAdd="handleEditorImgAdd" />
      <el-button type="primary" size="default" @click="addProject">提交</el-button>
    </div>
  </div>
</template>

<script>
import moment from "moment";
import axios from "axios";
export default {
  data() {
    return {
      form: {
        title: "",
        desc: "",
        techStack: "",
        createTime: "",
        content: "",
        pic: "",
      },
      dialogVisible: false,
      // 表单校验规则
      rules: {
        title: [
          { required: true, message: "请输入标题", trigger: "blur" },
          { min: 3, max: 50, message: "长度在 3 到 50 个字符", trigger: "blur" },
        ],

        techStack: [{ required: true, message: "请选择输入技术栈", trigger: "blur" }],
        desc: [{ required: true, message: "请填写描述", trigger: "blur" }],
      },
    };
  },
  methods: {
    handleRemove(file, fileList) {
      console.log(file, fileList);
    },
    handlePictureCardPreview(file) {
      console.log(file);
      this.form.pic = file.response;
      this.dialogVisible = true;
    },
    onSuccess(response, file, fileList) {
      // 图片上传成功,将图片路径返回并保存
      console.log(response);
      this.form.pic = response;
    },
    // md添加图片
    handleEditorImgAdd(pos, $file) {
      var formdata = new FormData();
      formdata.append("imgUpload", $file);
      axios
        .post("http://127.0.0.1:3000/uploadPic", formdata, {
          headers: {
            "Content-Type": "multipart/form-data; boundary=----WebKitFormBoundaryBpq2BI1u5l04wDAq",
            // name: "imgUpload",
          },
        })
        .then(response => {
          console.log(response);
          // 第二步.将返回的url替换到文本原位置![...](0) -> ![...](url)
          if (response.status === 200) {
            var url = "http://127.0.0.1:3000/" + response.data;
            this.$refs.md.$img2Url(pos, url);
          }
        });
    },

    // 添加项目
    addProject() {
      this.form.createTime = moment().format("YYYY-MM-DD");
      if (this.$route.params.pid) {
        this.$api.project.reqUpdateProject(this.form).then(res => {
          if (res.data.code == 200) {
            this.$message.success("修改成功");
            this.$router.back();
          }
        });
      } else {
        this.$api.project.reqAddProject(this.form).then(res => {
          if (res.data.code == 200) {
            this.$message.success("添加成功");
            this.$router.back();
          }
        });
      }
    },
  },
  mounted() {
    if (this.$route.params.pid) {
      this.$api.project.reqGetAPro(this.$route.params.pid).then(res => {
        if (res.data.code == 200) {
          this.form = res.data.data[0];
        }
      });
    }
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
