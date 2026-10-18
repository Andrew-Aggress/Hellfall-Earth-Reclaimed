# M1 Integration Audit

## Result

**Conditionally Ready for UE integration**

Validation result: `M1 Integration Ready validation: PASS`

## Verified scope

- 14 required integration files checked.
- 10 external aliases mapped to canonical project IDs.
- 3 weapon/ability rows validated.
- 33 localization rows validated across 7 locales: English, Ukrainian, Russian, German, Polish, French, Italian.
- 10 asset manifest rows validated with source revision, license status, status, texture budget, and memory budget.
- 10 M1 wave rows validated against the canonical enemy balance table.
- Existing M1 placement, Blueprint event, objective, pickup, performance, and QA packages remain indexed.
- Offline Mode is explicitly supported; online rules are optional and authority-ready.
- No external alias leaks into runtime gameplay, UI, or online contract documents.
- Localization fallback policy is covered by `Tools/TestM1LocalizationFallback.ps1`; UE String Table runtime behavior remains a post-import check.

## First UE integration sequence

1. Run `Tools/ValidateM1IntegrationReady.ps1 -Strict`.
2. Open the project in Unreal Engine 5.8.
3. Import the four M1 DataTable templates.
4. Create Gameplay Tags and Enhanced Input actions from the contracts.
5. Create the six M1 Blueprint actors and bind canonical events.
6. Build the E1M1 blockout from the placement map.
7. Run the offline M1 smoke test and seven-locale UI pass.
8. Capture the performance baseline in a Development build.

## Deferred until UE is available

- Blueprint/C++ implementation and runtime debugging.
- Final meshes, animation, VFX, audio, voice recording, and material authoring.
- Packaged-build performance capture.
- EOS/LAN session implementation and multiplayer playtest.
