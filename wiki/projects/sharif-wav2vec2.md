---
title: "Sharif-Wav2Vec2.0 — Farsi Speech Recognition Model"
type: project
status: completed
year: 2022
tags: [speech, asr, farsi, wav2vec2, model-release]
domain: speech
---

**Role:** Developer
**Org:** [[../research-experience/sharif-slp-lab]]

Wav2Vec2.0 base model fine-tuned on **108 hours of Farsi audio** from Common Voice. The token
set and language models were adapted to capture Farsi nuances absent from English. A **5-gram
language model** trained with the KenLM toolkit was plugged into the processor, improving
online ASR accuracy.

## Links
[Model](https://huggingface.co/SLPL/Sharif-wav2vec2)

## Related
[[../publications/speech-recognition-review]] — the review this work fed into.
[[nava]] — the other audio-domain project.
