<template>
  <div class="login">
    <div class="main">
      <img src="./images/a.jpg" alt="" @click="$router.push('/home')" />
      <el-form :model="form" ref="form" :rules="rules" :inline="false" size="normal">
        <el-form-item label="" prop="uname">
          <el-input v-model="form.uname" placeholder="请输入用户名"></el-input>
        </el-form-item>
        <el-form-item label="" prop="upwd">
          <el-input v-model="form.upwd" type="password" placeholder="请输入密码"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="onSubmit">Login</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
export default {
  name: "Login",
  data() {
    return {
      form: {
        uname: "",
        upwd: "",
      },
      rules: {
        uname: [
          { required: true, message: "名字都不记得了?", trigger: "blur" },
          { min: 3, max: 5, message: "长度在 3 到 5 个字符", trigger: "blur" },
        ],
        upwd: [{ required: true, message: "给LZ输密码", trigger: "change" }],
      },
    };
  },
  methods: {
    onSubmit() {},
  },
};
</script>

<style lang="scss" scoped>
.login {
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;

  .main {
    padding: 20px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    background-color: rgba($color: #fff, $alpha: 0.4);
    border-radius: 10px;

    img {
      width: 100px;
      border-radius: 50%;
      margin-bottom: 10px;
      cursor: pointer;
    }
    .el-form {
      border-radius: 10px;
      width: 500px;
      text-align: center;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      .el-form-item {
        width: 300px;
      }
    }
  }
}
</style>
