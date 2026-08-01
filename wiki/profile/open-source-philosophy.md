---
title: "Open Source Philosophy"
type: profile
status: active
tags: [open-source, reproducibility, open-science]
---

**Framing:** *Open World Development* — the second of the two theses Sadra organises his work
around; the first is [[../profile/research-agenda|Research Agenda]], framed on his site as
*AI Integration Challenges*.
**Organisation:** co-founded [OpenSciLab](https://github.com/openscilab/) with a group of friends.
Separately, Sadra co-leads an open-source team that builds scientific tools.

## Summary
Open-sourcing NLP research is what got the field to things like ChatGPT. The same openness now
makes it very cheap to produce work that looks convincing and is quietly wrong. Sadra calls this
the **Frankenstein-Trojan problem**: the monster is one we built ourselves, and since there is no
reliable way to evaluate it, it walks straight into our own science unnoticed. The threat is not
an outsider attacking the field's standards — it is the field's own output, assembled from
legitimate-looking parts, arriving inside the gates unchallenged.

## Auditable Science
The response is to write artifacts that people can rerun. Software is one of the few domains
where nobody has to take anyone's word for anything: no lab, no samples, no budget — you run the
thing on your own machine and see whether you get what the author got. That makes it an unusually
auditable science, and Sadra's position is that the field does not lean on this nearly enough.
It follows that reproducibility and transparency are properties of the tooling rather than of the
paper: software that makes its own workings inspectable is what lets the check actually happen.

## OpenSciLab
OpenSciLab was co-founded with a group of friends, to build those rerunnable artifacts.

## The Work
The output is grouped by topic — OpenSciLab projects, datasets, and things Sadra built on his
own:

- Natural language processing and large language models — [[../projects/tocount|ToCount — Lightweight Token Estimator]], [[../projects/xnum|XNum — Universal Numeral System Converter]], [[../projects/memor|Memor — Conversational Memory Across LLMs]], [[../projects/naab|naab — Farsi Text Corpus]], [[../publications/parsipy|ParsiPy: NLP Toolkit for Historical Persian Texts in Python]], [[../publications/pahgen|PahGen: Generating Ancient Pahlavi Text via Grammar-Guided Zero-Shot Translation]], [[../publications/docalog|Docalog: Multi-Document Dialogue System Using Transformer-Based Span Retrieval]]
- Speech processing — [[../projects/nava|Nava — OS-Native Sound Engine in Python]], [[../projects/sharif-wav2vec2|Sharif-Wav2Vec2.0 — Farsi Speech Recognition Model]]
- Machine learning — [[../projects/pycm|PyCM — Multi-Class Confusion Matrix Library]], [[../projects/pymilo|PyMilo — Python Library for ML I/O]]
- Network — [[../projects/pyrgg|PyRGG — Python Random Graph Generator]], [[../projects/ipspot|IPSpot — System IP Address Fetcher]]
- Art — [[../projects/samila|Samila — Generative Art Generator]], [[../projects/art|Art — ASCII Art Library for Python]]
- Human-computer interaction — [[../projects/nafas|Nafas — Breathing Gymnastics Application]], [[../projects/mytimer|MyTimer — A Timer for Command Line Enthusiasts]]
- Chemical data science — [[../publications/reaxff-boron-clusters|ReaxFF Parameter Set for Boron Clusters and Icosahedral Boron Crystals]], [[../publications/dbfc-dataset|Experimental Dataset of Electrochemical Efficiency of a Direct Borohydride Fuel Cell (DBFC)]], [[../projects/opem|OPEM — Open Source PEM Fuel Cell Simulation Tool]]
- Biomedical data science — [[../projects/drux|Drux — Drug Release Analysis Framework]], [[../projects/opr|OPR — Optimized Primer Design Tool]]
- Environmental data science — [[../publications/representative-sample-size-ks|Representative Sample Size for Estimating Saturated Hydraulic Conductivity via Machine Learning]]

## Links
[OpenSciLab](https://github.com/openscilab/)

## Related
[[../industry-experience/open-science-laboratory|Open Science Laboratory (OpenSciLab)]] — the organization and its output.
[[../projects/pymilo|PyMilo — Python Library for ML I/O]] — the clearest expression of the idea: non-executable, inspectable model serialization.
