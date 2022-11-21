<template>
  <div class="resume">
    <pdf style="margin-top: 10px" src="/static/1.pdf" :page="1"></pdf>
    <pdf style="margin-top: 10px" src="/static/1.pdf" :page="2"></pdf>
    <pdf style="margin-top: 10px" src="/static/1.pdf" :page="3"></pdf>
  </div>
</template>

<script>
import pdf from "vue-pdf";

export default {
  name: "Resume",
  components: {
    pdf,
  },
};
</script>

<style lang="scss" scoped>
.resume {
  color: #fff;
  margin: 0 auto;
  width: 800px;
}
</style>
