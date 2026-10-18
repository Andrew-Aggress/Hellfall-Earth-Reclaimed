# Localization Production Guide

## Supported languages

```text
en — English
uk — Ukrainian
ru — Russian
de — German
pl — Polish
fr — French
it — Italian
```

## Source of truth

English is the source language for keys and narrative intent. All player-facing text must use stable keys and `FText`. Translators receive context, speaker, character limit, and gameplay location.

## Required metadata

```text
Key
Source text
Context
Speaker
Maximum length
Voice required
Priority
Translation status
Review status
```

## Quality rules

- never translate key names;
- preserve placeholders and variables;
- preserve markup tags;
- test Cyrillic fonts in every HUD state;
- allow 30% expansion for German and French;
- test Polish diacritics and punctuation;
- test plural forms for every language;
- never hardcode text in C++ or Blueprint;
- verify subtitles against recorded audio.

## Review stages

1. Machine or first-pass translation.
2. Native-language editing.
3. Gameplay context review.
4. Voice recording review.
5. In-game clipping and overflow test.
6. Final linguistic sign-off.
