<template>
<div v-if="property != {}">
    <Sidebar v-if="generalAccess == false" />
    <div class="h-screen border z-50" :class="generalAccess == false ? 'lg:ml-48': ''">

        <div class="py-5 px-10 rounded w-full barlow-bold text-base lg:text-2xl border-b bg-white rounded-tl-3xl uppercase grid grid-cols-6 top-0">

            <span class="col-span-5 flex items-center grid grid-cols-1">
                <div>
                    <span v-if="generalAccess == false" @click="manageSidebar(true)" class="mr-5 lg:hidden " :class="`${menu == true ? 'block' : ''}`">
                        <Icon :object="{title: 'mobile-menu', class: 'h-5 w-5 text-black'}" />
                    </span>
                    <nuxt-link :to="`/properties`" v-if="generalAccess == false" class="text-gray-600">Properties</nuxt-link>
                    <span class="text-gray-600" v-else>Properties</span>
                    <span> > </span>
                    <span>{{ property.town_or_suburb}}</span>
                </div>

                <span class="text-xs text-gray-400 barlow-light">
                    This view provides details of all the traps deployed on a particular property and the activity status of each trap
                </span>
            </span>

            <button v-if="generalAccess == false" type="button" class="hidden lg:block col-span-1 group w-full bg-white rounded-md px-3.5 py-2 text-sm text-left font-medium text-gray-700 bg-white" x-ref="button">
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

        <main class="px-5 py-5 lg:px-24 lg:py-10 bg-gray-50" :class="`${generalAccess == false ? '' : 'px-2'}`" style="min-height: 90vh;">
            <div>
                <div class="sm:flex sm:items-center mb-5">
                    <div class="sm:flex-auto">
                        <button type="button" class="hidden sm:flex items-center w-6/12 text-left space-x-3 px-4 h-12 bg-white shadow-sm rounded-lg border text-gray-500">
                            <svg width="24" height="24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="flex-none text-slate-300 dark:text-gray-500" aria-hidden="true">
                                <path d="m19 19-3.5-3.5"></path>
                                <circle cx="11" cy="11" r="6"></circle>
                            </svg><span class="flex-auto">Quick search...</span></button>
                    </div>
                    <div v-if="generalAccess == false" class="mt-4 sm:mt-0 sm:ml-16 sm:flex-none">
                        <button type="button" class="inline-flex items-center justify-center rounded-md border border-transparent px-4 py-2 text-sm font-medium text-white shadow-sm bg-gray-900">
                            Add Trap
                        </button>
                    </div>
                </div>

                <div class=" flex flex-col w-full">
                    <div class="px-10 lg:px-0 -my-2 -mx-4 overflow-x-auto sm:-mx-6 lg:-mx-8">
                        <div class="inline-block min-w-full align-middle md:px-6 lg:px-8">
                            <div class="overflow-hidden shadow ring-1 ring-black ring-opacity-5 md:rounded-lg w-full">
                                <table class="min-w-full divide-y divide-gray-300 w-full">
                                    <thead class="w-full">
                                        <tr class="grid grid-cols-12 w-full">
                                            <th class="col-span-5 lg:col-span-2 py-3.5 text-gray-900 text-left px-6 text-xs sm:text-base">
                                                Trap Id
                                            </th>
                                            <th class="col-span-2 py-3.5 text-gray-900 text-center px-6 text-xs sm:text-base">
                                                Status
                                            </th>
                                            <th class="hidden lg:block col-span-3 py-3.5 text-gray-900 text-left px-6 text-xs sm:text-base">
                                                Activity Date
                                            </th>
                                            <th class="hidden lg:block col-span-2 py-3.5 text-gray-900 text-left px-6 text-xs sm:text-base">
                                                Corrective Action
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
                                    <tbody v-else class="divide-y divide-gray-200 bg-white">
                                        <tr v-for="(trap, index) in property.traps" v-bind:key="index" class="w-full grid grid-cols-12">
                                            <td class="col-span-5 col-span-2 py-3.5 text-gray-900 text-left px-6 text-xs sm:text-base">
                                                {{ trap.trap_site_id }}
                                            </td>
                                            <td class="col-span-2 py-3.5 text-gray-900 px-6 flex text-xs sm:text-base text-center w-full">
                                                <span v-if="getTheLatestEntry(trap)[0].target_spp == 'Absent'" class="p-1 rounded-full bg-green-600 h-5 w-5 flex items-center justify-center text-white">
                                                    <Icon :object="{title: 'check', class: 'h-5 w-5'}" />
                                                </span>
                                                <span v-else class="p-1 rounded-full bg-red-600 h-5 w-5 flex items-center justify-center text-white">
                                                    <Icon :object="{title: 'x', class: 'h-5 w-5'}" />
                                                </span>
                                            </td>
                                            <td class="hidden lg:block  col-span-3 py-3.5 text-gray-900 text-left px-6 text-xs sm:text-base">
                                                {{ getTheLatestEntry(trap)[0].activity_date}}
                                            </td>
                                            <td class="hidden lg:block col-span-2 py-3.5 text-gray-900 text-left px-6 text-xs sm:text-base">
                                                {{ getTheLatestEntry(trap)[0].corrective_action_msg != null ? 'Completed' : '' }}
                                            </td>
                                            <td class="col-span-5 lg:col-span-3 py-3.5 text-gray-900 px-6 grid grid-cols-1 lg:grid-cols-3 gap-x-2 text-xs sm:text-base">
                                                <button class="border px-2 py-1 rounded hover:bg-gray-900 hover:text-white" @click="setActive(trap, getTheLatestEntry(trap)), showModal = true">View</button>
                                                <button v-if="generalAccess == false" class="hidden lg:block border px-2 py-1 rounded hover:bg-gray-900 hover:text-white">Edit</button>
                                                <button v-if="generalAccess == false" class="hidden lg:block  border px-2 py-1 rounded hover:bg-gray-900 hover:text-white">Delete</button>
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
         <Footer />
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
            generalAccess: false
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
            //Get properties
            let res = await store.dispatch('resource/show', {
                type: 'property',
                id: this.$route.params.id
            })
            this.property = res.data.data

            console.log(res)
            console.log(this.property)
            this.loading = false
        },

        getTheLatestEntry(trap) {
            let allEntries = this.property.entries.filter(el => el.trap_id == trap.id)
            return allEntries
        },
        setActive(trap, entries) {
            trap.entries = entries

            store.commit('resource/set', {
                activeObject: trap
            })
        },
        close() {
            this.showModal = false
        }
    },

    mounted() {
        this.init();
        this.$route.query.generalAccess != undefined ? this.generalAccess = true : null
    }
}
</script>

<style>

</style>
