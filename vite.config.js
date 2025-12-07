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
        'remove-exif': resolve(__dirname, 'remove-exif.html'),
        resizer: resolve(__dirname, 'resizer.html'),
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
