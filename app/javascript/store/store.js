import { defineStore } from 'pinia';
import axios from 'axios';
import { objectToFormData } from '../../../lib/formdata';

export const useTodoStore = defineStore({
id: 'todo',
state: () => ({
  user: null,
  users: [],
  show: false,
  token: localStorage.getItem('token'),
  page: 1,
  items: 2,
  totalPages: 0,
  birthday: '',
  position: '',
  first_name: '',
  middle_name: '',
  last_name: '',
  location: '',
  telegram: '',
  login: '',
  password: '',
  phone: '',
  email: '',
  bio: '',
  id: '',
  avatar: '',
}),
getters: {
  async getUser() {
  try {
    const response = await axios.get('/api/user/session', {
    headers: {
      Authorization: localStorage.getItem('token')
  }
  });
  return this.user = response.data; 
  } catch (e) {
    console.error(e);
  }
  }  
},
actions: {
  async getAllUsers() {
  try {
    const response = await axios.get('/api/user/users', {
    headers: {
    Authorization: localStorage.getItem('token'),
  },
  params:{
    page: this.page,
    items: this.items,
  }
  });
  this.totalPages= Math.ceil(response.headers['total-count'] / this.items);
  return this.users = response.data; 
  } catch (e) {
    console.error(e);
  }
  },
  async loadMoreUsers() {
  try {
    this.page +=1;
    const response = await axios.get('/api/user/users', {
    headers: {
      Authorization: localStorage.getItem('token'),
    },
    params:{
      page: this.page,
      items: this.items,
    }
    });
    this.users = [...this.users, ...response.data];

  } catch (e) {
    console.error(e);
  }
  },
  async createUser() {
  this.show = false;  
  try {
    const data =
    {
      avatar: this.avatar,
      first_name: this.first_name,
      middle_name: this.middle_name,
      last_name: this.last_name,
      location: this.location,
      phone: this.phone,
      telegram: this.telegram,
      birthday: this.birthday,
      position: this.position,
      password: this.password,
      bio: this.bio,
      login: this.login,
      email: this.email,
    };
    const request = objectToFormData({ user: data });
    const test = await axios.post('/api/user/users', request, {
    headers: {
      'Authorization': localStorage.getItem('token'),
    },
    });
    this.first_name = '',
    this.password = '',
    this.avatar= '',
    this.middle_name= '',
    this.last_name= '',
    this.location= '',
    this.phone= '',
    this.telegram= '',
    this.birthday= '',
    this.position= '',
    this.bio= '',
    this.login= '',
    this.email= '',
    console.log(test);
  } catch (e) {
    console.error(e);
  }
  },
  async deleteUser(id) {
  try {
    const del = await axios.delete(`/api/user/users/${id}`, {
    headers: {
    Authorization: localStorage.getItem('token'),
  },
  });
  console.log(del);
  } catch (e) {
  console.error(e);
  }
  },
  }}
);
export const useAuthUser = defineStore({
  id: 'auth',
  state: () => ({
    login:'',
    password:'',
    email:'',
    formShow:true,
    passwordRecovery:false,
    error: '',
    showPassword: false,
    isAuthenticated:false,
  }),
  actions:{
  async handleSubmit(){
  try{
    const response = await axios.post('/api/session', {
      login: this.login,
      password:this.password
    });
    localStorage.setItem('token', response.data.access );
    if (localStorage.getItem('token')){
      this.isAuthenticated = true;
      return true;
    }    
  } catch({ response }){
    this.error = response.data.error;
  }
  },
  async getPassword(){
  try{
    const resp = await axios.post('/api/passwords', {
      email: this.email
    });
    console.log(resp);
  } catch(e){
    console.error(e);
  }
  }}
});