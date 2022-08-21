<template>
<div class="bg-gray-900 border-t">
    <Sidebar/>
    <div class="h-screen lg:ml-48 z-50 bg-gray-50">

         <div class="py-5 px-10 rounded w-full barlow-bold text-base lg:text-2xl border-b bg-white rounded-tl-3xl uppercase grid grid-cols-6 top-0">
           
            <span class="col-span-5 flex items-center">
                <span @click="manageSidebar(true)" class="mr-5 lg:hidden " :class="`${menu == true ? 'block' : ''}`">
                  <Icon :object="{title: 'mobile-menu', class: 'h-5 w-5 text-black'}"/>
                </span>
                <span>
                  Dashboard
                </span>
            </span>
            <button type="button" class="hidden lg:block col-span-1 group w-full bg-white rounded-md px-3.5 py-2 text-sm text-left font-medium text-gray-700 bg-white"  x-ref="button" >
                <span class="flex w-full justify-between items-center">
                    <span class="flex min-w-0 items-center justify-between space-x-3">
                        <img class="w-10 h-10 bg-white rounded-full flex-shrink-0" src="https://source.unsplash.com/random/?profile,man" alt="">
                        <span class="flex-1 flex flex-col min-w-0">
                            <span class="text-gray-900 text-sm font-medium truncate">Matthew Scott</span>
                            <span class="text-gray-500 text-sm truncate">@matt</span>
                        </span>
                    </span>
                    <svg class="flex-shrink-0 h-5 w-5 text-gray-400 group-hover:text-gray-500" x-description="Heroicon name: solid/selector" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                        <path fill-rule="evenodd" d="M10 3a1 1 0 01.707.293l3 3a1 1 0 01-1.414 1.414L10 5.414 7.707 7.707a1 1 0 01-1.414-1.414l3-3A1 1 0 0110 3zm-3.707 9.293a1 1 0 011.414 0L10 14.586l2.293-2.293a1 1 0 011.414 1.414l-3 3a1 1 0 01-1.414 0l-3-3a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                    </svg>
                </span>
            </button>
        </div>

        <main class="px-10 py-10 bg-gray-50" style="min-height: 90vh;">

            <div>
                <div class="sm:flex sm:items-center mb-5">
                    <div class="sm:flex-auto">

                        <p class="mt-2 text-sm text-gray-700"></p>
                    </div>
                   
                </div>

                <div class="grid grid-cols-6 gap-x-2">
                     <div class="col-span-6 lg:col-span-4 bg-white border rounded-xl p-1">
                         <DashboardChart />
                    </div>

                    <div class="col-span-6 lg:col-span-2 bg-white border rounded-xl p-3">
                       <DashboardAlert />
                    </div>
                </div>

                <div class="grid grid-cols-6 gap-x-2 mt-10">
                     <div class="col-span-6 lg:col-span-6 bg-white border rounded-xl p-3">
                         <DashboardStats/>
                    </div>
                </div>

                <div class="grid grid-cols-6 gap-x-2 mt-10">
                     <div class="col-span-6 lg:col-span-6 bg-white border rounded-xl p-3">
                         <DashboardCorrectiveAction />
                    </div>
                </div>
                
            </div>

        </main>
        <Footer />
    </div>

</div>
</template>

<script>
import DashboardStats from '../components/DashboardStats.vue'
import {
    store
} from "@/store/index.js"
export default {
  components: { DashboardStats },
  computed:{
    menu(){
      return store.state.resource.menu
    }
  },
  methods:{
      manageSidebar(status){
            store.commit('resource/set', {menu: status})
      },
  }
}
</script>

<style>

</style>
