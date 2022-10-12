import { createApp } from 'vue';
import App from '../App.vue';
// import components from '@/components/UI'

import router from '@/router';

// console.log('Vite ⚡️ Rails')
// console.log('Visit the guide for more information: ', 'https://vite-ruby.netlify.app/guide/rails')

const app = createApp(App);

// components.forEach(component => {
//     app.component(component.name, component)
// })
app
    .use(router)
    .mount('#app');
