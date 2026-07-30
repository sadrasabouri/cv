#!/usr/bin/env bash
# Preview the wiki locally exactly as CI builds it.
#
#   ./scripts/preview.sh          build and serve on http://localhost:8080
#   ./scripts/preview.sh --build  build only, into ./public
#
# Quartz is fetched into .quartz-engine/ (gitignored) at the same pinned tag
# the deploy workflow uses. Delete that directory to force a clean refetch.
set -euo pipefail

QUARTZ_VERSION="v5.0.0"
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ENGINE="$REPO_ROOT/.quartz-engine"

if [ ! -d "$ENGINE" ]; then
  echo "Fetching Quartz $QUARTZ_VERSION..."
  git clone --quiet --depth 1 --branch "$QUARTZ_VERSION" \
    https://github.com/jackyzha0/quartz.git "$ENGINE"
fi

cp "$REPO_ROOT/quartz.config.yaml" "$REPO_ROOT/quartz.lock.json" "$ENGINE/"
cd "$ENGINE"

[ -d node_modules ] || npm ci
npx quartz plugin install

# See scripts/patch-base-path.py — Quartz hardcodes an absolute content-index URL
# that breaks the explorer, graph, and search on a base-path deployment.
python3 "$REPO_ROOT/scripts/patch-base-path.py" "$ENGINE/.quartz/plugins"

if [ "${1:-}" = "--build" ]; then
  exec npx quartz build -d "$REPO_ROOT/wiki" -o "$REPO_ROOT/public"
fi

echo "Serving on http://localhost:8080 — Ctrl-C to stop"
exec npx quartz build -d "$REPO_ROOT/wiki" -o "$REPO_ROOT/public" --serve --watch
