---
title: "Log"
---

Append-only. Newest at the bottom. Entry prefix: `## [YYYY-MM-DD] ingest | <description>`

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
