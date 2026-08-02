#!/usr/bin/env bash
# Compile latex/cv.tex -> latex/cv.pdf, then clean up the aux files.
# CI does the same thing via .github/workflows/deploy.yml; this is for local checks.
set -euo pipefail

cd "$(dirname "$0")"
[ -d /Library/TeX/texbin ] && export PATH="/Library/TeX/texbin:$PATH"

# Twice, so hyperref's PDF metadata and any page references settle.
for _ in 1 2; do
  pdflatex -interaction=nonstopmode -halt-on-error cv.tex >/dev/null
done

rm -f cv.aux cv.log cv.out cv.fls cv.fdb_latexmk
echo "built latex/cv.pdf ($(du -h cv.pdf | cut -f1))"
