import {defineStore} from 'pinia'
import {objectToFormData} from '../../../lib/formdata';
import axios from 'axios'

export const useTodoStore = defineStore({
    id: 'todo',
    state: () => ({

      user: null,
      users: [],
      show: false,
      token: localStorage.getItem('token'),
      page: 1 ,
      items: 4,
      totalPages: 0,
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
            params:{
              page: this.page,
              items: this.items,
              }
          });
          console.log(resp)
          this.totalPages= Math.ceil(resp.headers['total-count'] / this.items)
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
            }

          const request = objectToFormData({user: data})
          const test = await axios.post('/api/user/users', request, {
            headers: {
              'Authorization': localStorage.getItem('token'),
            },
          });

          console.log(test)
        } catch (e) {
          console.error(e)
        }
      },
      async deleteUser(id) {
        try {
          const del = await axios.delete(`/api/user/users/${id}`, {
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
