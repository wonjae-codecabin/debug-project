<template>
<div class="h-screen fixed flxed z-50" v-if="menu">
    <div class="h-screen bg-white w-48 z-10 fixed border-r grid grid-rows-2">
        <div>

             <div class="w-full flex justify-end py-2 px-2 block lg:hidden">
                    <span class="block lg:hidden cursor-pointer" @click="manageSidebar(false)">
                        <Icon :object="{title:'x', class: 'h-5 w-5 '}" />
                    </span>
                </div>
            <div class="h-24 flex items-center w-full justify-center">
                <!-- Logo -->
               
                <img src="https://res.cloudinary.com/dxmgdmeup/image/upload/v1660980021/imageedit_1_4973873735_rawwzy.png" class="w-32" />
            </div>
            <div class="w-full text-base px-3 cursor-pointer">
                <nuxt-link :to="`/`" class="flex w-full gap-x-3 items-center barlow-medium text-sm">
                    <span>
                        <Icon :object="{title:'chart', class: 'h-5 w-5 '}" />
                    </span>
                    <span class="">
                        Dashboard
                    </span>
                </nuxt-link>
            </div>
            <div class="w-full text-base pt-5 px-3 cursor-pointer">
                <nuxt-link :to="`/properties`" class="flex w-full gap-x-3 items-center barlow-medium text-sm">
                    <span>
                        <Icon :object="{title:'clipboard-check', class: 'h-5 w-5 '}" />
                    </span>
                    <span class="">
                        Properties
                    </span>
                </nuxt-link>
            </div>
             <div class="w-full text-base pt-5 px-3 cursor-pointer">
                <a href="https://fruitfly.sa.gov.au/" target="_blank" class="flex w-full gap-x-3 items-center barlow-medium text-sm">
                    <span>
                        <Icon :object="{title:'globe', class: 'h-5 w-5 '}" />
                    </span>
                    <span class="">
                        Resources
                    </span>
                </a>
            </div>
             <div class="w-full text-base pt-5 px-3 cursor-pointer">
                <a href="https://www.sa.gov.au/topics/about-sa/directories/customer-service-centres/locations-and-opening-hours#:~:text=Call%20Service%20SA%20Monday%20to,am%20and%205%3A00%20pm" target="_blank" class="flex w-full gap-x-3 items-center barlow-medium text-sm">
                    <span>
                        <Icon :object="{title:'contact', class: 'h-5 w-5 '}" />
                    </span>
                    <span class="">
                        Contact
                    </span>
                </a>
            </div>
              <div class="w-full text-base pt-5 px-3 cursor-pointer">
                <a href="https://www.preventfruitfly.com.au/news/" target="_blank" class="flex w-full gap-x-3 items-center barlow-medium text-sm">
                    <span>
                        <Icon :object="{title:'news-paper', class: 'h-5 w-5 '}" />
                    </span>
                    <span class="">
                        News
                    </span>
                </a>
            </div>


            
        </div>
        <div class="flex items-end pb-10">
            <div class="w-full text-base pt-5 px-3 cursor-pointer">
                <nuxt-link :to="`/signin`" class="flex w-full gap-x-3 items-center barlow-medium text-sm">
                    <span>
                        <Icon :object="{title:'account', class: 'h-5 w-5 '}" />
                    </span>
                    <span class="">
                        Logout
                    </span>
                </nuxt-link>
            </div>
        </div>
    </div>

</div>
<div v-else></div>
</template>

<script>
import {
    store
} from "@/store/index.js"
export default {
   
    computed:{
        menu(){
            return store.state.resource.menu
        }
    },
    methods:{
        manageSidebar(status){
            store.commit('resource/set', {menu: status})
        },

        
    },
   
}
</script>

<style>

</style>
