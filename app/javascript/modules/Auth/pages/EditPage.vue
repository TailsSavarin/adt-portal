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
            <form class="form">
                 <p class="textB">Основная информация</p>
                 <div style="display:flex;">
                    <div style="margin-right:20px">
                        <label class="label" for="name">Имя</label>
                        <input class="input" type="text" name="name" >
                    </div>
                    <div>
                        <label class="label" for="patronymic">Отчество</label>
                        <input class="input" type="text" name="patronymic">
                    </div>

                 </div>
                 <label class="label" for="surname"> Фамилия</label>
                 <input class="input" type="text" name="surname" >

                 <label class="label" for="location">Локация</label>
                 <input class="input" type="text" name="location">

                 <label class="label" for="telephone"> Телефон</label>
                 <input class="input" type="text" name="telephone" >

                 <label class="label" for="telegram">Telegram</label>
                 <input class="input" type="text" name="telegram">

                 <p class="textB">Новый пароль</p>
                 <div style="display:flex;">
                    <div style="margin-right:20px">
                        <label class="label" for="password">Пароль</label>
                        <input class="input" type="password" name="password" >
                    </div>
                    <div>
                        <label class="label" for="password">Повторите пароль</label>
                        <input class="input" type="password" name="password">
                    </div>

                 </div>
             </form>
        </div>
        <div class="container_two">
            <form class="form">
            <p class="textB">BIO</p>
            <p class="text_normal">А вот без био сотрудник может, скорее всего он и будет без него</p>
            <label class="label" for="myself">О себе</label>
            <textarea  class="textarea" name="myself" cols="60" rows="10">Чёрная окраска пантер является проявлением меланизма, вызванного мутацией гена[1]. Примером сильного распространения мутации, которая приводит к меланизму, в популяции кошачьих, является популяция леопарда на территории Малайзии, где около 50 % животных имеют чёрную окраску. Вообще среди больших кошек меланизм обычно является более распространённым в тех популяциях, которые живут в плотных лесах — при условии недостатка освещения тёмные животные здесь являются менее заметными, чем на открытой местности, что облегчает им выживание.</textarea>
            </form>

        </div>
        <div>
            <div class="container_three"> 

                <div>

                </div>                    
            
            </div>       
            <div class="btn_container">
                <button class="btn text_h2" @click="$router.push('/editpage')">Save</button>

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
    min-height: 384px;

    background: #F5F6F7;
    border-radius: 20px;
    padding:40px;
    display: flex;
    flex-direction: column;
    
}
.container_two{
    width: 33%;

    height: 490px;

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
.form{
    border-radius: 20px;
    text-align: left;

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
.textarea{
    width: 100%;
    max-height: 288%;
}
</style>