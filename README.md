# `REAMDE.md` for [smol-puhe](https://github.com/Ai-Yukino/smol-puhe)

- Extract estimates for the first three formants `F1`, `F2`, and `F3` and the fundamental frequency `F0` from audio clips listed in `validated.tsv` from the [Common Voice Corpus 9.0 - Finnish dataset](https://commonvoice.mozilla.org/en/datasets) using [Praat](https://www.fon.hum.uva.nl/praat/)
- Build a model which predicts the perceived gender of a speaker based on a relationship between the formants `F1`, `F2`, and `F3` and the fundamental frequency `F0`
- Redo of [puhe](https://github.com/Ai-Yukino/puhe) repo without audio files and with `.gitignore` which ignores any additional `.mp3` and `.wav` files you add to your locally cloned repo

---

## 🔗 links 🔗

- [📝 Docs for Common Voice Dataset](https://github.com/common-voice/cv-dataset#readme)

### 🔗🔗 Good introduction to formants

- [🎥 Speech Acoustics 4 - Source-filter model | Listen Lab](https://www.youtube.com/watch?v=wUE6Q8l17qI) (9 minutes)
  - Good starting place to build intuition about what formants are
- [🎥 Speech Acoustics 5 - vowel formants | Listen Lab](https://www.youtube.com/watch?v=glnUFa2fLyE) (10 minutes)
  - More details about formants
- [🎥 Praat 3 - Formant settings | Listen Lab](https://www.youtube.com/watch?v=fsGIecMgTzQ) (7 minutes)
  - Motivation for why we need to manually tweak Praat parameters for each individual speaker

## 📦 Versions 📦

### Ai's computer

- tidyverse 1.3.1
- R version 4.2.0 (2022-04-22 ucrt)
- RStudio 2022.02.3+492 "Prairie Trillium" Release (1db809b8323ba0a87c148d16eb84efe39a8e7785, 2022-05-20) for Windows
  Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) QtWebEngine/5.12.8 Chrome/69.0.3497.128 Safari/537.36
- Praat version 6.2.14 (May 24, 2022)
  - [FastTrack plugin](https://github.com/santiagobarreda/FastTrack)
    - Repo cloned on June 8, 2022
    - Last commit on that day is probably [this](https://github.com/santiagobarreda/FastTrack/commit/1fa7a8c1263070372aff30fde02b5ed23f0c2839)
