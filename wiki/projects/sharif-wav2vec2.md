---
title: "Sharif-Wav2Vec2.0 — Farsi Speech Recognition Model"
type: project
status: completed
year: 2022
tags: [speech, asr, farsi, wav2vec2, model-release]
domain: speech
---

**Role:** Developer
**Org:** [[../research-experience/sharif-slp-lab|Sharif University of Technology — Speech and Language Processing Lab]]
**Base model:** Wav2Vec2.0, tailored for Farsi
**Training data:** 108 hours of Farsi audio from Common Voice
**Release:** Hugging Face, `SLPL/Sharif-wav2vec2`

## Summary
A Wav2Vec2.0 speech-processing model tailored for Farsi: the base model, fine-tuned on 108
hours of Farsi audio from Common Voice. Adapting it was not only a matter of retraining. The
token set and the language models were reworked to handle the things Farsi does and English
does not, so the released model captures the nuances of the language rather than being an
English-shaped model pointed at Farsi audio. On top of that, a 5-gram language model trained
with the KenLM toolkit was plugged into the processor, which noticeably improved accuracy on
online ASR. The model is published openly on Hugging Face under the SLPL organization as
`SLPL/Sharif-wav2vec2`.

## Links
[Model](https://huggingface.co/SLPL/Sharif-wav2vec2)

## Related
[[../publications/speech-recognition-review|A Review of the Recent Speech Recognition Methods]] — the review this work fed into.
[[nava|Nava — OS-Native Sound Engine in Python]] — the other audio-domain project.
