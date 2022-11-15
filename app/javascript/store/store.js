import {defineStore} from 'pinia'
import axios from 'axios'

export const useTodoStore = defineStore({
    id: 'todo',
    state: () => ({

      user: null,
      users: [],
      show: false,
      token: localStorage.getItem('token'),
      // page: 1 ,
      // limit: 4,
      // totalPages: 0, 

      birthday: "",
      position: "",
      first_name: "",
      middle_name: "",
      last_name: "",
      location: "",
      telegram: "",
      login: "",
      password: "",
      phone: "",
      email: "",
      bio: "",
      id: "",
      avatar: "",

    }),
    getters: {
      async getUser() {
        try {
          const response = await axios.get('/api/user/session', {
            headers: {
              Authorization: localStorage.getItem('token')
            }
          });
          console.log(response)
          return this.user = response.data


        } catch (e) {
          console.error(e)
        }

      }
      ,

      async getAllUsers() {
        try {
          const resp = await axios.get('/api/user/users', {
            headers: {
              Authorization: localStorage.getItem('token'),

            },
            // params:{
            //   _page: this.page,
            //   _limit: this.limit,
            //   }
          });
          console.log(resp)
//           this.totalPages= Math.ceil(resp.headers['total-count'] /
// this.limit) 
          return this.users = resp.data


        } catch (e) {
          console.error(e)
        }

      }
    },
    actions: {
      async createUser() {
        this.show = false


        try {
          const formData = new FormData()
          formData.append('avatar', this.avatar)
          formData.append('first_name', this.first_name)
          formData.append('middle_name', this.middle_name)
          formData.append('last_name', this.last_name)
          formData.append('location', this.location)
          formData.append('phone', this.phone)
          formData.append('telegram', this.telegram)
          formData.append('birthday', this.birthday)
          formData.append('position', this.position)
          formData.append('password', this.password)
          formData.append('bio', this.bio)
          formData.append('login', this.login)
          
    
          console.log(formData)
          const test = await axios.post('/api/user/users', formData, {
            headers: {
              'Content-Tipe': 'mulipart/form-data',
              'Authorization': localStorage.getItem('token'),
              
            },
          });

          console.log(test)
        } catch (e) {
          console.error(e)
        }
      },
      async deleteUser() {
        try {
          const del = await axios.delete(`/api/user/users/${this.id}`, {
            headers: {
              Authorization: localStorage.getItem('token'),

            },

          });
          console.log(del)

          


        } catch (e) {
          console.error(e)
        }

      }
    }
  }
)
