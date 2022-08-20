<template>
<div class="h-screen fixed flxed">
    <div class="h-screen bg-gray-900 w-48 z-10 fixed">
        <div class="h-24 flex items-center w-full justify-center">
            <!-- Logo -->
            <img src="https://res.cloudinary.com/dxmgdmeup/image/upload/v1660980021/imageedit_1_4973873735_rawwzy.png" class="w-32" />
        </div>
        <div class="w-full text-base px-3 cursor-pointer">
            <nuxt-link :to="`/`" class="flex w-full gap-x-3 items-center">
                <span>
                    <Icon :object="{title:'chart', class: 'h-5 w-5 text-white'}" />
                </span>
                <span class="text-white">
                    Dashboard
                </span>
            </nuxt-link>
        </div>
        <div class="w-full text-base pt-5 px-3 cursor-pointer">
            <nuxt-link :to="`/properties`" class="flex w-full gap-x-3 items-center">
                <span>
                    <Icon :object="{title:'clipboard-check', class: 'h-5 w-5 text-white'}" />
                </span>
                <span class="text-white">
                    Properties
                </span>
            </nuxt-link>
        </div>

    </div>

</div>
</template>

<script>
export default {

}
</script>

<style>

</style>
