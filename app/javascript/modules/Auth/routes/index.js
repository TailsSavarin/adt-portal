export const auth = [
  {
    path: '/login',
    name: 'Login',
    component: () => import('@/modules/Auth/pages/AuthenticationPage.vue')
  },
]
