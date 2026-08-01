---
title: "OPEM — Open Source PEM Fuel Cell Simulation Tool"
type: project
status: active
year: 2019
tags: [python, fuel-cell, simulation, open-source]
domain: chemistry
---

**Role:** Developer
**Org:** ECSIM
**Full name:** Open-Source PEMFC Simulation Tool
**Domain:** Chemical data science — the tooling strand alongside the DBFC dataset and the ReaxFF boron work

## Summary
OPEM, the Open-Source PEMFC Simulation Tool, evaluates how a proton exchange membrane fuel cell
performs and predicts its optimum operating parameters. It bundles both static and dynamic
models of the cell in one package.

The models are deliberately generic in what they accept. On the operating side they take the
anode and cathode feed gas, its pressure and composition, the cell temperature, and the current
density; on the hardware side they take the cell's own parameters, such as active area and
membrane thickness.

OPEM is developed under the ECSIM GitHub organisation and distributed as a Python package on
PyPI. It is the simulation half of Sadra's chemical data science work, whose experimental and
atomistic halves are the DBFC dataset and the ReaxFF boron parameter set.

## Links
[GitHub](https://github.com/ECSIM/opem) · [PyPI](http://pepy.tech/project/opem)

## Related
[[../publications/dbfc-dataset|Experimental Dataset of Electrochemical Efficiency of a Direct Borohydride Fuel Cell (DBFC)]] — fuel cell dataset from the same ECSIM context, the measured counterpart to these simulations.
[[../publications/reaxff-boron-clusters|ReaxFF Parameter Set for Boron Clusters and Icosahedral Boron Crystals]] — the third piece of the same chemical data science strand.
