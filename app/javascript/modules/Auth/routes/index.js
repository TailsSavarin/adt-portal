export const auth = [
  {
    path: '/login',
    name: 'Login',
    component: () => import('@/modules/Auth/pages/AuthenticationPage.vue'),
  },
  {
    path: '/',
    name: 'Main',
    component: () => import('@/modules/Auth/pages/Main.vue'),
  },
  {
    path: '/profile',
    name: 'Profile',
    component: () => import('@/modules/Auth/pages/MyProfile.vue')   
  },
  {
    path: '/editpage',
    name: 'EditPage',
    component: () => import('@/modules/Auth/pages/EditPage.vue')   
  },
  {
    path: '/users',
    name: 'Users',
    component: () => import('@/modules/Auth/pages/Users.vue')   
  },
  {
    path: '/usersPagination',
    name: 'UsersPagination',
    component: () => import('@/modules/Auth/pages/UsersPagination.vue')   
  },
  { 
    path: '/:pathMatch(.*)*', 
    name: '404', 
    component: () => import('@/modules/Auth/pages/NotFound.vue'), 
  },
];

