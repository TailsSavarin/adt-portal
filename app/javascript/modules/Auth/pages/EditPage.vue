<template>
<my-navbar/>
    <div class="wrapper">
        <div class="section">
            <div class="container_one">
            <form class="form">
                 <h2>Основная информация</h2>
                 <div style="display:flex;">
                    <div style="margin-right:20px">
                        <div class="input-cont">
                           <label class="label" for="first_name">Имя</label>
                        <my-input v-model="first_name" class="input" type="text" name="first_name"  @input="updateInput"/>
                        <div class="cross" v-if="crossVis" @click="deleteTextOne" ></div> 
                        </div>
                        
                    </div>
                    <div>
                        <div class="input-cont">
                            <label class="label" for="middle_name">Отчество</label>
                            <my-input v-model="middle_name" class="input" type="text" name="middle_name" @input="updateInput"/>
                            <div class="cross" v-if="crossVis" @click="deleteTextTwo" ></div>                            
                        </div>

                    </div>

                 </div>
                 <div class="input-cont">
                    <label class="label" for="last_name"> Фамилия</label>
                    <my-input v-model="last_name" class="input" type="text" name="last_name" @input="updateInput"/>
                    <div class="cross" v-if="crossVis" @click="deleteTextThree" ></div>
                 </div>
                 
                 <div class="input-cont">
                    <label class="label" for="location">Локация</label>
                    <my-input v-model="location" class="input" type="text" name="location" @input="updateInput" />   
                    <div class="cross" v-if="crossVis" @click="deleteTextFour" ></div>
                 </div>

                 <div class="input-cont">
                    <label class="label" for="phone"> Телефон</label>
                    <my-input v-model="phone" class="input" type="text" name="phone" @input="updateInput"/>
                    <div class="cross" v-if="crossVis" @click="deleteTextFive" ></div>
                 </div>
                 <div class="input-cont">
                    <label class="label" for="telegram">Telegram</label>
                    <my-input v-model="telegram" class="input" type="tel" name="telegram"  @input="updateInput"/>
                    <div class="cross" v-if="crossVis" @click="deleteTextSix" ></div>                    
                 </div>

            </form>
        </div>
            <div class="container_four">
            <h2>Новый пароль</h2>
                 <div style="display:flex;">
                    <div style="margin-right:20px">
                        <label class="label" for="password">Пароль</label>
                        <my-input v-model="password" class="input" type="password" name="password"/>
                    </div>
                    <div>
                        <label class="label" for="password">Повторите пароль</label>
                        <my-input v-model="password" class="input" type="password" name="password"/>
                    </div>

                 </div>                
            </div>        
        </div>


             
        <div class="container_two">
            <form class="form">
            <h2>BIO</h2>
            <p style="margin:0 0 20px 0">А вот без био сотрудник может, скорее всего он и будет без него</p>
            <label class="label" for="myself">О себе</label>
            <textarea  class="textarea" name="myself" cols="60" rows="10">Чёрная окраска пантер является проявлением меланизма, вызванного мутацией гена[1]. Примером сильного распространения мутации, которая приводит к меланизму, в популяции кошачьих, является популяция леопарда на территории Малайзии, где около 50 % животных имеют чёрную окраску. Вообще среди больших кошек меланизм обычно является более распространённым в тех популяциях, которые живут в плотных лесах — при условии недостатка освещения тёмные животные здесь являются менее заметными, чем на открытой местности, что облегчает им выживание.</textarea>
            </form>

        </div>
        <div>
            <div class="container_three"> 
            <h2>Аватар</h2>
                <div>
                    <form enctype="multipart/form-data" method="post">
                    <p><input type="file" name="photo" multiple accept="image/*,image/jpeg">
                    <!-- <input type="submit" value="Поменять"> -->
                </p>
                    </form>

                </div>                    
            
            </div>       
      
        </div>


    </div>
        
        <my-button class="btn" @click="saveСhange">Сохранить</my-button>
        <!-- <span class="back" @click="$router.push('/profile')">Назад</span> -->

        <div class="back" @click="$router.push('/profile')">
                    <div class="arrow">назад</div>
                </div>    
     
</template>
<script>
import MyNavbar from '@/components/UI/MyNavbar.vue'
import MyInput from '@/components/UI/MyInput.vue'
import MyButton from '@/components/UI/MyButton.vue'
import axios from 'axios'

export default{
    components:{
        MyNavbar,
        MyInput,
        MyButton
    },
    data(){
        return{
            crossVis: false,
            first_name:'',
            middle_name:'',
            last_name:'',
            location:'',
            telegram:'',
            phone:'',
            password:'',
            birthday:'',
            position:'',
            bio:''

        }
    },
    methods:{
        deleteTextOne(){
            this.first_name = ''
        },
        deleteTextTwo(){
            this.middle_name = ''
        },
        deleteTextThree(){
            this.last_name = ''
        },
        deleteTextFour(){
            this.location = ''
        },
        deleteTextFive(){
            this.phone = ''
        },
        deleteTextSix(){
            this.telegram = ''
        },
        updateInput(event){
            var len = event.target.value
            if (len.length > 0){
                this.crossVis = true
            }
            else {
                this.crossVis = false

            }
        },

            async saveСhange(){
                try{
                    const response = await axios.put('/api/user/users/{id}',{
                        first_name : this.first_name,
                        middle_name : this.middle_name,
                        last_name : this.last_name,
                        location : this.location,
                        phone : this.phone,
                        telegram: this.telegram,
                        password: this.password,
                        birthday: this.birthday,
                        position: this.position,
                        bio: this.bio
                        
                });
                console.log(response)
                }
                
                catch(e){
                    console.error(e)
                }

        
      
        },
                // saveСhange(){
            // const name = this.name;
            // const patronymic = this.patronymic;
            // const surname = this.surname;
            // const location = this.location;
            // const telephone = this.telephone;
            // const telegram = this.telegram;
            // const password = this.password;
            // const baseInformation = {
            //     name : this.name,
            //     patronymic : this.patronymic,
            //     surname : this.surname,
            //     location : this.location,
            //     telephone : this.telephone,
            //     password: this.password
            // }
    },
    mounted() {
        (async()=>{
            try{
            const inf = await axios.get('/api/user/users/{id}');
                console.log(inf)
            }
            catch(e){
                console.error(e)
            }
      
      })()

    },
}
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
.btn{
    position: absolute;
    top:75px;
    right: 110px;

}
.back{
    position: absolute;
    top:100px;
    left:120px;
    color: #033A92;
    cursor: pointer;
}

h2{
    padding: 0 0 24px 0;
}

.photo{
    background-image: url('../../../assets/img/photo.png');
    width: 323px;
    height: 214px;
    margin: 20px 0;
}
.section{
    width: 29%;
    margin:0 auto;

}
.container_one{
    min-height: 384px;
    background: #F5F6F7;
    border-radius: 20px;
    padding: 24px 24px 40px 24px;    
    display: flex;
    flex-direction: column;
    
}
.container_two{
    max-width: 33%;

    max-height: 490px;

    background: #F5F6F7;
    border-radius: 20px;
    padding: 40px;
}
.container_three{

    min-height: 350px;
    min-width: 418px;
    padding: 40px;
    min-height: 252px;
    background: #F5F6F7;
    border-radius: 20px;
}
.container_four{
    background: #F5F6F7;
    height: 185px;
    border-radius: 20px;
    padding: 24px;
    margin-top: 20px;
}
.form{
    border-radius: 20px;
    text-align: left;

}


.label {
  font: 500 14px/ 27px 'Montserrat';
  color: #5B5A5D;

}
.textarea{
    max-width: 100%;
    max-height: 288px;
    padding: 15px;
    border: none;
}
.arrow{
    background-image: url('../../../assets/img/ArrowLeft.svg');
    background-repeat: no-repeat;
    min-width: 16.54px;
    min-height: 15.49px;
    margin:0;
    padding-left: 28px;
}   
.cross{
    position: absolute;
    bottom:22px;
    right: 10px;
    width: 24px;
    height: 24px;   
    background-image: url('../../../assets/img/Cross.svg');
    cursor: pointer
}
.input-cont{
 position: relative; 
}
</style>