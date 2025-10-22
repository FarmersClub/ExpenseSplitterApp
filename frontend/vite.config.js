import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import tailwindcss from '@tailwindcss/vite'

// https://vite.dev/config/
export default defineConfig({
  plugins: [
    react(),
    tailwindcss(),
  ],
  server: {
    host: '0.0.0.0',   // expose dev server to host machine
    watch: {
      usePolling: true, // enable Docker-friendly file watching
      interval: 100,    // (optional) tweak polling frequency
    },
  },
})
