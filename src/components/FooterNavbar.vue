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
            <a target="_blank" href="https://www.instagram.com/denis_qb_/?next=%2F" class="item"><img class="item__img" src="../assets/socialMedias/inst.png" alt="inst"></a>
            <a target="_blank" href="https://t.me/denisqb" class="item"><img class="item__img" src="../assets/socialMedias/tg.png" alt="telegram"></a>
				<a target="_blank" href="https://www.tiktok.com/@keoa.kpi" class="item"><img class="item__img" src="../assets/socialMedias/tiktok.png" alt="tiktok"></a>
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
  display: flex;
}
.item__img {
  width: 40px;
  height: 40px;
}
</style>
