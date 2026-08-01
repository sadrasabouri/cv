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
- Uses `konstfish/quartz-build-action@v7`, not v6. v6 pins nothing: its Dockerfile clones
  Quartz's default branch, which is now v5, then runs `npm ci --only=production` — esbuild is a
  devDependency in v5, so `quartz create` fails and the Docker build never completes. v7 pins
  the ref to v4 and drops `--only=production`. It builds Quartz v4.5.2.
- `page_base_url` is not set: the action substitutes it into a `sed s///` expression without
  escaping, so any value containing `/` fails with "bad option in substitution expression".
  Consequence: `baseUrl` stays at the action's default, so sitemap and RSS carry example.com
  URLs. Navigation is unaffected — Quartz v4 emits relative links throughout.
- Quartz v4 does not have v5's base-path bug: it emits depth-correct relative paths
  (`./static/...` at the root, `../static/...` one level down), so the explorer, graph and
  search all load their data correctly under `/cv/`. The patch script is no longer needed.
- `markdownLinkResolution` is `shortest` (the action hardcodes it) but the relative wikilinks
  still resolve correctly, including the three basenames that exist in both `projects/` and
  `publications/` (pymilo, samila, nafas). Verified on the deployed site.
- Trade-off accepted: no local preview and no pinned Quartz version.

## [2026-07-31] cleanup | Provenance notes and the identity page removed

Sadra deleted `wiki/profile/sadra-sabouri` and the two "Source artifact" callouts on the
industry-experience pages. Followed through on the rest:

- Removed the two remaining provenance callouts of the same kind — the "Title history" note on
  `publications/cognitive-biases-llm-programming` and the "Venue history" note on
  `publications/advice-styles-contemplation`. Both described what the source documents said
  rather than the work itself. No callouts of any kind remain in `wiki/`.
- Collapsed the blank lines left where the deleted callouts had been.
- Checked for fallout from the deleted page: no inbound links to it remained, 264 wikilinks all
  resolve, and no page is orphaned.
- Contact details and profile links (email, GitHub, LinkedIn, Scholar, Twitter, Stack Overflow,
  IMDB) are now absent from `wiki/` entirely, since that page owned them.

## [2026-07-31] ingest | cv-web.html — rewritten personal site, folded into every page it covers

Sadra re-added his personal site export as `cv-web.html`, a rewritten and much richer version
of the page the wiki was originally built from. Instruction: expand the pages with its content,
assume readers cannot follow links or see badges, and add nothing from any other source.

- **39 of 75 pages enriched**, +355 net lines. The other 36 — education, references, skills,
  services, teaching, the four under-submission papers, Mycoffee, Asr Gooyesh Pardaz — are not
  in the file at all, so they were left alone rather than padded.
- New material the wiki did not have: the **two-theses framing** (*AI Integration Challenges* /
  *Open World Development*); the full Frankenstein-Trojan argument and the case for software as
  unusually auditable science; and a personal passage on `publications/docalog` — his first
  paper, the one that pulled him into NLP and publishing, now its own section on that page.
- `index.md` regenerated with a short bio from the site intro and refreshed summaries.
- Badges on the site are shields.io images, so they carry no literal figures in the HTML;
  no adoption numbers could be recovered from them. Existing figures came from the CV document
  and were kept.

Written by parallel agents, then diff-verified line by line against the HTML. The verification
caught **26 unsupported additions** — fluent, plausible padding of exactly the kind the
instruction forbade. All were removed. The worst were outright wrong:

- `projects/samila` claimed "two runs never look alike", contradicting the seed mechanism
  described in the same paragraph.
- `publications/docalog` filed an English MultiDoc2Dial shared-task paper under a "Farsi text line".
- `publications/eli-why` invented "why the sky is blue" as an example, reading as a benchmark item.
- `industry-experience/open-science-laboratory` attributed projects that live outside the
  OpenSciLab organization to it.
- `profile/open-source-philosophy` welded two separate statements together — that Sadra
  co-leads an open-source team, and that he co-founded OpenSciLab — into a claim the site
  never makes.

Schema updated with an explicit no-padding rule, and the old ~40-line limit replaced: a page
must now carry whatever a link or badge would have told the reader.

## [2026-08-01] change | Live badges replace hardcoded adoption counts

Star, fork, and download figures were written into the project pages as prose, so they went
stale the moment they were written. All 15 project pages with a GitHub repo and a PyPI package
now carry live shields.io and pepy.tech badges instead, placed between the fact block and
`## Summary`.

The stale numbers were removed rather than kept alongside the badges, since a hardcoded count
next to a live one eventually contradicts it. How stale they were, measured against the badges:

| Project | Page claimed | Actually |
|---|---|---|
| Art | 13M+ downloads, 141 forks | 25M, 156 |
| PyCM | 2k+ stars, 3M+ downloads | 1.5k, 4M |
| Nava | 30k+ downloads | 78k |
| PyRGG | 209 stars, 42,000+ downloads | 222, 55k |
| OPR | 18,000+ downloads | 26k |
| PyMilo | 13k+ downloads | 21k |
| Samila | 1,100+ stars, 36,000+ downloads | 1.2k, live |

Qualitative adoption facts that no badge can express were kept — conda-forge, the Keras and
TensorBoard dependency, 200+ research papers, the Real Python podcast mention, the Web3/NFT
reception, the 10+ research teams using PyRGG.

Not badged: `projects/mycoffee` (no repository named in either source), and `projects/naab` and
`projects/sharif-wav2vec2`, which live on Hugging Face — its badges are static labels carrying
no counts, so they would not auto-update.

This closes both open conflicts in `todo.md`; that section is now empty.

## [2026-08-01] change | Under-submission papers no longer name their venue

Four papers carry `status: under-submission`, and each stated where it was submitted. Removed,
since the site is public and a paper's current review venue is not.

- `publications/auditing-ai-agents-spreadsheets`, `publications/prompting-reflection`,
  `publications/synthesizing-program-analyzers`,
  `publications/anthropomorphism-sycophancy-therapeutic-ai` — dropped the `venue:` frontmatter
  key and replaced the `**Venue:**` line with `**Status:** Under submission, 2026`.
- `industry-experience/microsoft-prose-internship` — a `## Related` annotation named the venue
  of the spreadsheet-agents submission; now reads "submission co-authored with Gulwani".
- `index.md` — the four entries now read *(2026 · under submission)* with no venue.

The 21 accepted and published papers keep their venues. Schema updated so a future ingest does
not reintroduce one, including in link annotations.

## [2026-08-01] ingest | LinkedIn skills list

Sadra supplied his LinkedIn skills (~70 entries). Filed into `skills/`, which grew from two
pages to three.

- `skills/technical` — rebuilt as ten grouped inventories: programming languages, machine
  learning and AI, ML frameworks, speech and signal, immersive and visual computing, web and
  backend, data, software and infrastructure, hardware and embedded, and research/design tools.
  Adds C, MATLAB, Assembly, Verilog, VHDL, LaTeX, PostgreSQL, Git, CI/CD, DevOps, GNU/Linux,
  FPGA, Arduino, Raspberry Pi, AR/VR, holography, CNNs, agentic AI, agent-based modeling, and
  more. Records the five passed LinkedIn skill assessments.
- `skills/research-methods` — gains research design, UX research, UX testing, user behavior,
  human-centered AI design, and psychology.
- `skills/professional` — new page for teamwork, leadership, project management, public
  speaking, presentation, and teaching.

Endorsement counts were not carried over: they are LinkedIn social proof that drifts, and the
schema already forbids hardcoding numbers that a live source owns. The skill-to-role
attributions were kept, since those say where a skill was actually exercised, and link to the
experience pages.

Deduplicated along the way: "C" / "C (Programming Language)", "Speech Recognition" / "ASR", and
"Open-Source Software" / "Open Source Development" each appear once.

**Three experiences surfaced that the wiki has no record of** — a Research Assistant Internship
at the University of Sydney, a Teaching Assistant role at USC, and an apparent second Microsoft
experience. All three are recorded in `todo.md`; none got a page, since a skills list is too
thin to write an experience from.

## [2026-08-01] change | Software-engineering thread reframed as knowledge work

Sadra's observation: the thread had grown past its own name. The spreadsheet-agents study has
spreadsheet users as subjects, not developers, so "Human-AI Interaction in Software Engineering"
described the first four studies rather than the thread.

- Renamed `research-experience/ace-lab-human-ai-software-engineering` →
  `ace-lab-human-ai-knowledge-work`, retitled **Thread: Human-AI Interaction in Knowledge Work**.
  The old slug is kept as an `aliases:` entry so the published URL redirects rather than 404s —
  Quartz v4 has `AliasRedirects` in its default emitters.
- The spreadsheet study was only a `## Related` link before. It is now the fifth study in the
  thread, described as taking the oversight question to a population that does not write code.
- Reframed the opening: the thread is about people who already have a job to do, and knowledge
  work is the level the findings generalise at.
- Relinked all eight inbound references and reworded two annotations that described the older,
  narrower scope.

`profile/research-agenda` still lists the domain as "Developers working with code agents",
because that wording is from Sadra's own site. Left as-is — the domain is one part of the
broadened thread, not a contradiction of it.
