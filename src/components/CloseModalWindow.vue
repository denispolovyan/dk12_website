<template>
  <div class="data__close"></div>
</template>

<style scoped>
.data__close {
  position: absolute;
  top: 20px;
  right: 20px;
  width: 3em;
  height: 3em;
  background-color: #c0c0c0;
  clip-path: polygon(
    20% 0%,
    0% 20%,
    30% 50%,
    0% 80%,
    20% 100%,
    50% 70%,
    80% 100%,
    100% 80%,
    70% 50%,
    100% 20%,
    80% 0%,
    50% 30%
  );
}
.data__close:hover {
  transition-duration: 0.7s;
  background-color: #808080;
}
</style>
