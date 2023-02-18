<template>
  <div
    class="days__navbar"
    @click="getDayofTheWeek"
    v-if="clientWidth < 920"
  >
    <div
      id="monday"
      class="days__item"
      :class="{
        bgbtn: days.monday,
      }"
    >
      Пн
    </div>
    <div
      id="tuesday"
      class="days__item"
      :class="{
        bgbtn: days.tuesday,
      }"
    >
      Вт
    </div>
    <div
      id="wednesday"
      class="days__item"
      :class="{
        bgbtn: days.wednesday,
      }"
    >
      Ср
    </div>
    <div
      id="thursday"
      class="days__item"
      :class="{
        bgbtn: days.thursday,
      }"
    >
      Чт
    </div>
    <div
      id="friday"
      class="days__item"
      :class="{
        bgbtn: days.friday,
      }"
    >
      Пт
    </div>
  </div>
</template>

<style scoped>
.days__navbar {
  gap: 5px;
  display: flex;
  justify-content: space-between;
  max-width: 300px;
  margin: 0px auto 40px auto;
}
.days__item {
  padding: 5px 10px;
  border: 1px solid #000;
  border-radius: 20px;
}
.bgbtn {
  background-color: #d3d3d3;
  transition-duration: 0.7s;
}
</style>

<script>
export default {

  data: () => {
    return {
      days: {
        monday: true,
        tuesday: false,
        wednesday: false,
        thursday: false,
        friday: false,
      },
		clientWidth: false
    };
  },
  methods: {
    getDayofTheWeek(e) {
      for (let value in this.days) {
        this.days[value] = false;
      }
      let element = e.target.id;
      this.days[element] = true;
		this.$emit("setDaysList", this.days)
    },
    getWindowSize() {
      this.clientWidth = window.screen.width;
    },
  },
  mounted() {
    window.addEventListener("resize", this.getWindowSize);
    this.getWindowSize();
  },
  beforeUnmount() {
    window.removeEventListener("resize", this.getWindowSize);
  },
};
</script>
