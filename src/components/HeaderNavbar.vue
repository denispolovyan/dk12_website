<template> 
    <div class="header__body" >
      <div class="logo">
        <div class="logo__body " @click.stop="$emit('openMainMenu')">
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
          <div class="item">
            <!-- Lorem ipsum dolor sit amet. -->
          </div>
        </div>
      </div>
    </div>
</template>

<script>

</script>


<style>
.header__body {
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
  gap: 40px;
}
.item {
  font-size: 16px;
  display: flex;
}
</style>
