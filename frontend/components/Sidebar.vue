<template>
<div class="h-screen fixed flxed">
    <div class="h-screen bg-white w-48 z-10 fixed border-r">
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

    </div>

</div>
</template>

<script>
export default {

}
</script>

<style>

</style>
