import { writeFile } from 'node:fs/promises';
import { fileURLToPath } from 'node:url';
import { dirname, resolve } from 'node:path';

const currentDir = dirname(fileURLToPath(import.meta.url));

export async function writeSignature() {
  const payload = {
    ts: new Date().toISOString(),
    agent: 'Archive-Gen-0'
  };
  const target = resolve(currentDir, '../../public/sig.beacon.json');
  await writeFile(target, JSON.stringify(payload, null, 2));
}

export function emitSignature() {
  return {
    name: 'archive-signature',
    hooks: {
      'astro:build:done': async () => {
        await writeSignature();
        // TODO(archive-next): mirror signature to IPFS
      }
    }
  } as const;
}
