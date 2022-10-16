<template>
    <div>
      <div class="nav">
        <ul class="nav_list" >
            <li class="logo" @click="$router.push('/login')"></li>
            <li>Космические исследования</li>
            <li>Заявки</li>
            <li @click="$router.push('/profile')">Мой профиль</li>
        </ul>
      </div>
    </div>
    <div class="wrapper"> 
        
        <div class="block">
            <h1>Привет, Элина!</h1>
            <p>Присядь к нашему костру и рассказывай</p>
            <button class="btn" @click="createEvent" id="btn">Создать</button>
            <div v-if="show" class="block_cards">
                <div class="card" v-if="action_one" @click="openCardOne">

                    <div class="card-border"> <div class="card_image_one">  </div></div>
                    <div>
                        <p class="text-1">К шефу</p>
                        <p class="text-2">Организационные вопросы в рабочем процессе</p>
                    </div>
                </div>

                <div v-if="choice" class="choice_cards_block">
                    <div class="choice_card" v-if="requestTimeOff" @click="requestAction">
                        <p class="text-1">Запросить отгул</p>
                        <p class="text-2">Отсутствие на работе по уважительной причине</p>
                    </div>
                    
                    <div v-if="openForm">
                        <form class="form">
                            <p class="text-1">Запросить отгул</p>
                            <p class="text-2">Отсутствие на работе по уважительной причине</p>
                            <label class="label" for="period">Необходимый период</label>
                            <input class="input" type="text" name="period" >
                            <label class="label" for="reason">Причина</label>
                            <input class="input" type="text" name="reason">
                            <button class="btn">Отправить</button>
                        </form>
                    </div>

                    <div class="choice_card" v-if="planVacation">
                        <p class="text-1">Запланировать отпуск</p>
                        <p class="text-2">В этом году у вас еще есть дни отпуска</p>
                    </div>
                    <div class="choice_card" v-if="goRemote">
                        <p class="text-1">Перейти на удаленку</p>
                        <p class="text-2">Приготовьте уважительные причины для перехода</p>
                    </div>
                    <div class="choice_card" v-if="preportIllness">
                        <p class="text-1">Уведомить о болезни</p>
                        <p class="text-2">Напишите сюда, а потом спите и кушайте супчик</p>
                    </div>
                </div>

                <div class="card" v-if="action_two" @click="openCardTwo">
                    <div class="card-border"> <div class="card_image_two">  </div></div>
                    <div>
                       <p class="text-1">К коллеге</p>
                        <p class="text-2"> Нас разделяют расстояния, но мы вместе</p>     
                    </div>               
                </div>
                <div class="card" v-if="action_three" @click="openCardThree">
                    <div class="card-border"> <div class="card_image_three">  </div></div>
                    <div>
                        <p class="text-1">К службе</p>
                        <p class="text-2">Есть чем поделиться с коллегами - welcome</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import axios from 'axios'
export default{

    data(){
        return{
            show: false,
            action_one: true,
            action_two: true,
            action_three: true,
            choice: false,
            requestTimeOff:true,
            planVacation:true,
            goRemote:true,
            preportIllness:true,
            openForm:false
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
            const button = document.getElementById('btn')
            button.remove()
        },
        openCardOne(){
            this.action_two = false;
            this.action_three = false;
            this.choice = true;
        },
        openCardTwo(){
            this.action_one = false;
            this.action_three = false
        },
        openCardThree(){
            this.action_one=false;
            this.action_two=false;
        },
        requestAction(){
            this.requestTimeOff = false;
            this.planVacation = false;
            this.goRemote = false;
            this.preportIllness = false;
            this.openForm= true;
        }
    },
    
}
</script>

<style scoped>
*{
    transition: all 1s ease;
}
.nav{
    width: 100%;
    height: 70px;
    background: #EEF1F6;

}
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
.nav_list , li{
    display: flex;
    flex-direction: row;
    font:500 18px/ 26px 'Monserrat';
    color:#333333;
    list-style: none;
    text-align: center;
    padding-top: 15px;
}
.logo{
    background-image: url('../../../assets/img/logo-mini.svg');
    width: 66px;
    height: 61px;
    z-index: 10;
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
    border: 1px solid #333333;
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
h1{
    font: 700 42px/ 50px 'RussianRail G Pro';
    padding:10px;
}
.text-1{
    font: 700 16px / 50px 'Monserrat';
}
.text-2{
    font: 500 14px / 20px 'Monserrat';
}
.btn{
  width: 98px;
  height: 44px;
  background: #4256F6;
  border: none;
  border-radius: 10px;
  color: white;
  font: 700 16px/ 20px 'Montserrat';
  margin:20px 20px 0 20px;
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
.input {
  width: 100%;
  border: 1px solid #F0EFF2;
  border-radius: 10px;
  padding: 10px 15px;
  margin: 15px 0 0 0;
}

.label {
  font: 500 14px/ 37px 'Montserrat';
  color: #5B5A5D;

}
</style>