<template>
  <div class="add" ref="blog">
    <div class="info">
      <el-form :model="form" ref="form" :rules="rules">
        <el-form-item label="" prop="title">
          <el-input v-model="form.title" placeholder="请输入博客标题"></el-input>
        </el-form-item>

        <el-form-item prop="desc">
          <el-input type="textarea" v-model="form.desc" placeholder="简单描述一下吧"></el-input>
        </el-form-item>
        <el-form-item prop="category">
          <el-select v-model="form.cid" placeholder="请选择分类">
            <el-option :label="cname" :value="cid" v-for="{ cid, cname } in categoryList" :key="cid">
            </el-option>
          </el-select>
        </el-form-item>

        <el-form-item prop="tag">
          <el-checkbox-group v-model="form.tname">
            <el-checkbox
              :label="tagName"
              name="tag"
              v-for="{ tagName } in tagList"
              :key="tagName"
            ></el-checkbox>
          </el-checkbox-group>
        </el-form-item>
      </el-form>

      <mavon-editor
        ref="md"
        v-model="form.content"
        @imgAdd="handleEditorImgAdd"
        @imgDel="handleEditorImgDel"
      />
      <el-button type="primary" size="default" @click="onsubmit">提交</el-button>
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
        cid: "",
        tname: [],
        createTime: "",
        content: "",
      },
      // 表单校验规则
      rules: {
        title: [
          { required: true, message: "请输入标题", trigger: "blur" },
          { min: 3, max: 50, message: "长度在 3 到 50 个字符", trigger: "blur" },
        ],

        category: [{ required: true, message: "请选择分类", trigger: "blur" }],
        desc: [{ required: true, message: "请填写描述", trigger: "blur" }],
      },
      tagList: [],
      categoryList: [],
      isTop: true,
    };
  },
  methods: {
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
    handleEditorImgDel(pos) {},

    // 获取标签
    async getTag() {
      let { data } = await this.$api.blog.reqGetTag();
      this.tagList = data.data;
    },
    // 获取分类
    async getCategory() {
      let { data } = await this.$api.blog.reqGetCategory();
      this.categoryList = data.data;
    },
    // 提交博客
    async onsubmit() {
      // 天添加时间
      this.form.createTime = moment().format("YYYY-MM-DD");
      this.form.tname = JSON.stringify(this.form.tname);
      // 如果路由存在bid就是更新
      if (this.$route.params.bid) {
        // 发送请求
        let { data } = await this.$api.blog.reqUpdataBlog(this.form);
        // 弹出提示
        if (data.code == 200) {
          this.$router.back();
          this.$message.success("修改成功");
        } else {
          this.$message.error("修改失败");
        }
      } else {
        // 发送请求添加
        let { data } = await this.$api.blog.reqAddBlog(this.form);
        // 弹出提示
        if (data.code == 200) {
          this.$router.back();
          this.$message.success("添加成功");
        } else {
          this.$message.error("添加失败");
        }
      }
    },
    //
    goBottom() {
      console.log(window);
      console.dir(this.$refs.blog);
      // window.scrollTop = this.$refs.blog.clientHeight;
    },
  },
  mounted() {
    if (this.$route.params.bid) {
      this.$api.blog.reqGetABlog(this.$route.params.bid).then(res => {
        let result = res.data.data[0];
        result.tname = JSON.parse(result.tname);
        this.form = result;
      });
    }
    this.getCategory();
    this.getTag();

    // 绑定滚动监听事件，滚动到顶部时不显示按钮
    window.onscroll = () => {
      if (window.scrollY === 0) {
        this.isTop = true;
      } else {
        this.isTop = false;
      }
    };
  },
};
</script>

<style lang="scss" scoped>
.add {
  padding-top: 80px;
  box-sizing: border-box;
  width: 1200px;
  min-height: 100vh;
  margin: 0 auto;
  position: relative;
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
