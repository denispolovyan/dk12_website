<template>
  <div class="wrapper">
    <header-navbar class="header-navbar" />
    <main class="main">
      <section>
        <dick-size-meter class="check" />
      </section>
    </main>
    <footer-navbar class="footer-navbar" />
  </div>
</template>

<script>
import HeaderNavbar from "./components/HeaderNavbar.vue";
import FooterNavbar from "./components/FooterNavbar.vue";
import DickSizeMeter from "./components/DickSizeMeter.vue";

export default {
  name: "App",
  components: {
    DickSizeMeter,
    HeaderNavbar,
    FooterNavbar,
  },
};
</script>

<style>
@import url("https://fonts.googleapis.com/css2?family=Ubuntu&display=swap");

* {
  padding: 0;
  margin: 0;
  border: 0;
}
*,
:after,
:before {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}
:active,
:focus {
  outline: none;
}
a:active,
a:focus {
  outline: none;
}
aside,
footer,
header,
nav {
  display: block;
}
body,
html {
  height: 100%;
  width: 100%;
  font-size: 100%;
  line-height: 1;
  font-size: 14px;
  -ms-text-size-adjust: 100%;
  -moz-text-size-adjust: 100%;
  -webkit-text-size-adjust: 100%;
}
button,
input,
textarea {
  font-family: inherit;
}
input::-ms-clear {
  display: none;
}
button {
  cursor: pointer;
}
button::-moz-focus-inner {
  padding: 0;
  border: 0;
}
a,
a:visited {
  text-decoration: none;
}
a:hover {
  text-decoration: none;
}
ul li {
  list-style: none;
}
img {
  vertical-align: top;
}
h1,
h2,
h3,
h4,
h5,
h6 {
  font-size: inherit;
  font-weight: 400;
}

.container {
  padding: 0px 15px;
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
</style>
