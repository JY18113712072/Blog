<template>
  <div class="login">
    <div class="main">
      <img src="./images/a.jpg" alt="" @click="$router.push('/home')" />
      <el-form :model="form" ref="form" :rules="rules" :inline="false" size="normal">
        <el-form-item label="" prop="uname">
          <el-input v-model="form.uname" placeholder="请输入用户名"></el-input>
        </el-form-item>
        <el-form-item label="" prop="upwd">
          <el-input
            v-model="form.upwd"
            type="password"
            placeholder="请输入密码"
            @keyup.enter.native="onSubmit"
          ></el-input>
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
          { min: 1, max: 10, message: "长度在 1 到 10 个字符", trigger: "blur" },
        ],
        upwd: [{ required: true, message: "给LZ输密码", trigger: "change" }],
      },
    };
  },
  methods: {
    onSubmit() {
      if (this.form.uname === "saury" && this.form.upwd === "saury") {
        this.$store.commit("Login");
        localStorage.setItem("token", JSON.stringify({ uname: "saury" }));
        this.$message.success("登录成功");
        this.$router.push("/home");
      } else {
        this.$message.error("登录失败,账号或密码错误");
      }
    },
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
