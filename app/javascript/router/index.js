import {createRouter, createWebHistory} from 'vue-router';
import {auth} from '@/modules/Auth/routes'
import axios from 'axios';
import {useAuthUser} from '@/store/store'

const routes = [
  ...auth
]

const router = createRouter({
  routes,
  history: createWebHistory(),
})

// router.beforeEach((to, from, next) => {
//   if (to.name !== 'Login' && !localStorage.getItem('token')) next({ name: 'Login' })
//   else next()
// })

router.beforeEach((to, from, next) => {
  const authUser = useAuthUser()
  if (to.name !== 'Login' && !authUser.isAuthenticated) next({ name: 'Login' })
  else next()
})
export default router;
