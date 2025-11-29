import { defineConfig } from 'astro/config';
import svelte from '@astrojs/svelte';
import { emitSignature } from './src/lib/sig.ts';

export default defineConfig({
  integrations: [svelte(), emitSignature()],
  site: 'https://example.com',
  output: 'static'
});
