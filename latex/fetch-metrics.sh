#!/usr/bin/env bash
# Snapshot GitHub stars/forks and PyPI downloads for every project the CV lists.
#
# /render runs this and bakes the numbers into cv.tex as plain text, because a PDF
# has no live badges. The numbers are therefore true as of the render, not as of the
# CI compile, and the CV says so under the section heading.
#
# Downloads are last-30-days from pypistats. Lifetime totals (what the wiki badges
# show via pepy.tech) need an API key that this repo does not have.
set -uo pipefail

# slug|github owner/repo|pypi package    (empty field = not applicable)
PROJECTS="
memor|openscilab/memor|memor
tocount|openscilab/tocount|tocount
xnum|openscilab/xnum|xnum
ipspot|openscilab/ipspot|ipspot
drux|openscilab/drux|drux
pymilo|openscilab/pymilo|pymilo
opr|openscilab/opr|opr
nava|openscilab/nava|nava
samila|sepandhaghighi/samila|samila
nafas|sepandhaghighi/nafas|nafas
mytimer|sepandhaghighi/mytimer|mytimer
art|sepandhaghighi/art|art
pycm|sepandhaghighi/pycm|pycm
pyrgg|sepandhaghighi/pyrgg|pyrgg
opem|ECSIM/opem|opem
"

printf '%-16s %8s %8s %12s\n' project stars forks dl/month

echo "$PROJECTS" | while IFS='|' read -r slug repo pkg; do
  [ -z "${slug:-}" ] && continue

  stars="-"; forks="-"; dl="-"
  if [ -n "$repo" ]; then
    json=$(curl -sf -m 15 "https://api.github.com/repos/$repo" || true)
    if [ -n "$json" ]; then
      stars=$(printf '%s' "$json" | python3 -c 'import sys,json;print(json.load(sys.stdin).get("stargazers_count","-"))' 2>/dev/null || echo "-")
      forks=$(printf '%s' "$json" | python3 -c 'import sys,json;print(json.load(sys.stdin).get("forks_count","-"))' 2>/dev/null || echo "-")
    fi
  fi
  if [ -n "$pkg" ]; then
    dl=$(curl -sf -m 15 "https://pypistats.org/api/packages/$pkg/recent" 2>/dev/null \
      | python3 -c 'import sys,json;print(json.load(sys.stdin)["data"]["last_month"])' 2>/dev/null || echo "-")
  fi

  printf '%-16s %8s %8s %12s\n' "$slug" "$stars" "$forks" "$dl"
done
