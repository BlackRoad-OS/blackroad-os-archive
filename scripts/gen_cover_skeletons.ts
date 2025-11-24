import fs from "fs";
import path from "path";
import yaml from "js-yaml";

type RepoRecord = {
  id: string;
  full_name: string;
  status: string;
};

type Catalog = { repos: RepoRecord[] };

function loadCatalog(catalogPath: string): Catalog {
  const raw = fs.readFileSync(catalogPath, "utf8");
  return yaml.load(raw) as Catalog;
}

function coverPathForRepo(repoName: string): string {
  return path.join(process.cwd(), "covers", `${repoName}.cover.md`);
}

function formatTitle(repoName: string): string {
  const words = repoName.replace(/[-_]/g, " ")
    .replace(/\bos\b/i, "OS")
    .split(" ")
    .map((word) => word.charAt(0).toUpperCase() + word.slice(1));
  return words.join(" ");
}

function createSkeleton(repoName: string, status: string): string {
  const title = formatTitle(repoName);
  return `---
id: ${repoName}
title: ${title}
type: repo
status: ${status}
timeframe: 2025-
primary_repo: ${repoName}
linked_repos: []
summary: TODO
why_it_matters: TODO
risk_if_lost: TODO
recommended_action: keep-live
---

# ${title} – Archive Cover Sheet

## Narrative
TODO

## History
TODO

## Current Role
TODO

## Dependencies
TODO

## Migration / Future
TODO
`;
}

function ensureCover(repo: RepoRecord) {
  const repoName = repo.full_name.split("/")[1];
  const destination = coverPathForRepo(repoName);
  if (fs.existsSync(destination)) {
    return;
  }
  const skeleton = createSkeleton(repoName, repo.status ?? "active");
  fs.writeFileSync(destination, skeleton);
  console.log(`Generated cover skeleton for ${repoName}`);
}

function main() {
  const catalogPath = path.join(process.cwd(), "catalog", "repos.yaml");
  if (!fs.existsSync(catalogPath)) {
    throw new Error("catalog/repos.yaml not found");
  }
  const catalog = loadCatalog(catalogPath);
  catalog.repos.forEach((repo) => ensureCover(repo));
}

if (require.main === module) {
  main();
}
