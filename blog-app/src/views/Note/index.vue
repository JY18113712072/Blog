<template>
  <div class="note">
    <div class="add">
      <header>
        <i class="el-icon-user-solid" />
        <span>匿名用户</span>
      </header>
      <textarea
        name="note"
        cols="90"
        rows="4"
        class="content"
        wrap="hard"
        required
        placeholder="想说啥快说,我待会儿来看...."
      ></textarea>
      <a href="">发表</a>
    </div>
    <ul class="show">
      <li>
        <i class="el-icon-s-custom" />
        <div>
          <div><span>匿名用户</span> <span>2022-11-11</span></div>
          <p>地方建安费假按揭啊发奖金</p>
        </div>
      </li>
      <li>
        <i class="el-icon-s-custom" />
        <div>
          <div><span>匿名用户</span> <span>2022-11-11</span></div>
          <p>
            地方建安费假按揭啊发奖金djfjfj京东方减肥减肥减肥减肥减肥法JFJF酒精发酵方法将辅警附近放假就快点快点快点快点看得开
          </p>
        </div>
      </li>
      <li>
        <i class="el-icon-s-custom" />
        <div>
          <div><span>匿名用户</span> <span>2022-11-11</span></div>
          <p>地方建安费假按揭啊发奖金</p>
        </div>
      </li>
      <li>
        <i class="el-icon-s-custom" />
        <div>
          <div><span>匿名用户</span> <span>2022-11-11</span></div>
          <p>地方建安费假按揭啊发奖金</p>
        </div>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  name: "Welcome",
};
</script>

<style lang="scss" scoped>
.note {
  box-sizing: border-box;
  width: 800px;
  margin: 0 auto;
  min-height: 100vh;
  padding: 70px 0 30px 0;
  .add {
    border-radius: 10px;
    background-color: rgba($color: #fff, $alpha: 0.7);
    padding: 15px;
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
      i {
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
    }
  }
}
</style>
