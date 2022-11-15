<template>
    <my-navbar/>
    <div class="wrapper"> 
        
    

        <div class="block">

            <div class="start">
                <h1>Привет, {{user?.first_name}}!</h1>
                <p style="margin:10px 0">Присядь к нашему костру и рассказывай</p>
                <button class="btn" @click="createEvent" id="btn">Создать</button>
            </div>    
 <!-- Все карточки -->     
        

        <div v-if="show" class="block_cards">


                <div class="to_back" v-if="toBack" @click="toBackF">
                    <div class="arrow">назад</div>
                </div>         
       
                <div class="card" v-if="action_one" @click.once="openCardOne">

                    <div class="card-border"> <div class="card_image_one">  </div></div>
                    <div>
                        <h3>К шефу</h3>
                        <p class="сard_description">Организационные вопросы в рабочем процессе</p>
                    </div>
                </div>
          
        <!-- Открываем 1-ую карточку => у нее 4 действия  -->
       
            <div class="to_back" v-if="toBackChapter" @click="toBackChapterF">
                    <div class="arrow">к выбору раздела</div>
            </div>          
         <!-- <transition name="slide-fade"> -->
                <div v-if="choice" class="choice_cards_block">

                    <!-- 1-ое действие -->
                 <div class="to_back" v-if="toBackVariant" @click="toBackVariantF">
                    <div class="arrow">к выбору варианта</div>
                </div>                      
                    <div class="choice_card" v-if="requestTimeOff" @click="requestAction">
                        <h4>Запросить отгул</h4>
                        <p class="сard_description">Отсутствие на работе по уважительной причине</p>
                    </div>

                        <!-- Открываем его(форма) -->
                    <div v-if="openForm">
                        <form class="form">
                            <h4>Запросить отгул</h4>
                            <p class="сard_description">Отсутствие на работе по уважительной причине</p>
                            <label class="label" for="period">Необходимый период</label>
                            <my-input class="input" type="text" name="period"/>
                            <label class="label" for="reason">Причина</label>
                            <my-input class="input" type="text" name="reason"/>
                            <button class="btn">Отправить</button>
                        </form>
                    </div>
                
                    <!-- 2-ое действие -->
                    <div class="choice_card" v-if="planVacation">
                        <h4>Запланировать отпуск</h4>
                        <p class="сard_description">В этом году у вас еще есть дни отпуска</p>
                    </div>
                    <!-- 3-ое действие -->
                    <div class="choice_card" v-if="goRemote">
                        <h4>Перейти на удаленку</h4>
                        <p class="сard_description">Приготовьте уважительные причины для перехода</p>
                    </div>
                    <!-- 4-ое действие -->
                    <div class="choice_card" v-if="preportIllness">
                        <h4>Уведомить о болезни</h4>
                        <p class="сard_description">Напишите сюда, а потом спите и кушайте супчик</p>
                    </div>
                </div>
            <!-- </transition> -->
                <!-- Открываем 2-ую карточку -->
                
                <div class="card" v-if="action_two" @click="openCardTwo">
                    <div class="card-border"> <div class="card_image_two">  </div></div>
                    <div>
                       <h3>К коллеге</h3>
                        <p class="сard_description"> Нас разделяют расстояния, но мы вместе</p>     
                    </div>               
                </div>

                <!-- Открываем 3-ую карточку -->
                <div class="card" v-if="action_three" @click="openCardThree">
                    <div class="card-border"> <div class="card_image_three">  </div></div>
                    <div>
                        <h3>К службе</h3>
                        <p class="сard_description">Есть чем поделиться с коллегами - welcome</p>
                    </div>
                </div>

            </div>

        </div>

    </div>
</template>

<script>
import axios from 'axios'
import MyNavbar from '@/components/UI/MyNavbar.vue'
import MyInput from '@/components/UI/MyInput.vue'


export default{
    components:{
        MyNavbar,
        MyInput,

    },
    data(){
        return{
            show: false,
            start: true,
            action_one: true,
            action_two: true,
            action_three: true,
            choice: false,
            requestTimeOff:true,
            planVacation:true,
            goRemote:true,
            preportIllness:true,
            openForm:false,
            toBack: false,
            toBackChapter:false,
            toBackVariant:false,
            user: null
        }
    },
    methods:{
        async created(){
            const response = await axios.get('/api/user/session', {
                headers:{
                    Authorization: 'Bearer' + localStorage.getItem('token')
                }
                            

            })
        },
        createEvent(){
            this.show = true
            this.toBack = true
            const button = document.getElementById('btn')
            button.style.display = 'none'
            
        },
        openCardOne(){
            this.action_two = false;
            this.action_three = false;
            this.toBack = false,
            this.toBackChapter = true
            this.choice = true;
            

        },
        // openCardTwo(){
        //     this.action_one = false;
        //     this.action_three = false
        // },
        // openCardThree(){
        //     this.action_one=false;
        //     this.action_two=false;
        // },
        requestAction(){
            this.requestTimeOff = false;
            this.planVacation = false;
            this.goRemote = false;
            this.preportIllness = false;
            this.openForm= true;
            this.toBackVariant = true;
            this.toBackChapter = false;
        },
        toBackF(){
            this.show = false;
            const buttonV = document.getElementById('btn')
            buttonV.style.display = ''
        },
        toBackChapterF(){
            this.toBack = true;
            this.toBackChapter = false;
            this.show = true;
            this.choice = false;
            this.action_two = true;
            this.action_three = true;

        },
        toBackVariantF(){
            this.toBackVariant = false;
            this.toBackChapter = true;
            this.action_one = true;
            this.choice = true;
            this.openForm = false;
            this.requestTimeOff = true;
            this.planVacation = true;
            this.goRemote = true;
            this.preportIllness = true;

        }


               

    },
    mounted(){
        (() => {
            if(localStorage.getItem('token'))
                console.log(localStorage)
        })(),
        (async()=>{
            try{
                const response = await axios.get('/api/user/session',{
                  headers:{
                      Authorization: localStorage.getItem('token')
                  }
                });
                console.log(response)
                this.user = response.data
            }
            
            catch(e){
            console.error(e)
            }
        })()
    }

} 
</script>
<script setup>
import {useTodoStore} from '@/store/store'

const todoStore = useTodoStore()
</script>

<style scoped>

/* .slide-fade-enter-active {
  transition: all 0.3s ease-out;
}

.slide-fade-leave-active {
  transition: all 0.5s cubic-bezier(1, 0.5, 0.8, 1);
}

.slide-fade-enter-from,
.slide-fade-leave-to {
  transform: translateX(20px);
  opacity: 0;
} */

.wrapper {
  width: 100%;
  height: 100%;
  position: fixed;
  top: 65px;
  left: 0px;
  background: #EEF1F6;
  /* padding: 100px;     */
  display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;

}

.block , .block_carts{
    margin: 0 auto;
    text-align: center;

}
.block_cards{
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    justify-content: space-around;

}
.card{
    width: 276px;
    height: 346px;
    background: #F5F6F7;
    border: 1px solid #FFFFFF;
    border-radius: 20px;
    display: flex;
    flex-direction: column;
    justify-content: space-around;
    margin:30px;
    text-align: left;
    padding: 0 30px;


}
.card:hover .card-border{
    background-image:none;
    

}
.card:hover .card_image_one{
    transform: scale(1.2);

}
.card:hover .card_image_two{
    transform: scale(1.2);
}
.card:hover .card_image_three{
    transform: scale(1.2);

    
}
.card:hover , .choice_card:hover{

    background-color:  #F1F5FC;
    transition: all 1s ease;
    border: 1px solid #333333;
}
.card-border{
    background-image: url('../../../assets/img/card-border.svg');
    width:147px;
    height:147px;
    padding: 10px;

}
.card_image_one{
    background-image: url('../../../assets/img/Icon-12.svg');
    width: 98.77px;
    height: 116.78px;

}
.card_image_two{
    background-image: url('../../../assets/img/Icon-8.svg');
    margin-top: 15px;
    width: 97.31px;
    height: 95.28px;

}
.card_image_three{
    background-image: url('../../../assets/img/Icon-6.svg');
    width: 75.77px;
    height: 109.27px;
}

.сard_description{
    font: 500 14px / 20px 'Monserrat';
    padding:15px 0;
}
.btn{
  width: 98px;
  height: 44px;
  background: #4256F6;
  border: none;
  border-radius: 10px;
  color: white;
  font: 700 16px/ 20px 'Montserrat';
  margin:10px 20px 0 0;
  padding:7px;
}
.choice_cards_block{
    max-width: 600px;
    height: 350px;
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
}
.choice_card{
    width: 276px;
    height: 153px;
    background: #F5F6F7;
    border: 1px solid #FFFFFF;
    border-radius: 20px;
    text-align:left;
    margin-top: 30px;
    padding: 40px 10px 10px 10px;
}
.form{
    min-width: 584px;
    min-height: 346px;
    background: #F1F5FC;
    border: 1px solid #333333;
    border-radius: 20px;
    padding: 20px 20px 10px 20px;
    text-align: left;
    margin: 27px;
}

.label {
  font: 500 14px/ 27px 'Montserrat';
  color: #5B5A5D;

}
.to_back{
    position: absolute;
    margin:0;
    min-width: 91.54px;
    height: 41px;
    top:100px;
    left:150px;
    color: #4256F6;
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


</style>