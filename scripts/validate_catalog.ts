import fs from "fs";
import path from "path";
import matter from "gray-matter";
import yaml from "js-yaml";
import Ajv from "ajv";
import addFormats from "ajv-formats";

type RepoRecord = {
  id: string;
  full_name: string;
  status: "active" | "archived" | "experimental" | "legacy";
};

type Catalog = { repos: RepoRecord[] };

type CoverValidation = {
  file: string;
  valid: boolean;
  errors?: string;
};

function loadSchema(schemaPath: string) {
  const raw = fs.readFileSync(schemaPath, "utf8");
  return JSON.parse(raw);
}

function loadCatalog(catalogPath: string): Catalog {
  const raw = fs.readFileSync(catalogPath, "utf8");
  return yaml.load(raw) as Catalog;
}

function validateCatalog(catalog: Catalog, schema: any, ajv: Ajv): boolean {
  const validate = ajv.compile(schema);
  const valid = validate(catalog);
  if (!valid) {
    console.error("Catalog validation errors:", validate.errors);
  }
  return Boolean(valid);
}

function listCoverFiles(coversDir: string): string[] {
  if (!fs.existsSync(coversDir)) return [];
  return fs.readdirSync(coversDir).filter((file) => file.endsWith(".cover.md"));
}

function validateCover(filePath: string, schema: any, ajv: Ajv): CoverValidation {
  const raw = fs.readFileSync(filePath, "utf8");
  const parsed = matter(raw);
  const validate = ajv.compile(schema);
  const valid = validate(parsed.data);
  return {
    file: path.basename(filePath),
    valid: Boolean(valid),
    errors: valid ? undefined : JSON.stringify(validate.errors, null, 2)
  };
}

function summarizeRepos(repos: RepoRecord[]) {
  const total = repos.length;
  const counts = repos.reduce<Record<string, number>>((acc, repo) => {
    acc[repo.status] = (acc[repo.status] ?? 0) + 1;
    return acc;
  }, {});

  const summaryParts = [
    `Repos: ${total} total`,
    `active: ${counts.active ?? 0}`,
    `legacy: ${counts.legacy ?? 0}`,
    `experimental: ${counts.experimental ?? 0}`,
    `archived: ${counts.archived ?? 0}`
  ];
  console.log(summaryParts.join(" | "));
}

function summarizeCovers(covers: CoverValidation[], missing: string[]) {
  const validCount = covers.filter((c) => c.valid).length;
  console.log(`Cover Sheets: ${validCount} valid, ${covers.length} present, ${missing.length} missing`);
  if (covers.some((c) => !c.valid)) {
    console.error("Invalid cover sheets:");
    covers
      .filter((c) => !c.valid)
      .forEach((c) => console.error(`- ${c.file}: ${c.errors}`));
  }
  if (missing.length) {
    console.error("Missing cover sheets:");
    missing.forEach((m) => console.error(`- ${m}`));
  }
}

function ensureLegacyHasCovers(repos: RepoRecord[], coverNames: Set<string>): string[] {
  return repos
    .filter((repo) => repo.status === "archived" || repo.status === "legacy")
    .map((repo) => repo.full_name.split("/")[1])
    .filter((repoName) => !coverNames.has(`${repoName}.cover.md`));
}

function main() {
  const catalogPath = path.join(process.cwd(), "catalog", "repos.yaml");
  const coversDir = path.join(process.cwd(), "covers");
  const catalogSchemaPath = path.join(process.cwd(), "schemas", "repos.schema.json");
  const coverSchemaPath = path.join(process.cwd(), "schemas", "cover.schema.json");

  const ajv = new Ajv({ allErrors: true, allowUnionTypes: true });
  addFormats(ajv);

  const catalog = loadCatalog(catalogPath);
  const catalogSchema = loadSchema(catalogSchemaPath);
  const catalogValid = validateCatalog(catalog, catalogSchema, ajv);
  summarizeRepos(catalog.repos);

  const coverFiles = listCoverFiles(coversDir);
  const coverSchema = loadSchema(coverSchemaPath);
  const coverValidations = coverFiles.map((file) =>
    validateCover(path.join(coversDir, file), coverSchema, ajv)
  );
  coverValidations.forEach((result) => {
    if (!result.valid) {
      console.error(`Cover validation failed for ${result.file}`);
    }
  });

  const missingForLegacy = ensureLegacyHasCovers(catalog.repos, new Set(coverFiles));
  summarizeCovers(coverValidations, missingForLegacy);

  const allValid = catalogValid && coverValidations.every((c) => c.valid) && missingForLegacy.length === 0;
  if (!allValid) {
    process.exit(1);
  }
}

if (require.main === module) {
  main();
}
