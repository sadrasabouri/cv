---
title: "PyMilo: A Python Library for ML I/O"
type: publication
status: accepted
year: 2026
venue: JOSS
tags: [machine-learning, serialization, open-source, tooling]
---

**Authors:** AmirHosein Rostami, Sepand Haghighi, **Sadra Sabouri**, Alireza Zolanvari
**Venue:** Journal of Open Source Software (JOSS), 2026

## Summary
The paper treats saving a machine learning model as a safety and transparency problem rather
than a convenience one. Existing ML model storage formats — pickle and other binary formats —
have real reliability, safety, and transparency problems, and PyMilo answers them by
serializing models into a transparent, **non-executable** format that can be inspected before
it is used.

## The problem with pickle
Saving a model with pickle means shipping executable code. What the other side receives is
code that runs on their machine, and it comes back as the model the sender had only if they
load it in the same environment the sender was in. Both halves of that are taken on trust: the
receiver cannot see what the file will do until it has already done it, and the sender is
hoping the receiving environment matches their own.

## A transparent, non-executable format
PyMilo writes models into a representation that carries no executable content, so loading a
model is not the same act as running someone else's code. Because the representation is
transparent, you can read what you are about to load before you load it, instead of learning
what was in it by running it. The result is the point the paper is making: exchanging a
trained model stops being an act of faith and becomes something the receiving side can check
for itself.

## Links
[Paper](https://joss.theoj.org/papers/10.21105/joss.08858)

## Related
[[../projects/pymilo|PyMilo — Python Library for ML I/O]] — the library itself.
[[../profile/open-source-philosophy|Open Source Philosophy]] — the clearest instance of the transparency argument.
[[../references/sepand-haghighi|Sepand Haghighi]] — co-author on the paper.
