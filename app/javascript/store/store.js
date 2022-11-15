import {defineStore} from 'pinia'
import axios from 'axios'

export const useTodoStore = defineStore({
    id: 'todo',
    state: () => ({

      user: null,
      users: [],
      show: false,
      token: localStorage.getItem('token'),

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
              Authorization: localStorage.getItem('token')
            }
          });
          console.log(resp)
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
          const user = {
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
            avatar: this.avatar

          }
          const test = await axios.post('/api/user/users', {user: {...user}}, {
            headers: {
              Authorization: localStorage.getItem('token')
            },
          });

          console.log(test)
        } catch (e) {
          console.error(e)
        }
      }
    }
  }
)
