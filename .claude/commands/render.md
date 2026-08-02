---
description: Render the CV wiki into latex/cv.tex and compile the PDF
---

Render the wiki into a LaTeX CV, following @latex/RULES.md.

$ARGUMENTS

If arguments were given above, treat them as a scope or preference change for this render (for
example, a section to add, drop, or reorder). If the change is one Sadra will want next time too,
put it in `latex/RULES.md` before rendering, so the next render keeps it.

## Steps

1. **Read `latex/RULES.md`.** It owns the section order, the per-section rules, and the formatting
   conventions. This command does not restate them.
2. **Read every page under `wiki/`.** Frontmatter carries `title`, `status`, `year`, and `venue`;
   the bolded fact block under it carries dates, roles, authors, and affiliations; `## Summary`
   and the body carry the prose.
3. **Snapshot the project metrics:** `./latex/fetch-metrics.sh`. It prints stars, forks, and
   downloads per month for every project the CV lists. Bake the numbers into `cv.tex` as plain
   text so the CI compile needs no network, and date the note under the section heading.
4. **Regenerate `latex/cv.tex` wholesale.** It is a generated file, so rewrite it rather than
   patching it, and it can never drift from the wiki.
5. **Compile:** `./latex/build.sh`. Fix any LaTeX error and rebuild until it is clean.
6. **Look at the result.** Render the pages (`pdftoppm -png -r 100 latex/cv.pdf`) and read them.
   A PDF that compiles can still be broken: collided columns, a title running into its venue, a
   section that lost its spacing. Check the pages, don't just check the exit code.
7. **Report:** page count, what changed since the last render, and anything the wiki could not
   supply.

## Rules that matter most

- **Never use an em dash**, in the CV or anywhere else. Comma, colon, semicolon, or parentheses
  instead. An en dash in a date range (`Aug. 2023 -- Present`) is fine.
- **Every line traces to a wiki page.** The PDF is a rendering, not a rewrite. If a sentence
  can't be traced to a page, delete it. This is the easiest rule to break while writing fluent
  LaTeX and the most damaging when broken.
- **Never edit `latex/cv.tex` to fix a fact.** Fix the wiki page that owns it, then re-render.
  Editing the generated file puts the CV and the wiki out of sync silently.
- `latex/preamble.tex` and `latex/contact.tex` are hand-maintained. Do not regenerate them.
  Needing a new macro is a reason to add one to the preamble and document it in `RULES.md`.
- **A paper under submission never names its venue.** The PDF is served from a public URL.
- **Gaps stay gaps.** A page with no year renders without one. Never invent a date to fill a
  column; add the missing fact to `todo.md` instead.
- Never commit `cv.pdf`. CI builds it on push and publishes it at `/cv/cv.pdf`.
