---
title: "Log"
---

Append-only. Newest at the bottom. Entry prefix: `## [YYYY-MM-DD] ingest | <description>`

**This file is not published.** It lives at the repo root, outside `wiki/`, and only `wiki/`
is rendered to the site.

Open conflicts and gaps live in `todo.md` at the repo root, not here and not on wiki pages.

## [2026-07-30] ingest | Bootstrap — personal web page + master CV document

Initial build. Two sources read, unioned, and discarded; the wiki is now the source of truth.

- Created the schema (`CLAUDE.md`) and the `/ingest` command
- Created 12 section directories and 76 pages
- **profile/** 3 pages — identity, research agenda, open-source philosophy
- **education/** 3 pages — USC PhD, USC MS, Sharif BSc
- **publications/** 25 pages — 13 shared by both sources, 10 CV-only (incl. 4 under
  submission), 2 recovered from prose mentions (Nafas arXiv, DBFC dataset)
- **research-experience/** 6 pages — ACE Lab + its 3 threads, CUTE LAB NAME, Sharif SLP Lab
- **industry-experience/** 3 pages — OpenSciLab, Asr Gooyesh Pardaz, Microsoft PROSE
- **projects/** 18 pages — 17 from the web page, Mycoffee recovered from the CV
- **honors-and-awards/** 7 pages — 5 grants, 1 scholarship, 1 selection
- **services/** 1 page — peer review across 10 venues
- **teaching-and-outreach/** 2 pages, **talks/** 1 page, **skills/** 2 pages,
  **references/** 5 pages
- Created `index.md` with an open conflicts and gaps table

Dedup decisions:
- The CV listed **Open Science Laboratory 3×** and **Asr Gooyesh Pardaz 3×** under different
  role framings with reworded bullets — CV variants for different job targets. Each unified
  into one page listing all roles held.
- The web page's **News** section was dissolved into the sections it belonged to
  (publications, honors, industry-experience, talks) rather than kept as its own directory,
  since "news" is not a CV section.
- Where a thing exists as both software and a paper (PyMilo, Samila, Nafas, naab), the
  artifact and the paper were given separate cross-linked pages rather than merged.
- The web page's project taxonomy (NLP, Speech, ML, Network, Art, HCI, Chemistry, Biomedical,
  Environmental) was preserved as a `domain:` frontmatter field and index grouping rather than
  as subdirectories.

Flagged: 9 open conflicts and gaps — see `index.md`.

## [2026-07-30] ingest | Corrections from Sadra — roles and two paper conflicts

- `industry-experience/open-science-laboratory` — role is **Co-founder**, single. The other
  framings (full-stack dev, software engineer, data scientist, user researcher) are now a
  "What the role covers" section describing facets of the work, not separate titles.
- `industry-experience/asr-gooyesh-pardaz` — role is **Machine Learning Engineer Intern**.
  Other framings dropped; added `internship` tag.
- `publications/advice-styles-contemplation` — **resolved**: one paper, accepted at
  **VL/HCC 2026**. CUI was the prior submission target. Conflict callout replaced with a
  venue-history note.
- `publications/cognitive-biases-llm-programming` — **resolved**: real title is
  *"Cognitive Biases in LLM-Assisted Software Development"*. "Biased by Design" was an earlier
  working title. Conflict callout replaced with a title-history note. Filename slug left
  unchanged so inbound links stay stable.
- `index.md` — removed both resolved rows from the conflicts table; updated the industry and
  publication entries.

Open conflicts and gaps now: 7.

## [2026-07-30] publish | Quartz site on GitHub Pages

`wiki/` is now published to <https://sadrasabouri.github.io/cv> with Quartz v5.

- Added `title:` frontmatter to all 78 pages and removed the duplicate body `# H1` from each.
  The frontmatter title is now the single source of the page title; Quartz renders it as the
  heading. Schema updated so future ingests follow suit.
- Added `quartz.config.yaml`, `quartz.lock.json` (42 plugins pinned),
  `.github/workflows/deploy.yml`, `scripts/preview.sh`, `.gitignore`.
- Quartz is fetched at pinned tag `v5.0.0` into a gitignored `.quartz-engine/` rather than
  vendored, so the repo stays a content repo.
- `markdownLinkResolution: relative` — required, because `pymilo`, `samila`, and `nafas` each
  exist in both `projects/` and `publications/`; the default `shortest` would resolve them
  ambiguously. Verified all cross-section links land on the correct page.
- No content was rewritten for the site beyond the title/H1 change.

Removed before publishing, since everything in `wiki/` becomes public:

- Sadra's phone number, from `profile/sadra-sabouri`. His existing public web page listed only
  an email; the number came from the CV, which has a different audience.
- The email addresses of all five recommenders in `references/`. They keep name, role, and
  affiliation. Publishing colleagues' contact details is their call, not ours.

Schema updated with a standing rule so neither gets re-added on a future ingest.

## [2026-07-30] redesign | CV-first homepage, simpler chrome, graph focus

Site was reading as a wiki dump rather than a CV, and internal bookkeeping was public.

- **`index.md` rewritten as an actual CV** — education, research and industry experience,
  25 publications with authors and venues, selected projects with adoption numbers, awards,
  service, teaching, talks, skills, references. Every entry links to its detail page.
  Publication entries were generated from the pages themselves so they cannot drift.
- **`log.md` is no longer published.** It was exposing the ingest history to anyone reading
  the CV. The "open conflicts and gaps" table moved here from `index.md` for the same reason —
  a public CV should not advertise "13M+ vs 10M+ downloads, needs confirmation".
- **192 wikilinks across 74 files given display aliases.** They were rendering as raw slugs
  (`ace-lab-ai-for-education`), which is what made the site feel machine-generated.
- Fixed 5 links whose alias contained `[CUTE LAB NAME]` — the brackets terminated the
  wikilink early and broke it.
- **Graph promoted**: tag nodes off on both local and global graph, local depth raised to 2,
  hover focus on. The graph now shows page structure instead of a tag hairball.
- Frontmatter properties block hidden (`hidePropertiesView: true`). Note: disabling the
  plugin outright also removes all tag pages — see the schema note.
- Contact details removed from the references section of the CV; available on request.

## [2026-07-30] cleanup | Provisional language out of the wiki, into `todo.md`

Pages were carrying their own unfinished business — "Worth filling in", "Needs confirmation" —
which reads as draft notes on what is meant to be a finished CV.

- Removed 5 `> [!note] Gap` callouts: `teaching-and-outreach/sharif-nlp-workshop`,
  `teaching-and-outreach/stanford-code-in-place`, `honors-and-awards/vector-scholarship-in-ai`,
  `honors-and-awards/usc-presenter-viterbitrek`, `projects/mycoffee`. Each page now simply
  omits the fact it doesn't have.
- Removed 2 `> [!warning] Conflict` callouts: `projects/art`, `projects/pycm`. Both keep the
  figures they already claimed; `projects/pycm` had also been hedging in the body
  ("1.5k–2k GitHub stars") and now states **2k+ stars, 3M+ downloads** outright.
- **Created `todo.md` at the repo root** with all 7 items, each recording what the page claims
  and what still needs confirming. It sits outside `wiki/`, so it cannot be published by
  accident the way an ignored file inside `wiki/` could.
- The open conflicts and gaps table moved out of this file into `todo.md`. `log.md` is now
  ingest history only.
- Schema and `/ingest` updated: nothing provisional in `wiki/`, ever — `todo.md` is the only
  place a question lives, and ingest step 8 keeps it current.

## [2026-07-30] fix | Explorer, graph and search were dead; index restored to a catalog

- **Root cause found for the broken explorer and graph.** Quartz v5.0.0 hardcodes
  `fetch("/static/contentIndex.json")` in the explorer, graph, *and* search scripts. This site
  is served under `/cv/`, so that absolute path resolved to the domain root and returned 404.
  All three components fetch that file, so all three quietly did nothing while the
  server-rendered page looked completely normal. Search was broken too, unreported.
  Fixed by `scripts/patch-base-path.py`, run by both the preview script and CI.
  Verified in headless Chrome: the explorer now renders all 12 section folders, the graph
  builds its canvas, and the request goes to `<base>/static/contentIndex.json`.
- **`index.md` restored to a catalog** — 76 pages grouped by section with a link and one-line
  summary each, per the LLM-wiki pattern. The CV-rendering version is gone: the CV *is* the
  wiki, since each directory is a CV section.

## [2026-07-30] simplify | Drop the hand-rolled Quartz setup

Replaced the whole custom build with `konstfish/quartz-build-action`.

- Deleted `quartz.config.yaml`, `quartz.lock.json`, `scripts/preview.sh`, and
  `scripts/patch-base-path.py`. The workflow is now ~50 lines and owns the build entirely.
- `log.md` moved from `wiki/` to the repo root. Privacy no longer depends on an `ignorePatterns`
  entry being correct — only `wiki/` is published, so anything outside it is private by
  construction.
- Trade-off accepted: no local preview, no pinned Quartz version, and no control over Quartz
  settings unless a config file is passed to the action.
