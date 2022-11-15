import {createRouter, createWebHistory} from 'vue-router';
import {auth} from '@/modules/Auth/routes'
// import axios from 'axios';

const routes = [
  ...auth
]

const router = createRouter({
  routes,
  history: createWebHistory(),
})

// router.beforeEach((to, from, next) => {
//  const isAuthenticated= false;
//  if(localStorage.getItem('token'))
//   isAuthenticated = true;
//  else
//   isAuthenticated= false;
// if(isAuthenticated) {
//   next(); 
//  } else{
//   next('/login'); 
//  }
// })

// router.beforeEach((to, from, next) => {
//   const token = localStorage.getItem('token')
//   if (token){
//     axios.defaults.headers.common['Authorization'] = token;
//     //текущий пол-ль
//     console.log(token)
    
//   }
//   if (to.meta.requiresAuth){
    
//   }
//   else {
//     next()
//   }
  
// })
export default router;
