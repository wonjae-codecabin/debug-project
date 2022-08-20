<template>
<div>
    <Sidebar />
    <div class="h-screen ml-48 border z-50">

        <div class="py-5 px-24 rounded w-full barlow-bold text-2xl border-b bg-white rounded-tl-3xl uppercase ">
            <nuxt-link :to="`/properties`" class="text-gray-600">Properties</nuxt-link>
            <span> > </span>
            <span>{{ property.town_or_suburb}}</span>
        </div>

        <main class="px-24 py-10 bg-gray-50" style="min-height: 90vh;">

            <div>
                <div class="sm:flex sm:items-center mb-5">
                    <div class="sm:flex-auto">
                        <p class="mt-2 text-sm text-gray-700">
                            Lorem ipsum dolor sit amet consectetur, adipisicing elit. Recusandae necessitatibus a, natus velit reiciendis animi blanditiis tempore voluptate est ex soluta! In ipsam deleniti laboriosam magnam. Quaerat eum deserunt alias.
                        </p>
                    </div>
                    <div class="mt-4 sm:mt-0 sm:ml-16 sm:flex-none">
                        <button type="button" class="inline-flex items-center justify-center rounded-md border border-transparent px-4 py-2 text-sm font-medium text-white shadow-sm bg-gray-900">
                            Add Trap
                        </button>
                    </div>
                </div>

                <div class=" flex flex-col w-full">
                    <div class="-my-2 -mx-4 overflow-x-auto sm:-mx-6 lg:-mx-8">
                        <div class="inline-block min-w-full py-2 align-middle md:px-6 lg:px-8">
                            <div class="overflow-hidden shadow ring-1 ring-black ring-opacity-5 md:rounded-lg w-full">
                                <table class="min-w-full divide-y divide-gray-300 w-full">
                                    <thead class="w-full">
                                        <tr class="grid grid-cols-12 w-full">
                                            <th class="col-span-2 py-3.5 text-gray-900 text-left px-6">
                                                Trap Id
                                            </th>
                                            <th class="col-span-2 py-3.5 text-gray-900 text-left px-6">
                                                Status
                                            </th>
                                            <th class="col-span-5 py-3.5 text-gray-900 text-left px-6">
                                                Activity Date
                                            </th>
                                            <th class="col-span-3 py-3.5 text-gray-900 text-left px-6">
                                                
                                            </th>

                                        </tr>
                                    </thead>
                                     <tbody v-if="loading" class="divide-y divide-gray-200 bg-white">
                                        <tr class="w-full grid grid-cols-12">
                                            <td class="col-span-12 py-3.5 text-gray-900 text-left px-6">
                                               <Icon :object="{title: 'preloader', class: 'h-8 w-8', stroke: '#000000'}"/>
                                            </td>
                                            
                                        </tr>
                                    </tbody>
                                    <tbody v-else class="divide-y divide-gray-200 bg-white">
                                        <tr v-for="(trap, index) in property.traps" v-bind:key="index" class="w-full grid grid-cols-12">
                                            <td class="col-span-2 py-3.5 text-gray-900 text-left px-6">
                                                {{ trap.trap_site_id }}
                                            </td>
                                            <td class="col-span-2 py-3.5 text-gray-900 text-left px-6 flex">
                                                <span v-if="getTheLatestEntry(trap)[0].target_spp == 'Absent'" class="p-1 rounded-full bg-green-600 h-8 w-8 flex items-center justify-center text-white">
                                                    <Icon :object="{title: 'check', class: 'h-5 w-5'}" />
                                                </span>
                                                <span v-else class="p-1 rounded-full bg-red-600 h-8 w-8 flex items-center justify-center text-white">
                                                    <Icon :object="{title: 'x', class: 'h-5 w-5'}" />
                                                </span>
                                            </td>
                                             <td class="col-span-5 py-3.5 text-gray-900 text-left px-6">
                                                {{ getTheLatestEntry(trap)[0].activity_date}}
                                            </td>
                                            <td class="col-span-3 py-3.5 text-gray-900 px-6 grid grid-cols-3 gap-x-2">
                                                <button class="border px-2 py-1 rounded" @click="setActive(trap, getTheLatestEntry(trap)), showModal = true">View</button>
                                                <button class="border px-2 py-1 rounded">Edit</button>
                                                <button class="border px-2 py-1 rounded">Delete</button>
                                            </td>

                                        </tr>

                                        <!-- More people... -->
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </main>
    </div>
    <TrapModal v-show="showModal" @close="close" />
</div>
</template>

<script>
import {
    store
} from "@/store/index.js"
export default {

    data() {
        return {
            loading: true,
            showModal: false,
            property: {},
        }
    },

    methods: {
        async init() {
            //Get properties
            let res = await store.dispatch('resource/show', {
                type: 'property',
                id: this.$route.params.id
            })
            this.property = res.data.data
            this.loading = false
        },

        getTheLatestEntry(trap) {
            let allEntries = this.property.entries.filter(el => el.trap_id == trap.id)
            return allEntries
        },
        setActive(trap, entries){
            trap.entries = entries
           
            store.commit('resource/set', {
                activeObject: trap
            })
        },
        close(){
            this.showModal = false
        }
    },

    mounted() {
        this.init();
    }
}
</script>

<style>

</style>
