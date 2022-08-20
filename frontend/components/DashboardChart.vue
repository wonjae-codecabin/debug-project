<template>
<client-only>
    <component :is="apexchart" height="300px" width="100%" :options="options" :series="series" />
</client-only>
</template>

<script>
export default {
    props: {
     
    },
    data() {
        return {
            options: {
                title: {
                    text: "Weekly Chart"
                },
                theme: {
                    monochrome: {
                        enabled: true,
                        // color: '#111827',
                    },
                },
                chart: {
                    toolbar: {
                        show: false
                    },
                    zoom: {
                        enabled: false
                    },
                    type: 'area'
                },
                dataLabels: {
                    enabled: false
                },
                yaxis: {
                    title: {
                        text: 'Number of fruit flies',
                        offsetY: 20,
                    },
                },
                tooltip: {
                    enabled: false
                },
                xaxis: {
                    categories: [
                        '15 Aug',
                        '16 Aug',
                        '17 Aug',
                        '18 Aug',
                        '19 Aug',
                        '20 Aug',
                        '21 Aug'
                    ]
                },

            },
            series: [{
                name: 'Adelaide',
                data: [
                    0,0,4,2,0,3,5
                ]
            },
            {
                name: 'North Adelaide',
                data: [
                    3,1,6,0,0,3,5
                ]
            },
            {
                name: 'Mt Gambier',
                data: [
                    1,4,2,4,4,0,0
                ]
            }
            ]
        }
    },
    computed: {
        apexchart() {
            return () => {
                if (process.client) {
                    return import('vue-apexcharts')
                }
            }
        }
    },



}
</script>

<style>

</style>
