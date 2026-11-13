# TODO: open conflicts and gaps

Everything the wiki is missing or unsure about lives here, never on a wiki page. `wiki/` stays
clean and reads as a finished CV; this file holds the questions.

Resolve during an ingest by asking Sadra, then update the owning page and delete the item.

## Conflicts: a claim is on the page but the sources disagreed

- **`wiki/publications/synthesizing-program-analyzers` participant count.** The page used to say
  the user study had 20 software engineers, with a 3.7x accuracy gain and a 32% time cut. The
  arXiv abstract (2605.09304) gives 3.8x and 31% but no participant count; a third-party summary
  of the paper says 18 participants. The page now carries the arXiv numbers and omits the count
  (so does `research-experience/ace-lab-human-ai-knowledge-work`). Confirm the count from the
  camera-ready.

Earlier conflicts are resolved. The star/fork/download disagreements on `wiki/projects/art` and `wiki/projects/pycm`
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
- **Missing role: Teaching Assistant at USC.** LinkedIn attributes Teaching to a "Teaching
  Assistant at University of Southern California". `teaching-and-outreach/` has only the Sharif
  workshop and the Stanford program. Needs the courses and terms.
- **No identity page under `profile/`.** `profile/` owns identity, contact, and links per
  CLAUDE.md, but no page carries them. The CV PDF header now hardcodes them in
  `latex/contact.tex` instead: phone, `sabourih@usc.edu`, LinkedIn and GitHub slugs, and
  Los Angeles, California. The email and the two slugs would sit fine on a wiki page; the phone
  number cannot, since `wiki/` is published. Decide whether a `profile/identity` page owns the
  publishable subset.

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
