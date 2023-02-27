<template>
  <div class="wrapper">
    <main class="main">
      <working-schedule />
    </main>
  </div>
</template>

<script>
import WorkingSchedule from "./components/WorkingSchedule";

export default {
  components: {
    WorkingSchedule,
  },
};
</script>

<style>
@import url("https://fonts.googleapis.com/css2?family=Ubuntu&display=swap");
@import url("./assets/css/nullstyle.css");
body{
	overflow-x: hidden;
}
</style>
