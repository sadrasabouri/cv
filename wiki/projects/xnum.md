---
title: "XNum — Universal Numeral System Converter"
type: project
status: active
year: 2025
tags: [python, i18n, numerals, open-source]
domain: nlp
---

**Role:** Developer
**Org:** [[../industry-experience/open-science-laboratory|Open Science Laboratory (OpenSciLab)]]
**Distribution:** Python package, on GitHub and PyPI

[![GitHub stars](https://img.shields.io/github/stars/openscilab/xnum.svg?style=social&logo=github&label=Stars)](https://github.com/openscilab/xnum)
[![GitHub forks](https://img.shields.io/github/forks/openscilab/xnum.svg?style=social&logo=github&label=Forks)](https://github.com/openscilab/xnum)
[![PyPI downloads](https://static.pepy.tech/badge/xnum)](https://pepy.tech/project/xnum)

## Summary
Converts digits across numeral systems — English, Persian, Hindi, Arabic-Indic, Bengali, and
others. Auto-detects mixed formats and converts only the numbers, leaving surrounding text
untouched, which makes multilingual and localized data handling straightforward.

The useful part is that second behaviour: XNum finds the numbers inside mixed text and
rewrites only those, so a sentence that mixes scripts comes back with its numerals normalized
and everything else exactly as it was. Anyone who has cleaned a Persian text by hand knows why
the library exists.

It belongs to the natural-language and LLM group of OpenSciLab tools.

## Links
[GitHub](https://github.com/openscilab/xnum/) · [PyPI](https://pepy.tech/project/xnum)

## Related
[[naab|naab — Farsi Text Corpus]] — the other Persian-language data effort.
[[tocount|ToCount — Lightweight Token Estimator]] — sibling text utility in the same OpenSciLab NLP group.
[[../profile/open-source-philosophy|Open Source Philosophy]] — why these tools get written and released at all.
