<template>
  <div>

    <router-view/>
  </div>
</template>

<!-- <script setup>
import {} from 'vue'
  const test = created(()=>{
            let response =  axios.get('/api/user/session', {
                headers:{
                    Authorization: 'Bearer' + localStorage.getItem('token')
                }
                            

            })
        },)
</script> -->
<style>
* {
  margin: 0 auto;
  padding: 0;
  box-sizing: border-box;
  transition: 0.2s ease;
  font-family: 'Montserrat';
  
}

</style>
