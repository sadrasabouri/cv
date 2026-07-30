# CV Wiki

A personal CV knowledge base, maintained by an LLM and published as a website.

**Live site:** <https://sadrasabouri.github.io/cv>

## Layout

| Path | What it is |
|---|---|
| `wiki/` | The content, and the only thing published. One directory per CV section, one file per instance. |
| `wiki/index.md` | Catalog of every page, plus open conflicts and gaps. |
| `wiki/log.md` | Append-only history of every ingest. |
| `CLAUDE.md` | The schema — how pages are structured and how new material gets filed. |
| `quartz.config.yaml` | Site configuration. |
| `quartz.lock.json` | Pinned Quartz plugin versions. |

## Adding something

Tell the agent what's new — a paper, a role, a grant, a talk — or run `/ingest`. It files the
material into the right sections, updates every page that links to it, refreshes the index, and
appends to the log. That's the only operation.

## Local preview

```bash
./scripts/preview.sh          # build and serve on http://localhost:8080
./scripts/preview.sh --build  # build only, into ./public
```

Quartz is fetched at a pinned tag into `.quartz-engine/` (gitignored) rather than vendored, so
this stays a content repo. Delete that directory to force a clean refetch.

## Deploying

Pushing to `main` builds and deploys automatically via `.github/workflows/deploy.yml`.
