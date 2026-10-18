# M1 Integration Checklist

## Import order

- [ ] Confirm Unreal Engine 5.8 and project plugins are available.
- [ ] Import `Docs/ContentTables/ASSET_IMPORT_MANIFEST.csv` rows marked `Planned` into the documented `/Game/Hellfall/` folders.
- [ ] Create Gameplay Tags from weapon, ability, objective, wave, and event contracts.
- [ ] Import `DT_M1_WaveDefinitions`, `DT_M1_SpawnPoints`, `DT_M1_Objectives`, and `DT_M1_Pickups` as DataTables.
- [ ] Create `BP_M1_WaveManager`, `BP_M1_ObjectiveManager`, `BP_M1_RelayCore`, `BP_M1_GateController`, `BP_M1_Pickup`, and `BP_M1_HUD`.
- [ ] Configure Enhanced Input actions from `M1_SAVE_SETTINGS_INPUT.md`.
- [ ] Connect canonical wave, relay, objective, pickup, and gate events.
- [ ] Import `Docs/Localization/M1_LOCALIZATION_PACK.csv` and verify fallback fonts.
- [ ] Connect Niagara and MetaSound/audio placeholders to the event catalog.

## Smoke test

- [ ] Launch E1M1 in Offline Mode.
- [ ] Complete corridor, junction, relay defense, Phalanx, subway arena, gate, and surface exit flow.
- [ ] Confirm retry from each checkpoint without duplicated rewards.
- [ ] Validate HUD on 16:9, 21:9, 2560x1440, and 4K.
- [ ] Run all seven locales and check text overflow, fallback, and subtitle timing.
- [ ] Run the M1 performance baseline and record results in the import manifest/QA record.
