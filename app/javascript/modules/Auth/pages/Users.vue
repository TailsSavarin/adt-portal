<template>
    <MyNavbar/>
    <div class="wrapper">
        <div style="background-attachment:scroll">
            <button @click="dialogVisiable" class="btn">Создать пользователя</button>
        <!-- <div>{{todoStore.token}}</div> -->
        <div v-if="todoStore.show == true" class="dialog" @click="dialogUnvisiable"> 
            <div  @click.stop class="dialog-content">
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
                    <textarea v-model="todoStore.bio" class="textarea" cols="50" rows="10" ></textarea>
                </div> 
                <div class="block">
                    <h4 style="margin:0">Аватар</h4>
                    <!-- <label for="file" class="avatar-img">Загрузить фотографию</label> -->
                    <input type="file" id="file" class="avatar-img" name="photo" multiple
                     accept="image/*,image/jpeg">
                </div> 
                </div>
            </div>
                
             <button class="btn" @click="todoStore.createUser">Создать</button>                             
            </div>
 
        </div>

        <button class="btn">Список пользователей</button>
        <div class="all-user">
            <div v-for="user in todoStore.users" class="user-block">
                <div class="user-section"></div>
                <div class="user-section">
                    <p>Имя: {{user.first_name}}</p>
                    <p>Фамилия: {{user.last_name}}</p>
                    <p>Отчество: {{user.middle_name}}</p>
                    <p>Страна: {{user.location}}</p>
                    <p>Телеграм:{{user.telegram}}</p>
                    <p>Номер:{{user.phone}}</p>
                    <p>Почта:{{user.email}}</p>                    
                </div>

                

            </div>
        </div>

        </div>
        
   
    </div>
    
</template>
<script setup>

import {useTodoStore} from '@/store/store'
import { onMounted } from 'vue';

const todoStore = useTodoStore()
const updateUser = onMounted(() => {
    todoStore.getAllUsers
    })

// const users = todoStore.users

// const users = todoStore.user

// const newUser = reactive({
//     first_name: todoStore.first_name,
//     middle_name: todoStore.middle_name,
//     last_name: todoStore.last_name,
//     location: todoStore.location,
//     phone: todoStore.phone,
//     telegram: todoStore.telegram,
//     birthday: todoStore.birthday,
//     position: todoStore.position,
//     password: todoStore.password,
//     bio: todoStore.bio,
// })

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
export default{
    components:{
        MyNavbar,
        MyInput
    }
}
</script>
<style scoped>
.wrapper {
  width: 100%;
  height: 100%;
  background-attachment:fixed;
  top: 65px;
  left: 0px;
  background: #EEF1F6;
  padding: 100px;    
}
.dialog{
    padding: 50px;
    background: rgba(0,0,0,0.5);
    position: fixed;
    top:0;
    bottom: 0;
    left: 0;
    right:0;
}
.dialog-content{
    background: white;
    border-radius: 12px;
    width: 650px;
    padding: 50px 0 50px 50px;
    transition: all 0.8s ease;    


}
.dialog-content:hover{
    background: rgb(226, 226, 226);
    border-radius: 12px;
    width: 650px;
    padding: 50px 0 50px 50px;
    border: 1px solid rgba(0, 0, 0, 0.158);
    transition: all 0.8s ease;    

}
.input-block{
    display: flex;
    flex-direction: row;
    justify-content: space-between;
}
.input-content{
    display: flex;
    flex-direction: column;
    margin:0;
    width: 50%;
}
.input{
    max-width: 240px;
    /* margin: 20px 0px 20px 15px; */
}
.btn {
    min-width: 98px;
    min-height: 44px;
    background: #2376b6;;
    border: none;
    border-radius: 10px;
    color: white;
    font: 700 16px / 30px 'Montserrat';
    padding: 10px;
    cursor: pointer;
    
  }
.block{
    margin: 0;
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
}
label{
    margin:0
}
.textarea{
    max-width: 240px;
    max-height: 130px;
    margin:15px 0;
    border: 1px solid #F0EFF2;
    border-radius: 10px;
    padding:10px
}
.avatar-img{
    border: 1px solid #F0EFF2;
    padding:10px;
    margin:7px 0;
    max-width: 240px;
    border-radius: 10px;
}
.all-user{
    width: 90%;
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    
}
.user-block{
    margin:20px 0;
    width: 50%;
    height: 400px;
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    border:1px solid black;    
}
.user-section{
    width: 45%;
}
</style>