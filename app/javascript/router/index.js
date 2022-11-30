import { createRouter, createWebHistory } from 'vue-router';
import { auth } from '@/modules/Auth/routes';
import { useAuthUser } from '@/store/store';

const routes = [
  ...auth
];

const router = createRouter({
  routes,
  history: createWebHistory(),
});

router.beforeEach((to, from, next) => {
  const authUser = useAuthUser();
  if (to.name !== 'Login' && !authUser.isAuthenticated) next({ name: 'Login' });
  else next();
});
export default router;
