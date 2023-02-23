<template>
  <div class="card__container_todo">
    <div
      class="card__item_todo"
      v-for="todo in filteredTodoList"
      v-bind:key="todo"
      v-on:click="select(todo)"
    >
      <div class="card__body">
        <div class="card__title_todo">{{ todo.name }}</div>
        <div class="card__text_todo">
          {{ todo.text }}
        </div>
        <button class="todo-list__button todo-list__button_submit">
          Overline
        </button>
        <button
          class="todo-list__button todo-list__button_reset"
          @click.stop="deleteTodo(todo)"
        >
          Delete
        </button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    filteredTodoList: Array,
  },
  data: () => {
    return {
      selectedTodo: null,
    };
  },
  methods: {
    deleteTodo(elementToDelete) {
      if (this.selectedTodo == elementToDelete) {
        this.select(null);
      }
		this.$emit("deleteTodo", elementToDelete)
    },
    select(todo) {
      this.selectedTodo = todo;
    },
  },
};
</script>

<style scoped>
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

/* todo card  */
.card__item_todo {
  padding: 20px;
  background-color: #f5deb3;
  border-radius: 20px;
  margin: 0px 0px 20px 0px;
}

.card__title_todo {
  padding: 10px 15px;
  background-color: #fff;
  margin: 0px 0px 20px 0px;
  border-radius: 20px;
}
.card__text_todo {
  background-color: #fff;
  padding: 20px;
  border-radius: 20px;
  line-height: 20px;
}
</style>
