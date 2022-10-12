<<<<<<< HEAD

import {createRouter, createWebHistory} from 'vue-router';
import {auth} from '@/modules/Auth/routes'
const routes = [
    ...auth
    ]

const router = createRouter({
    routes,
    history: createWebHistory()
})

export default router;
=======
import { createRouter, createWebHistory } from 'vue-router';

const routes = []

const router = createRouter({
  history: createWebHistory(),
  routes
});

export default router;
>>>>>>> 3ffd78d94631d03dbdb8b90d8ab0808411630147
