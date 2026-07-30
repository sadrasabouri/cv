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
wiki/
  index.md      catalog of every page, grouped by section
  log.md        append-only, chronological
  <section>/    one directory per CV section, one file per instance
```

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
- Links are Obsidian-style wikilinks with a path relative to the linking file:
  `[[../projects/pycm]]`. Always annotate a link with why the connection exists.
  Relative paths are required — several pages share a basename across sections
  (`projects/pymilo` vs `publications/pymilo`), so bare `[[pymilo]]` is ambiguous.
- `status` vocabulary: `accepted`, `published`, `under-submission`, `in-preparation`,
  `active`, `completed`, `ongoing`, `awarded`.
- Numbers (download counts, stars, participant counts, dates) belong in the body with the
  date they were true, not only in frontmatter.
- Keep pages short. A page that grows past ~40 lines is usually two pages.

## Projects vs. publications

Several things exist as both a software artifact and a paper (PyMilo, Samila, Nafas, naab,
ParsiPy). These are **not** duplicates:

- `projects/<name>.md` owns the artifact — what it does, adoption, funding, status.
- `publications/<name>.md` owns the paper — venue, authors, findings.

Each links to the other. Do not restate adoption numbers on the publication page or
findings on the project page.

## Conflicts

Sources disagree. When two facts collide, **never silently pick one**. Keep the page's main
claim as the best-supported version and add:

```markdown
> [!warning] Conflict
> Web page says 13M+ downloads; CV says "over 10 million". Needs confirmation.
```

Resolve conflicts by asking Sadra during an ingest, then delete the callout. Open conflicts
are listed in `index.md` so they stay visible.

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
6. **Update `index.md`** — add or revise the one-line entry.
7. **Append to `log.md`** using the exact prefix format:
   `## [YYYY-MM-DD] ingest | <short description>` followed by a bullet per page touched.
8. **Report back**: which pages changed, and any conflict or gap worth Sadra's attention.

Stay conversational during ingest. Ask when the section is ambiguous, when a date or number
is missing, or when the input contradicts something already filed.

## The published site

`wiki/` is published with [Quartz](https://quartz.jzhao.xyz) to
<https://sadrasabouri.github.io/cv>. Only `wiki/` is published — this schema file and
everything else at the repo root stay private to the repo.

**Everything in `wiki/` is public.** Two things therefore never go in it:

- **Sadra's phone number**, or any contact detail beyond the work email and public profile
  links. A CV sent to a named recipient is not the same audience as an indexed website.
- **Other people's contact details.** Recommenders and collaborators get a name, role, and
  affiliation — never an email or phone number. Their emails are theirs to publish, not
  Sadra's.

If a source document contains these, file everything else from it and drop these silently;
note the omission in the log rather than the page.

- `quartz.config.yaml` — site config. `markdownLinkResolution: relative` is **load-bearing**:
  it is what makes `[[../projects/pymilo]]` resolve unambiguously. Do not change it to
  `shortest` without first renaming every duplicated basename.
- `quartz.lock.json` — pinned plugin versions.
- `.github/workflows/deploy.yml` — builds on every push to `main` that touches `wiki/`.
  Quartz is fetched at a pinned tag into `.quartz-engine/` and never committed.
- `scripts/preview.sh` — same build locally at <http://localhost:8080>.

Ingest does not need to do anything for the site — pushing to `main` deploys it. Nothing about
the site's existence changes how pages are written, with one exception: the `title:` frontmatter
rule above.
