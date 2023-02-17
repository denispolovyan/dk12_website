<template>
  <div class="container">
    <div class="schedule">
      <article class="article">
        <div
          class="article__button article__button_first"
          :class="{
            bgbtn: showFirstWeek,
          }"
          @click="switchToFirstWeek"
        >
          Тиждень 1
        </div>
        <div
          @click="switchToSecondWeek"
          class="article__button article__button_second"
          :class="{
            bgbtn: showSecondWeek,
          }"
        >
          Тиждень 2
        </div>
      </article>
      <div
        class="days__navbar"
        @click="getDayofTheWeek"
        v-if="clientWidth < 920"
      >
        <div
          id="monday"
          class="days__item"
          :class="{
            bgbtn: days.monday,
          }"
        >
          Пн
        </div>
        <div
          id="tuesday"
          class="days__item"
          :class="{
            bgbtn: days.tuesday,
          }"
        >
          Вт
        </div>
        <div
          id="wednesday"
          class="days__item"
          :class="{
            bgbtn: days.wednesday,
          }"
        >
          Ср
        </div>
        <div
          id="thursday"
          class="days__item"
          :class="{
            bgbtn: days.thursday,
          }"
        >
          Чт
        </div>
        <div
          id="friday"
          class="days__item"
          :class="{
            bgbtn: days.friday,
          }"
        >
          Пт
        </div>
      </div>
      <div
        class="cards"
        v-if="showFirstWeek"
        :class="{ jccenter: clientWidth < 920 }"
      >
        <div class="cards__body" v-if="days.monday || clientWidth > 919">
          <div class="card__title">Понеділок</div>
          <div class="card__column">
            <div @click="openModalWindow(), removeScroll()" class="card__text">
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
              <div v-if="showModalWindow" class="data">
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
                  v-if="showModalWindow"
                  @click.stop="closeModalWindow"
                  @click="addScroll"
                  class="data__close"
                ></div>
                <div class="todo-list">
                  <div class="todo-list__body">
                    <div class="todo-list__title">
                      <input
                        id="taskTitle"
                        type="text"
                        placeholder="Title of task"
                        maxlength="20"
                      />
                    </div>
                    <div class="todo__list__text">
                      <textarea
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
                <div class="card__container_todo">
                  <div
                    class="card__item_todo"
                    v-for="todo in todoList"
                    :key="todo.name"
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
                      <button class="todo-list__button todo-list__button_reset">
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
            <div class="card__text">
              <p>
                Соціальна психологія
                <span class="card__activity card__activity_lecture">лек</span>
              </p>
              <p>
                Розумні міста
                <span class="card__activity card__activity_lecture">лек </span>
              </p>
            </div>
            <div class="card__subtitle">10:25</div>
          </div>
          <div class="card__column">
            <div class="card__text">
              <p>
                Економічна психологія
                <span class="card__activity card__activity_practice">прак</span>
              </p>
              <p>
                Психологія конфлікту
                <span class="card__activity card__activity_lecture">лек</span>
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
.schedule {
  font-family: "Ubuntu", sans-serif;
  margin: 40px 0px;
  font-size: 18px;
}
.article {
  display: flex;
  justify-content: center;
  align-items: center;
  margin: 0px 0px 40px 0px;
}
.cards {
  flex-wrap: wrap;
  display: flex;
  gap: 20px;
}
.cards__body {
  width: 430px;
  background: #f0f8ff;
  border: 2px solid #000;
  border-radius: 15px;
}
.card__title {
  font-weight: 600;
  font-size: 22px;
  display: inline-block;
  border-radius: 15px;
  margin: 20px 20px 40px 20px;
}
.card__column {
  padding: 10px 10px 0px 10px;
  margin: 0px 10px 40px 10px;
  border-bottom: 1px dotted #000;
}
.card__column:hover {
  transition-duration: 0.6s;
  background-color: #ffe4b5;
  border-radius: 20px 20px 0px 0px;
}
.card__text {
  position: relative;
  height: 150px;
}
.data {
  z-index: 50;
  background-color: #e0ffff;
  position: fixed;
  top: 100px;
  left: 0px;
  width: 100%;
  height: 100%;
  padding: 80px 0px 0px 0px;
}
.data__block {
  text-align: center;
  border-radius: 20px;
  padding: 20px;
  margin: 0px 0px 30px 0px;
  line-height: 30px;
  font-size: 20px;
}
.data__body {
  padding: 20px;
  width: 450px;
  border-radius: 20px;
  display: inline-block;
  background-color: #eee8aa;
}
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

.card__text p {
  margin: 0px 0px 10px 0px;
  line-height: 30px;
}
.card__text p span {
  font-size: 12px;
}
.card__subtitle {
  text-align: right;
  margin: 0px 0px 5px 0px;
}
.article__button {
  font-size: 22px;
  border-radius: 20px;
  padding: 10px 20px;
}
/* lec / prac / lab*/
.card__activity {
  padding: 5px 10px;
  border-radius: 15px;
}
.card__activity_practice {
  background-color: #7fffd4;
}
.card__activity_lecture {
  background-color: #ffa07a;
}
.card__activity_lab {
  background-color: #f0e68c;
}
/* dynamic classes */
.bgbtn {
  background-color: #d3d3d3;
  transition-duration: 0.7s;
}
.jccenter {
  justify-content: center;
}
/* days for < 920px  */
.days__navbar {
  gap: 5px;
  display: flex;
  justify-content: space-between;
  max-width: 300px;
  margin: 0px auto 40px auto;
}
.days__item {
  padding: 5px 10px;
  border: 1px solid #000;
  border-radius: 20px;
}

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

/* media  */

@media (min-width: 2300px) {
  .cards {
    justify-content: space-between;
  }
}
</style>

<script>
export default {
  data: () => {
    return {
      showFirstWeek: true,
      showSecondWeek: false,
      showModalWindow: false,
      days: {
        monday: true,
        tuesday: false,
        wednesday: false,
        thursday: false,
        friday: false,
      },
      clientWidth: "",
      todoList: [],
    };
  },
  methods: {
    switchToFirstWeek() {
      this.showFirstWeek = true;
      this.showSecondWeek = false;
    },
    switchToSecondWeek() {
      this.showFirstWeek = false;
      this.showSecondWeek = true;
    },
    openModalWindow() {
      this.showModalWindow = true;
    },
    closeModalWindow() {
      this.showModalWindow = false;
    },
    handleKeydown(e) {
      if (e.key === "Escape") {
        this.closeModalWindow();
        this.addScroll();
      }
    },

    getDayofTheWeek(e) {
      for (let value in this.days) {
        this.days[value] = false;
      }
      let element = e.target.id;
      this.days[element] = true;
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
        };
        this.todoList = [...this.todoList, currentTodo];
      }
      this.resetForm();
    },
  },
  computed: {
    returnTodos() {
      return this.todoList;
    },
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
