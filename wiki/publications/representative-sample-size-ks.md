---
title: "Representative Sample Size for Estimating Saturated Hydraulic Conductivity via Machine Learning"
type: publication
status: published
year: 2024
venue: Water Resources Research
tags: [machine-learning, hydrology, sample-size, xgboost]
---

**Full title:** Representative sample size for estimating saturated hydraulic conductivity via
machine learning: A proof-of-concept study

**Authors:** Amin Ahmadisharaf, Reza Nematirad, **Sadra Sabouri**, Yakov Pachepsky,
Behzad Ghanbarian
**Venue:** Water Resources Research (AGU), 2024

## Summary
Hydrology adopted machine learning widely but rarely examined how data heterogeneity and sample
size affect accuracy. This proof-of-concept study asks the question directly for one target:
saturated hydraulic conductivity (Ks).

The study draws on roughly **18,000 soil samples** from the USKSAT database and measures how
training size changes estimation accuracy. XGBoost models are trained over repeated random
subsets of the database, so accuracy can be plotted as a function of how much data the model
was given rather than reported at a single dataset size.

The result is a negative one, and that is the point: the learning and validation curves **never
flattened out**, even at ~18,000 samples — accuracy had not stopped improving with added data,
so the field's working assumption about what counts as "enough data" for Ks estimation does not
hold even at that scale.

## Links
[Paper](https://agupubs.onlinelibrary.wiley.com/doi/pdfdirect/10.1029/2023WR036783)

## Related
[[reaxff-boron-clusters|ReaxFF Parameter Set for Boron Clusters and Icosahedral Boron Crystals]] — same first author, Amin Ahmadisharaf, and an adjacent computational-science collaboration.
