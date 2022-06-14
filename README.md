# `REAMDE.md` for [smol-puhe](https://github.com/Ai-Yukino/smol-puhe)

- Extract estimates for the first four formants `F1`, `F2`, `F3`, and `F4`, and the fundamental frequency `F0` from audio clips listed in `validated.tsv` from the [Common Voice Corpus 9.0 - Finnish dataset](https://commonvoice.mozilla.org/en/datasets) using [Praat](https://www.fon.hum.uva.nl/praat/)
- Build a model which predicts the perceived gender of a speaker based on a relationship between the formants `F1`, `F2`, `F3`, `F4`, and the fundamental frequency `F0`
- Redo of [puhe](https://github.com/Ai-Yukino/puhe) repo without audio files and with `.gitignore` which ignores any additional `.mp3` and `.wav` files you add to your locally cloned repo

---

## 💬 Voice sample clips 💬

If you don't want to downlaod the full data set above, you can listen to and download the 10 sample clips we used in our analysis below:

### Female speaker sample clips

- [Female speaker 1 sample clip](https://whyp.it/t/female-speaker-1-sample-clip-aMBR5)
- [Female speaker 2 sample clip](https://whyp.it/t/female-speaker-2-sample-clip-aO9WL)
- [Female speaker 5 sample clip](https://whyp.it/t/female-speaker-5-sample-clip-dPJ0W)
- [Female speaker 7 sample clip](https://whyp.it/t/female-speaker-7-sample-clip-aQLYL)
- [Female speaker 9 sample clip](https://whyp.it/t/female-speaker-9-sample-clip-dRBZK)

### Male speaker sample clips

- [Male speaker 17 sample clip](https://whyp.it/t/male-speaker-17-sample-clip-eVZ4W)
- [Male speaker 18 sample clip](https://whyp.it/t/male-speaker-18-sample-clip-bWB5v)
- [Male speaker 23 sample clip](https://whyp.it/t/male-speaker-23-sample-clip-eXVgA)
- [Male speaker 26 sample clip](https://whyp.it/t/male-speaker-26-sample-clip-bYXjn)
- [Male speaker 29 sample clip](https://whyp.it/t/male-speaker-29-sample-clip-eZXkR)

## 🔗 Other links 🔗

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
