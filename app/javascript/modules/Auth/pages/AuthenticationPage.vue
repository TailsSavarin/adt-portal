<template>
  <div class="wrapper" @mousemove="playParallax">
    <moving-icons/>
    <my-form @submit.prevent v-if="authUser.formShow">
      <div class="logo"></div>

      <div style="margin:0">
        <label for="login" class="label">Логин</label>
        <my-input v-model="authUser.login" type="text" name="login" class="input" @input="inputUpdate"/>

        <div class="blockPassword">
          <label for="password" class="label">Пароль</label>
          <my-input v-model="authUser.password" :type="authUser.showPassword ? 'text' : 'password'" name="password" class="input" id="password" />
          <div class="passwordVis" @click="authUser.showPassword = !authUser.showPassword"></div>
        </div>


        <p class="wrong" v-if="authUser.error">{{authUser.error}}</p>
        <p class="text" @click="forgotPassword" style="cursor: pointer;">Забыли пароль?</p>

      </div>
     <my-button @click="submitResult" id="btn">Войти</my-button>


    </my-form>
    <my-form v-if="authUser.passwordRecovery" style="min-height:370px">
      <div>
        <div class="logo"></div>

        <div class="toBack" @click="authUser.passwordRecovery = false; authUser.formShow = true; authUser.login= null;authUser.password=null">
                    <div class="arrow">назад</div>
        </div>
        <label for="email" class="label">Ваша рабочая почта</label>
        <my-input v-model="authUser.email" type="text" name="email" class="input" @input="inputUpdate"/>
        <my-button @click="authUser.getPassword" id="btn">Запросить</my-button>
     </div>
    </my-form>
  </div>
</template>

<script>

import MyButton from '@/components/UI/MyButton.vue'
import MyInput from '@/components/UI/MyInput.vue'
import MyForm from '@/components/UI/MyForm.vue'
import MovingIcons from '@/components/UI/MovingIcons.vue'



export default {
  components:{
    MyButton,
    MovingIcons,
    MyInput,
    MyForm
  },
}
</script>
<script setup>
import {useRoute, useRouter} from 'vue-router';
import axios from 'axios'
import {useAuthUser} from '@/store/store';
import {computed} from 'vue'

const authUser = useAuthUser()
const router = useRouter();
const route = useRoute();



const submitResult = async() => {
  if (await authUser.handleSubmit()){
    router.push('/') 
  }
}


const playParallax = (e) => {
      let imagePlx = document.getElementsByName("img");
      let x = e.clientX / window.innerWidth;
      let y = e.clientY / window.innerHeight;
      for (let i = 0; i < imagePlx.length; i++) {
        if (i % 2) {
          imagePlx[i].style.transform = 'translate(-' + x * 50 + 'px, -' + y * 50 + 'px)';
        } else {
          imagePlx[i].style.transform = 'translate(+' + x * 50 + 'px, +' + y * 50 + 'px)';
        }
      }
}
const forgotPassword = () => {
  authUser.formShow = false;
  authUser.passwordRecovery = true;
}
const inputUpdate = (event) => {
        var len = event.target.value

        if (len.length > 0 ){

           if ( authUser.password || authUser.login || authUser.email){
            btn.classList.add('btn-blue')

          }


        }
        else{
            btn.classList.remove('btn-blue')
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

.label {
  font: 500 14px/ 17px 'Montserrat';
  color: #5B5A5D;
}

.btn_2{
  display: flex;
  justify-content: center;
  padding: 12px 22px;
  margin-top: 10px;

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
.toBack{
  color: #4256F6;
  margin: 20px 0 25px 0;
  cursor: pointer;
}
.arrow{
    background-image: url('../../../assets/img/ArrowLeft.svg');
    background-repeat: no-repeat;
    min-width: 16.54px;
    min-height: 15.49px;
    margin:0;
    padding-left: 28px;
}
.wrong{
  margin: 10px 0 5px 5px;
  color: rgba(206, 7, 7, 0.808);
font-style: italic;
}
.blockPassword{
  position: relative;
}
.passwordVis{
  background-image: url('../../../assets/img/eye.svg');
  position: absolute;
  width: 24px;
  height: 24px;
  right: 10px;
  bottom: 22px;
}
.btn-blue{
  background: #4256F6;
}
</style>
