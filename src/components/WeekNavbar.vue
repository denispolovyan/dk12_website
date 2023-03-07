<template>
  <article class="article">
    <div
      class="article__button"
      :class="{
        bgbtn: showFirstWeek,
      }"
      @click="switchToFirstWeek"
    >
      Тиждень 1
    </div>
    <div
      @click="switchToSecondWeek"
      class="article__button"
      :class="{
        bgbtn: showSecondWeek,
      }"
    >
      Тиждень 2
    </div>
  </article>
</template>

<style scoped>
.article {
  display: flex;
  justify-content: center;
  align-items: center;
  margin: 0px 0px 20px 0px;
}
.article__button {
  font-size: 18px;
  border-radius: 20px;
  padding: 10px 20px;
  cursor: pointer;
}
.bgbtn {
  background-color: #d3cfff;
  transition-duration: 0.5s;
}
@media (min-width: 2000px) {
  .article__button {
    font-size: 22px;
  }
}
</style>

<script>
export default {
  data: () => {
    return {
      showFirstWeek: true,
      showSecondWeek: false,
    };
  },
  methods: {
    switchToFirstWeek() {
      this.showFirstWeek = true;
      this.showSecondWeek = false;
      this.$emit("switchToFirstWeek");
    },
    switchToSecondWeek() {
      this.showFirstWeek = false;
      this.showSecondWeek = true;
      this.$emit("switchToSecondWeek");
    },
  },
};
</script>
