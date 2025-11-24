export type DeployRecord = {
  ts: string;
  msg: string;
  source?: string;
};

export type BeaconRecord = {
  ts: string;
  env: string;
  status: string;
  note?: string;
};

type DeployFile = DeployRecord[];
type BeaconFile = BeaconRecord[];

const deployImports = import.meta.glob('../../data/deploys/*.json', {
  eager: true,
  import: 'default'
}) as Record<string, DeployFile>;

const beaconImports = import.meta.glob('../../data/beacons/*.json', {
  eager: true,
  import: 'default'
}) as Record<string, BeaconFile>;

function flatten<T extends { ts: string }>(files: Record<string, T[]>): T[] {
  return Object.values(files)
    .flat()
    .sort((a, b) => new Date(b.ts).getTime() - new Date(a.ts).getTime());
}

export function getDeploys(): DeployRecord[] {
  return flatten(deployImports);
}

export function getBeacons(): BeaconRecord[] {
  return flatten(beaconImports);
}

export function getDeploysByDate(date: string): DeployRecord[] {
  return getDeploys().filter((deploy) => deploy.ts.startsWith(date));
}

export function getBeaconsByDate(date: string): BeaconRecord[] {
  return getBeacons().filter((beacon) => beacon.ts.startsWith(date));
}

// TODO(archive-next): expose helpers for compressed bundle reads
