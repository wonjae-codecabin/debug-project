<template>
<div>
    <Sidebar />
    <div class="h-screen ml-48 border-t z-50">

        <div class="py-5 px-10 rounded w-full barlow-bold text-2xl border-b bg-white rounded-tl-3xl uppercase">
            Properties
        </div>

        <main class="px-10 py-10 bg-gray-50" style="min-height: 90vh;">

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
                                <table class="min-w-full divide-y divide-gray-300 w-full">
                                    <thead class="w-full">
                                        <tr class="grid grid-cols-12 w-full">

                                            <th class="col-span-9 py-3.5 text-gray-900 text-left px-6">
                                                Name
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
                                        <tr v-for="(el, index) in items" v-bind:key="index" class="w-full grid grid-cols-12">
                                            <td class="col-span-9 py-3.5 text-gray-900 text-left px-6">
                                                {{ el.town_or_suburb }}
                                            </td>
                                            <td class="col-span-3 py-3.5 text-gray-900 px-6 grid grid-cols-3 gap-x-2">
                                                <nuxt-link :to="`/properties/${el.id}`" class="border px-2 py-1 rounded text-center">View</nuxt-link>
                                                <button class="border px-2 py-1 rounded">Edit</button>
                                                <button class="border px-2 py-1 rounded">Delete</button>
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

    methods: {
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
