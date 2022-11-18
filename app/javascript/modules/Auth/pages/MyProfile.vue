<template>
    <my-navbar/>
    <div class="wrapper"> 
        <div class="container_one">
            <div style="margin:0 auto">
            <div class="head" > 
                <div class="logo_micro"></div>
                <h4 style="margin:0; padding: 10px;">AGILE DEVELOPMENT TEAM</h4>
            </div>
            <div class="photo"></div>
            <div style="text-align:left">
                <p class="text_orange">{{user?.position}}</p>
                <p class="textB">{{user?.last_name}} {{user?.first_name}} {{user?.middle_name}}</p>
                <p class="text_normal">{{user?.email}}</p>
                <a href="#" class="text_normal">{{user?.phone}}</a><br>
                <a href="#" class="text_normal">Telegram: {{user?.telegram}}</a>
            
            </div>

            </div>

        </div>
        <div class="container_two">
            <p class="textB">BIO</p>
            <p class="text_h2">День рождения</p>
            <p class="text_normal">{{user?.birthday}}</p>
            <p class="text_h2">О себе</p>
            <p class="text_normal">{{user?.bio}}</p>
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
                    <p>{{user?.location}}</p>
                </div>
                <div>

                </div>                    
            
            </div>       
            <div class="btn_container">
                <div class="blockButton">
                    <button class ="btn text_h2" @click="$router.push('/editpage')" style="cursor: pointer;">Редактировать</button>
                    <div class = "editPage"></div>
                </div>
                <div class ="blockButton">
                    <button class="btn text_h2" @click="toExit" style="cursor: pointer;"> Выйти</button>
                    <div class = "exit"></div>
                </div>
            </div>       
        </div>

    </div>
</template>

<script>
import MyNavbar from '@/components/UI/MyNavbar.vue'
import axios from 'axios'
export default{
    components:{
        MyNavbar
    },
    data(){
        return{
            user: null
        }
    },
    methods:{
         toExit(){
            try{
                const response =  axios.delete('/api/user/session',{
                  headers:{
                      Authorization: localStorage.getItem('token')
                  }
                });
                localStorage.removeItem('token')
                window.location.reload()

            }
            
            catch(e){
            console.error(e)
            }
        
        }
    },
    mounted(){

        (async()=>{
            try{
                const response = await axios.get('/api/user/session',{
                  headers:{
                      Authorization: localStorage.getItem('token')
                  }
                });
                this.user = response.data
            }
            
            catch(e){
            console.error(e)
            }
        })()
    }

}
</script>
<style scoped>


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
    display: flex;
    justify-content: space-between;
}
.btn{
    margin: 10px 0 30px 0;
    background: #F5F6F7;
    border-radius: 20px;
    border:none;
    padding: 30px 60px;
    max-width: 243px;
    min-height: 72px;

}


.text_orange{
    color: #FC3A1B;
    /* padding-top: 50px; */
}
.textB{
    font:700 24px/ 24px 'Montesart';
    padding: 15px 0;
}
.text_normal{
    color: #5B5A5D;
    font-size: 14px;
    text-decoration: none;

}
.photo{
    background: url('../../../assets/img/photo.png') center center / cover;
    border-radius: 20px;
    max-width: 323px;
    height: 214px;
    margin: 19px 0 50px 0px;

}
.logo_micro{
    background-image: url('../../../assets/img/logo-micro.svg');
    width: 46px;
    height: 43px;
    margin: 0;
}
.container_one{
    width: 419px;
    height: 580px;
    margin: 0 auto;
    background: #F5F6F7;
    border-radius: 20px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    
}
.head{
    margin: 0;
    display: flex;
    justify-content: flex-start;
}
.container_two{
    width: 33%;

    height: 400px;

    min-height: 400px;
    background: #F5F6F7;
    border-radius: 20px;
    padding: 10px 40px 40px 30px;
}
.container_three{

    min-height: 350px;
    min-width: 418px;
    padding: 10px 40px 20px 30px;
    min-height: 252px;
    background: #F5F6F7;
    border-radius: 20px;
}
.blockButton{
    margin: 0;
    display: inline;
    position: relative;
}
.editPage{
    background-image: url('../../../assets/img/Edit.svg');
    position: absolute;
    width: 24px;
    height: 24px;
    top:37px;
    left:20px;
}
.exit{
    background-image: url('../../../assets/img/Exit.svg');
    position: absolute;
    width: 24px;
    height: 24px;
    top:37px;
    left:20px;
}
</style>