import fs from "fs";
import path from "path";
import yaml from "js-yaml";
import { scanGithubRepos } from "./scan_github_repos";

type RepoRecord = {
  id: string;
  full_name: string;
  org: string;
  description: string;
  visibility: "public" | "private";
  status: "active" | "archived" | "experimental" | "legacy";
  primary_domain: string | null;
  home_pack: string;
  created_at: string;
  updated_at: string;
  tags: string[];
  owner_handles: string[];
};

type Catalog = { repos: RepoRecord[] };

function loadLocalCatalog(catalogPath: string): Catalog {
  if (!fs.existsSync(catalogPath)) {
    throw new Error(`Catalog not found at ${catalogPath}`);
  }
  const raw = fs.readFileSync(catalogPath, "utf8");
  const parsed = yaml.load(raw) as Catalog;
  return parsed;
}

function mergeRepo(local: RepoRecord, remote: RepoRecord): RepoRecord {
  return {
    ...local,
    description: remote.description || local.description,
    visibility: remote.visibility,
    created_at: remote.created_at || local.created_at,
    updated_at: remote.updated_at || local.updated_at
  };
}

function normalizeRepo(repo: RepoRecord): RepoRecord {
  return {
    ...repo,
    tags: repo.tags || [],
    owner_handles: repo.owner_handles || []
  };
}

function writeCatalog(catalogPath: string, catalog: Catalog) {
  const sorted = [...catalog.repos].sort((a, b) => a.id.localeCompare(b.id));
  const payload: Catalog = { repos: sorted.map(normalizeRepo) };
  const yamlOutput = yaml.dump(payload, { lineWidth: 120 });
  fs.writeFileSync(catalogPath, yamlOutput);
}

async function main() {
  try {
    const catalogPath = path.join(process.cwd(), "catalog", "repos.yaml");
    const localCatalog = loadLocalCatalog(catalogPath);
    const remoteRepos = await scanGithubRepos();

    const mergedMap = new Map<string, RepoRecord>();

    // Seed with local entries
    for (const repo of localCatalog.repos) {
      mergedMap.set(repo.full_name, repo);
    }

    // Merge remote updates
    for (const repo of remoteRepos) {
      const existing = mergedMap.get(repo.full_name);
      if (existing) {
        mergedMap.set(repo.full_name, mergeRepo(existing, repo));
      } else {
        mergedMap.set(repo.full_name, {
          ...repo,
          status: "active",
          primary_domain: null,
          home_pack: "tbd",
          tags: [],
          owner_handles: []
        });
      }
    }

    writeCatalog(catalogPath, { repos: Array.from(mergedMap.values()) });
    console.log(`Catalog refreshed with ${mergedMap.size} entries.`);
  } catch (error) {
    console.error((error as Error).message);
    process.exit(1);
  }
}

if (require.main === module) {
  main();
}
