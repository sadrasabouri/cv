---
title: "PyMilo — Python Library for ML I/O"
type: project
status: active
year: 2024
tags: [python, machine-learning, serialization, mlops, open-source]
domain: machine-learning
---

**Role:** Co-developer
**Org:** [[../industry-experience/open-science-laboratory|Open Science Laboratory (OpenSciLab)]]
**Adoption:** 13k+ downloads.

## Summary
A flexible I/O interface for ML pipelines, built around one problem: saving a model with
pickle means shipping executable code and hoping the other side loads it in the same
environment you had. PyMilo serializes ML models into a transparent, non-executable format
instead, so you can read what you are about to load before you load it, and exchanging a
trained model stops being an act of faith. It is the first ML serialization package to provide
a safe and transparent representation of models — comparable in intent to Hugging Face's
safetensors, but for full model objects.

## Links
[GitHub](https://github.com/openscilab/pymilo) · [PyPI](http://pepy.tech/project/pymilo)

## Related
[[../publications/pymilo|PyMilo: A Python Library for ML I/O]] — the JOSS paper.
[[../profile/open-source-philosophy|Open Source Philosophy]] — the transparency argument this library embodies.
[[pycm|PyCM — Multi-Class Confusion Matrix Library]] — sibling ML tooling.
