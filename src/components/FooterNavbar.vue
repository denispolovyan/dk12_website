<template>
      <div class="footer__body">
        <div class="logo">
          <div class="logo__body" @click.stop="$emit('openMainMenu')">
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
</template>

<style>
.footer__body {
  height: 100px;
  display: flex;
  align-items: center;
    background-color: #615faa;
  padding: 0px 20px;
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
