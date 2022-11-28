<template>
  <div class="skills">
    <div><img src="./images/5.webp" alt="" /></div>
    <div><img src="./images/8.webp" alt="" /></div>

    <div><img src="./images/2.png" alt="" /></div>
    <div><img src="./images/6.svg" alt="" /></div>
    <div><img src="./images/4.webp" alt="" /></div>

    <div><img src="./images/3.webp" alt="" /></div>

    <div><img src="./images/7.svg" alt="" /></div>
    <div><img src="./images/1.png" alt="" /></div>
  </div>
</template>

<script>
export default {
  name: "Skills",
};
</script>

<style lang="scss" scoped>
.skills {
  color: #fff;
  box-sizing: border-box;
  margin: 20px;
  padding: 30px;
  background-color: rgba($color: #fff, $alpha: 0.5);
  display: flex;
  flex-wrap: wrap;
  div {
    width: 250px;
    margin: 10px;
    img {
      width: 100%;
    }
  }
}
</style>
