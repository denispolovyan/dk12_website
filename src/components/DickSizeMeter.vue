<template>
  <div class="container">
    <div class="size">
      <div class="size__card">
        <div class="size__title">Check your size</div>
        <div class="button">
          <button @click="getSize()" class="button__body">Click</button>
        </div>
        <div class="size__result">Your size: {{ size }} cm</div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.size {
	margin: 20px 0px 0px 0px;
}
.size__card {
  border: 1px solid #000;
  border-radius: 10px;
  padding: 10px 20px;
  display: inline-block;
  background-color: #e0e0e0;
  font-size: 20px;
}
.size__title {
  display: inline;
  margin: 0px 10px 0px 0px;
}
.button {
  display: inline;
}
.button__body {
  border: 1px solid #000;
  border-radius: 10px;
  padding: 5px 10px;
  background-color: #e0e0e0;
  font-size: 14px;
}
.size__result {
  margin: 10px 0px 0px 0px;
}
</style>

<script>
export default {
  data() {
    return {
      size: "--",
    };
  },
  methods: {
    getSize() {
      let randomSize = Math.random();
      this.size = ((randomSize * 100) / 3).toPrecision(3);
    },
  },
};
</script>
