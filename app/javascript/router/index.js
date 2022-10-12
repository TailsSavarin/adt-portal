import {createRouter, createWebHistory} from 'vue-router';
import {auth} from '@/modules/Auth/routes'

const routes = [
  ...auth
]

const router = createRouter({
  routes,
  history: createWebHistory(),
})

export default router;
