<template>
  <MyNavbar />
  <div class="wrapper">
    <div class="section">
      <div class="container_one">
        <form class="form">
          <h2>Основная информация</h2>
          <div style="display:flex;">
            <div style="margin-right:20px">
              <div class="input-cont">
                <label class="label" for="first_name">Имя</label>
                <MyInput
                  v-model="first_name"
                  class="input"
                  id="inputName"
                  type="text"
                  name="first_name"
                  @input="updateInputName"
                />
                <div class="cross" v-if="crossVisName" @click="deleteTextOne"></div>
              </div>
            </div>
            <div>
              <div class="input-cont">
                <label class="label" for="middle_name">Отчество</label>
                <MyInput
                  v-model="middle_name"
                  class="input"
                  id="inputMiddleName"
                  type="text"
                  name="middle_name"
                  @input="updateInputMiddleName"
                />
                <div class="cross" v-if="crossVisMiddleName" @click="deleteTextTwo"></div>
              </div>
            </div>
          </div>
          <div class="input-cont">
            <label class="label" for="last_name"> Фамилия</label>
            <MyInput
              v-model="last_name"
              class="input"
              type="text"
              id="inputLastName"
              name="last_name"
              @input="updateInputLastName"
            />
            <div class="cross" v-if="crossVisLastName" @click="deleteTextThree"></div>
          </div>
          <div class="input-cont">
            <label class="label" for="location">Локация</label>
            <MyInput
              v-model="location"
              class="input"
              type="text"
              id="inputLocation"
              name="location"
              @input="updateInputLocation"
            />
            <div class="cross" v-if="crossVisLocation" @click="deleteTextFour"></div>
          </div>
          <div class="input-cont">
            <label class="label" for="phone"> Телефон</label>
            <MyInput v-model="phone" class="input" type="text" id="inputPhone" name="phone" @input="updateInputPhone" />
            <div class="cross" v-if="crossVisPhone" @click="deleteTextFive"></div>
          </div>
          <div class="input-cont">
            <label class="label" for="telegram">Telegram</label>
            <MyInput
              v-model="telegram"
              class="input"
              type="tel"
              id="inputTelegram"
              name="telegram"
              @input="updateInputTelegram"
            />
            <div class="cross" v-if="crossVisTelegram" @click="deleteTextSix"></div>
          </div>
        </form>
      </div>
      <div class="container_four">
        <div>
          <h2>Новый пароль</h2>
        </div>
        <div style="display:flex; ">
          <div style="margin-right:10px; width: 45%;">
            <label class="label" for="password">Пароль</label>
            <MyInput
              v-model="password"
              class="input"
              :type="showPassword ? 'text' : 'password'"
              name="password"
              id="password"
              @input="updateInputPasswordBtn"
              @click="updateInputPassword"
            />
          </div>
          <div style=" width: 45%;">
            <label class="label" for="passwordRepeat">Повторите пароль</label>
            <MyInput
              v-model="passwordRepeat"
              :type="showPassword ? 'text' : 'password'"
              class="input"
              name="passwordRepeat"
              id="passwordRepeat"
              @input="updateInputPasswordBtn"
              @click="updateInputPassword"
            />
          </div>
          <div class="passwordVis" @click="showPassword = !showPassword"></div>
        </div>
      </div>
    </div>

    <div class="container_two">
      <form class="form">
        <h2>BIO</h2>
        <p style="margin:0 0 20px 0">А вот без био сотрудник может, скорее всего он и будет без него</p>
        <label class="label" for="myself">О себе</label>
        <textarea v-model="bio" class="textarea" name="myself" cols="60" rows="10">{{ bio }}</textarea>
      </form>
    </div>
    <div>
      <div class="container_three">
        <form enctype="multipart/form-data" method="post">
          <div class="blockFlex">
            <h2 style="display:inline-block; margin:0">Аватар</h2>

            <div class="blockPhoto">
              <label class="labelImg" for="file"></label>
              <input
                type="file"
                id="file"
                name="photo"
                multiple
                accept="image/*,image/jpeg"
              />
            </div>
          </div>
          <div class="imgEdit"></div>
        </form>
      </div>
    </div>
  </div>
  <MyButton class="btn" @click="saveСhange" id="btn">Сохранить</MyButton>
  <div class="back" @click="$router.push('/profile')">
    <div class="arrow">назад</div>
  </div>
</template>

<script>
import axios from 'axios';
import MyNavbar from '@/components/UI/MyNavbar.vue';
import MyInput from '@/components/UI/MyInput.vue';
import MyButton from '@/components/UI/MyButton.vue';

export default {
  components: {
    MyNavbar,
    MyInput,
    MyButton
  },

  data() {
    return {
      crossVisName: true,
      crossVisLastName: true,
      crossVisMiddleName: true,
      crossVisLocation: true,
      crossVisPhone: true,
      crossVisTelegram: true,
      first_name: null,
      middle_name: null,
      last_name: null,
      location: null,
      telegram: null,
      phone: null,
      password: null,
      passwordRepeat: null,
      birthday: null,
      position: null,
      bio: null,
      id: null,
      showPassword:false

    };
  },

  methods: {
    deleteTextOne() {
      this.first_name = '';
      this.crossVisName = false;
      btn.classList.remove('btn-blue');
    },

    deleteTextTwo() {
      this.middle_name = '';
      this.crossVisMiddleName = false;
      btn.classList.remove('btn-blue');
    },

    deleteTextThree() {
      this.last_name = '';
      this.crossVisLastName = false;
      btn.classList.remove('btn-blue');
    },

    deleteTextFour() {
      this.location = '';
      this.crossVisLocation = false;
      btn.classList.remove('btn-blue');
    },

    deleteTextFive() {
      this.phone = '';
      this.crossVisPhone = false;
      btn.classList.remove('btn-blue');
    },

    deleteTextSix() {
      this.telegram = '';
      this.crossVisTelegram = false;
      btn.classList.remove('btn-blue');
    },

    updateInputName(event) {
      let len = event.target.value;
      console.log(len);
      if (len.length > 0) {
        this.crossVisName = true;
        btn.classList.add('btn-blue');
      } else {
        this.crossVisName = false;
      }
    },

    updateInputLastName(event) {
      let len = event.target.value;
      if (len.length > 0) {
        this.crossVisLastName = true;
        btn.classList.add('btn-blue');
      } else {
        this.crossVisLastName = false;
      }
    },

    updateInputMiddleName(event) {
      let len = event.target.value;
      if (len.length > 0) {
        this.crossVisMiddleName = true;
        btn.classList.add('btn-blue');
      } else {
        this.crossVisMiddleName = false;
      }
    },

    updateInputLocation(event) {
      let len = event.target.value;
      if (len.length > 0) {
        this.crossVisLocation = true;
        btn.classList.add('btn-blue');
      } else {
        this.crossVisLocation = false;
      }
    },

    updateInputPhone(event) {
      let len = event.target.value;
      if (len.length > 0) {
        this.crossVisPhone = true;
        btn.classList.add('btn-blue');
      } else {
        this.crossVisPhone = false;
      }
    },

    updateInputTelegram(event) {
      let len = event.target.value;
      if (len.length > 0) {
        this.crossVisTelegram = true;
        btn.classList.add('btn-blue');
      } else {
        this.crossVisTelegram = false;
      }
    },

    updateInputPassword() {
        password.style.boxShadow = 'none';
        passwordRepeat.style.boxShadow = 'none';
    },

    updateInputPasswordBtn(event){
        btn.classList.add('btn-blue');
    },

    async saveСhange() {
      if (this.password == this.passwordRepeat) {
        try {
          const user = {
            first_name: this.first_name,
            middle_name: this.middle_name,
            last_name: this.last_name,
            location: this.location,
            phone: this.phone,
            telegram: this.telegram,
            birthday: this.birthday,
            position: this.position,
            password: this.password,
            bio: this.bio
          };
          const test = await axios.put(`/api/user/users/${this.id}`, { user: { ...user } }, {
            headers: {
              Authorization: localStorage.getItem('token')
            },
          });
          this.$router.push('/profile');
        } catch (e) {
          console.error(e);
        }
      } else {
        password.style.boxShadow = '0 0 3px red';
        passwordRepeat.style.boxShadow = '0 0 3px red';
      }
    },
  },

  mounted() {
    (async () => {
      try {
        const response = await axios.get('/api/user/session', {
          headers: {
            Authorization: localStorage.getItem('token')
          }
        });
        this.id = response.data.id;
        this.first_name = response.data.first_name;
        this.middle_name = response.data.middle_name;
        this.last_name = response.data.last_name;
        this.location = response.data.location;
        this.phone = response.data.phone;
        this.bio = response.data.bio;
        this.telegram = response.data.telegram;
        this.password = response.data.password;
      } catch (e) {
        console.error(e);
      }
    })();
  }
};
</script>
<style scoped>
.wrapper {
  width: 100%;
  height: 100%;
  position: fixed;
  top: 65px;
  left: 0px;
  background: #EEF1F6;
  padding: 70px;
  display: flex;
}
.btn {
  position: fixed;
  top: 75px;
  right: 110px;
}
.back {
  position: absolute;
  top: 100px;
  left: 120px;
  color: #033A92;
  cursor: pointer;
}
h2 {
  padding: 0 0 24px 0;
}
.photo {
  background-image: url('../../../assets/img/photo.png');
  width: 323px;
  height: 214px;
  margin: 20px 0;
}
.section {
  width: 29%;
  margin: 0 auto;
}
.container_one {
  min-height: 384px;
  background: #F5F6F7;
  border-radius: 20px;
  padding: 24px 24px 40px 24px;
  display: flex;
  flex-direction: column;
}
.container_two {
  max-width: 33%;
  max-height: 490px;
  background: #F5F6F7;
  border-radius: 20px;
  padding: 40px;
}
.container_three {
  min-height: 350px;
  min-width: 418px;
  padding: 20px 40px 40px 30px;
  min-height: 252px;
  background: #F5F6F7;
  border-radius: 20px;
}
.container_four {
  background: #F5F6F7;
  height: 185px;
  border-radius: 20px;
  padding: 24px;
  margin-top: 20px;
  position:relative 
}
.form {
  border-radius: 20px;
  text-align: left;
}
.label {
  font: 500 14px/ 27px 'Montserrat';
  color: #5B5A5D;
}
.textarea {
  max-width: 100%;
  max-height: 288px;
  padding: 15px;
  border: none;
}
.arrow {
  background-image: url('../../../assets/img/ArrowLeft.svg');
  background-repeat: no-repeat;
  min-width: 16.54px;
  min-height: 15.49px;
  margin: 0;
  padding-left: 28px;
  position: fixed;
}
.cross {
  position: absolute;
  bottom: 22px;
  right: 10px;
  width: 24px;
  height: 24px;
  background-image: url('../../../assets/img/Cross.svg');
  cursor: pointer
}
.input-cont {
  position: relative;
}
.blockFlex {
  display: flex;
  justify-content: space-between;
}
.imgEdit {
  background: url('../../../assets/img/avatar.png') 100% 100% / cover;
  width: 371px;
  height: 371px;
}
.labelImg {
  padding: 0;
  margin: 0;
  display: inline;
  font: 500 16px / 27px 'Montserrat';
  color: #033A92;
}
.blockPhoto {
  display: inline;
  margin: 0
}
.btn-blue {
  background: #4256F6;
}
.passwordVis{
  background-image: url('../../../assets/img/eye.svg');
  position: absolute;
  width: 24px;
  height: 24px;
  right: 5px;
  bottom: 39px;
  cursor: pointer;
}
</style>
