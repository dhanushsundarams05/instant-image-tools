import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import { resolve } from 'path';

export default defineConfig({
  base: '/',
  plugins: [react()],
  build: {
    rollupOptions: {
      input: {
        main: resolve(__dirname, 'index.html'),
        compressor: resolve(__dirname, 'compressor.html'),
        'heic-to-jpg': resolve(__dirname, 'heic-to-jpg.html'),
        'jpg-to-png': resolve(__dirname, 'jpg-to-png.html'),
        'png-to-jpg': resolve(__dirname, 'png-to-jpg.html'),
        'jpg-to-webp': resolve(__dirname, 'jpg-to-webp.html'),
        'remove-exif': resolve(__dirname, 'remove-exif.html'),
        resizer: resolve(__dirname, 'resizer.html'),
        about: resolve(__dirname, 'about.html'),
        contact: resolve(__dirname, 'contact.html'),
        privacy: resolve(__dirname, 'privacy.html'),
        terms: resolve(__dirname, 'terms.html'),
        disclaimer: resolve(__dirname, 'disclaimer.html'),
        404: resolve(__dirname, '404.html'),
      },
    },
    chunkSizeWarningLimit: 600,
    minify: 'esbuild',
  },
  server: {
    port: 3000,
  },
});