---
title: "FlashScript: Compiling Recurring Agent Workflows into Reusable Neuro-Symbolic Programs"
type: publication
status: under-submission
year: 2026
tags: [ai-agents, program-synthesis, neuro-symbolic, llm]
---

**Authors:** **S Sabouri**, H Hasanbeig, A Sage, S Sinha, C Darling, A Tiwari, K Garms, S Chattopadhyay, S Gulwani
**Status:** Under submission, 2026

## Summary
Proposes compiling a successful agent run into a reusable neuro-symbolic program (NSP), following
a set of guidelines called FlashScript: actions and data transformations become code,
instance-specific values become parameters, and judgment-heavy decisions become LLM calls. On
120 WorkBench analytics tasks with Claude Haiku 4.5, the NSPs produced correct results with
identical tool calls on every run, using about 70 times fewer input tokens and about a third of
the runtime of a skill-guided agent whose runs were inconsistent. On a composite version of the
tasks the skill-guided agent's accuracy fell to 23% while the NSPs stayed correct and
consistent, and the NSPs generalized to 108 unseen instances of the same templates.

## Links
[Paper](https://arxiv.org/abs/2610.33876)

## Related
[[../industry-experience/microsoft-prose-internship|Microsoft PROSE — Applied Scientist Intern]]: co-authored with the PROSE team the internship was spent on.
[[../references/sumit-gulwani|Sumit Gulwani]]: co-author.
[[../references/katie-garms|Katie Garms]]: co-author.
[[../references/souti-chattopadhyay|Souti Chattopadhyay]]: co-author.
