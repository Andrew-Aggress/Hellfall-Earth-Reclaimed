# Save, Settings, and Progression

## Save slots

- three manual campaign slots;
- one autosave slot;
- one quicksave slot;
- one profile-wide settings file.

## Saved campaign state

- current episode;
- current mission;
- checkpoint ID;
- player health and armor;
- ammunition;
- unlocked weapons;
- purchased upgrades;
- discovered secrets;
- completed optional objectives;
- mission difficulty;
- localization-independent IDs;
- save version.

## Save safety

- write to a temporary file first;
- validate checksum;
- replace the previous save only after a successful write;
- preserve a backup of the previous valid save;
- migrate old save versions explicitly.

## Settings categories

- graphics;
- display;
- input;
- controller;
- audio;
- subtitles;
- accessibility;
- language;
- gameplay;
- network.

## Progression rules

- campaign progression is mission-based;
- upgrades are earned through exploration and objectives;
- difficulty does not lock story content;
- New Game Plus preserves upgrades but remixes encounter composition;
- multiplayer progression is server-authoritative;
- cosmetic rewards never affect combat balance.
