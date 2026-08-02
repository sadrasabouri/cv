# CV PDF, rendering rules

How `wiki/` becomes `cv.pdf`. This file is the durable half of the `/render` command: the command
says *do it*, this says *how*. It sits outside `wiki/`, so it is never published.

Sadra's preferences live here. Change them here rather than hand-editing `cv.tex`, which is
generated and gets overwritten on the next render.

## Files

| Path | Owner | Regenerated? |
|---|---|---|
| `latex/RULES.md` | Sadra | never, this file |
| `latex/contact.tex` | Sadra | never, header data edited by hand |
| `latex/preamble.tex` | Sadra | never, document class, packages, macros |
| `latex/fetch-metrics.sh` | Sadra | never, snapshots project stars/forks/downloads |
| `latex/cv.tex` | `/render` | **every render, wholesale** |
| `latex/build.sh` | Sadra | never, local compile helper |

`cv.pdf` is never committed. CI builds it and publishes it to
<https://sadrasabouri.github.io/cv/cv.pdf>; see `.github/workflows/deploy.yml`.

## Hard rules

**Never use an em dash.** Not in the CV, not in `cv.tex`, not in these docs. Use a comma, a colon,
a semicolon, or parentheses. This applies to `---` in LaTeX and to a literal em dash character.
An en dash (`--`) in a date range such as `Aug. 2023 -- Present` is fine and is not an em dash.

**Every line traces to a wiki page.** The PDF is a rendering, not a rewrite. No fact appears in
`cv.tex` that isn't on a page in `wiki/`. This is the same rule CLAUDE.md applies to the wiki, and
it is the one most easily broken while writing fluent LaTeX.

**The wiki stays the source of truth.** A fact that is wrong in the PDF is wrong in the wiki. Fix
the page and re-render. Never patch `cv.tex` directly.

**Author lists are copied verbatim from the publication page**, including whether the page wrote
`S Sabouri` or `Sadra Sabouri`, and including the bolding of Sadra's own name. Do not expand
initials; the full names aren't recorded anywhere and guessing them invents facts.

**A paper under submission never names its venue.** Same rule as the wiki, and it matters more
here, because the PDF is served from a public URL.

**Gaps stay gaps.** If a page has no year, the entry renders without one. Never invent a date to
make a column line up. Missing facts are tracked in `todo.md`.

## Header

Exactly the block Sadra specified, rendered by `\cvheader` in `preamble.tex` from the values in
`contact.tex`: name, then one line of phone, email, LinkedIn, and GitHub with FontAwesome icons
and underlined link text separated by `\quad`, then the location on its own line. No tagline, no
website link, no Google Scholar link.

Note that `cv.pdf` is served publicly and is therefore indexable, phone number included. That is
a deliberate choice, not an oversight.

## Section order

1. Education
2. Publications
3. Research Experience
4. Industry Experience
5. Open-Source Projects
6. Honors and Awards
7. Talks and Posters
8. Teaching and Outreach
9. Service
10. Skills
11. References

There is **no Research Interests or summary section.**

Within each section, sort **by start date, descending**, and put entries with no date last. Start
date, not end date: an ongoing 2025 affiliation outranks an ongoing role begun in 2023, and a role
recorded only by its founding year sorts on that year regardless of how long it ran.

## Per-section rules

**Education.** Institution, location, degree, dates. Nothing else. No bullets, no description of
the research, no thesis note.

**Publications.** One single section. Do not split into peer-reviewed, preprints, and under
submission. Link the title to the paper where the page has a link.

Order: **every under-submission paper first**, at the top of the section, then everything
published, sorted by three keys in this order:

1. **Year descending.**
2. **Venue, alphabetically**, so papers sharing a venue in the same year sit next to each other
   (the two VL/HCC 2026 papers, for instance). Sort on the right-hand label as it is printed and
   ignore case, which puts `Preprint, arXiv, 2024` before `Preprint, Preprints.org, 2024` and so
   keeps preprints grouped too.
3. **Title, alphabetically**, to break a remaining tie.

The right-hand label depends on what the paper is:

| Page state | Right-hand label |
|---|---|
| `status: under-submission` | `Under submission, 2026`, never the venue |
| Published at a conference or journal | `VL/HCC, 2026`, `Water Resources Research, 2024` |
| On a preprint server (arXiv, ChemRxiv, Preprints.org) | `Preprint, arXiv, 2025` |
| Self-published report | `Technical report, pycm.io, 2022` |

Saying "Preprint" explicitly matters: a bare `arXiv, 2025` reads like a venue, and a reader
skimming a single merged list has no other way to tell it apart from a refereed one.

**Research and Industry Experience.** Headings only, exactly like Education. Role and dates on
the first line, organization and location on the second, and **no bullets and no description**.
The substance (study sizes, findings, funders, team sizes) stays on the wiki pages, which is
where a reader who wants it should go.

**Open-Source Projects.** Link the project name to its GitHub repository, or to Hugging Face where
that is the artifact's actual home. Follow the name with a short descriptor, the year on the
right, then role, organization, and what the thing does. Close each entry with a
`\projectstats{...}` line carrying **stars, forks, and downloads per month**, snapshotted at render
time by `fetch-metrics.sh`. A dated note under the section heading says when the figures were true.
Projects with no repository (Mycoffee) and artifacts not on GitHub or PyPI (naab,
Sharif-Wav2Vec2.0) simply have no stats line.

This is the one place the CV departs from CLAUDE.md's "never write star, fork, or download counts"
rule, and deliberately: that rule exists because wiki pages carry live badges that cannot go stale.
A PDF has no badges, so the numbers are stamped with the date they were taken instead.

**Service, Skills, References.** Flat lists. Referees get name, title, and affiliation, never an
email or phone number; those are theirs to publish, not Sadra's.

## Metrics

`./latex/fetch-metrics.sh` prints stars, forks, and downloads-per-month for every project the CV
lists. `/render` runs it and bakes the numbers into `cv.tex` as plain text, so the CI compile
needs no network.

Stars and forks come from the GitHub API. Downloads are **last 30 days from pypistats**, because
pepy.tech now requires an API key this repo does not have; lifetime totals would need one. The
numbers are true as of the render, not as of the CI compile, which is why the note under the
section heading is dated.

## Formatting

Jake's-resume macros, supplied by Sadra, live in `preamble.tex` and are used as given:

- `\resumeSubheading{role or institution}{dates}{organization}{location}`, four-field entries with
  a bold first line and an italic second. Education, research and industry roles.
- `\resumeItemListStart` / `\resumeItem{...}` / `\resumeItemListEnd`, bullets under a subheading.
- `\resumeSubHeadingListStart` / `\resumeSubHeadingListEnd`, wraps every section's list.

Two macros were added for the renderer and are documented here rather than assumed:

- `\cventry{bold left}{right}{second line}` for entries whose title is long enough to wrap, which
  `\resumeSubheading`'s `tabular*` cannot do. Publications, projects, awards, talks, teaching.
- `\projectstats{...}` for the small italic snapshot line under a project.

Escape `&`, `%`, `_`, and `#`. Write `$\times$` and `$\sim$` rather than the Unicode characters.

## Tag filtering, available but off

`preamble.tex` carries Sadra's `\mytags` macro and `\def\tagfilter{ALL}`, so every entry renders.
The machinery is there for targeted versions of the CV later: set `\tagfilter` to `AI`, `HCI`, or
`SE`, wrap entries as `\mytags{AI,HCI}{...}`, and only matching entries print. Turning it on means
changing this section and re-rendering; the wrappers are generated, not hand-written.

Wiki frontmatter `tags:` are topical and fine-grained (146 distinct values across the wiki), not
audience tags. If filtering is switched on, `/render` maps them to coarse audience tags rather
than passing them through.

## Building

    ./latex/build.sh          # writes latex/cv.pdf, then cleans aux files

CI does the same on every push to `main` and drops the result at `/cv/cv.pdf`. Local builds need
`xstring`, `enumitem`, `titlesec`, `marvosym`, `fontawesome5`, and `preprint` (for `fullpage.sty`);
on a BasicTeX install, `tlmgr --usermode install` them.
