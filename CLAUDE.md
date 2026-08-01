# CV Wiki — Schema

This repo is a personal CV wiki, maintained entirely by the LLM. Sadra supplies new
experiences in conversation; the LLM files them.

## Core rules

1. **The wiki is the only source of truth.** There is no `raw/` layer. Nothing is kept
   verbatim "just in case" — if a fact matters, it lives in a wiki page. Source documents
   are read once, absorbed, and discarded.
2. **One directory per CV section.** Every directory under `wiki/` is a section that could
   appear on a CV. Nothing else gets a directory.
3. **One file per instance.** Inside a section directory, each file is a single instance of
   that section: one paper, one job, one project, one grant, one course.
4. **There is exactly one operation: `ingest`.** See below. Queries are answered by reading
   the wiki; they are not a documented workflow and produce no files unless asked.
5. **Never duplicate a fact across pages.** State it on the page that owns it, and link from
   everywhere else. Cross-links are cheap; restated facts drift.

## Layout

```
log.md          ingest history. Repo root, outside the wiki. NOT published.
todo.md         open conflicts and gaps. Repo root, outside the wiki. NOT published.
wiki/
  index.md      catalog of every page, grouped by section. Published.
  <section>/    one directory per CV section, one file per instance
```

Everything under `wiki/` is published; everything outside it is not. That is the whole rule —
there is no ignore list to maintain, so nothing private depends on getting config right.

**`index.md` is an index.** It catalogs every page in the wiki, grouped by section, each with
a link and a one-line summary — the index file from the LLM-wiki pattern. It is not a rendered
CV: the CV *is* the wiki, since every directory is a CV section and every page an entry. The
sidebar explorer and the graph are the other two ways in.

Regenerate the catalog body rather than hand-editing it when many pages change; summaries come
from each page's `## Summary`, or its first prose paragraph when there isn't one. **The intro
paragraph above the first `##` is Sadra's own — leave it alone when regenerating.**

**`log.md` is never published.** Internal bookkeeping — what was ingested when — lives at the
repo root, outside `wiki/`, so it cannot be published by accident.

**Nothing in `wiki/` is ever provisional.** No TODOs, no "worth filling in", no "needs
confirmation", no gap or conflict callouts, no bracketed placeholders — not on a published page,
not in `log.md`. A wiki page states what is known, in finished prose, and says nothing about what
isn't. Everything unresolved goes in **`todo.md` at the repo root**, which is outside `wiki/` and
therefore can never be published by accident. When a page can't yet carry a fact, the page simply
omits it and `todo.md` records the question.

Current sections:

| Directory | Owns |
|---|---|
| `profile/` | Identity, contact, links, positioning statements, research agenda |
| `education/` | Degrees, institutions, dates |
| `publications/` | One page per paper, accepted or under submission |
| `research-experience/` | Lab appointments and the research threads inside them |
| `industry-experience/` | Employers, internships, roles held there |
| `projects/` | Software, libraries, datasets, models — the artifact, not the paper |
| `honors-and-awards/` | Grants, scholarships, competitive selections |
| `services/` | Peer review, program committees, editorial work |
| `teaching-and-outreach/` | Instruction, mentoring, community education |
| `talks/` | Talks, posters, presentations |
| `skills/` | Skill inventories, grouped by kind |
| `references/` | Recommenders and their affiliations |

**Adding a section:** only when new material genuinely doesn't fit an existing one *and*
would appear under its own heading on a real CV (e.g. `patents/`, `press/`). Create the
directory, add it to the table above, and add its group to `index.md`.

## Page format

Filename is a kebab-case slug of the thing itself — no dates or numeric prefixes, so links
stay stable when a title changes.

```markdown
---
title: "Full Human-Readable Title"   # required — the only place the title lives
type: publication          # singular form of the section
status: accepted           # see status vocabulary
year: 2025
venue: ICSE
tags: [hci, trust]
---

**Authors:** ...           # short bolded fact block, section-dependent
**Venue:** ...

## Summary
Two to five sentences. What it is, what was found, why it matters.

## Links
[Paper](...) · [Code](...)

## Related
[[../projects/pycm]] — one clause saying *why* it's related.
```

Rules:

- **`title:` is required, and the body must not repeat it as an `# H1`.** The published site
  renders the frontmatter title as the page heading; a body H1 would duplicate it on the page
  and drift from the frontmatter over time. Quote the title so colons and brackets are safe.
- Body content starts at the fact block. Section headings are `##`.
- **Every wikilink carries a display alias: `[[../projects/pycm|PyCM — Multi-Class Confusion
  Matrix Library]]`.** Without one, the site renders the raw slug (`pycm`), which reads as
  machine output. Use the target page's `title`. Aliases must not contain `[` or `]` — the
  brackets terminate the link early.
- Relative paths are required — several pages share a basename across sections
  (`projects/pymilo` vs `publications/pymilo`), so bare `[[pymilo]]` is ambiguous.
- Always annotate a link with a clause saying why the connection exists.
- `status` vocabulary: `accepted`, `published`, `under-submission`, `in-preparation`,
  `active`, `completed`, `ongoing`, `awarded`.
- **A paper under submission never names its venue.** Omit the `venue:` frontmatter key and
  write `**Status:** Under submission, <year>` instead of a `**Venue:**` line. The site is
  public, and where a paper is currently under review is not. Add the venue only once it is
  accepted, at which point `status` changes too. This applies to inbound links as well — do not
  annotate a link with a venue the paper has not earned yet.
- **Never write star, fork, or download counts as prose.** Every project page carries live
  shields.io and pepy.tech badges instead, so GitHub and PyPI stay the source of truth and the
  numbers cannot go stale. A hardcoded count next to a live badge will eventually contradict it.
  Other numbers — participant counts, dataset sizes, dates — do belong in the body, with the
  date they were true.
- New project page: add the badge block between the fact block and `## Summary`, derived from
  the page's own GitHub and PyPI links:

  ```markdown
  [![GitHub stars](https://img.shields.io/github/stars/ORG/REPO.svg?style=social&logo=github&label=Stars)](https://github.com/ORG/REPO)
  [![GitHub forks](https://img.shields.io/github/forks/ORG/REPO.svg?style=social&logo=github&label=Forks)](https://github.com/ORG/REPO)
  [![PyPI downloads](https://static.pepy.tech/badge/PKG)](https://pepy.tech/project/PKG)
  ```
- **A page must stand on its own.** Assume the reader cannot click a link, cannot open a repo,
  and cannot see a badge. Whatever a link or badge would have told them goes in the prose.
  Length is not the constraint; a page runs as long as the material it actually has.
- **Never pad.** Everything on a page traces to a source Sadra supplied. Do not add plausible
  background, do not explain how a method works because you happen to know, and do not invent
  a rationale for why a tool exists. If a sentence cannot be traced, delete it. This is the
  single easiest rule to break while writing fluent prose, and the most damaging when broken.

## Projects vs. publications

Several things exist as both a software artifact and a paper (PyMilo, Samila, Nafas, naab,
ParsiPy). These are **not** duplicates:

- `projects/<name>.md` owns the artifact — what it does, adoption, funding, status.
- `publications/<name>.md` owns the paper — venue, authors, findings.

Each links to the other. Do not restate adoption numbers on the publication page or
findings on the project page.

## Conflicts and gaps

Sources disagree, and sources leave things out. Neither ever shows on a wiki page.

**Conflict.** Put the best-supported version on the page, stated plainly and without hedging —
no ranges like "1.5k–2k stars" standing in for uncertainty. Then add a bullet to `todo.md`
naming the page, what each source claimed, and which one the page went with.

**Gap.** The page omits the fact entirely — no empty heading, no "year unknown". Add a bullet to
`todo.md` naming the page and what's missing.

Resolve both by asking Sadra during an ingest, then update the page and delete the bullet from
`todo.md`.

## The one operation: ingest

Triggered by `/ingest` or by Sadra just describing something new in conversation ("I got
accepted to X", "I started an internship at Y", "we released version 2 of Z").

1. **Read it.** Whatever the input is — a message, a link, a file, an email paste.
2. **Locate.** Decide which section(s) it belongs to. One input often touches several: a new
   paper touches `publications/`, its `research-experience/` thread, and possibly `projects/`.
3. **Check for duplicates first.** Search the wiki before creating anything. A new paper
   about an existing project updates that project's page rather than starting a new one. Prefer
   updating an existing page over creating a near-identical sibling.
4. **Write or update** the owning page, then update every page that links to it.
5. **Reconcile.** If the new information contradicts what's on a page, update the claim and
   note what changed — don't leave the old version standing unmarked.
6. **Update the catalog in `index.md`** — add the page under its section with a link and a
   one-line summary, matching its neighbours.
7. **Append to `log.md`** using the exact prefix format:
   `## [YYYY-MM-DD] ingest | <short description>` followed by a bullet per page touched.
8. **Update `todo.md`** — delete anything this ingest resolved, add a bullet for any new
   conflict or gap. Never leave the question on the page itself.
9. **Report back**: which pages changed, and any conflict or gap worth Sadra's attention.

Stay conversational during ingest. Ask when the section is ambiguous, when a date or number
is missing, or when the input contradicts something already filed.

## The published site

`wiki/` is published to <https://sadrasabouri.github.io/cv> by
`.github/workflows/deploy.yml`, using the `konstfish/quartz-build-action` action. Only `wiki/`
is published — this schema file, `log.md`, `todo.md`, and everything else at the repo root stay
private to the repo. There is no Quartz config, no build script, and nothing to install; the
action owns the build.

**Everything in `wiki/` is public.** Two things therefore never go in it:

- **Sadra's phone number**, or any contact detail beyond the work email and public profile
  links. A CV sent to a named recipient is not the same audience as an indexed website.
- **Other people's contact details.** Recommenders and collaborators get a name, role, and
  affiliation — never an email or phone number. Their emails are theirs to publish, not
  Sadra's.
- Nothing provisional: no TODOs, gap notes, or conflict callouts. Those go in `todo.md`.

If a source document contains these, file everything else from it and drop these silently;
note the omission in `log.md` rather than the page.

Keep pages densely cross-linked — the graph view is only as good as the `## Related` sections.
