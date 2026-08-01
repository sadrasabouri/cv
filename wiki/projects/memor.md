---
title: "Memor — Conversational Memory Across LLMs"
type: project
status: active
year: 2025
tags: [python, llm, memory, open-source]
domain: nlp
---

**Role:** Lead developer
**Org:** [[../industry-experience/open-science-laboratory|Open Science Laboratory (OpenSciLab)]]
**Distribution:** Python package, on GitHub and PyPI

[![GitHub stars](https://img.shields.io/github/stars/openscilab/memor.svg?style=social&logo=github&label=Stars)](https://github.com/openscilab/memor)
[![GitHub forks](https://img.shields.io/github/forks/openscilab/memor.svg?style=social&logo=github&label=Forks)](https://github.com/openscilab/memor)
[![PyPI downloads](https://static.pepy.tech/badge/memor)](https://pepy.tech/project/memor)

## Summary
Manages the memory of a user's interactions with LLMs. Users can tap the history of past
conversations when prompting, select specific parts of an exchange with one model, and carry
them over to another — bridging otherwise isolated LLM instances so switching between models
is smooth.

The problem it answers is vendor lock-in at the level of the conversation: everything you tell
an LLM stays trapped inside that one environment, so moving to a different model means
re-explaining yourself from scratch. Memor keeps the history, lets the user pick out the parts
that actually matter rather than replaying the whole transcript, and carries that selection
into a session with a different model. Switching models becomes less of a fresh start each
time.

Positioned as a more streamlined, user-facing alternative to solutions like LangChain for
conversational state transfer.

It is part of the natural-language and LLM group of OpenSciLab tools, alongside ToCount and
XNum.

## Links
[GitHub](https://github.com/openscilab/memor/) · [PyPI](https://pepy.tech/project/memor)

## Related
[[../talks/pycon-us-2026-memor-poster|PyCon US 2026 — Memor Poster]] — presented as a poster in Long Beach, May 2026.
[[tocount|ToCount — Lightweight Token Estimator]] — sibling LLM tooling.
[[xnum|XNum — Universal Numeral System Converter]] — another OpenSciLab tool in the same NLP group.
[[../profile/open-source-philosophy|Open Source Philosophy]] — why these tools get written and released at all.
