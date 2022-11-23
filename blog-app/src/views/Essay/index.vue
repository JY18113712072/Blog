<template>
  <div class="essay">
    <a href="" class="add" @click.prevent="$router.push('/addEssay')">记一笔</a>
    <el-timeline>
      <el-timeline-item
        :timestamp="item.createTime"
        placement="top"
        reverse
        v-for="item in essayList"
        :key="item.eid"
      >
        <el-card body-style="padding:0;position:relative">
          <mavon-editor
            :value="item.content"
            defaultOpen="preview"
            :boxShadow="false"
            :editable="false"
            :subfield="false"
            :toolbarsFlag="false"
          >
          </mavon-editor>
          <i class="el-icon-delete" @click="deleteEssay(item.eid)"></i>
        </el-card>
      </el-timeline-item>
    </el-timeline>
  </div>
</template>

<script>
import moment from "moment";
export default {
  name: "Essay",
  data() {
    return {
      essayList: [],
    };
  },
  methods: {
    // 获取随笔
    async getEssay() {
      let res = await this.$api.essay.reqGetEssay();
      res.data.data.forEach(item => {
        item.createTime = moment(item.createTime).format("YYYY-MM-DD");
      });
      this.essayList = res.data.data.reverse();
    },
    // 删除随笔
    deleteEssay(eid) {
      this.$confirm("真的要删除吗?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(() => {
          // 发送请求删除随笔
          this.$api.essay.reqDelEssay(eid).then(res => {
            if (res.data.code == 200) {
              this.$message.success("删除成功啦");
              this.getEssay();
            }
          });
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "已取消删除",
          });
        });
    },
  },
  mounted() {
    this.getEssay();
  },
};
</script>

<style lang="scss" scoped>
.essay {
  box-sizing: border-box;
  min-height: 100vh;
  width: 1000px;
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

.v-note-wrapper {
  min-height: 100px;
}
.el-icon-delete {
  position: absolute;
  top: 10px;
  right: 10px;
  z-index: 10000;
  font-size: 25px;
  width: 40px;
  height: 40px;
  text-align: center;
  line-height: 40px;
  background-color: #999;
  border-radius: 50%;
  color: #fff;
  cursor: pointer;
  &:hover {
    color: gold;
  }
}
</style>
