<template>
  <div class="wrapper" @mousemove="playParallax">
    <moving-icons/>
    <my-form @submit.prevent v-if="formShow">
      <div class="logo"></div>

      <div>
        <label for="login" class="label">Логин</label>
        <my-input v-model="login" type="text" name="login" class="input"/>

        <label for="password" class="label">Пароль</label>
        <my-input v-model="password" type="password" name="password" class="input"/>
        <p class="wrong" v-if="error">{{error}}</p>
        <p class="text" @click="forgotPassword" style="cursor: pointer;">Забыли пароль?</p>

      </div>
     <my-button @click="handleSubmit">Войти</my-button>


    </my-form>
    <my-form v-if="passwordRecovery" style="min-height:370px">
      <div>
        <div class="logo"></div>

        <div class="toBack" @click="this.passwordRecovery = false; this.formShow = true">
                    <div class="arrow">назад</div>
        </div>
        <label for="email" class="label">Ваша рабочая почта</label>
        <my-input v-model="email" type="text" name="email" class="input"/>
        <my-button class="btn_2">Запросить</my-button>
     </div>
    </my-form>
  </div>
</template>

<script>
import {useRoute, useRouter} from 'vue-router';


import axios from 'axios'
import MyButton from '@/components/UI/MyButton.vue'
import MyInput from '@/components/UI/MyInput.vue'
import MyForm from '@/components/UI/MyForm.vue'
import MovingIcons from '@/components/UI/MovingIcons.vue'

const router = useRouter();
const route = useRoute();

export default {
  components:{
    MyButton,
    MovingIcons,
    MyInput,
    MyForm
  },

  data(){
    return{
      login:'',
      password:'',
      email:'',
      formShow:true,
      passwordRecovery:false,
      error: null
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
    forgotPassword(){
      this.formShow = false;
      this.passwordRecovery = true;
    },
      async handleSubmit(){
        try{
          const response = await axios.post('/api/session',{
          login: this.login,
          password:this.password
        });
        console.log(response)
        localStorage.setItem('token', response.data.access)

        if (localStorage.getItem('token')){
          this.$router.push('/');
        }



      }

        catch({response}){

          this.error = response.data.error
        }


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

</style>
