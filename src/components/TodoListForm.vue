<template>
  <div class="todo-list">
    <div class="todo-list__body">
      <div class="todo-list__title" @click="showWarningMessage = false">
        <input
          autocomplete="off"
          tabindex="1"
          id="taskTitle"
          type="text"
          placeholder="Title of task"
          maxlength="20"
          :class="{
            redborder: showWarningMessage,
          }"
        />
      </div>
      <div class="todo-list__text" @click="showWarningMessage = false">
        <textarea
          tabindex="2"
          id="taskBody"
          placeholder="Body of task"
          maxlength="100"
          :class="{
            redborder: showWarningMessage,
          }"
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
        @click="resetForm(), (showWarningMessage = false)"
      >
        Reset
      </button>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    index: {
      type: String,
      required: false,
    },
    filteredTodoList: {
      type: Array,
      required: false,
    },
  },

  data: () => {
    return {
      showWarningMessage: false,
      unfocusTextarea: false,
    };
  },

  methods: {
    resetForm() {
      document.getElementById("taskBody").value = "";
      document.getElementById("taskTitle").value = "";
    },
    addTodo() {
      if (this.filteredTodoList.length < 5) {
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
      } else {
        this.showWarningMessage = true;
      }
    },
    handleKeydown(e) {
      if (e.key === "Enter") {
        e.preventDefault();
        this.addTodo();
      }
    },
  },

  mounted() {
    document.addEventListener("keydown", this.handleKeydown);
  },

  beforeUnmount() {
    document.removeEventListener("keydown", this.handleKeydown);
  },
};
</script>

<style scoped>
/* todo list  */
.todo-list {
  position: absolute;
  background-color: #d3cfff;
  border-radius: 5px;
  border: 1px solid #000;
}
.todo-list__body {
  padding: 20px;
}
.todo-list__text {
  margin: 40px 0px 0px 0px;
}
.todo-list__title input {
  font-size: 18px;
  padding: 0px 20px;
  border-radius: 5px;
  width: 300px;
  height: 40px;
}
.todo-list__text textarea {
  font-size: 18px;
  padding: 20px 20px;
  border-radius: 5px;
  width: 300px;
  height: 150px;
  resize: none;
}
.todo-list__button {
  font-size: 18px;
  padding: 10px 15px;
  border-radius: 5px;
  margin: 20px 0px 0px 0px;
}
.todo-list__button_submit {
  background-color: #ffcc4e;
  margin: 0px 20px 0px 0px;
}
.todo-list__button_reset {
  background-color: #ffa07a;
}
.todo-list__button_submit:hover {
  transition-duration: 0.5s;
  background-color: #98fb98;
  margin: 0px 20px 0px 0px;
}
.todo-list__button_reset:hover {
  transition-duration: 0.5s;
  background-color: #dc143c;
}
.redborder {
  border: 1px solid red;
}
</style>
