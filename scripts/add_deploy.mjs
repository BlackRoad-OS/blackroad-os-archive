#!/usr/bin/env node
import { readFile, writeFile, mkdir } from 'node:fs/promises';
import { resolve } from 'node:path';

const args = Object.fromEntries(
  process.argv.slice(2).map((arg) => {
    const [key, ...rest] = arg.replace(/^--/, '').split('=');
    return [key, rest.join('=') || ''];
  })
);

const message = args.msg || args.message;
if (!message) {
  console.error('Usage: pnpm add:deploy --msg "Deploy message"');
  process.exit(1);
}

const now = new Date();
const isoDate = now.toISOString();
const dateSlug = isoDate.slice(0, 10);
const targetPath = resolve('data/deploys', `${dateSlug}.json`);

async function appendDeploy() {
  await mkdir(resolve('data/deploys'), { recursive: true });

  let existing = [];
  try {
    const raw = await readFile(targetPath, 'utf-8');
    existing = JSON.parse(raw);
  } catch (err) {
    if ((err).code !== 'ENOENT') throw err;
  }

  const record = {
    ts: isoDate,
    msg: message,
    source: 'cli'
  };

  await writeFile(targetPath, JSON.stringify([...existing, record], null, 2));
  console.log(`Appended deploy to ${targetPath}`);
}

appendDeploy();
