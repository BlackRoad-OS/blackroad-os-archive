#!/usr/bin/env node
import { readFile, writeFile, mkdir } from 'node:fs/promises';
import { resolve } from 'node:path';

const args = Object.fromEntries(
  process.argv.slice(2).map((arg) => {
    const [key, ...rest] = arg.replace(/^--/, '').split('=');
    return [key, rest.join('=') || ''];
  })
);

const env = args.env;
const status = args.status;
const note = args.note || '';

if (!env || !status) {
  console.error('Usage: pnpm add:beacon --env ENV --status STATUS [--note "..." ]');
  process.exit(1);
}

const now = new Date();
const isoDate = now.toISOString();
const dateSlug = isoDate.slice(0, 10);
const targetPath = resolve('data/beacons', `${dateSlug}.json`);

async function appendBeacon() {
  await mkdir(resolve('data/beacons'), { recursive: true });

  let existing = [];
  try {
    const raw = await readFile(targetPath, 'utf-8');
    existing = JSON.parse(raw);
  } catch (err) {
    if ((err).code !== 'ENOENT') throw err;
  }

  const record = {
    ts: isoDate,
    env,
    status,
    ...(note ? { note } : {})
  };

  await writeFile(targetPath, JSON.stringify([...existing, record], null, 2));
  console.log(`Appended beacon to ${targetPath}`);
}

appendBeacon();
