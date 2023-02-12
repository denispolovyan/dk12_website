<template>
  <div class="wrapper">
    <header-navbar class="header-navbar" />
    <main class="main">
      <section>
        <dick-size-meter class="dick-size-meter" />
        <working-schedule />
      </section>
    </main>
    <footer-navbar class="footer-navbar" />
  </div>
</template>

<script>
import HeaderNavbar from "./components/HeaderNavbar.vue";
import FooterNavbar from "./components/FooterNavbar.vue";
import DickSizeMeter from "./components/DickSizeMeter.vue";
import WorkingSchedule from "./components/WorkingSchedule";

export default {
  components: {
    DickSizeMeter,
    HeaderNavbar,
    FooterNavbar,
    WorkingSchedule,
  },
};
</script>

<style>
@import url("https://fonts.googleapis.com/css2?family=Ubuntu&display=swap");
@import url("./app.css");

.container {
  padding: 0px 20px;
}

.wrapper {
  min-height: 100%;
  display: flex;
  flex-direction: column;
}

.main {
  flex: 1 1 auto;
  height: 100vh;
}

.dick-size-meter {
  display: none;
}

.schedule {
}
</style>
