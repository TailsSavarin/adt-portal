import router from '@/router';
// import Vuex from 'vuex'
// import store from '@/store';
// import Vuelidate from 'validators';
import { createApp } from 'vue';
import App from '../App.vue';

const app = createApp(App);


app.use(router)
    // .use(Vuex)
    // .use(store)
    // .use(Vuelidate);
app.mount('#app');

