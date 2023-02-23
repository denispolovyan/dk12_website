<template>
  <div class="todo-list">
    <div class="todo-list__body">
      <div class="todo-list__title">
        <input
          autocomplete="off"
          tabindex="1"
          id="taskTitle"
          type="text"
          placeholder="Title of task"
          maxlength="20"
        />
      </div>
      <div class="todo__list__text">
        <textarea
          tabindex="2"
          id="taskBody"
          placeholder="Body of task"
          maxlength="100"
        ></textarea>
      </div>
      <button
        class="todo-list__button todo-list__button_submit"
        @click="addTodo"
      >
        Submit
      </button>
      <button
        class="todo-list__button todo-list__button_reset"
        @click="resetForm"
      >
        Reset
      </button>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    index: Number,
  },

  methods: {
    resetForm() {
      document.getElementById("taskBody").value = "";
      document.getElementById("taskTitle").value = "";
    },
    addTodo() {
      const title = document.getElementById("taskTitle").value;
      const body = document.getElementById("taskBody").value;
      if (title && body) {
        const currentTodo = {
          name: title,
          text: body,
          id: this.index,
        };
        this.$emit("addTodo", currentTodo);
      }
      this.resetForm();
    },
  },
};
</script>

<style scoped>
/* todo list  */
.todo-list {
  top: 100px;
  left: 20px;
  position: absolute;
  background-color: #f5deb3;
  border-radius: 20px;
}
.todo-list__body {
  padding: 20px;
}
.todo-list__title {
  margin: 0px 0px 40px 0px;
}
.todo-list__title input {
  font-size: 18px;
  padding: 0px 20px;
  border-radius: 20px;
  width: 300px;
  height: 40px;
}
.todo__list__text textarea {
  font-size: 18px;
  padding: 20px 20px;
  border-radius: 20px;
  width: 300px;
  height: 150px;
  resize: none;
}
.todo-list__button {
  font-size: 18px;
  padding: 10px 15px;
  border-radius: 20px;
  margin: 20px 0px 0px 0px;
}
.todo-list__button_submit {
  background-color: #f0fff0;
  margin: 0px 20px 0px 0px;
}
.todo-list__button_reset {
  background-color: #fff5ee;
}
.todo-list__button_submit:hover {
  transition-duration: 0.7s;
  background-color: #98fb98;
  margin: 0px 20px 0px 0px;
}
.todo-list__button_reset:hover {
  transition-duration: 0.7s;
  background-color: #ffa07a;
}
.card__container_todo {
  position: absolute;
  left: 20px;
  top: 500px;
  width: 340px;
}
</style>
