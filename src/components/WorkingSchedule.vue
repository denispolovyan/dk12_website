<template>
  <div class="container">
    <div class="schedule">
      <week-navbar
        @switchToFirstWeek="(showFirstWeek = true), (showSecondWeek = false)"
        @switchToSecondWeek="(showFirstWeek = false), (showSecondWeek = true)"
      />
      <day-navbar @setDaysList="setDaysList" />
      <div
        class="cards"
        v-if="showFirstWeek"
        :class="{ jccenter: clientWidth < 920 }"
      >
        <div class="cards__body" v-if="days.monday || clientWidth > 919">
          <div class="card__title">Понеділок</div>
          <div class="card__column">
            <div
              @click="
                openModalWindow('first'),
                  removeScroll(),
                  setSubjectId(1),
                  filterTodos()
              "
              class="card__text"
            >
              <p>
                Економічна психологія
                <span class="card__activity card__activity_practice">прак</span>
              </p>
              <p>
                Психологія конфлікту
                <span class="card__activity card__activity_lecture">лек</span>
              </p>
              <p>
                Політична наука: конфліктологічний підхід
                <span class="card__activity card__activity_practice">прак</span>
              </p>
              <div v-if="showModalWindow.first" class="data">
                <div class="data__block">
                  <div class="data__body">
                    <p>Економічна психологія</p>
                    <p>Винославська Олена Василівна</p>
                    <p>
                      <a href="">Посилання (прак)</a>
                    </p>
                  </div>
                </div>
                <div class="data__block">
                  <div class="data__body">
                    <p>Психологія конфлікту</p>
                    <p>Сербова Ольга Вікторівна</p>
                    <p><a href="">Посилання (лек)</a></p>
                  </div>
                </div>
                <div class="data__block">
                  <div class="data__body">
                    <p>Політична наука: конфліктологічний підхід</p>
                    <p>Багінський Андрій Владиславович</p>
                    <p><a href="">Посилання (прак)</a></p>
                  </div>
                </div>
                <div
                  v-if="showModalWindow.first"
                  @click.stop="closeModalWindow('first')"
                  @click="addScroll"
                  class="data__close"
                ></div>
                <todo-list-form @addTodo="addTodo" :index="subjectIndex" />
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
                      <button
                        class="todo-list__button todo-list__button_submit"
                      >
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
              </div>
            </div>
            <div class="card__subtitle">8:30</div>
          </div>
          <div class="card__column">
            <div
              class="card__text"
              @click="
                openModalWindow('second'),
                  removeScroll(),
                  setSubjectId(2),
                  filterTodos()
              "
            >
              <p>
                Політична участь та громадянська відповідальність
                <span class="card__activity card__activity_lecture">лек </span>
              </p>
              <p>
                Розумні міста
                <span class="card__activity card__activity_practice"
                  >прак
                </span>
              </p>
              <p>
                Психологія
                <span class="card__activity card__activity_lecture">лек </span>
              </p>
              <div v-if="showModalWindow.second" class="data">
                <div class="data__block">
                  <div class="data__body">
                    <p>Політична участь та громадянська відповідальність</p>
                    <p>Цимбаленко Яна Юріївна</p>
                    <p><a href="">Посилання (лек)</a></p>
                  </div>
                </div>
                <div class="data__block">
                  <div class="data__body">
                    <p>Розумні міста</p>
                    <p>Чукут Світлана Анатоліївна</p>
                    <p><a href="">Посилання (прак)</a></p>
                  </div>
                </div>
                <div class="data__block">
                  <div class="data__body">
                    <p>Психологія</p>
                    <p>Волянюк Наталія Юріївна</p>
                    <p><a href="">Посилання (лек)</a></p>
                  </div>
                </div>
                <div
                  v-if="showModalWindow.second"
                  @click.stop="closeModalWindow('second')"
                  @click="addScroll"
                  class="data__close"
                ></div>
                <todo-list-form @addTodo="addTodo" :index="subjectIndex" />
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
                      <button
                        class="todo-list__button todo-list__button_submit"
                      >
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
              </div>
            </div>
            <div class="card__subtitle">10:25</div>
          </div>
          <div class="card__column">
            <div class="card__text">
              <p>
                Соціальна психологія
                <span class="card__activity card__activity_practice">прак</span>
              </p>
            </div>
            <div class="card__subtitle">12:20</div>
          </div>
          <div class="card__column">
            <div class="card__text"></div>
            <div class="card__subtitle">14:15</div>
          </div>
        </div>
        <div class="cards__body" v-if="days.tuesday || clientWidth > 919">
          <div class="card__title">Вівторок</div>
          <div class="card__column">
            <div class="card__text">
              <p>
                Конструкторське проектування радіоелектронної апаратури
                <span class="card__activity card__activity_lecture">лек</span>
              </p>
            </div>
            <div class="card__subtitle">8:30</div>
          </div>
          <div class="card__column">
            <div class="card__text">
              <p>
                Електродинаміка та поширення радіохвиль
                <span class="card__activity card__activity_lecture">лек</span>
              </p>
            </div>
            <div class="card__subtitle">10:25</div>
          </div>
          <div class="card__column">
            <div class="card__text">
              <p>
                Методи обробки даних в інформатиці
                <span class="card__activity card__activity_lecture">лек</span>
              </p>
            </div>
            <div class="card__subtitle">12:20</div>
          </div>
          <div class="card__column">
            <div class="card__text">
              <p>
                Методи обробки даних в інформатиці
                <span class="card__activity card__activity_practice">прак</span>
              </p>
            </div>
            <div class="card__subtitle">14:15</div>
          </div>
        </div>
        <div class="cards__body" v-if="days.wednesday || clientWidth > 919">
          <div class="card__title">Середа</div>
          <div class="card__column">
            <div class="card__text">
              <p>
                Схемотехніка
                <span class="card__activity card__activity_lecture">лек</span>
              </p>
            </div>
            <div class="card__subtitle">8:30</div>
          </div>
          <div class="card__column">
            <div class="card__text">
              <p>
                Вступ до філософії
                <span class="card__activity card__activity_lecture">лек</span>
              </p>
            </div>
            <div class="card__subtitle">10:25</div>
          </div>
          <div class="card__column">
            <div class="card__text">
              <p>
                Функціонально-логічне проектування
                <span class="card__activity card__activity_lecture">лек</span>
              </p>
            </div>
            <div class="card__subtitle">12:20</div>
          </div>
          <div class="card__column">
            <div class="card__text">
              <p>
                Електродинаміка та поширення радіохвиль
                <span class="card__activity card__activity_lecture">лек</span>
              </p>
            </div>
            <div class="card__subtitle">14:15</div>
          </div>
        </div>
        <div class="cards__body" v-if="days.thursday || clientWidth > 919">
          <div class="card__title">Четвер</div>
          <div class="card__column">
            <div class="card__text">
              <p>
                Конструкторське проектування радіоелектронної апаратури
                <span class="card__activity card__activity_lab">лаб</span>
              </p>
            </div>
            <div class="card__subtitle">8:30</div>
          </div>
          <div class="card__column">
            <div class="card__text">
              <p>
                Практичний курс іноземної мови
                <span class="card__activity card__activity_practice">прак</span>
              </p>
            </div>
            <div class="card__subtitle">10:25</div>
          </div>
          <div class="card__column">
            <div class="card__text"></div>
            <div class="card__subtitle">12:20</div>
          </div>
          <div class="card__column">
            <div class="card__text"></div>
            <div class="card__subtitle">14:15</div>
          </div>
        </div>
        <div class="cards__body" v-if="days.friday || clientWidth > 919">
          <div class="card__title">П'ятниця</div>
          <div class="card__column">
            <div class="card__text"></div>
            <div class="card__subtitle">8:30</div>
          </div>
          <div class="card__column">
            <div class="card__text"></div>
            <div class="card__subtitle">10:25</div>
          </div>
          <div class="card__column">
            <div class="card__text">
              <p>
                Електродинаміка та поширення радіохвиль
                <span class="card__activity card__activity_practice">прак</span>
              </p>
            </div>
            <div class="card__subtitle">12:20</div>
          </div>
          <div class="card__column">
            <div class="card__text">
              <p>
                Вступ до філософії
                <span class="card__activity card__activity_practice">прак</span>
              </p>
            </div>
            <div class="card__subtitle">14:15</div>
          </div>
        </div>
      </div>
      <div
        class="cards"
        v-if="showSecondWeek"
        :class="{ jccenter: clientWidth < 920 }"
      >
        <div class="cards__body" v-if="days.monday || clientWidth > 919">
          <div class="card__title">Понеділок</div>
          <div class="card__column">
            <div class="card__text">
              <p>
                Психологія конфлікту
                <span class="card__activity card__activity_lecture">лек</span>
              </p>
            </div>
            <div class="card__subtitle">8:30</div>
          </div>
          <div class="card__column">
            <div class="card__text">
              <p>
                Політична участь
                <span class="card__activity card__activity_practice">прак</span>
              </p>
            </div>
            <div class="card__subtitle">10:25</div>
          </div>
          <div class="card__column">
            <div class="card__text">
              <p>
                Соціальна психологія
                <span class="card__activity card__activity_lecture">лек</span>
              </p>
            </div>
            <div class="card__subtitle">12:20</div>
          </div>
          <div class="card__column">
            <div class="card__text">
              <p>
                Розумні міста
                <span class="card__activity card__activity_lecture">лек</span>
              </p>
            </div>
            <div class="card__subtitle">14:15</div>
          </div>
        </div>
        <div class="cards__body" v-if="days.tuesday || clientWidth > 919">
          <div class="card__title">Вівторок</div>
          <div class="card__column">
            <div class="card__text">
              <p>
                Конструкторське проектування радіоелектронної апаратури
                <span class="card__activity card__activity_lecture">лек</span>
              </p>
            </div>
            <div class="card__subtitle">8:30</div>
          </div>
          <div class="card__column">
            <div class="card__text">
              <p>
                Електродинаміка та поширення радіохвиль
                <span class="card__activity card__activity_lecture">лек</span>
              </p>
            </div>
            <div class="card__subtitle">10:25</div>
          </div>
          <div class="card__column">
            <div class="card__text"></div>
            <div class="card__subtitle">12:20</div>
          </div>
          <div class="card__column">
            <div class="card__text"></div>
            <div class="card__subtitle">14:15</div>
          </div>
        </div>
        <div class="cards__body" v-if="days.wednesday || clientWidth > 919">
          <div class="card__title">Середа</div>
          <div class="card__column">
            <div class="card__text">
              <p>
                Схемотехніка
                <span class="card__activity card__activity_lecture">лек</span>
              </p>
            </div>
            <div class="card__subtitle">8:30</div>
          </div>
          <div class="card__column">
            <div class="card__text">
              <p>
                Функціонально-логічне проектування
                <span class="card__activity card__activity_lecture">лек</span>
              </p>
            </div>
            <div class="card__subtitle">10:25</div>
          </div>
          <div class="card__column">
            <div class="card__text">
              <p>
                Функціонально-логічне проектування
                <span class="card__activity card__activity_lecture">лек</span>
              </p>
            </div>
            <div class="card__subtitle">12:20</div>
          </div>
          <div class="card__column">
            <div class="card__text">
              <p>
                Електродинаміка та поширення радіохвиль
                <span class="card__activity card__activity_lecture">лек</span>
              </p>
            </div>
            <div class="card__subtitle">14:15</div>
          </div>
        </div>
        <div class="cards__body" v-if="days.thursday || clientWidth > 919">
          <div class="card__title">Четвер</div>
          <div class="card__column">
            <div class="card__text">
              <p>
                Конструкторське проектування радіоелектронної апаратури
                <span class="card__activity card__activity_lab">лаб</span>
              </p>
            </div>
            <div class="card__subtitle">8:30</div>
          </div>
          <div class="card__column">
            <div class="card__text">
              <p>
                Практичний курс іноземної мови
                <span class="card__activity card__activity_practice">прак</span>
              </p>
            </div>
            <div class="card__subtitle">10:25</div>
          </div>
          <div class="card__column">
            <div class="card__text"></div>
            <div class="card__subtitle">12:20</div>
          </div>
          <div class="card__column">
            <div class="card__text"></div>
            <div class="card__subtitle">14:15</div>
          </div>
        </div>
        <div class="cards__body" v-if="days.friday || clientWidth > 919">
          <div class="card__title">П'ятниця</div>
          <div class="card__column">
            <div class="card__text">
              <p>
                Схемотехніка
                <span class="card__activity card__activity_lab">лаб</span>
              </p>
            </div>
            <div class="card__subtitle">8:30</div>
          </div>
          <div class="card__column">
            <div class="card__text">
              <p>
                Функціонально-логічне проектування
                <span class="card__activity card__activity_lecture">лек</span>
              </p>
            </div>
            <div class="card__subtitle">10:25</div>
          </div>
          <div class="card__column">
            <div class="card__text">
              <p>
                Електродинаміка та поширення радіохвиль
                <span class="card__activity card__activity_practice">прак</span>
              </p>
            </div>
            <div class="card__subtitle">12:20</div>
          </div>
          <div class="card__column">
            <div class="card__text"></div>
            <div class="card__subtitle">14:15</div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
@import url("../assets/css/WorkingSchedule");
</style>

<script>
import WeekNavbar from "./WeekNavbar.vue";
import DayNavbar from "./DayNavbar.vue";
import TodoListForm from "./TodoListForm.vue";

export default {
  components: {
    WeekNavbar,
    DayNavbar,
    TodoListForm,
  },

  data: () => {
    return {
      showFirstWeek: true,
      showSecondWeek: false,
      showModalWindow: {
        first: false,
        second: false,
      },
      days: {
        monday: true,
        tuesday: false,
        wednesday: false,
        thursday: false,
        friday: false,
      },
      todoList: [],
      filteredTodoList: [],
      subjectIndex: "",
      selectedTodo: null,
      clientWidth: "",
    };
  },

  methods: {
    openModalWindow(index) {
      this.showModalWindow[index] = true;
    },
    closeModalWindow(index) {
      this.showModalWindow[index] = false;
    },
    handleKeydown(e) {
      if (e.key === "Escape") {
        this.closeModalWindow();
        this.addScroll();
      }
    },
    getWindowSize() {
      this.clientWidth = window.screen.width;
    },
    removeScroll() {
      document.body.style.overflow = "hidden";
    },
    addScroll() {
      document.body.style.overflow = "scroll";
    },

    addTodo(currentTodo) {
      this.todoList = [...this.todoList, currentTodo];
    },
    setSubjectId(idx) {
      this.subjectIndex = idx;
    },
    deleteTodo(elementToDelete) {
      if (this.selectedTodo == elementToDelete) {
        this.select(null);
      }
      this.todoList = this.todoList.filter((t) => t != elementToDelete);
    },
    select(todo) {
      this.selectedTodo = todo;
    },
    setDaysList(list) {
      this.days = list;
    },
    filterTodos() {
      this.filteredTodoList = this.todoList.filter(
        (t) => t.id == this.subjectIndex
      );
    },
    returnTodos() {
      return this.todoList;
    },
  },
  watch: {
    todoList() {
      localStorage.setItem("todo-list", JSON.stringify(this.todoList));
      this.filterTodos();
    },
  },

  created() {
    const todoList = localStorage.getItem("todo-list");
    if (todoList) {
      this.todoList = JSON.parse(todoList);
    }
  },

  mounted() {
    document.addEventListener("keydown", this.handleKeydown);
    window.addEventListener("resize", this.getWindowSize);
    this.getWindowSize();
  },

  beforeUnmount() {
    document.removeEventListener("keydown", this.handleKeydown);
    window.removeEventListener("resize", this.getWindowSize);
  },
};
</script>
