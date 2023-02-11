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
            <div class="item">schedule</div>
            <div class="item">deadlines</div>
            <div class="item">tasks</div>
            <div class="item">news</div>
            <div class="item">ads</div>
          </div>
        </div>
      </div>
    </div>
  </header>
</template>

<style>
header {
  background-color: #5F9EA0;
   background-color: #C0C0C0;
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
  gap: 40px
}
.item {
  font-size: 16px;
  display: flex;
}
</style>
