export default {
  // Global page headers: https://go.nuxtjs.dev/config-head
  head: {
    title: 'frontend',
    htmlAttrs: {
      lang: 'en'
    },
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: '' },
      { name: 'format-detection', content: 'telephone=no' }
    ],
    link: [
      { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }
    ]
  },

  // Global CSS: https://go.nuxtjs.dev/config-css
  css: [
    '~/assets/css/custom.css',
    '~/assets/css/font.css',
  ],
  generate: {
    fallback: true
  },
  // Plugins to run before rendering page: https://go.nuxtjs.dev/config-plugins
  plugins: [
    { src: '~/plugins/vuex-persist.js', mode: "client" },
    { src : '~/plugins/vue-apexchart.js', mode : "client" }
  ],

  // Auto import components: https://go.nuxtjs.dev/config-components
  components: true,

  // Modules for dev and build (recommended): https://go.nuxtjs.dev/config-modules
  buildModules: [
    // https://go.nuxtjs.dev/tailwindcss
    '@nuxtjs/tailwindcss',
  ],

  // Modules: https://go.nuxtjs.dev/config-modules
  modules: [
  ],
  env: {
    VUE_APP_API_TOKEN: "9c971cf2-4c4a-46bb-a298-41859e419c06",
    VUE_APP_API_URL: "https://api.debugsa.info",
    // VUE_APP_API_URL: "http://localhost:3001",
  },
  // Build Configuration: https://go.nuxtjs.dev/config-build
  build: {
  },
}
