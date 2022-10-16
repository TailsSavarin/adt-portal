<template>
        <div>
      <div class="nav">
        <ul class="nav_list" >
            <li class="logo" @click="$router.push('/login')"></li>
            <li>Космические исследования</li>
            <li @click="$router.push('/main')">Заявки</li>
            <li>Мой профиль</li>
        </ul>
      </div>
    </div>
    <div class="wrapper"> 
        <div class="container_one">
            <div style="margin:0"> 
                <div class="logo_micro"></div>
                <h1 style="display:inline-block; vertical-align: top; margin: 14px 10px;">AGILE DEVELOPMENT TEAM</h1>
            </div>
            <div class="photo"></div>
            <div style="text-align:left">
                <p class="text_orange">Frontend-разработчик</p>
                <p class="textB">Иванова Элина Евгеньевна</p>
                <p class="text_normal">elina@nasa.moon</p>
                <p class="text_normal">+96 558 441 598</p>
                <p class="text_normal">Telegram: @elinaI</p>
            </div>
        </div>
        <div class="container_two">
            <p class="textB">BIO</p>
            <p class="text_h2">День рождения</p>
            <p class="text_normal">6 июня</p>
            <p class="text_h2">О себе</p>
            <p class="text_normal">Чёрная окраска пантер является проявлением меланизма, вызванного мутацией гена[1]. Примером сильного распространения мутации, которая приводит к меланизму, в популяции кошачьих, является популяция леопарда на территории Малайзии, где около 50 % животных имеют чёрную окраску. Вообще среди больших кошек меланизм обычно является более распространённым в тех популяциях, которые живут в плотных лесах — при условии недостатка освещения тёмные животные здесь являются менее заметными, чем на открытой местности, что облегчает им выживание.</p>
        </div>
        <div>
            <div class="container_three"> 
                <div>
                    <p class="textB">Условия работы</p>
                    <p class="text_h2">Начало работы в организации</p>
                    <p>08.10.2022</p>
                    <p class="text_h2">Согласованная локация</p>
                    <p>Удаленная работа</p>
                    <p class="text_h2">Локация</p>
                    <p>Париж</p>
                </div>
                <div>

                </div>                    
            
            </div>       
            <div class="btn_container">
                <button class="btn text_h2" @click="$router.push('/editpage')">Редактировать</button>
                <button class="btn text_h2" > Выйти</button>  
            </div>       
        </div>

    </div>
</template>
<script>
</script>
<style scoped>
*{

}
.nav{
    width: 100%;
    height: 70px;
    background: #EEF1F6;


}
.text_h2{
    font:700 16px/ 20px 'Montesart';
    padding: 10px 0;
    color: #333333;
}
.wrapper {
  width: 100%;
  height: 100%;
  position: fixed;
  top: 65px;
  left: 0px;
  background: #EEF1F6;
  padding: 100px;    
  display: flex;


}
.btn_container{
    width: 418px;
    margin:20px 0;
}
.btn{
    margin: 30px 30px 30px 0;
    background: #F5F6F7;
    border-radius: 20px;
    border:none;
    padding: 40px;
    max-width: 243px;
    min-height: 72px;

}


.text_orange{
    color: #FC3A1B;
    
}
.textB{
    font:700 24px/ 24px 'Montesart';
    padding: 15px 0;
}
.text_normal{
    color: #5B5A5D;
    font-size: 14px;

}
.photo{
    background-image: url('../../../assets/img/photo.png');
    width: 323px;
    height: 214px;
    margin: 20px 0;
}
.logo_micro{
    background-image: url('../../../assets/img/logo-micro.svg');
    width: 46px;
    height: 43px;
    display: inline-block;
}
.container_one{
    width: 30%;
    height: 584px;

    min-height: 584px;
    background: #F5F6F7;
    border-radius: 20px;
    padding:40px;
    display: flex;
    flex-direction: column;
    justify-content: space-around;
    
}
.container_two{
    width: 33%;

    height: 400px;

    min-height: 400px;
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
</style>