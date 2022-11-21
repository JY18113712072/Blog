<template>
  <div class="info">
    <div class="left">
      <el-row :gutter="20">
        <el-col :span="6" :offset="0">Saury</el-col>
        <el-col :span="18" :offset="0">00后</el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="6" :offset="0">毕业院校: </el-col>
        <el-col :span="18" :offset="0">宜宾学院(本科)</el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="6" :offset="0">email: </el-col>
        <el-col :span="18" :offset="0">jinyuan043@163.com</el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="6" :offset="0">现居地: </el-col>
        <el-col :span="18" :offset="0">成都</el-col>
      </el-row>
    </div>
    <div class="right">
      <div class="box">
        <div class="item"><img src="./images/a1.jpg" alt="" /></div>
        <div class="item"><img src="./images/a2.jpg" alt="" /></div>
        <div class="item"><img src="./images/a3.jpg" alt="" /></div>
        <div class="item"><img src="./images/a4.jpg" alt="" /></div>
        <div class="item"><img src="./images/a5.jpg" alt="" /></div>
        <div class="item"><img src="./images/a6.jpg" alt="" /></div>
        <div class="item"><img src="./images/a7.jpg" alt="" /></div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Myinfo",
};
</script>

<style lang="scss" scoped>
.info {
  height: 100%;
  display: flex;
  justify-content: space-between;
  .left {
    box-sizing: border-box;
    padding: 20px;
    width: 40%;
    background-color: rgba($color: #fff, $alpha: 0.7);
    border-radius: 10px;
    .el-row {
      margin-top: 20px;
    }
  }
  .right {
    box-sizing: border-box;
    padding: 20px;
    width: 58%;
    background-color: rgba($color: #fff, $alpha: 0.4);
    border-radius: 10px;
    .box {
      margin: 0 auto;
      display: grid;
      grid-template-rows: repeat(4, 110px);
      grid-template-columns: repeat(6, 95px);

      grid-template-areas:
        "a a a a b b"
        "a a a a c c"
        "d d e e c c"
        "d d f f g g";

      grid-gap: 10px 10px;
    }

    .item img {
      overflow: hidden;
      width: 100%;
    }
    .item {
      overflow: hidden;
    }
    .box div:nth-child(1) {
      grid-column: 1/5;
      grid-row: 1/3;
    }
    .box div:nth-child(2) {
      grid-column: 5/7;
      grid-row: 1/2;
    }
    .box div:nth-child(3) {
      grid-column: 5/7;
      grid-row: 2/4;
    }
    .box div:nth-child(4) {
      grid-column: 1/3;
      grid-row: 3/5;
    }
    .box div:nth-child(5) {
      grid-column: 3/5;
      grid-row: 3/4;
    }
    .box div:nth-child(6) {
      grid-column: 3/5;
      grid-row: 4/5;
    }
    .box div:nth-child(7) {
      grid-column: 5/7;
      grid-row: 4/5;
      img {
        margin-top: -20px;
      }
    }
  }
}
</style>
