import 'virtual:windi.css'
import { createApp } from 'vue'
import App from './App.vue'

import { createRouter, createWebHistory } from 'vue-router'
import routes from "~pages"
# import { GesturePlugin } from '@vueuse/gesture'

router = createRouter({
  history: createWebHistory()
  routes
})

app = createApp(App)
app.use(router)
# app.use(GesturePlugin)

app.mount('#app')
