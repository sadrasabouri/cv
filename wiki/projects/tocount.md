---
title: "ToCount — Lightweight Token Estimator"
type: project
status: active
year: 2025
tags: [python, llm, tokenization, open-source]
domain: nlp
---

**Role:** Developer
**Org:** [[../industry-experience/open-science-laboratory|Open Science Laboratory (OpenSciLab)]]
**Distribution:** Python package, on GitHub and PyPI

[![GitHub stars](https://img.shields.io/github/stars/openscilab/tocount.svg?style=social&logo=github&label=Stars)](https://github.com/openscilab/tocount)
[![GitHub forks](https://img.shields.io/github/forks/openscilab/tocount.svg?style=social&logo=github&label=Forks)](https://github.com/openscilab/tocount)
[![PyPI downloads](https://static.pepy.tech/badge/tocount)](https://pepy.tech/project/tocount)

## Summary
Estimates token counts for LLM input using rule-based and ML methods. Built for prompt
analysis, token budgeting, and optimizing interactions with token-metered systems.

The design point is the cost of getting that number. An exact count means loading a whole
tokenizer; ToCount is for the case where you need the figure quickly — sizing a prompt,
staying inside a token budget — and don't want to pull in a tokenizer just to get it. It
reaches that estimate by rule-based and ML methods.

It is one of the natural-language and LLM tools in the OpenSciLab portfolio, sitting next to
Memor and XNum.

## Links
[GitHub](https://github.com/openscilab/tocount/) · [PyPI](https://pepy.tech/project/tocount)

## Related
[[memor|Memor — Conversational Memory Across LLMs]] — sibling LLM tooling.
[[xnum|XNum — Universal Numeral System Converter]] — the other text-preprocessing utility in the same OpenSciLab NLP group.
[[../profile/open-source-philosophy|Open Source Philosophy]] — why these tools get written and released at all.
