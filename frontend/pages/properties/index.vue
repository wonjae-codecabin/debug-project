<template>
<div>
    <Sidebar />
    <div class="h-screen lg:ml-48 border-t z-50">

        <div class="py-5 px-10 rounded w-full barlow-bold text-base lg:text-2xl border-b bg-white rounded-tl-3xl uppercase grid grid-cols-6 top-0">

            <span class="col-span-5 flex items-center">
                <span @click="manageSidebar(true)" class="mr-5 lg:hidden " :class="`${menu == true ? 'block' : ''}`">
                    <Icon :object="{title: 'mobile-menu', class: 'h-5 w-5 text-black'}" />
                </span>
                <span>
                    Properties
                    <br>
                    <span class="text-xs text-gray-400 barlow-light">This view provides a list of the properties and their live fruit fly activity status for the traps on the property</span>
                </span>
            </span>
            <button type="button" class="hidden lg:block col-span-1 group w-full bg-white rounded-md px-3.5 py-2 text-sm text-left font-medium text-gray-700 bg-white" x-ref="button">
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

        <main class="px-5 py-5 lg:py-10 bg-gray-50" style="min-height: 90vh;">

            <div>
                <div class="sm:flex sm:items-center mb-5">
                    <div class="sm:flex-auto">

                        <button type="button" class="hidden sm:flex items-center w-6/12 text-left space-x-3 px-4 h-12 bg-white shadow-sm rounded-lg border text-gray-500">
                            <svg width="24" height="24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="flex-none text-slate-300 dark:text-gray-500" aria-hidden="true">
                                <path d="m19 19-3.5-3.5"></path>
                                <circle cx="11" cy="11" r="6"></circle>
                            </svg><span class="flex-auto">Quick search...</span></button>
                    </div>
                    <div class="mt-4 sm:mt-0 sm:ml-16 sm:flex-none">
                        <button type="button" class="inline-flex items-center justify-center rounded-md border border-transparent px-4 py-2 text-sm font-medium text-white shadow-sm bg-gray-900">
                            Add Property
                        </button>
                    </div>
                </div>

                <div class=" flex flex-col w-full">
                    <div class="-my-2 -mx-4 overflow-x-auto sm:-mx-6 lg:-mx-8">
                        <div class="inline-block min-w-full py-2 align-middle md:px-6 lg:px-8">
                            <div class="overflow-hidden shadow ring-1 ring-black ring-opacity-5 md:rounded-lg w-full">
                                <table class="min-w-full divide-y divide-gray-300 w-full ">
                                    <thead class="w-full">
                                        <tr class="grid grid-cols-12 w-full">

                                            <th class="col-span-5 py-3.5 text-gray-900 text-left px-6 text-xs lg:text-base">
                                                Name
                                            </th>
                                            <th class="col-span-2 py-3.5 text-gray-900 text-left px-6 text-xs lg:text-base">
                                                Status
                                            </th>
                                            <th class="col-span-2 py-3.5 text-gray-900 text-left px-6 text-xs lg:text-base">
                                                Number of traps
                                            </th>
                                           
                                            <th class="col-span-3 py-3.5 text-gray-900 text-left px-6">

                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody v-if="loading" class="divide-y divide-gray-200 bg-white">
                                        <tr class="w-full grid grid-cols-12">
                                            <td class="col-span-12 py-3.5 text-gray-900 text-left px-6">
                                                <Icon :object="{title: 'preloader', class: 'h-8 w-8', stroke: '#000000'}" />
                                            </td>

                                        </tr>
                                    </tbody>
                                    <tbody v-else class="divide-y divide-gray-200 bg-white ">
                                        <tr v-for="(el, index) in items" v-bind:key="index" class="w-full grid grid-cols-12 text-xs lg:text-base">
                                            <td class="col-span-5 py-3.5 text-gray-900 text-left px-6">
                                                {{ el.town_or_suburb }}
                                            </td>
                                            <td class="col-span-2 py-3.5 text-gray-900 text-left px-6 text-xs lg:text-base">
                                                  <span v-if="el.traps.length < 50" class="p-1 rounded-full bg-green-600 h-8 w-8 flex items-center justify-center text-white">
                                                    <Icon :object="{title: 'check', class: 'h-5 w-5'}" />
                                                </span>
                                                <span v-else class="p-1 rounded-full bg-red-600 h-8 w-8 flex items-center justify-center text-white">
                                                    <Icon :object="{title: 'x', class: 'h-5 w-5'}" />
                                                </span>
                                            </td>
                                            <td class="col-span-2 py-3.5 text-gray-900 text-left px-6 text-xs lg:text-base">
                                                {{ el.traps.length }}
                                            </td>
                                            <td class="col-span-3 py-3.5 text-gray-900 px-6 grid grid-cols-1 lg:grid-cols-3 gap-x-2 text-xs lg:text-base">
                                                <nuxt-link :to="`/properties/${el.id}`" class="border px-2 py-1 rounded text-center hover:bg-gray-900 hover:text-white">View</nuxt-link>
                                                <button class="hidden lg:block border px-2 py-1 rounded hover:bg-gray-900 hover:text-white">Edit</button>
                                                <button class="hidden lg:block border px-2 py-1 rounded hover:bg-gray-900 hover:text-white">Delete</button>
                                            </td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        
        </main> 
         <Footer />
        
    </div>
   
</div>
</template>

<script>
import {
    store
} from "@/store/index.js"
export default {

    data() {
        return {
            items: [],
            loading: true
        }
    },
    computed: {
        menu() {
            return store.state.resource.menu
        }
    },

    methods: {
        manageSidebar(status) {
            store.commit('resource/set', {
                menu: status
            })
        },
        async init() {

            let res = await store.dispatch('resource/fetch', {
                type: 'properties'
            })

            this.items = res.data.data
            this.loading = false
        }
    },

    mounted() {
        this.init();
    }
}
</script>

<style>

</style>
