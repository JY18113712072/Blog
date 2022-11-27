<template>
  <div class="note">
    <div class="add">
      <header>
        <i class="el-icon-user-solid" />
        <span>匿名用户</span>
      </header>
      <textarea
        v-model="content"
        name="note"
        cols="90"
        rows="4"
        class="content"
        wrap="hard"
        required
        placeholder="想说啥快说,我待会儿来看...."
      ></textarea>
      <a href="" @click.prevent="addNote">发表</a>
    </div>
    <ul class="show">
      <li v-for="item in noteList" :key="item.nid">
        <i class="el-icon-s-custom" />
        <div>
          <div>
            <span>匿名用户</span> <span>{{ item.createTime }}</span>
          </div>
          <p>{{ item.content }}</p>
        </div>
        <i class="el-icon-delete" @click="deleteNote(item.nid)" v-if="$store.state.token"></i>
      </li>
    </ul>
  </div>
</template>

<script>
import moment from "moment";
export default {
  name: "Welcome",
  data() {
    return {
      noteList: [],
      content: "",
    };
  },
  methods: {
    // 删除留言
    deleteNote(nid) {
      this.$confirm("确定删除吗?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(() => {
          this.$api.note.reqDelNote(nid).then(res => {
            if (res.data.code == 200) {
              this.$message({
                type: "success",
                message: "删除成功!",
              });
              this.getNote();
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
    // 添加留言
    addNote() {
      let form = { createTime: moment().format("YYYY-MM-DD"), content: this.content };
      this.$api.note.reqAddNote(form).then(res => {
        if (res.data.code == 200) {
          this.content = "";
          this.$message.success("发表成功");
          this.getNote();
        }
      });
    },
    // 获取留言
    async getNote() {
      let res = await this.$api.note.reqGetNote();
      if (res.data.code == 200) {
        res.data.data.forEach(item => {
          item.createTime = moment(item.createTime).format("YYYY-MM-DD");
        });
        this.noteList = res.data.data.reverse();
      }
    },
  },
  mounted() {
    this.getNote();
  },
};
</script>

<style lang="scss" scoped>
.note {
  box-sizing: border-box;
  width: 800px;
  margin: 0 auto;
  min-height: 100vh;
  padding: 80px 0 30px 0;
  .add {
    border-radius: 10px;
    background-color: rgba($color: #fff, $alpha: 0.7);
    padding: 15px;
    overflow: hidden;
    header {
      display: flex;
      align-items: center;
      color: #666;
      i {
        font-size: 18px;
        background-color: #666;
        border-radius: 50%;
        padding: 5px;
        color: #fff;
        margin-right: 10px;
      }
    }
    .content {
      box-sizing: border-box;
      margin: 10px 0;
      border: none;
      padding: 10px;
      outline: none;
      font-size: 16px;
      resize: none;
      background-color: rgba($color: #fff, $alpha: 0.6);
    }
    a {
      display: block;
      background-color: #999;
      width: 50px;
      padding: 5px 8px;
      margin-left: auto;
      margin-right: 20px;
      text-align: center;
      color: #fff;
      &:hover {
        color: gold;
      }
    }
  }
  .show {
    border-radius: 10px;
    margin-top: 20px;
    background-color: rgba($color: #fff, $alpha: 0.7);
    padding: 20px 10px;
    li {
      display: flex;
      align-items: center;
      padding: 15px 0;
      border-bottom: 1px solid #999;
      position: relative;
      .el-icon-s-custom {
        color: #fff;
        background-color: #999;
        width: 35px;
        height: 35px;
        font-size: 20px;
        line-height: 35px;
        text-align: center;
        border-radius: 50%;
        margin-right: 10px;
      }
      div {
        div {
          span {
            font-size: 14px;
            color: #666;
            margin-right: 10px;
            font-size: 14px;
          }
        }
        p {
          margin-top: 6px;
          font-size: 16px;
        }
      }
      .el-icon-delete {
        width: 40px;
        height: 40px;
        background-color: #999;
        border-radius: 50%;
        text-align: center;
        line-height: 40px;
        position: absolute;
        font-size: 18px;
        color: #fff;
        top: 10px;
        right: 20px;
        &:hover {
          color: red;
        }
      }
    }
  }
}
</style>
