---
title: "ReaxFF Parameter Set for Boron Clusters and Icosahedral Boron Crystals"
type: publication
status: published
year: 2025
venue: Journal of Physical Chemistry C
tags: [chemistry, dft, machine-learning-potentials, materials]
---

**Full title:** ReaxFF Parameter Set for Boron Clusters and Icosahedral Boron Crystals:
Comparison with Density Functional Theory and Machine-Learning Potentials

**Authors:** Amin Ahmadisharaf, Adri C. T. van Duin, Bin Liu, Dylan Evans, **Sadra Sabouri**,
Jeffrey Comer
**Venue:** The Journal of Physical Chemistry C (JPCC), 2025

## Summary
Icosahedral boron is a candidate material for semiconductors and energy storage, but the
synthesis conditions that yield high-quality crystals of it have had to be found in a lab. This
paper tunes a ReaxFF parameter set so those conditions can be predicted on a computer instead.

The parameters were fitted by matching the relative energies of small B80 clusters against
density functional theory data, and the result is compared against both DFT and machine-learning
potentials — the comparison the paper's subtitle names. What the fit buys is a model that
follows nucleation and growth properly, rather than one that only reproduces cluster energies.

Not having such a model had been one of the things holding icosahedral boron back from
semiconductor and energy-storage use, so a parameter set that captures nucleation and growth
removes a standing obstacle to developing the material.

## Links
[Paper](https://pubs.acs.org/doi/full/10.1021/acs.jpcc.5c04822) ·
[GitHub](https://github.com/ECSIM/dbfc-dataset)

## Related
[[dbfc-dataset|Experimental Dataset of Electrochemical Efficiency of a Direct Borohydride Fuel Cell (DBFC)]] — earlier chemistry collaboration, and the two share the ECSIM repository.
[[representative-sample-size-ks|Representative Sample Size for Estimating Saturated Hydraulic Conductivity via Machine Learning]] — same first author, Amin Ahmadisharaf.
[[../projects/opem|OPEM — Open Source PEM Fuel Cell Simulation Tool]] — the third strand of Sadra's chemical data science work, alongside this paper and the DBFC dataset.
