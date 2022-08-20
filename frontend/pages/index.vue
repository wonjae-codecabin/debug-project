<template>
<div class="bg-gray-900 border-t">
    <Sidebar />
    <div class="h-screen ml-48  z-50 bg-gray-50">

        <div class="py-5 px-10 rounded w-full barlow-bold text-2xl border-b bg-white rounded-tl-3xl uppercase">
            Dashboard
        </div>

        <main class="px-10 py-10 bg-gray-50" style="min-height: 90vh;">

            <div>
                <div class="sm:flex sm:items-center mb-5">
                    <div class="sm:flex-auto">

                        <p class="mt-2 text-sm text-gray-700">A list of all the users in your account including their name, title, email and role.</p>
                    </div>
                   
                </div>

                <div class="grid grid-cols-6 gap-x-2">
                     <div class="col-span-4 bg-white border rounded-xl p-1">
                         <DashboardChart />
                    </div>

                    <div class="col-span-2 bg-white border rounded-xl p-3">
                       <DashboardAlert />
                    </div>
                </div>

                <div class="grid grid-cols-6 gap-x-2 mt-10">
                     <div class="col-span-6 bg-white border rounded-xl p-3">
                         <DashboardStats/>
                    </div>
                </div>

                <div class="grid grid-cols-6 gap-x-2 mt-10">
                     <div class="col-span-6 bg-white border rounded-xl p-3">
                         <DashboardCorrectiveAction />
                    </div>
                </div>
                
            </div>

        </main>
    </div>
</div>
</template>

<script>
import DashboardStats from '../components/DashboardStats.vue'
export default {
  components: { DashboardStats },

}
</script>

<style>

</style>
