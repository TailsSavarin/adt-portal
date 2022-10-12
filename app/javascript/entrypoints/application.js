import { createApp } from 'vue';
import App from '../App.vue';
<<<<<<< HEAD
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
=======
import router from '@/router';

const app = createApp(App);
app.use(router);
app.mount('#app');
>>>>>>> 3ffd78d94631d03dbdb8b90d8ab0808411630147
