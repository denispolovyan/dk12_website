<template>
  <div class="card__container_todo">
    <todo-list-form
      @addTodo="addTodo"
      :index="index"
      :filteredTodoList="filteredTodoList"
    />
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
import TodoListForm from "./TodoListForm.vue";

export default {
  components: {
    TodoListForm,
  },
  props: {
    filteredTodoList: Array,
    index: String,
    clientWidth: {
      type: Number,
      required: false,
    },
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
      this.$emit("deleteTodo", elementToDelete);
    },
    select(todo) {
      this.selectedTodo = todo;
    },
    addTodo(currentTodo) {
      this.$emit("addTodo", currentTodo);
    },
  },
};
</script>

<style scoped>
/* container  */
.card__container_todo {
  position: absolute;
  max-width: 700px;
  display: flex;
  left: 600px;
  top: 100px;
  gap: 20px;
  flex-wrap: wrap;
}
.card__item_todo {
  width: 340px;
  height: 340px;
  padding: 20px;
  background-color: #f5deb3;
  border-radius: 20px;
  margin: 0px 0px 20px 0px;
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

.card__title_todo {
  padding: 10px 15px;
  background-color: #fff;
  margin: 0px 0px 40px 0px;
  border-radius: 20px;
}
.card__text_todo {
  background-color: #fff;
  padding: 20px;
  border-radius: 20px;
  line-height: 20px;
  height: 150px;
}

@media (max-width: 960px) {
  .card__container_todo {
    position: static;
    max-width: 100%; 
padding: 0px 15%;
    justify-content: center;
  }
}
</style>
