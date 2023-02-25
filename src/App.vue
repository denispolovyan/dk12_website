<template>
  <div class="wrapper">
    <header>
      <header-navbar class="header-navbar" />
    </header>
    <main class="main">
      <working-schedule />
    </main>
    <footer>
      <footer-navbar class="footer-navbar" />
    </footer>
  </div>
</template>

<script>
import HeaderNavbar from "./components/HeaderNavbar.vue";
import FooterNavbar from "./components/FooterNavbar.vue";
import WorkingSchedule from "./components/WorkingSchedule";

export default {
  components: {
    HeaderNavbar,
    FooterNavbar,
    WorkingSchedule,
  },
};
</script>

<style>
@import url("https://fonts.googleapis.com/css2?family=Ubuntu&display=swap");
@import url("./assets/css/nullstyle.css");

body {
  font-family: "Ubuntu", sans-serif;
}
.wrapper{
	background-color: #f3f3f3;
}
/* container with padding for all components */
.container {
  padding: 0px 20px;
}

.main {
  flex: 1 1 auto;
  height: 100%;
}

header {
  background-color: #615faa;
}

footer {
  background-color: #615faa;
}
</style>
