<template>
<div class="px-4 sm:px-6 lg:px-8">
  <div class="sm:flex sm:items-center">
    <div class="sm:flex-auto">
      <h1 class="text-xl font-semibold text-gray-900">Corrective Actions</h1>
      <p class="mt-2 text-sm text-gray-700">A list of all the users in your account including their name, title, email and role.</p>
    </div>
  
  </div>
  <div class="mt-8 flex flex-col">
    <div class="-my-2 -mx-4 overflow-x-auto sm:-mx-6 lg:-mx-8">
      <div class="inline-block min-w-full py-2 align-middle md:px-6 lg:px-8">
        <div class="overflow-hidden shadow ring-1 ring-black ring-opacity-5 md:rounded-lg">
          <table class="min-w-full divide-y divide-gray-300">
            <thead class="bg-gray-50">
              <tr>
                <th scope="col" class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900 sm:pl-6">Name</th>
                <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Action</th>
                <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Status</th>
          
                <th scope="col" class="relative py-3.5 pl-3 pr-4 sm:pr-6">
                  <span class="sr-only"></span>
                </th>
              </tr>
            </thead>
            <tbody class="divide-y divide-gray-200 bg-white">
              <tr v-for="(el, index) in users" v-bind:key="index">
                <td class="whitespace-nowrap py-4 pl-4 pr-3 text-sm sm:pl-6">
                  <div class="flex items-center">
                    <div class="h-10 w-10 flex-shrink-0">
                      <img class="h-10 w-10 rounded-full" :src="`https://source.unsplash.com/random/?property-${index}`" alt="">
                    </div>
                    <div class="ml-4">
                      <div class="font-medium text-gray-900">
                          {{ el.name}}
                      </div>
                      <div class="text-gray-500">
                          {{ el.email}}
                      </div>
                    </div>
                  </div>
                </td>
                <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                  <div class="text-gray-900">
                      {{ el.msg }}
                  </div>
        
                </td>
                <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                  <span class="inline-flex rounded-full bg-green-100 px-2 text-xs font-semibold leading-5 text-green-800">Submitted</span>
                </td>
       
                <td class="relative whitespace-nowrap py-4 pl-3 pr-4 text-right text-sm font-medium sm:pr-6">
                  <a href="#" class=" hover:text-indigo-900">View</a>
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

</template>

<script>
export default {
    data(){
        return{
            users: [
                {
                    name: "Lindsay Walton",
                    email: "lindsay.walton@example.com",
                    msg: " Corrective Action is submitted",
                    status: "Submitted",
                },
                {
                    name: "Josh Smith",
                    email: "lindsay.walton@example.com",
                    msg: " Corrective Action is submitted",
                    status: "Submitted",
                },
                 {
                    name: "Josh Smith",
                    email: "lindsay.walton@example.com",
                    msg: " Corrective Action is submitted",
                    status: "Submitted",
                },
                 {
                    name: "Josh Smith",
                    email: "lindsay.walton@example.com",
                    msg: " Corrective Action is submitted",
                    status: "Submitted",
                },
                 {
                    name: "Josh Smith",
                    email: "lindsay.walton@example.com",
                    msg: " Corrective Action is submitted",
                    status: "Submitted",
                }
            ]
        }
    }
}
</script>

<style>

</style>