<template>
  <div class="weather"><div id="he-plugin-standard"></div></div>
</template>

<script>
export default {
  created() {
    window.WIDGET = {
      CONFIG: {
        layout: "2",
        width: 230,
        height: 270,
        background: "5",
        dataColor: "ffffff",
        borderRadius: "5",
        key: "877050b9d3744fe48724cffe2d4bf6a0",
      },
    };
    (function (d) {
      var c = d.createElement("link");
      c.rel = "stylesheet";
      c.href = "https://widget.qweather.net/standard/static/css/he-standard.css?v=2.0";
      var s = d.createElement("script");
      s.src = 'https://widget.qweather.net/standard/static/js/he-standard-common.js?v=2.0"';
      var sn = d.getElementsByTagName("script")[0];
      sn.parentNode.insertBefore(c, sn);
      sn.parentNode.insertBefore(s, sn);
      s.onload = () => {
        //自动宽度
        setTimeout(() => {
          document.getElementById("he-plugin-standard").style.width = "100%";
        }, 100);
      };
    })(document);
  },
};
</script>

<style lang="scss" scoped></style>
