<template>
  <header>
    <div class="container">
      <div class="header__body">
        <div class="logo">
          <div class="logo__body">
            <img
              class="logo__img"
              src="../assets/dk12logo.jpg"
              alt="logo"
              style="width: 60px"
            />
          </div>
        </div>
        <div class="list">
          <div class="list__body">
            <!-- <div class="item">
            </div> -->
          </div>
        </div>
      </div>
    </div>
  </header>
</template>

<script>
export default {
//   data: () => {
//     return {
//       showBlackTheme: false,
//     };
//   },
//   methods: {
//     changeColorTheme(theme) {
//       localStorage.setItem("colorTheme", JSON.stringify({ colorTheme: theme }));
//     },
//   },

//   created() {
//     setInterval(() => {
//       const todoList = JSON.parse(localStorage.getItem("colorTheme"));
//       this.showBlackTheme = todoList["colorTheme"] === "black" ? true : false;
//     }, 100);
//   },
};
</script>

<style>
header {
  background-color: #c0c0c0;
  font-family: "Ubuntu", sans-serif;
}
.header__body {
  height: 100px;
  display: flex;
  align-items: center;
}
.logo {
  flex: 1 1 200px;
}
.logo__img {
  border-radius: 50%;
}

.list {
  width: 100%;
}
.list__body {
  justify-content: end;
  display: flex;
  align-items: center;
  gap: 40px;
}
.item {
  font-size: 16px;
  display: flex;
}

/* themes  */
.theme {
  width: 40px;
  height: 40px;
  border-radius: 50%;
}
.whiteTheme {
  background-color: #fff;
  margin: 0px 10px 0px 0px;
}
.blackTheme {
  background-color: #000;
}

.blackThemeColor {
  background-color: #000;
}
</style>
