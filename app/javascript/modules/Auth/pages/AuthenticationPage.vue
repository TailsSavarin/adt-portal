<template>
  <div class="wrapper" @mousemove="playParallax">
    <div class="icon_one" name="img"></div>
    <div class="icon_two" name="img"></div>
    <div class="icon_three" name="img"></div>
    <div class="icon_four" name="img"></div>
    <div class="icon_five" name="img"></div>
    <div class="icon_six" name="img"></div>
    <div class="icon_seven" name="img"></div>
    <div class="icon_eight" name="img"></div>
    <div class="icon_nine" name="img"></div>
    <div class="icon_ten" name="img"></div>
    <div class="icon_eleven" name="img"></div>
    <div class="icon_twelve" name="img"></div>
    <div class="icon_thirteen" name="img"></div>
    <div class="icon_fourteen" name="img"></div>
    <form @submit.prevent>
      <div class="logo"></div>

      <div>
        <label for="login" class="label">Логин</label>
        <input v-model="login" type="text" name="login" class="input">

        <label for="password" class="label">Пароль</label>
        <input v-model="password" type="password" name="password" class="input">
        <p class="text">Забыли пароль?</p>
      </div>

      <!-- <button class="btn" @click="$router.push('/main')">Войти</button> -->
      <MyButton>gggg</MyButton>
      <button class="btn" @click="handleSubmit">Войти</button>
    </form>
  </div>
</template>

<script>
import {useRoute, useRouter} from 'vue-router';
import axios from 'axios'
import MyButton from '@/components/UI/MyButton.vue'
const router = useRouter();
const route = useRoute();

export default {

  data(){
    return{
      login:'',
      password:'',
    }
  },
  methods: {
    playParallax(e) {
      const imagePlx = document.getElementsByName("img");
      const x = e.clientX / window.innerWidth;
      const y = e.clientY / window.innerHeight;
      for (let i = 0; i < imagePlx.length; i++) {
        if (i % 2) {
          imagePlx[i].style.transform = 'translate(-' + x * 50 + 'px, -' + y * 50 + 'px)';
        } else {
          imagePlx[i].style.transform = 'translate(+' + x * 50 + 'px, +' + y * 50 + 'px)';
        }
      }

    },
      async handleSubmit(){
        try{
          const response = await axios.post('/api/session',{
          login: this.login,
          password:this.password
        });
        console.log(response)
        localStorage.setItem('token', response.data.token)}
        catch(e){
          console.log(e)
        }

        this.$router.push('/main')
      }
      
  }

}
</script>

<style scoped>


.wrapper {
  width: 100%;
  height: 100%;
  position: fixed;
  top: 0;
  left: 0;
  background: #EEF1F6;
  padding: 150px;
}

form {
  margin: 0 auto;
  margin-top: 90px;
  width: 418px;
  height: 474px;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  padding: 30px;
  background: #F5F6F7;
  border-radius: 20px;
  transition: all 0.5s ease;
  box-shadow: 3px 3px 3px rgba(128, 128, 128, 0.212);
}

form:hover {
  background: rgba(0, 0, 0, 0.041);
  border: 1px solid rgba(0, 0, 0, 0.158);
  transition: all 0.5s ease;
}

.input {
  width: 100%;
  border: 1px solid #F0EFF2;
  border-radius: 10px;
  padding: 10px 15px;
  margin: 15px 0;
}

.label {
  font: 500 14px/ 17px 'Montserrat';
  color: #5B5A5D;
}

.btn {
  width: 98px;
  height: 44px;
  background: #BFD1DF;
  border: none;
  border-radius: 10px;
  color: white;


}

.text {
  text-align: right;
  padding-top: 15px;
  color: #333333;
}

.logo {
  background-image: url('../../../assets/img/logo.svg');
  width: 109px;
  height: 100px;
}

.icon_one {
  background-image: url('../../../assets/img/Icon-1.svg');
  width: 111.46px;
  height: 97.74px;
  bottom: 60px;
  right: 860px;
  position: absolute;
}

.icon_two {
  background-image: url('../../../assets/img/Icon-2.svg');
  width: 93.53px;
  height: 113.35px;
  bottom: 70px;
  left: 500px;
  position: absolute;
}

.icon_three {
  background-image: url('../../../assets/img/Icon-3.svg');
  width: 126.38px;
  height: 92.18px;
  bottom: 190px;
  left: 200px;
  position: absolute;
}

.icon_four {
  background-image: url('../../../assets/img/Icon-4.svg');
  width: 119.75px;
  height: 104.08px;
  top: 394px;
  left: 100px;
  position: absolute;
}

.icon_five {
  background-image: url('../../../assets/img/Icon-5.svg');
  width: 97.29px;
  height: 112.9px;
  top: 462px;
  left: 459px;
  position: absolute;
}

.icon_six {
  background-image: url('../../../assets/img/Icon-6.svg');
  width: 75.77px;
  height: 109.27px;
  bottom: 100px;
  right: 570px;
  position: absolute;
}

.icon_seven {
  background-image: url('../../../assets/img/Icon-7.svg');
  width: 113.36px;
  height: 108.62px;
  bottom: 220px;
  right: 300px;
  position: absolute;
}

.icon_eight {
  background-image: url('../../../assets/img/Icon-8.svg');
  width: 98px;
  height: 95.95px;
  top: 360px;
  right: 500px;
  position: absolute;
}

.icon_nine {
  background-image: url('../../../assets/img/Icon-9.svg');
  width: 100.41px;
  height: 111.29px;
  top: 330px;
  right: 190px;
  position: absolute;
}

.icon_ten {
  background-image: url('../../../assets/img/Icon-10.svg');
  width: 109.68px;
  height: 107.33px;
  top: 100px;
  right: 380px;
  position: absolute;
}

.icon_eleven {
  background-image: url('../../../assets/img/Icon-11.svg');
  width: 116.39px;
  height: 103.06px;
  top: 80px;
  right: 700px;
  position: absolute;
}

.icon_twelve {
  background-image: url('../../../assets/img/Icon-12.svg');
  width: 98.77px;
  height: 116.78px;
  top: 60px;
  left: 750px;
  position: absolute;
}

.icon_thirteen {
  background-image: url('../../../assets/img/Icon-13.svg');
  width: 97.21px;
  height: 112.86px;
  top: 60px;
  left: 450px;
  position: absolute;
}

.icon_fourteen {
  background-image: url('../../../assets/img/Icon-14.svg');
  width: 105.54px;
  height: 108.81px;
  top: 220px;
  left: 280px;
  position: absolute;
}
</style>
