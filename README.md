# CV Wiki

A personal CV knowledge base, maintained by an LLM and published as a website.

**Live site:** <https://sadrasabouri.github.io/cv>

## Layout

| Path | What it is |
|---|---|
| `wiki/` | The content, and the only thing published. One directory per CV section, one file per instance. |
| `wiki/index.md` | Catalog of every page, grouped by section. |
| `CLAUDE.md` | The schema: how pages are structured and how new material gets filed. |
| `latex/` | The PDF renderer: rules, template, and the generated `cv.tex`. Not published as pages. |
| `log.md` | Append-only history of every ingest. Not published. |
| `todo.md` | Open conflicts and gaps. Not published. |

Everything under `wiki/` is public; everything outside it is not.

## Adding something

Tell the agent what's new (a paper, a role, a grant, a talk), or run `/ingest`. It files the
material into the right sections, updates every page that links to it, refreshes the index, and
appends to the log. That's the only operation.

## The PDF

`/render` turns the wiki into a full academic CV and compiles it. `latex/RULES.md` holds the
rules and preferences it follows; `latex/cv.tex` is generated and should never be hand-edited;
fix the wiki page that owns the fact and re-render. Build locally with `./latex/build.sh`.

The PDF is not committed. CI compiles it on every push and serves it at
<https://sadrasabouri.github.io/cv/cv.pdf>, so it cannot drift from the wiki it came from.

## Deploying

Pushing to `main` builds and deploys automatically via `.github/workflows/deploy.yml`, which
uses [`konstfish/quartz-build-action`](https://github.com/konstfish/quartz-build-action) to
render `wiki/` with [Quartz](https://quartz.jzhao.xyz). There is nothing to configure or
install locally.
