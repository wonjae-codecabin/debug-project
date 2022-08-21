<template>
<!-- This example requires Tailwind CSS v2.0+ -->
<div class="relative z-50" aria-labelledby="modal-title" role="dialog" aria-modal="true">

    <div class="fixed inset-0 bg-gray-900 bg-opacity-75 transition-opacity"></div>

    <div class="fixed z-10 inset-0 overflow-y-auto">
        <div class="flex items-center sm:items-center justify-center min-h-full p-4 text-center sm:p-0">

            <div class="relative bg-white rounded-lg text-left overflow-hidden shadow-xl transform transition-all w-full lg:w-8/12">
                <div>
                    <div class="grid grid-cols-5 w-full">
                        <div v-if="step == 0" class="col-span-4 px-5 py-3 barlow-bold text-2xl">
                            {{ activeObject.trap_site_id }}
                        </div>
                        <div v-else class="col-span-4 px-5 py-3 barlow-bold text-2xl">
                            <span @click="step = 0" class="text-gray-400 hover:text-gray-800 cursor-pointer">{{ activeObject.trap_site_id }}</span>
                            <span class="text-gray-400">></span>
                            <span>{{ activeEntry.unique_identifier}}</span>
                        </div>

                        <div class="col-span-1 flex justify-end border-b px-5 py-3 grid">
                            <button @click="close">
                                <Icon :object="{title:'x', class: 'h-8 w-8 text-black'}" />
                            </button>
                        </div>
                    </div>

                    <!-- List Entries -->
                    <div v-if="step == 0" class="text-center bg-gray-100 px-2 lg:px-10 py-5 grid grid-cols-1">
                        <div class="border rounded-xl col-span-2 rounded-lg bg-white ">
                            <div class="overflow-y-scroll border rounded-lg">
                                <table class="min-w-full divide-y divide-gray-300 w-full">
                                    <thead class="w-full">
                                        <tr class="grid grid-cols-12 w-full border-t">
                                            <th class="col-span-2 py-3.5 text-gray-900 text-left px-6 text-xs lg:text-base">
                                                Status
                                            </th>
                                            <th class="col-span-5 lg:col-span-3 py-3.5 text-gray-900 text-left px-6 text-xs lg:text-base">
                                                Activity Date
                                            </th>
                                            <th class="hidden lg:block col-span-4 py-3.5 text-gray-900 text-left px-6 text-xs lg:text-base">
                                                Unique Identifier
                                            </th>
                                            <th class="col-span-3 py-3.5 text-gray-900 text-left px-6 text-xs lg:text-base">

                                            </th>
                                        </tr>
                                    </thead>

                                    <tbody class="divide-y divide-gray-200 bg-white">
                                        <tr v-for="(entry, index) in activeObject.entries" v-bind:key="index" class="w-full grid grid-cols-12">
                                            <td class="col-span-2 py-3.5 text-gray-900 text-left px-6 flex items-center">
                                                <span v-if="entry.target_spp == 'Absent'" class="p-1 rounded-full bg-green-600 h-5 w-5 flex items-center justify-center text-white">
                                                    <Icon :object="{title: 'check', class: 'h-5 w-5'}" />
                                                </span>
                                                <span v-else class="p-1 rounded-full bg-red-600 h-5 w-5 flex items-center justify-center text-white">
                                                    <Icon :object="{title: 'x', class: 'h-5 w-5'}" />
                                                </span>
                                            </td>
                                            <td class="col-span-5 lg:col-span-3 py-3.5 text-gray-900 text-left px-6 flex text-xs lg:text-base items-center flex">
                                                {{ entry.activity_date }}
                                            </td>
                                            <td class="hidden lg:block col-span-4 py-3.5 text-gray-900 text-left px-6 text-xs lg:text-base flex items-center">
                                                {{ entry.unique_identifier}}
                                            </td>
                                            <td class="col-span-4 lg:col-span-3 py-3.5 text-gray-900 text-xs lg:text-base">
                                                <button v-if="entry.target_spp == 'Present'" @click="setActiveEntry(entry), step = 1" class="border px-3 rounded py-2 bg-gray-900 text-white text-xs lg:text-base">
                                                    Corrective Action
                                                </button>
                                                <button v-else class="border px-3 rounded py-2 bg-gray-200 text-gray-400 border text-xs lg:text-base">
                                                    Corrective Action
                                                </button>
                                            </td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </div>
                    <div v-else class="bg-gray-100 px-2 lg:px-10 py-5 grid grid-cols-1">

                        <div class="border rounded-xl col-span-2 rounded-lg bg-white">
                            <div class="overflow-y-scroll border rounded-lg px-10 py-5">
                                <div class="w-full grid grid-cols-1">
                                    <button class="flex items-center gap-x-2 mb-5 text-gray-400" @click="step = 0">
                                        <Icon :object="{title:'left', class: 'h-5 w-5 text-gray-400'}" /> 
                                         Go back
                                    </button>
                                    <span class="text-lg barlow-bold">
                                         Corrective Action
                                    </span>
                                </div>
                                <div class="mt-1 text-sm text-gray-500 text-black w-full">

                                    <span class="text-red-600 barlow-medium">
                                        Suggestion:
                                    </span> As a land owner in South Australia you have a responsibility to take appropriate and prompt action regarding any identified fruit fly activity on your property. Please ensure the below correct action report is complete within 12 hours of receipt, to notify Government Departments of your actions.

                                </div>
                                <div class="space-y-8 divide-y divide-gray-200">
                                    <div>
                                        <div class="mt-6 sm:mt-5 space-y-6 sm:space-y-5">
                                            <div class="sm:grid sm:grid-cols-3 sm:gap-4 sm:items-start sm:border-t sm:border-gray-200 sm:pt-5">
                                                <label for="about" class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">
                                                    Date
                                                </label>
                                                <div class="mt-1 sm:mt-0 sm:col-span-2">
                                                    <input type="date" v-model="createObject.corrective_action_date" class="px-3 py-2 shadow-sm block w-full  sm:text-sm border border-gray-300 rounded-md" />
                                                    <p class="mt-2 text-sm text-gray-500">Date of your corrective action</p>
                                                </div>
                                            </div>

                                            <div class="sm:grid sm:grid-cols-3 sm:gap-4 sm:items-start sm:border-t sm:border-gray-200 sm:pt-5">
                                                <label for="about" class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">Action</label>
                                                <div class="mt-1 sm:mt-0 sm:col-span-2">
                                                    <textarea id="about" name="about" v-model="createObject.corrective_action_msg" rows="5" class="max-w-lg p-2 shadow-sm block w-full sm:text-sm border border-gray-300 rounded-md">
                                                        
                                                    </textarea>
                                                    <p class="mt-2 text-sm text-gray-500">Write a few sentences about the action.</p>
                                                </div>
                                            </div>

                                            <div class="sm:grid sm:grid-cols-3 sm:gap-4 sm:items-start sm:border-t sm:border-gray-200 sm:pt-5">
                                                <label for="cover-photo" class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">Photo</label>
                                                <div class="mt-1 sm:mt-0 sm:col-span-2">
                                                    <div class="max-w-lg flex justify-center px-6 pt-5 pb-6 border-2 border-gray-300 border-dashed rounded-md">
                                                        <div class="space-y-1 text-center">

                                                            <a v-if="createObject.corrective_action_img != ''" :href="`${createObject.corrective_action_img}`" target="_blank" class="cursor-pointer h-24 w-24 bg-black border">
                                                              <img :src="createObject.corrective_action_img" class="h-24 w-24 object-contain" /> 
                                                            </a>
                                                            <svg v-else class="mx-auto h-12 w-12 text-gray-400" stroke="currentColor" fill="none" viewBox="0 0 48 48" aria-hidden="true">
                                                                <path d="M28 8H12a4 4 0 00-4 4v20m32-12v8m0 0v8a4 4 0 01-4 4H12a4 4 0 01-4-4v-4m32-4l-3.172-3.172a4 4 0 00-5.656 0L28 28M8 32l9.172-9.172a4 4 0 015.656 0L28 28m0 0l4 4m4-24h8m-4-4v8m-12 4h.02" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                                                            </svg>


                                                            <div class="text-sm text-gray-600 text-center w-full">
                                                                <label for="file-upload" class="relative cursor-pointer bg-white rounded-md font-medium barlow-medium">
                                                                    <span>
                                                                        {{ file_name}}
                                                                    </span>
                                              
                                                                    <input id="file-upload" name="file-upload" type="file" class="sr-only" @change="setFile">
                                                                </label>

                                                            </div>
                                                            <!-- <p class="text-xs text-gray-500">PNG, JPG, GIF up to 10MB</p> -->
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="pt-5">
                                    <div class="flex justify-end">
                                         <button v-if="submiting" class="ml-3 inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white  bg-gray-900 text-white">
                                              <Icon :object="{title:'preloader', class: 'h-5 w-5', stroke: '#ffffff'}" /> 
                                        </button>
                                        <button v-else @click="submit" class="ml-3 inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white  bg-gray-900 text-white">
                                            Submit
                                        </button>
                                    </div>
                                </div>

                                <!-- {{ activeEntry }} -->
                            </div>
                        </div>

                    </div>
                </div>
                <div class="mt-5 sm:mt-6">

                </div>
            </div>
        </div>
    </div>
</div>
</template>

<script>
import {
    store
} from "@/store/index.js"
export default {
    computed: {
        activeObject() {
            return store.state.resource.activeObject
        },
    },
    data() {
        return {
            step: 0,
            activeEntry: {
                corrective_action_msg: '',
                corrective_action_date: '',
                corrective_action_image: ''
            },
            file_name: "Upload a file",
            submiting: false,
            createObject:{
                id: store.state.resource.activeObject.id,
                corrective_action_msg: "",
                corrective_action_date: "",
                corrective_action_img: "",
                corrective_action_img_file: ""
            }
        }
    },
    methods: {
        manageStep(step) {
            this.step = step
        },
        setActiveEntry(entry){
            this.activeEntry = entry
            this.createObject.corrective_action_msg = entry.corrective_action_msg
            this.createObject.corrective_action_date = entry.corrective_action_date
            this.createObject.corrective_action_img = entry.corrective_action_image

            console.log(this.createObject)
            console.log(entry)
        },
        setFile(e){
            this.createObject.corrective_action_img_file = e.target.files[0]
            this.file_name = e.target.files[0].name
            console.log(this.file_name)
        },
        submit(){
            this.submiting = true;
            let params = new FormData
            params.append('id', this.createObject.id)
            params.append('corrective_action_msg', this.createObject.corrective_action_msg)
            params.append('corrective_action_date', this.createObject.corrective_action_date)
            params.append('corrective_action_img_file', this.createObject.corrective_action_img_file)
            params.append('type', 'entry')
            params.append('property_id', this.$route.params.id)
            
            params.append('api_token', `${process.env.VUE_APP_API_TOKEN}`)

   
            store.dispatch('resource/update', params)

            this.submiting = false;
            alert('The corrective action has been updated successfully')
        },
        close() {
            this.$emit('close');
        }
    }
}
</script>

<style>

</style>
