# TODO: open conflicts and gaps

Everything the wiki is missing or unsure about lives here, never on a wiki page. `wiki/` stays
clean and reads as a finished CV; this file holds the questions.

Resolve during an ingest by asking Sadra, then update the owning page and delete the item.

## Conflicts: a claim is on the page but the sources disagreed

None open. The star/fork/download disagreements on `wiki/projects/art` and `wiki/projects/pycm`
are resolved: those counts are no longer written into the pages at all. Every project page now
carries live shields.io and pepy.tech badges, so GitHub and PyPI are the source of truth and the
figures cannot go stale again.

## Gaps: something a CV line normally carries is absent

- **`wiki/research-experience/university-of-sydney`** is thin. The page exists and records the
  role and the subject areas, but has no dates, no PI or supervisor, no location, and no account
  of what the project actually was. It therefore renders in the CV with a blank date column and
  sorts last in Research Experience. Also worth confirming: does this role connect to
  [[wiki/references/jonathan-kummerfeld]], who is at the University of Sydney? The wiki does not
  claim a connection, because none is recorded.
- **`wiki/industry-experience/open-science-laboratory` status vs. dates.** The page now records
  `**Dates:** 2019` with no end date, but keeps `status: completed`, which fitted the closed
  2019–2025 period it replaced. `profile/open-source-philosophy` says Sadra "co-leads an
  open-source team that builds scientific tools" in the present tense, and most of the projects
  under the org are `status: active`. Confirm whether the role should be `active`.
- **Missing role: Teaching Assistant at USC.** LinkedIn attributes Teaching to a "Teaching
  Assistant at University of Southern California". `teaching-and-outreach/` has only the Sharif
  workshop and the Stanford program. Needs the courses and terms.
- **Katie Garms has no `references/` page.** She is named on
  `industry-experience/microsoft-prose-internship` as the person Sadra did the UX research half
  of the internship with. Sumit Gulwani got a page when Sadra asked for one; decide whether she
  should too. If so, her affiliation and title are needed.

- **No identity page under `profile/`.** `profile/` owns identity, contact, and links per
  CLAUDE.md, but no page carries them. The CV PDF header now hardcodes them in
  `latex/contact.tex` instead: phone, `sabourih@usc.edu`, LinkedIn and GitHub slugs, and
  Los Angeles, California. The email and the two slugs would sit fine on a wiki page; the phone
  number cannot, since `wiki/` is published. Decide whether a `profile/identity` page owns the
  publishable subset.
- **Publication pages mix two author-name styles.** Some write `S Sabouri, JB Graber, J May`,
  others `Sadra Sabouri, Philipp Eibl, Xinyi Zhou`. The CV copies each page verbatim rather than
  guessing at initials it cannot expand, so both styles appear in one publication list. Needs a
  decision on which style the wiki uses, then a pass over `publications/`.

- **`wiki/projects/mycoffee`**: no GitHub/PyPI link. It is the only project without live
  badges, because neither source names its repository. Present in the CV document only, not on
  the web page.
- **`wiki/honors-and-awards/vector-scholarship-in-ai`**: no year. The announcement post linked
  from the CV was also not captured.
- **`wiki/honors-and-awards/usc-presenter-viterbitrek`**: no year.
- **`wiki/teaching-and-outreach/sharif-nlp-workshop`**: no year.
- **`wiki/teaching-and-outreach/stanford-code-in-place`**: no year, and the program name is
  unconfirmed (likely Stanford **Code in Place**; the page currently says "Stanford Python
  Program").
