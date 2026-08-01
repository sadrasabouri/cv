---
title: "IPSpot — System IP Address Fetcher"
type: project
status: active
year: 2025
tags: [python, networking, open-source]
domain: network
---

**Role:** Developer
**Org:** [[../industry-experience/open-science-laboratory|Open Science Laboratory (OpenSciLab)]]
**Domain:** Network tooling — a Python tool to fetch the system's IP address

[![GitHub stars](https://img.shields.io/github/stars/openscilab/ipspot.svg?style=social&logo=github&label=Stars)](https://github.com/openscilab/ipspot)
[![GitHub forks](https://img.shields.io/github/forks/openscilab/ipspot.svg?style=social&logo=github&label=Forks)](https://github.com/openscilab/ipspot)
[![PyPI downloads](https://static.pepy.tech/badge/ipspot)](https://pepy.tech/project/ipspot)

## Summary
IPSpot tells you your system's IP address and where it looks like you are. It reports the
private address the machine holds on its own network as well as the public address the rest of
the internet sees it from, and it handles both IPv4 and IPv6, so the answer does not depend on
which of the two a given network happens to be running.

Location comes back with the address: alongside the IP itself, IPSpot reports where that address
appears to place the machine geographically. Because that information has to be asked for from
an outside service, IPSpot does not depend on a single one. It queries several API providers and
falls back to the next when one of them is down, which is what keeps a lookup from failing
simply because one provider is having a bad day.

IPSpot belongs to the network group of Sadra's open-source work, alongside
[[pyrgg|PyRGG — Python Random Graph Generator]].

## Links
[GitHub](https://github.com/openscilab/ipspot) · [PyPI](https://pepy.tech/project/ipspot)

## Related
[[pyrgg|PyRGG — Python Random Graph Generator]] — sibling network-domain tool.
