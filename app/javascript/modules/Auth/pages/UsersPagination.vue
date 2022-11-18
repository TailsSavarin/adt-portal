<template>
    <MyNavbar/>
    <div class="wrapper">
      <div style="background-attachment:scroll">
        <button @click="dialogVisiable" class="btn">Создать пользователя</button>
        <!-- <div>{{testStore.testText}}</div> -->
        <div v-if="todoStore.show == true" class="dialog" @click="dialogUnvisiable">
          <my-form @click.stop class="dialog-content" type="submit">
            <div class="input-block">
              <div class="input-content">
                <div class="block">
                  <label>Имя:</label>
                  <my-input v-model="todoStore.first_name" class="input"/>
                </div>
  
                <div class="block">
                  <label>Фамилия:</label>
                  <my-input v-model="todoStore.last_name" class="input"/>
                </div>
                <div class="block">
                  <label>Отчество:</label>
                  <my-input v-model="todoStore.middle_name" class="input"/>
                </div>
                <div class="block">
                  <label>Дата рождения:</label>
                  <my-input v-model="todoStore.birthday" class="input"/>
                </div>
                <div class="block">
                  <label>Страна:</label>
                  <my-input v-model="todoStore.location" class="input"/>
                </div>
                <div class="block">
                  <label>Номер:</label>
                  <my-input v-model="todoStore.phone" class="input"/>
                </div>
                <div class="block">
                  <label>Телеграм:</label>
                  <my-input v-model="todoStore.telegram" class="input"/>
                </div>
              </div>
  
              <div class="input-content">
                <div class="block">
                  <label>Должность:</label>
                  <my-input v-model="todoStore.position" class="input"/>
                </div>
  
                <div class="block">
                  <label>Почта:</label>
                  <my-input v-model="todoStore.email" class="input"/>
                </div>
                <div class="block">
                  <label>Логин:</label>
                  <my-input v-model="todoStore.login" class="input"/>
                </div>
                <div class="block">
                  <label>Пароль:</label>
                  <my-input v-model="todoStore.password" class="input"/>
                </div>
                <div class="block">
                  <label>Описание:</label>
                  <textarea v-model="todoStore.bio" class="textarea" cols="50" rows="10"></textarea>
                </div>
                <div class="block">
                  <h4 style="margin:7px">Аватар</h4>
                  <my-input @change="onFileSelected" type="file" id="file" class="avatar-img" name="photo"
                  />
                </div>
              </div>
            </div>
  
            <button class="btn" @click="todoStore.createUser">Создать</button>
          </my-form>
  
        </div>
  
        <!-- <button class="btn">Список пользователей</button> -->
        <div class="all-user">

          <div v-for="user in todoStore.users" v-if="userVis" class="user-block">
            <img class="user-section img" :src="user.avatar?.url" alt="avatar"/>
            <div class="user-section inf" style="width:40%" >
              <p><h4>Имя:</h4>{{ user.first_name }}</p>
              <p><h4>Фамилия:</h4> {{ user.last_name }}</p>
              <p><h4>Отчество: </h4>{{ user.middle_name }}</p>
              <p><h4>День рождения:</h4>{{ user.birthday }}</p>
              <p><h4>Должность:</h4>{{ user.position }}</p>
              <p><h4>Страна:</h4> {{ user.location }}</p>
              <p><h4>Телеграм:</h4>{{ user.telegram }}</p>
              <p><h4>Номер:</h4>{{ user.phone }}</p>
              <p><h4>Почта:</h4>{{ user.email }}</p>
              
              <div>
                <button class="btn" @click="todoStore.deleteUser(user.id)">Удалить</button>
              </div>
              
            </div>
          </div>

        </div>
        <div class="observer" @mouseover="loadUsers"></div>
      </div>
  
  
    </div>
  
  </template>
  <script setup>
  
  import {useTodoStore} from '@/store/store'
 

  import { onMounted, ref} from 'vue';   
  
  const todoStore = useTodoStore()


  const userVis = ref(true)
  const updateUser = onMounted(() => {
    todoStore.getAllUsers()
  })
  
  const loadUsers = () => {
    todoStore.loadMoreUsers()
  }

  const onFileSelected = (event) =>
      todoStore.avatar = event.target.files[0]
  
  

  const dialogVisiable = () => {
    todoStore.show = true
  }
  
  const dialogUnvisiable = () => {
    todoStore.show = false
  }
  
  </script>
  <script>
  import MyNavbar from '@/components/UI/MyNavbar.vue'
  import MyInput from '@/components/UI/MyInput.vue'
  import MyForm from '@/components/UI/MyForm.vue'
  
  export default {
    components: {
      MyNavbar,
      MyInput,
      MyForm
    }
  }
  </script>
  <style scoped>
  .wrapper {
    width: 100%;
    height: 100%;
    background-attachment: fixed;
    top: 65px;
    left: 0px;
    background: #EEF1F6;
    padding: 100px;
  }

  .dialog {
    padding: 50px;
    background: rgba(0, 0, 0, 0.5);
    position: fixed;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
  }
  
  .dialog-content {
    background: white;
    border-radius: 12px;
    /* width: 650px; */
    padding: 40px;
    transition: all 0.8s ease;
  
  
  }
  
  .dialog-content:hover {
    background: rgb(226, 226, 226);
    border-radius: 12px;
    width: 650px;
    padding: 50px 0 50px 50px;
    border: 1px solid rgba(0, 0, 0, 0.158);
    transition: all 0.8s ease;
  
  }
  
  .input-block {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
  }
  
  .input-content {
    display: flex;
    flex-direction: column;
    margin: 0;
    width: 50%;
    margin: 0 50px 0 0;
  }
  
  .input {
    max-width: 240px;
    /* margin: 20px 0px 20px 15px; */
  }
  
  .btn {
    min-width: 98px;
    min-height: 44px;
    background: #2376b6;
    border: none;
    border-radius: 10px;
    color: white;
    font: 700 16px / 30px 'Montserrat';
    padding: 10px;
    cursor: pointer;
    margin: 10px;
  
  }
  
  .block {
    margin: 0;
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
  }
  
  label {
    margin: 0
  }
  
  .textarea {
    max-width: 240px;
    max-height: 130px;
    margin: 15px 0;
    border: 1px solid #F0EFF2;
    border-radius: 10px;
    padding: 10px
  }
  
  .avatar-img {
    border: 1px solid #F0EFF2;
    padding: 10px;
    margin: 7px 0;
    max-width: 240px;
    border-radius: 10px;
  }
  
  .all-user {
    width: 100%;
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    margin:0;
  
  }
  
  .user-block {
    margin: 10px 10px;
    width: 48%;
    /* height: 500px; */
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    border: 1px solid #2376b667;
    border-radius: 15px;
    transition: all 0.8s ease;
  
  }
  .user-block:hover{
    border: 1px solid #005c96dc;
    background-color: rgba(184, 227, 255, 0.226);
    transition: all 0.8s ease;
  
  }
  .user-section {
  
    padding: 20px 0;
  
  }
  
  p {
    padding: 10px 0;
    margin: 0;
  }
  
  h4 {
    display: inline;
    padding-right: 10px;
  }
  .page{
    display: inline-block;
    margin: 5px;
    padding: 10px;
    border: 1px solid black;
    border-radius: 15px;
  }
  .current-page{
    background-color: #2376b6;
    color:aliceblue
  }
  .img{
    max-width: 400px;
    height: 500px;
    padding: 10px;
    border-radius: 20px;
    /* width: 55%; */
  }
  .inf{
    display: flex;
    flex-direction: column;
    vertical-align: left;
  
  }
  .inputEdit{
    max-width: 150px;
    margin:0 0 5px 0;
  }
  .img-edit{
    max-width: 400px;
    /* height: 500px; */
    padding: 10px;
    border-radius: 20px;
    width: 80%;
  }
  .observer{
    width: 100%;
    height: 300px;
    opacity: 0;
    }
  </style>
  