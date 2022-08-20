<template>
<div>
  <ul role="list" class="divide-y divide-gray-200">
    <li class="py-4" v-for="(alert, index) in alerts" v-bind:key="index">
      <div class="flex space-x-3">
        <img class="h-6 w-6 rounded-full" :src="`https://source.unsplash.com/random/?property-${index}`">
        <div class="flex-1 space-y-1">
          <div class="flex items-center justify-between">
            <h3 class="text-sm font-medium">
                {{ alert.name}}
            </h3>
            <p class="text-sm text-gray-500">
                {{ alert.when}}
            </p>
          </div>
          <p class="text-sm text-gray-500">
              {{ alert.message}}
          </p>
        </div>
      </div>
    </li>

  </ul>
</div>

</template>

<script>
export default {
    data(){
        return{
            alerts:[
                {name: "RENMARK SOUTH", message: "Fruit fly alert text message has been sent", when: '1h'},
                {name: "RENMARK",  message: "Fruit fly alert text message has been sent", when: '3h'},
                {name: "Crescent",  message: "Fruit fly alert text message has been sent", when: '5h'},
                {name: "KESWICK",  message: "Fruit fly alert text message has been sent", when: '7hr'},
            ]
        }
    }
}
</script>

<style>

</style>