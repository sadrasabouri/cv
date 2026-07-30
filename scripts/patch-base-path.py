#!/usr/bin/env python3
"""Fix Quartz's hardcoded content-index URL for base-path deployments.

Quartz v5.0.0 hardcodes `fetch("/static/contentIndex.json")` in the explorer,
graph, and search inline scripts. This site is a GitHub *project* page served at
https://sadrasabouri.github.io/cv/, so that absolute path resolves to the domain
root and 404s. All three components fetch it, so all three silently do nothing:
the explorer shows no folders, the graph never renders, and search returns
nothing. Everything server-rendered still looks fine, which is what makes it
hard to spot.

The fix rewrites it to a path relative to the page's own depth, which the page
already knows from `<body data-slug>`. Correct at any base path, including local
preview served at /.

Usage: patch-base-path.py <path-to-.quartz/plugins>
"""

import pathlib
import sys

OLD = 'fetch("/static/contentIndex.json")'
NEW = (
    'fetch("../".repeat((document.body?.dataset?.slug ?? "index").split("/").length - 1)'
    ' + "static/contentIndex.json")'
)

PLUGINS = ["explorer", "graph", "search"]

# Quartz bundles the compiled dist/, not src/ — patching src alone changes
# nothing. Patch both so the source stays readable and the build is correct.
SUBPATHS = [
    "src/components/scripts/{name}.inline.ts",
    "dist/index.js",
    "dist/components/index.js",
]


def main() -> int:
    if len(sys.argv) != 2:
        print("usage: patch-base-path.py <path-to-.quartz/plugins>", file=sys.stderr)
        return 2

    root = pathlib.Path(sys.argv[1])
    if not root.is_dir():
        print(f"error: {root} is not a directory", file=sys.stderr)
        return 1

    patched = already = 0
    unfixed = []

    for name in PLUGINS:
        hit = False
        for sub in SUBPATHS:
            path = root / name / sub.format(name=name)
            if not path.exists():
                continue
            source = path.read_text()
            if NEW in source:
                already += 1
                hit = True
            elif OLD in source:
                path.write_text(source.replace(OLD, NEW))
                print(f"  patched  {name}/{sub.format(name=name)}")
                patched += 1
                hit = True
        if not hit:
            unfixed.append(name)

    # A plugin with no occurrence anywhere means upstream changed the code.
    # Fail loudly rather than deploy a site whose explorer, graph, and search
    # are silently dead.
    for name in unfixed:
        print(f"  FAILED   {name}: content-index fetch not found in src or dist", file=sys.stderr)

    print(f"base-path patch: {patched} patched, {already} already done, {len(unfixed)} failed")
    return 1 if unfixed else 0


if __name__ == "__main__":
    raise SystemExit(main())
