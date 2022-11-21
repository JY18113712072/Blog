<template>
  <div class="note">
    <a href="" class="add" @click.prevent="$router.push('/addEssay')">记一笔</a>
    <el-timeline>
      <el-timeline-item timestamp="2018-4-12" placement="top" reverse>
        <el-card>
          <h4>更新 Github 模板</h4>
          <p>王小虎 提交于 2018/4/12 20:46</p>
        </el-card>
      </el-timeline-item>
      <el-timeline-item timestamp="2018-4-3" placement="top">
        <el-card>
          <h4>更新 Github 模板</h4>
          <p>王小虎 提交于 2018/4/3 20:46</p>
          <h4>更新 Github 模板</h4>
          <p>王小虎 提交于 2018/4/3 20:46</p>
          <h4>更新 Github 模板</h4>
          <p>王小虎 提交于 2018/4/3 20:46</p>
          <h4>更新 Github 模板</h4>
          <p>王小虎 提交于 2018/4/3 20:46</p>
        </el-card>
      </el-timeline-item>
      <el-timeline-item timestamp="2018-4-8" placement="top">
        <el-card>
          <h4>更新 Github 模板</h4>
          <p>王小虎 提交于 2018/4/2 20:46</p>
        </el-card>
      </el-timeline-item>
      <el-timeline-item timestamp="2018-4-8" placement="top">
        <el-card>
          <h4>更新 Github 模板</h4>
          <p>王小虎 提交于 2018/4/2 20:46</p>
        </el-card>
      </el-timeline-item>
    </el-timeline>
  </div>
</template>

<script>
export default {
  name: "Essay",
};
</script>

<style lang="scss" scoped>
.note {
  box-sizing: border-box;
  min-height: 100vh;
  width: 800px;
  margin: 0 auto;
  padding-top: 100px;
  .add {
    display: block;
    width: 80px;
    height: 30px;
    border: 2px solid orange;
    border-radius: 5px;
    margin-bottom: 20px;
    line-height: 30px;
    text-align: center;
    background-color: rgba($color: #fff, $alpha: 0.6);
    font-size: 14px;
    font-weight: bold;
    color: gold;
  }
  .el-card {
    background-color: rgba($color: #fff, $alpha: 0.8);
    border: 3px solid orange;
    border-radius: 10px;
  }
}
</style>
