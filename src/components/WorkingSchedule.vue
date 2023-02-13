<template>
  <div class="container">
    <div class="schedule">
      <div class="schedule__body">
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
        <div class="cards" v-if="showFirstWeek">
          <div class="cards__body">
            <div class="card__title">Понеділок</div>
            <div class="card__column">
              <div class="card__text">
                <p>
                  Економічна психологія
                  <span class="card__activity card__activity_practice"
                    >прак</span
                  >
                </p>
                <p>
                  Психологія конфлікту
                  <span class="card__activity card__activity_lecture">лек</span>
                </p>
                <p>
                  Політична наука: конфліктологічний підхід
                  <span class="card__activity card__activity_practice"
                    >прак</span
                  >
                </p>
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
                  <span class="card__activity card__activity_lecture"
                    >лек
                  </span>
                </p>
              </div>
              <div class="card__subtitle">10:25</div>
            </div>
            <div class="card__column">
              <div class="card__text">
                <p>
                  Економічна психологія
                  <span class="card__activity card__activity_practice"
                    >прак</span
                  >
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
          <div class="cards__body">
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
                  <span class="card__activity card__activity_practice"
                    >прак</span
                  >
                </p>
              </div>
              <div class="card__subtitle">14:15</div>
            </div>
          </div>
          <div class="cards__body">
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
          <div class="cards__body">
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
                  <span class="card__activity card__activity_practice"
                    >прак</span
                  >
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
          <div class="cards__body">
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
                  <span class="card__activity card__activity_practice"
                    >прак</span
                  >
                </p>
              </div>
              <div class="card__subtitle">12:20</div>
            </div>
            <div class="card__column">
              <div class="card__text">
                <p>
                  Вступ до філософії
                  <span class="card__activity card__activity_practice"
                    >прак</span
                  >
                </p>
              </div>
              <div class="card__subtitle">14:15</div>
            </div>
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
.schedule__body {
}
.first-week {
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
  padding: 20px 20px;
  background: #f0f8ff;
  border: 2px solid #000;
  border-radius: 15px;
}
.card__title {
  font-weight: 600;
  font-size: 22px;
  display: inline-block;
  border-radius: 15px;
  margin: 0px 0px 40px 0px;
}
.card__column {
  margin: 0px 0px 40px 0px;
  border-bottom: 1px dotted #000;
}
.card__text {
  height: 150px;
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
.bgbtn {
  background-color: #d3d3d3;
}
</style>

<script>
export default {
  data: () => {
    return {
      showFirstWeek: true,
      showSecondWeek: false,
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
  },
};
</script>
