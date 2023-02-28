<template>
  <div class="wrapper">
    <header-navbar @openMainMenu="closeModalWindow(),addScroll()"/>
    <div class="schedule">
      <week-navbar
        @switchToFirstWeek="(showFirstWeek = true), (showSecondWeek = false)"
        @switchToSecondWeek="(showFirstWeek = false), (showSecondWeek = true)"
      />
      <day-navbar @setDaysList="setDaysList" :clientWidth="clientWidth" />
      <div
        class="cards"
        v-if="showFirstWeek"
        :class="{ jccenter: clientWidth < 920 }"
      >
        <div class="cards__body" v-if="days.monday || clientWidth > 919">
          <div class="card__title">Понеділок</div>
          <div class="card__column card__column_color">
            <div
              @click="
                scroollToTheTop(),
                  openModalWindow(),
                  removeScroll(),
                  setSubjectId('first'),
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
                <close-modal-window
                  @click="addScroll"
                  @click.stop="closeModalWindow"
                  v-if="showModalWindow.first"
                />
                <todo-list-card
                  @addTodo="addTodo"
                  @deleteTodo="deleteTodo"
                  :index="subjectIndex"
                  :filteredTodoList="filteredTodoList"
                  :clientWidth="clientWidth"
                />
              </div>
            </div>
            <div class="card__subtitle">8:30</div>
          </div>
          <div class="card__column">
            <div
              class="card__text"
              @click="
                scroollToTheTop(),
                  openModalWindow(),
                  removeScroll(),
                  setSubjectId('second'),
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
                <close-modal-window
                  @click="addScroll"
                  @click.stop="closeModalWindow"
                  v-if="showModalWindow.second"
                />
                <todo-list-card
                  @addTodo="addTodo"
                  :index="subjectIndex"
                  :filteredTodoListLength="filteredTodoList.length"
                  :filteredTodoList="filteredTodoList"
                  @deleteTodo="deleteTodo"
                />
              </div>
            </div>
            <div class="card__subtitle">10:25</div>
          </div>
          <div class="card__column card__column_color">
            <div
              class="card__text"
              @click="
                scroollToTheTop(),
                  openModalWindow(),
                  removeScroll(),
                  setSubjectId('third'),
                  filterTodos()
              "
            >
              <p>
                Соціальна психологія
                <span class="card__activity card__activity_practice">прак</span>
              </p>
              <div v-if="showModalWindow.third" class="data">
                <div class="data__block">
                  <div class="data__body">
                    <p>Соціальна психологія</p>
                    <p>Кононець Марія Олександрівна</p>
                    <p><a href="">Посилання (прак)</a></p>
                  </div>
                </div>
                <close-modal-window
                  @click="addScroll"
                  @click.stop="closeModalWindow"
                  v-if="showModalWindow.third"
                />
                <todo-list-card
                  @addTodo="addTodo"
                  :index="subjectIndex"
                  :filteredTodoListLength="filteredTodoList.length"
                  :filteredTodoList="filteredTodoList"
                  @deleteTodo="deleteTodo"
                />
              </div>
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
            <div
              class="card__text"
              @click="
                scroollToTheTop(),
                  openModalWindow(),
                  removeScroll(),
                  setSubjectId('fourth'),
                  filterTodos()
              "
            >
              <p>
                Конструкторське проектування радіоелектронної апаратури
                <span class="card__activity card__activity_lecture">лек</span>
              </p>
              <div v-if="showModalWindow.fourth" class="data">
                <div class="data__block">
                  <div class="data__body">
                    <p>
                      Конструкторське проектування радіоелектронної апаратури
                    </p>
                    <p>Губар В’ячеслав Григорович</p>
                    <p><a href="">Посилання (лек)</a></p>
                  </div>
                </div>
                <close-modal-window
                  @click="addScroll"
                  @click.stop="closeModalWindow"
                  v-if="showModalWindow.fourth"
                />
                <todo-list-card
                  @addTodo="addTodo"
                  :index="subjectIndex"
                  :filteredTodoListLength="filteredTodoList.length"
                  :filteredTodoList="filteredTodoList"
                  @deleteTodo="deleteTodo"
                />
              </div>
            </div>
            <div class="card__subtitle">8:30</div>
          </div>
          <div class="card__column card__column_color">
            <div
              class="card__text"
              @click="
                scroollToTheTop(),
                  openModalWindow(),
                  removeScroll(),
                  setSubjectId('fifth'),
                  filterTodos()
              "
            >
              <p>
                Електродинаміка та поширення радіохвиль
                <span class="card__activity card__activity_lecture">лек</span>
              </p>
              <div v-if="showModalWindow.fifth" class="data">
                <div class="data__block">
                  <div class="data__body">
                    <p>Електродинаміка та поширення радіохвиль</p>
                    <p>Пілінський В В</p>
                    <p><a href="">Посилання (лек)</a></p>
                  </div>
                </div>
                <close-modal-window
                  @click="addScroll"
                  @click.stop="closeModalWindow"
                  v-if="showModalWindow.fifth"
                />
                <todo-list-card
                  @addTodo="addTodo"
                  :index="subjectIndex"
                  :filteredTodoListLength="filteredTodoList.length"
                  :filteredTodoList="filteredTodoList"
                  @deleteTodo="deleteTodo"
                />
              </div>
            </div>
            <div class="card__subtitle">10:25</div>
          </div>
          <div class="card__column">
            <div
              class="card__text"
              @click="
                scroollToTheTop(),
                  openModalWindow(),
                  removeScroll(),
                  setSubjectId('sixth'),
                  filterTodos()
              "
            >
              <p>
                Методи обробки даних в інформатиці
                <span class="card__activity card__activity_lecture">лек</span>
              </p>
              <div v-if="showModalWindow.sixth" class="data">
                <div class="data__block">
                  <div class="data__body">
                    <p>Методи обробки даних в інформатиці</p>
                    <p>Бондаренко Наталія Олександрівна</p>
                    <p><a href="">Посилання (лек)</a></p>
                  </div>
                </div>
                <close-modal-window
                  @click="addScroll"
                  @click.stop="closeModalWindow"
                  v-if="showModalWindow.sixth"
                />
                <todo-list-card
                  @addTodo="addTodo"
                  :index="subjectIndex"
                  :filteredTodoListLength="filteredTodoList.length"
                  :filteredTodoList="filteredTodoList"
                  @deleteTodo="deleteTodo"
                />
              </div>
            </div>
            <div class="card__subtitle">12:20</div>
          </div>
          <div class="card__column card__column_color">
            <div
              class="card__text"
              @click="
                scroollToTheTop(),
                  openModalWindow(),
                  removeScroll(),
                  setSubjectId('seventh'),
                  filterTodos()
              "
            >
              <p>
                Методи обробки даних в інформатиці
                <span class="card__activity card__activity_practice">прак</span>
              </p>
              <div v-if="showModalWindow.seventh" class="data">
                <div class="data__block">
                  <div class="data__body">
                    <p>Методи обробки даних в інформатиці</p>
                    <p>Бондаренко Наталія Олександрівна</p>
                    <p><a href="">Посилання (прак)</a></p>
                  </div>
                </div>
                <close-modal-window
                  @click="addScroll"
                  @click.stop="closeModalWindow"
                  v-if="showModalWindow.seventh"
                />
                <todo-list-card
                  @addTodo="addTodo"
                  :index="subjectIndex"
                  :filteredTodoListLength="filteredTodoList.length"
                  :filteredTodoList="filteredTodoList"
                  @deleteTodo="deleteTodo"
                />
              </div>
            </div>
            <div class="card__subtitle">14:15</div>
          </div>
        </div>
        <div class="cards__body" v-if="days.wednesday || clientWidth > 919">
          <div class="card__title">Середа</div>
          <div class="card__column card__column_color">
            <div
              class="card__text"
              @click="
                scroollToTheTop(),
                  openModalWindow(),
                  removeScroll(),
                  setSubjectId('eighth'),
                  filterTodos()
              "
            >
              <p>
                Схемотехніка
                <span class="card__activity card__activity_lecture">лек</span>
              </p>
              <div v-if="showModalWindow.eighth" class="data">
                <div class="data__block">
                  <div class="data__body">
                    <p>Схемотехніка</p>
                    <p>Короткий Є В</p>
                    <p><a href="">Посилання (лек)</a></p>
                  </div>
                </div>
                <close-modal-window
                  @click="addScroll"
                  @click.stop="closeModalWindow"
                  v-if="showModalWindow.eighth"
                />
                <todo-list-card
                  @addTodo="addTodo"
                  :index="subjectIndex"
                  :filteredTodoListLength="filteredTodoList.length"
                  :filteredTodoList="filteredTodoList"
                  @deleteTodo="deleteTodo"
                />
              </div>
            </div>
            <div class="card__subtitle">8:30</div>
          </div>
          <div class="card__column">
            <div
              class="card__text"
              @click="
                scroollToTheTop(),
                  openModalWindow(),
                  removeScroll(),
                  setSubjectId('ninth'),
                  filterTodos()
              "
            >
              <p>
                Вступ до філософії
                <span class="card__activity card__activity_lecture">лек</span>
              </p>
              <div v-if="showModalWindow.ninth" class="data">
                <div class="data__block">
                  <div class="data__body">
                    <p>Вступ до філософії</p>
                    <p>Потіщук Ольга Олегівна</p>
                    <p><a href="">Посилання (лек)</a></p>
                  </div>
                </div>
                <close-modal-window
                  @click="addScroll"
                  @click.stop="closeModalWindow"
                  v-if="showModalWindow.ninth"
                />
                <todo-list-card
                  @addTodo="addTodo"
                  :index="subjectIndex"
                  :filteredTodoListLength="filteredTodoList.length"
                  :filteredTodoList="filteredTodoList"
                  @deleteTodo="deleteTodo"
                />
              </div>
            </div>
            <div class="card__subtitle">10:25</div>
          </div>
          <div class="card__column card__column_color">
            <div
              class="card__text"
              @click="
                scroollToTheTop(),
                  openModalWindow(),
                  removeScroll(),
                  setSubjectId('tenth'),
                  filterTodos()
              "
            >
              <p>
                Функціонально-логічне проектування
                <span class="card__activity card__activity_lecture">лек</span>
              </p>
              <div v-if="showModalWindow.tenth" class="data">
                <div class="data__block">
                  <div class="data__body">
                    <p>Функціонально-логічне проектування</p>
                    <p>Редько Ігор Володимирович</p>
                    <p><a href="">Посилання (лек)</a></p>
                  </div>
                </div>
                <close-modal-window
                  @click="addScroll"
                  @click.stop="closeModalWindow"
                  v-if="showModalWindow.tenth"
                />
                <todo-list-card
                  @addTodo="addTodo"
                  :index="subjectIndex"
                  :filteredTodoListLength="filteredTodoList.length"
                  :filteredTodoList="filteredTodoList"
                  @deleteTodo="deleteTodo"
                />
              </div>
            </div>
            <div class="card__subtitle">12:20</div>
          </div>
          <div class="card__column">
            <div
              class="card__text"
              @click="
                scrollToTheTop(),
                  openModalWindow(),
                  removeScroll(),
                  setSubjectId('eleventh'),
                  filterTodos()
              "
            >
              <p>
                Електродинаміка та поширення радіохвиль
                <span class="card__activity card__activity_lecture">лек</span>
              </p>
              <div v-if="showModalWindow.eleventh" class="data">
                <div class="data__block">
                  <div class="data__body">
                    <p>Електродинаміка та поширення радіохвиль</p>
                    <p>Пілінський В В</p>
                    <p><a href="">Посилання (лек)</a></p>
                  </div>
                </div>
                <close-modal-window
                  @click="addScroll"
                  @click.stop="closeModalWindow"
                  v-if="showModalWindow.eleventh"
                />
                <todo-list-card
                  @addTodo="addTodo"
                  :index="subjectIndex"
                  :filteredTodoListLength="filteredTodoList.length"
                  :filteredTodoList="filteredTodoList"
                  @deleteTodo="deleteTodo"
                />
              </div>
            </div>
            <div class="card__subtitle">14:15</div>
          </div>
        </div>
        <div class="cards__body" v-if="days.thursday || clientWidth > 919">
          <div class="card__title">Четвер</div>
          <div class="card__column">
            <div
              class="card__text"
              @click="
                scroollToTheTop(),
                  openModalWindow(),
                  removeScroll(),
                  setSubjectId('twelfth'),
                  filterTodos()
              "
            >
              <p>
                Конструкторське проектування радіоелектронної апаратури
                <span class="card__activity card__activity_lab">лаб</span>
              </p>
              <div v-if="showModalWindow.twelfth" class="data">
                <div class="data__block">
                  <div class="data__body">
                    <p>
                      Конструкторське проектування радіоелектронної апаратури
                    </p>
                    <p>Адаменко І О</p>
                    <p><a href="">Посилання (лаб)</a></p>
                  </div>
                </div>
                <close-modal-window
                  @click="addScroll"
                  @click.stop="closeModalWindow"
                  v-if="showModalWindow.twelfth"
                />
                <todo-list-card
                  @addTodo="addTodo"
                  :index="subjectIndex"
                  :filteredTodoListLength="filteredTodoList.length"
                  :filteredTodoList="filteredTodoList"
                  @deleteTodo="deleteTodo"
                />
              </div>
            </div>
            <div class="card__subtitle">8:30</div>
          </div>
          <div class="card__column card__column_color">
            <div
              class="card__text"
              @click="
                scroollToTheTop(),
                  openModalWindow(),
                  removeScroll(),
                  setSubjectId('thirteenth'),
                  filterTodos()
              "
            >
              <p>
                Практичний курс іноземної мови
                <span class="card__activity card__activity_practice">прак</span>
              </p>
              <div v-if="showModalWindow.thirteenth" class="data">
                <div class="data__block">
                  <div class="data__body">
                    <p>Практичний курс іноземної мови. Частина 1</p>
                    <p>Дем'янюк Наталія Олександрівна</p>
                    <p><a href="">Посилання (прак)</a></p>
                  </div>
                </div>
                <close-modal-window
                  @click="addScroll"
                  @click.stop="closeModalWindow"
                  v-if="showModalWindow.thirteenth"
                />
                <todo-list-card
                  @addTodo="addTodo"
                  :index="subjectIndex"
                  :filteredTodoListLength="filteredTodoList.length"
                  :filteredTodoList="filteredTodoList"
                  @deleteTodo="deleteTodo"
                />
              </div>
            </div>
            <div class="card__subtitle">10:25</div>
          </div>
          <div class="card__column">
            <div class="card__text"></div>
            <div class="card__subtitle">12:20</div>
          </div>
          <div class="card__column card__column_color">
            <div class="card__text"></div>
            <div class="card__subtitle">14:15</div>
          </div>
        </div>
        <div class="cards__body" v-if="days.friday || clientWidth > 919">
          <div class="card__title">П'ятниця</div>
          <div class="card__column card__column_color">
            <div class="card__text"></div>
            <div class="card__subtitle">8:30</div>
          </div>
          <div class="card__column">
            <div class="card__text"></div>
            <div class="card__subtitle">10:25</div>
          </div>
          <div class="card__column card__column_color">
            <div
              class="card__text"
              @click="
                scroollToTheTop(),
                  openModalWindow(),
                  removeScroll(),
                  setSubjectId('fourteenth'),
                  filterTodos()
              "
            >
              <p>
                Електродинаміка та поширення радіохвиль
                <span class="card__activity card__activity_practice">прак</span>
              </p>
              <div v-if="showModalWindow.fourteenth" class="data">
                <div class="data__block">
                  <div class="data__body">
                    <p>Електродинаміка та поширення радіохвиль -1</p>
                    <p>Бондаренко Віктор Миколайович</p>
                    <p><a href="">Посилання (прак)</a></p>
                  </div>
                </div>
                <close-modal-window
                  @click="addScroll"
                  @click.stop="closeModalWindow"
                  v-if="showModalWindow.fourteenth"
                />
                <todo-list-card
                  @addTodo="addTodo"
                  :index="subjectIndex"
                  :filteredTodoListLength="filteredTodoList.length"
                  :filteredTodoList="filteredTodoList"
                  @deleteTodo="deleteTodo"
                />
              </div>
            </div>
            <div class="card__subtitle">12:20</div>
          </div>
          <div class="card__column">
            <div
              class="card__text"
              @click="
                scroollToTheTop(),
                  openModalWindow(),
                  removeScroll(),
                  setSubjectId('fifteenth'),
                  filterTodos()
              "
            >
              <p>
                Вступ до філософії
                <span class="card__activity card__activity_practice">прак</span>
              </p>
              <div v-if="showModalWindow.fifteenth" class="data">
                <div class="data__block">
                  <div class="data__body">
                    <p>Вступ до філософії</p>
                    <p>Волотовська Валентина Петрівна</p>
                    <p><a href="">Посилання (прак)</a></p>
                  </div>
                </div>
                <close-modal-window
                  @click="addScroll"
                  @click.stop="closeModalWindow"
                  v-if="showModalWindow.fifteenth"
                />
                <todo-list-card
                  @addTodo="addTodo"
                  :index="subjectIndex"
                  :filteredTodoListLength="filteredTodoList.length"
                  :filteredTodoList="filteredTodoList"
                  @deleteTodo="deleteTodo"
                />
              </div>
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
          <div class="card__column card__column_color">
            <div
              @click="
                scroollToTheTop(),
                  openModalWindow(),
                  removeScroll(),
                  setSubjectId('first2'),
                  filterTodos()
              "
              class="card__text"
            >
              <p>
                Психологія конфлікту
                <span class="card__activity card__activity_lecture">лек</span>
              </p>
              <div v-if="showModalWindow.first2" class="data">
                <div class="data__block">
                  <div class="data__body">
                    <p>Психологія конфлікту</p>
                    <p>Сербова Ольга Вікторівна</p>
                    <p><a href="">Посилання (лек)</a></p>
                  </div>
                </div>
                <close-modal-window
                  @click="addScroll"
                  @click.stop="closeModalWindow"
                  v-if="showModalWindow.first2"
                />
                <todo-list-card
                  @addTodo="addTodo"
                  @deleteTodo="deleteTodo"
                  :index="subjectIndex"
                  :filteredTodoList="filteredTodoList"
                  :clientWidth="clientWidth"
                />
              </div>
            </div>
            <div class="card__subtitle">8:30</div>
          </div>
          <div class="card__column">
            <div
              @click="
                scroollToTheTop(),
                  openModalWindow(),
                  removeScroll(),
                  setSubjectId('second2'),
                  filterTodos()
              "
              class="card__text"
            >
              <p>
                Політична участь
                <span class="card__activity card__activity_practice">прак</span>
              </p>
              <div v-if="showModalWindow.second2" class="data">
                <div class="data__block">
                  <div class="data__body">
                    <p>Політична участь</p>
                    <p>Пашов Ростислав Іванович</p>
                    <p><a href="">Посилання (прак)</a></p>
                  </div>
                </div>
                <close-modal-window
                  @click="addScroll"
                  @click.stop="closeModalWindow"
                  v-if="showModalWindow.second2"
                />
                <todo-list-card
                  @addTodo="addTodo"
                  @deleteTodo="deleteTodo"
                  :index="subjectIndex"
                  :filteredTodoList="filteredTodoList"
                  :clientWidth="clientWidth"
                />
              </div>
            </div>
            <div class="card__subtitle">10:25</div>
          </div>
          <div class="card__column card__column_color">
            <div
              class="card__text"
              @click="
                scroollToTheTop(),
                  openModalWindow(),
                  removeScroll(),
                  setSubjectId('third2'),
                  filterTodos()
              "
            >
              <p>
                Соціальна психологія
                <span class="card__activity card__activity_lecture">лек</span>
              </p>
              <div v-if="showModalWindow.third2" class="data">
                <div class="data__block">
                  <div class="data__body">
                    <p>Соціальна психологія</p>
                    <p>Винославська Олена Василівна</p>
                    <p><a href="">Посилання (лек)</a></p>
                  </div>
                </div>
                <close-modal-window
                  @click="addScroll"
                  @click.stop="closeModalWindow"
                  v-if="showModalWindow.third2"
                />
                <todo-list-card
                  @addTodo="addTodo"
                  @deleteTodo="deleteTodo"
                  :index="subjectIndex"
                  :filteredTodoList="filteredTodoList"
                  :clientWidth="clientWidth"
                />
              </div>
            </div>
            <div class="card__subtitle">12:20</div>
          </div>
          <div class="card__column">
            <div
              class="card__text"
              @click="
                scroollToTheTop(),
                  openModalWindow(),
                  removeScroll(),
                  setSubjectId('fourth2'),
                  filterTodos()
              "
            >
              <p>
                Розумні міста
                <span class="card__activity card__activity_lecture">лек</span>
              </p>
              <div v-if="showModalWindow.fourth2" class="data">
                <div class="data__block">
                  <div class="data__body">
                    <p>Розумні міста</p>
                    <p>Чукут Світлана Анатоліївна</p>
                    <p><a href="">Посилання (лек)</a></p>
                  </div>
                </div>
                <close-modal-window
                  @click="addScroll"
                  @click.stop="closeModalWindow"
                  v-if="showModalWindow.fourth2"
                />
                <todo-list-card
                  @addTodo="addTodo"
                  @deleteTodo="deleteTodo"
                  :index="subjectIndex"
                  :filteredTodoList="filteredTodoList"
                  :clientWidth="clientWidth"
                />
              </div>
            </div>
            <div class="card__subtitle">14:15</div>
          </div>
        </div>
        <div class="cards__body" v-if="days.tuesday || clientWidth > 919">
          <div class="card__title">Вівторок</div>
          <div class="card__column">
            <div
              class="card__text"
              @click="
                scroollToTheTop(),
                  openModalWindow(),
                  removeScroll(),
                  setSubjectId('fifth2'),
                  filterTodos()
              "
            >
              <p>
                Конструкторське проектування радіоелектронної апаратури
                <span class="card__activity card__activity_lecture">лек</span>
              </p>
              <div v-if="showModalWindow.fifth2" class="data">
                <div class="data__block">
                  <div class="data__body">
                    <p>
                      Конструкторське проектування радіоелектронної апаратури
                    </p>
                    <p>Губар В’ячеслав Григорович</p>
                    <p><a href="">Посилання (лек)</a></p>
                  </div>
                </div>
                <close-modal-window
                  @click="addScroll"
                  @click.stop="closeModalWindow"
                  v-if="showModalWindow.fifth2"
                />
                <todo-list-card
                  @addTodo="addTodo"
                  @deleteTodo="deleteTodo"
                  :index="subjectIndex"
                  :filteredTodoList="filteredTodoList"
                  :clientWidth="clientWidth"
                />
              </div>
            </div>
            <div class="card__subtitle">8:30</div>
          </div>
          <div class="card__column card__column_color">
            <div
              class="card__text"
              @click="
                scroollToTheTop(),
                  openModalWindow(),
                  removeScroll(),
                  setSubjectId('sixth2'),
                  filterTodos()
              "
            >
              <p>
                Електродинаміка та поширення радіохвиль
                <span class="card__activity card__activity_lecture">лек</span>
              </p>
              <div v-if="showModalWindow.sixth2" class="data">
                <div class="data__block">
                  <div class="data__body">
                    <p>Електродинаміка та поширення радіохвиль</p>
                    <p>Пілінський В В</p>
                    <p><a href="">Посилання (лек)</a></p>
                  </div>
                </div>
                <close-modal-window
                  @click="addScroll"
                  @click.stop="closeModalWindow"
                  v-if="showModalWindow.sixth2"
                />
                <todo-list-card
                  @addTodo="addTodo"
                  @deleteTodo="deleteTodo"
                  :index="subjectIndex"
                  :filteredTodoList="filteredTodoList"
                  :clientWidth="clientWidth"
                />
              </div>
            </div>
            <div class="card__subtitle">10:25</div>
          </div>
          <div class="card__column">
            <div class="card__text"></div>
            <div class="card__subtitle">12:20</div>
          </div>
          <div class="card__column card__column_color">
            <div class="card__text"></div>
            <div class="card__subtitle">14:15</div>
          </div>
        </div>
        <div class="cards__body" v-if="days.wednesday || clientWidth > 919">
          <div class="card__title">Середа</div>
          <div class="card__column card__column_color">
            <div
              class="card__text"
              @click="
                scroollToTheTop(),
                  openModalWindow(),
                  removeScroll(),
                  setSubjectId('seventh2'),
                  filterTodos()
              "
            >
              <p>
                Схемотехніка
                <span class="card__activity card__activity_lecture">лек</span>
              </p>
              <div v-if="showModalWindow.seventh2" class="data">
                <div class="data__block">
                  <div class="data__body">
                    <p>Схемотехніка</p>
                    <p>Короткий Є. В.</p>
                    <p><a href="">Посилання (лек)</a></p>
                  </div>
                </div>
                <close-modal-window
                  @click="addScroll"
                  @click.stop="closeModalWindow"
                  v-if="showModalWindow.seventh2"
                />
                <todo-list-card
                  @addTodo="addTodo"
                  @deleteTodo="deleteTodo"
                  :index="subjectIndex"
                  :filteredTodoList="filteredTodoList"
                  :clientWidth="clientWidth"
                />
              </div>
            </div>
            <div class="card__subtitle">8:30</div>
          </div>
          <div class="card__column">
            <div
              class="card__text"
              @click="
                scroollToTheTop(),
                  openModalWindow(),
                  removeScroll(),
                  setSubjectId('eighth2'),
                  filterTodos()
              "
            >
              <p>
                Функціонально-логічне проектування
                <span class="card__activity card__activity_lecture">лек</span>
              </p>
              <div v-if="showModalWindow.eighth2" class="data">
                <div class="data__block">
                  <div class="data__body">
                    <p>Функціонально-логічне проектування</p>
                    <p>Редько І. В.</p>
                    <p><a href="">Посилання (лек)</a></p>
                  </div>
                </div>
                <close-modal-window
                  @click="addScroll"
                  @click.stop="closeModalWindow"
                  v-if="showModalWindow.eighth2"
                />
                <todo-list-card
                  @addTodo="addTodo"
                  @deleteTodo="deleteTodo"
                  :index="subjectIndex"
                  :filteredTodoList="filteredTodoList"
                  :clientWidth="clientWidth"
                />
              </div>
            </div>
            <div class="card__subtitle">10:25</div>
          </div>
          <div class="card__column card__column_color">
            <div
              class="card__text"
              @click="
                scroollToTheTop(),
                  openModalWindow(),
                  removeScroll(),
                  setSubjectId('ninth2'),
                  filterTodos()
              "
            >
              <p>
                Функціонально-логічне проектування
                <span class="card__activity card__activity_lecture">лек</span>
              </p>
              <div v-if="showModalWindow.ninth2" class="data">
                <div class="data__block">
                  <div class="data__body">
                    <p>Функціонально-логічне проектування</p>
                    <p>Редько І. В.</p>
                    <p><a href="">Посилання (лек)</a></p>
                  </div>
                </div>
                <close-modal-window
                  @click="addScroll"
                  @click.stop="closeModalWindow"
                  v-if="showModalWindow.ninth2"
                />
                <todo-list-card
                  @addTodo="addTodo"
                  @deleteTodo="deleteTodo"
                  :index="subjectIndex"
                  :filteredTodoList="filteredTodoList"
                  :clientWidth="clientWidth"
                />
              </div>
            </div>
            <div class="card__subtitle">12:20</div>
          </div>
          <div class="card__column">
            <div
              class="card__text"
              @click="
                scroollToTheTop(),
                  openModalWindow(),
                  removeScroll(),
                  setSubjectId('tenth2'),
                  filterTodos()
              "
            >
              <p>
                Електродинаміка та поширення радіохвиль
                <span class="card__activity card__activity_lecture">лек</span>
              </p>
              <div v-if="showModalWindow.tenth2" class="data">
                <div class="data__block">
                  <div class="data__body">
                    <p>Електродинаміка та поширення радіохвиль</p>
                    <p>Пілінський В. В.</p>
                    <p><a href="">Посилання (лек)</a></p>
                  </div>
                </div>
                <close-modal-window
                  @click="addScroll"
                  @click.stop="closeModalWindow"
                  v-if="showModalWindow.tenth2"
                />
                <todo-list-card
                  @addTodo="addTodo"
                  @deleteTodo="deleteTodo"
                  :index="subjectIndex"
                  :filteredTodoList="filteredTodoList"
                  :clientWidth="clientWidth"
                />
              </div>
            </div>
            <div class="card__subtitle">14:15</div>
          </div>
        </div>
        <div class="cards__body" v-if="days.thursday || clientWidth > 919">
          <div class="card__title">Четвер</div>
          <div class="card__column">
            <div
              class="card__text"
              @click="
                scroollToTheTop(),
                  openModalWindow(),
                  removeScroll(),
                  setSubjectId('eleventh2'),
                  filterTodos()
              "
            >
              <p>
                Конструкторське проектування радіоелектронної апаратури
                <span class="card__activity card__activity_lab">лаб</span>
              </p>
              <div v-if="showModalWindow.eleventh2" class="data">
                <div class="data__block">
                  <div class="data__body">
                    <p>
                      Конструкторське проектування радіоелектронної апаратури
                    </p>
                    <p>Адаменко І О</p>
                    <p><a href="">Посилання (лаб)</a></p>
                  </div>
                </div>
                <close-modal-window
                  @click="addScroll"
                  @click.stop="closeModalWindow"
                  v-if="showModalWindow.eleventh2"
                />
                <todo-list-card
                  @addTodo="addTodo"
                  @deleteTodo="deleteTodo"
                  :index="subjectIndex"
                  :filteredTodoList="filteredTodoList"
                  :clientWidth="clientWidth"
                />
              </div>
            </div>
            <div class="card__subtitle">8:30</div>
          </div>
          <div class="card__column card__column_color">
            <div
              class="card__text"
              @click="
                scroollToTheTop(),
                  openModalWindow(),
                  removeScroll(),
                  setSubjectId('twelfth2'),
                  filterTodos()
              "
            >
              <p>
                Практичний курс іноземної мови
                <span class="card__activity card__activity_practice">прак</span>
              </p>
              <div v-if="showModalWindow.twelfth2" class="data">
                <div class="data__block">
                  <div class="data__body">
                    <p>Практичний курс іноземної мови</p>
                    <p>Дем'янюк Наталія Олександрівна</p>
                    <p><a href="">Посилання (прак)</a></p>
                  </div>
                </div>
                <close-modal-window
                  @click="addScroll"
                  @click.stop="closeModalWindow"
                  v-if="showModalWindow.twelfth2"
                />
                <todo-list-card
                  @addTodo="addTodo"
                  @deleteTodo="deleteTodo"
                  :index="subjectIndex"
                  :filteredTodoList="filteredTodoList"
                  :clientWidth="clientWidth"
                />
              </div>
            </div>
            <div class="card__subtitle">10:25</div>
          </div>
          <div class="card__column">
            <div class="card__text"></div>
            <div class="card__subtitle">12:20</div>
          </div>
          <div class="card__column card__column_color">
            <div class="card__text"></div>
            <div class="card__subtitle">14:15</div>
          </div>
        </div>
        <div class="cards__body" v-if="days.friday || clientWidth > 919">
          <div class="card__title">П'ятниця</div>
          <div class="card__column card__column_color">
            <div
              class="card__text"
              @click="
                scroollToTheTop(),
                  openModalWindow(),
                  removeScroll(),
                  setSubjectId('thirteenth2'),
                  filterTodos()
              "
            >
              <p>
                Схемотехніка
                <span class="card__activity card__activity_lecture">лек</span>
              </p>
              <div v-if="showModalWindow.thirteenth2" class="data">
                <div class="data__block">
                  <div class="data__body">
                    <p>Схемотехніка</p>
                    <p>доц. Короткий Є. В.</p>
                    <p><a href="">Посилання (лек)</a></p>
                  </div>
                </div>
                <close-modal-window
                  @click="addScroll"
                  @click.stop="closeModalWindow"
                  v-if="showModalWindow.thirteenth2"
                />
                <todo-list-card
                  @addTodo="addTodo"
                  @deleteTodo="deleteTodo"
                  :index="subjectIndex"
                  :filteredTodoList="filteredTodoList"
                  :clientWidth="clientWidth"
                />
              </div>
            </div>
            <div class="card__subtitle">8:30</div>
          </div>
          <div class="card__column">
            <div
              class="card__text"
              @click="
                scroollToTheTop(),
                  openModalWindow(),
                  removeScroll(),
                  setSubjectId('fourteenth2'),
                  filterTodos()
              "
            >
              <p>
                Функціонально-логічне проектування
                <span class="card__activity card__activity_lab">лаб</span>
              </p>
              <div v-if="showModalWindow.fourteenth2" class="data">
                <div class="data__block">
                  <div class="data__body">
                    <p>Функціонально-логічне проектування</p>
                    <p>Омелян А. В.</p>
                    <p><a href="">Посилання (лаб)</a></p>
                  </div>
                </div>
                <close-modal-window
                  @click="addScroll"
                  @click.stop="closeModalWindow"
                  v-if="showModalWindow.fourteenth2"
                />
                <todo-list-card
                  @addTodo="addTodo"
                  @deleteTodo="deleteTodo"
                  :index="subjectIndex"
                  :filteredTodoList="filteredTodoList"
                  :clientWidth="clientWidth"
                />
              </div>
            </div>
            <div class="card__subtitle">10:25</div>
          </div>
          <div class="card__column card__column_color">
            <div
              class="card__text"
              @click="
                scroollToTheTop(),
                  openModalWindow(),
                  removeScroll(),
                  setSubjectId('fifteenth2'),
                  filterTodos()
              "
            >
              <p>
                Електродинаміка та поширення радіохвиль
                <span class="card__activity card__activity_lab">лаб</span>
              </p>
              <div v-if="showModalWindow.fifteenth2" class="data">
                <div class="data__block">
                  <div class="data__body">
                    <p>Електродинаміка та поширення радіохвиль</p>
                    <p>Бондаренко В. М.</p>
                    <p><a href="">Посилання (лаб)</a></p>
                  </div>
                </div>
                <close-modal-window
                  @click="addScroll"
                  @click.stop="closeModalWindow"
                  v-if="showModalWindow.fifteenth2"
                />
                <todo-list-card
                  @addTodo="addTodo"
                  @deleteTodo="deleteTodo"
                  :index="subjectIndex"
                  :filteredTodoList="filteredTodoList"
                  :clientWidth="clientWidth"
                />
              </div>
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
    <footer-navbar />
  </div>
</template>

<style scoped>
@import url("../assets/css/WorkingSchedule");
</style>

<script>
import WeekNavbar from "./WeekNavbar.vue";
import DayNavbar from "./DayNavbar.vue";
import TodoListCard from "./TodoListCard.vue";
import CloseModalWindow from "./CloseModalWindow.vue";
import HeaderNavbar from "./HeaderNavbar.vue";
import FooterNavbar from "./FooterNavbar.vue";

export default {
  components: {
    WeekNavbar,
    DayNavbar,
    TodoListCard,
    CloseModalWindow,
    HeaderNavbar,
    FooterNavbar,
  },

  data: () => {
    return {
      showFirstWeek: true,
      showSecondWeek: false,
      showModalWindow: {
        //first week
        first: false,
        second: false,
        third: false,
        fourth: false,
        fifth: false,
        sixth: false,
        seventh: false,
        eighth: false,
        ninth: false,
        tenth: false,
        eleventh: false,
        twelfth: false,
        fourteenth: false,
        fifteenth: false,
        //   second week
        first2: false,
        second2: false,
        third2: false,
        fourth2: false,
        fifth2: false,
        sixth2: false,
        seventh2: false,
        eighth2: false,
        ninth2: false,
        tenth2: false,
        eleventh2: false,
        twelfth2: false,
        fourteenth2: false,
        fifteenth2: false,
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
      clientWidth: null,
    };
  },

  methods: {
	hello(){
		console.log('hello');
	},
    openModalWindow() {
      setTimeout(() => {
        this.showModalWindow[this.subjectIndex] = true;
      }, 10);
    },
    closeModalWindow() {
      this.showModalWindow[this.subjectIndex] = false;
    },
    closeModalWindow2() {
      this.showModalWindow[this.subjectIndex] = false;
      console.log("success");
    },
    getWindowSize() {
      this.clientWidth = window.screen.width;
    },
    removeScroll() {
      document.body.style.overflow = "hidden";
    },
    addScroll() {
      document.body.style.overflowY = "scroll";
    },

    addTodo(currentTodo) {
      this.todoList = [...this.todoList, currentTodo];
    },
    setSubjectId(idx) {
      this.subjectIndex = idx;
    },
    deleteTodo(elementToDelete) {
      this.todoList = this.todoList.filter((t) => t != elementToDelete);
    },
    setDaysList(list) {
      this.days = list;
    },
    filterTodos() {
      setTimeout(() => {
        this.filteredTodoList = this.todoList.filter(
          (t) => t.id == this.subjectIndex
        );
      }, 20);
    },
    returnTodos() {
      return this.todoList;
    },
    handleKeydown(e) {
      if (e.key === "Escape") {
        this.closeModalWindow();
        this.addScroll();
      }
    },
    scroollToTheTop() {
      window.scrollTo(0, 0);
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
