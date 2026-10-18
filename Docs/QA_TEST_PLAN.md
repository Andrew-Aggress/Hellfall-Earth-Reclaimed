# QA Test Plan

## Smoke tests

- project opens without missing modules;
- default map loads;
- player can move and look;
- weapon fires;
- enemy can be damaged;
- player can die and restart;
- HUD appears;
- save and load complete;
- language can be changed.

## Movement tests

- slide under low clearance;
- slide into a wall;
- jump from moving platform;
- land on a narrow platform;
- change direction during air control;
- exit slide at the edge of a platform;
- test controller and keyboard/mouse separately.

## Combat tests

- damage applies to health and armor correctly;
- critical hit uses the correct multiplier;
- ammo cannot become negative;
- impact effects match surface type;
- enemies do not attack through walls;
- enemy death notifies encounter system;
- boss phase cannot be skipped accidentally;
- all weapons work after save/load.

## Mission tests

- objectives update in the correct order;
- optional objective does not block main mission;
- objective state survives loading;
- locked doors open only after their condition;
- encounter completion is deterministic;
- secret reward is granted once;
- mission completion triggers the correct next mission.

## Localization tests

- no missing keys;
- no fallback English where translation exists;
- Cyrillic glyphs render correctly;
- German and French text does not clip;
- Polish diacritics render correctly;
- pluralization works for one, few, and many;
- subtitles match voice timing;
- changing language updates menus and HUD.

## Multiplayer tests

- two players can join;
- player movement remains responsive under latency;
- damage is server-authoritative;
- pickups cannot be collected twice;
- mission state is shared;
- revive works;
- disconnect does not corrupt the save;
- late join receives current objective state.

## Performance tests

- greybox target remains near 120 FPS;
- shader compilation does not stall combat;
- VFX remain within frame budget;
- AI tick rate scales with distance;
- memory does not grow after repeated level reloads;
- packaged build is tested separately from editor.
