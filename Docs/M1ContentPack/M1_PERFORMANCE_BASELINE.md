# M1 Performance Baseline

## Baseline target

The first packaged Development build should target 60 FPS at 2560x1440, High quality, with the M1 defense wave active. The frame budget is 16.7 ms; a sustained result above 16.7 ms blocks `Ready for UE integration` until profiled and justified.

## Measurement setup

- Map: `L_FirstSlice_Arena`.
- Test position: Relay Chamber center, facing the Upper Catwalk.
- Combat load: full `E1M1_ENC_03` defense wave with VFX and audio active.
- Runs: three 60-second captures after shader compilation and asset streaming settle.
- Record average FPS, 1% low FPS, game thread, render thread, GPU time, memory, draw calls, Niagara particle count, and audio memory.

## Initial budgets

| Metric | Target | Blocker threshold | Measurement |
|---|---:|---:|---|
| Average frame time | <= 16.7 ms | > 20.0 ms sustained | Unreal Insights/Stat Unit |
| 1% low frame time | <= 25.0 ms | > 33.3 ms | Unreal Insights |
| Draw calls | <= 2,500 | > 4,000 | Stat RHI |
| Visible Niagara particles | <= 5,000 | > 10,000 | Niagara debug/stat capture |
| Texture pool usage | <= 75% | > 90% | Stat Streaming/Memory |
| Audio memory for M1 | <= 128 MB | > 192 MB | Audio Insights |
| Loaded M1 actors | <= 1,200 | > 1,800 | Stat Levels/Gameplay Debugger |
| Shader compile errors | 0 | Any error | Output log/package test |

## Test passes

### Pass A — Empty arena

Confirm baseline rendering, lighting, navigation, and map startup without enemies.

### Pass B — Full relay defense

Spawn all M1 relay waves, activate VFX/audio, and capture the metrics above.

### Pass C — Stress route

Run from Spawn Bunker through Junction, Secret Aegis Room, Relay Chamber, and Subway Gate Arena without restarting the map.

### Pass D — Localization and UI

Repeat the relay defense in `en`, `uk`, `ru`, `de`, `pl`, `fr`, and `it` (English, Ukrainian, Russian, German, Polish, French, and Italian); check that text expansion does not change layout or performance materially.

## Record format

Store results in `Docs/ContentTables/ASSET_IMPORT_MANIFEST.csv` for asset-level regressions and in the QA run record with build version, GPU, resolution, language, map revision, and tester.

## Acceptance

M1 passes the baseline when all blocker thresholds are avoided, no critical visual/audio events are missing, and the full QA checklist has no unresolved blocking item.
