<template>
    <div>
      <div class="nav">
        <div class="nav_list" >
            <span class="logo" @click="$router.push('/login')"></span>
            <div class="p">
              <div class="hide">Космические исследования
                  <span class="sticker">Soon</span>
              </div>
              
              <div><p @click="$router.push('/')" style="cursor: pointer;" id="request">Заявки</p></div>
              <div><p @click="$router.push('/profile')" style="cursor: pointer;" id="myProfile">Мой профиль</p></div>
              <div><p @click="$router.push('/users')" style="cursor: pointer;">Пользователи</p></div>
            </div>

        </div>
      </div>
    </div>
</template>
<script>
  export default {
    name: 'my-navbar',
    mounted() {
      (() => {
      const currentUrl = window.location.pathname;
      if(currentUrl == '/profile'){
        myProfile.style.borderBottom= '3px solid #033A92'
      }

      if(currentUrl == '/editpage'){
        myProfile.style.borderBottom= '3px solid #033A92'
      }     

      if(currentUrl == '/'){
        request.style.borderBottom= '3px solid #033A92'
      }
      
      })()

    },
  }
</script>

<style scoped>

.nav{
    width: 100%;
    height: 70px;
    background: #EEF1F6;
    position: fixed;
}
.nav_list{
    display: flex;
    flex-direction: row;
    font:500 18px/ 30px 'Monserrat';
    color:#333333;
    text-align: center;


}
.p{
  width: 50%;
  display: flex;
  justify-content: space-around;
  margin-top: 10px;
}
.logo{
    background-image: url('../../../assets/img/logo-mini.svg');
    width: 66px;
    height: 61px;
    z-index: 10;
    margin: 0 0 0 150px;
    cursor: pointer;
}
.hide{
  color: #ABABAB;
  position: relative;
  cursor:not-allowed;
}
.sticker{
  position: absolute;
  min-width: 42px;
  min-height: 14px;
  left: 207px;
  top: 0px;
  background: #FC3A1B;
  border-radius: 4px;
  font:500 10px/ 15px 'Monserrat';
  color:white;
  padding: 7px, 8px, 0px, 8px;
}
</style>