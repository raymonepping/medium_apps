export default defineNuxtConfig({
  ssr: false,
  runtimeConfig: {
    public: {
      apiBase: process.env.API_BASE_URL || 'http://localhost:4000'
    }
  }
})
