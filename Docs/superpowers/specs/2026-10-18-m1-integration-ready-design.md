# M1 Integration Ready — Design Specification

## Purpose

Prepare a complete, engine-independent integration package for the first playable Hellfall: Earth Reclaimed combat slice. The package must be usable immediately after Unreal Engine is available and must connect gameplay, AI, weapons, UI, localization, save/settings, assets, audio/VFX, and future online replication through stable IDs and event contracts.

## Scope

Included:

- E1M1 combat flow from player spawn through relay defense, Phalanx reveal, gate opening, and level completion.
- Weapon and ability tuning for the M1 loadout.
- AI state and behavior contracts for M1 enemies.
- Save/checkpoint, settings, input, accessibility, and subtitle requirements.
- Seven-language localization source data: English, Ukrainian, Russian, German, Polish, French, Italian.
- Asset import manifest and naming validation.
- HUD and objective presentation rules.
- Online-ready ownership and replication rules, without requiring online services for the first local build.
- Integration checklist and automated cross-reference validation.

Excluded:

- Final authored 3D meshes, animation production, voice recording, and final music composition.
- Shipping online backend or matchmaking.
- Final Unreal Blueprint/C++ implementation before the engine installation is complete.

## Stable integration IDs

All package rows use stable IDs. Gameplay IDs use `M1.*`, assets use the existing `HF_*` naming convention, localization uses `UI.*`, `Mission.*`, `Narrative.*`, and event names use `M1.Event.*`. IDs must not be renamed after first Unreal import; deprecated IDs remain in a compatibility map.

## Package modules

### Gameplay integration

`M1_GAMEPLAY_INTEGRATION.md` defines the authoritative sequence, encounter transitions, objective ownership, failure/retry rules, spawn activation, rewards, and completion state. The local player controller owns input and camera; the encounter manager owns wave progression; the objective manager owns mission state; the gate controller only opens after the required objective event.

### Weapons and abilities

`M1_WEAPONS_AND_ABILITIES.csv` defines weapon IDs, damage, rate of fire, magazine/ammo, stagger, cooldowns, tags, VFX/audio events, and network authority notes. Weapon damage and pickups are server-authoritative when online, while muzzle flash, camera shake, and hit markers are cosmetic.

### AI behavior

`M1_AI_BEHAVIOR_CONTRACTS.md` defines perception, navigation, combat states, attack telegraphs, stagger windows, target selection, leash/reset behavior, death events, and difficulty modifiers for every M1 enemy.

### Save, settings, and input

`M1_SAVE_SETTINGS_INPUT.md` defines checkpoint payloads, mission completion persistence, difficulty, sensitivity, key bindings, subtitles, language, color/accessibility options, and safe fallback behavior when a value is missing or invalid.

### Localization

`M1_LOCALIZATION_PACK.csv` is the source table for all M1 UI, mission, pickup, objective, and Mara dialogue strings. Every row has a stable key, English source, seven locale columns, context, maximum UI length, and review status. Missing translations fall back to English and are reported by validation.

### Asset import

`M1_ASSET_IMPORT_MANIFEST.csv` is the canonical import queue. Each row identifies source file, destination folder, asset type, naming rule, texture/material budget, collision policy, LOD/Nanite policy, audio settings, license/source, and import status.

### UI/HUD

`M1_UI_HUD_SPEC.md` defines screen-space regions, information priority, objective updates, health/armor/ammo, subtitles, combat notifications, pause/settings screens, controller/keyboard navigation, and localization expansion rules.

### Online-ready contract

`M1_ONLINE_READY_CONTRACT.md` defines authority, replicated state, RPC intent, prediction boundaries, late-join behavior, reconnect behavior, and cosmetic-only effects. The first build remains local but must avoid designs that block later co-op.

### Integration checklist

`M1_INTEGRATION_CHECKLIST.md` lists the exact import and setup order, required DataTables, Blueprint actors, Gameplay Tags, input actions, Niagara/audio hooks, localization validation, smoke tests, and acceptance criteria.

## Validation requirements

The package validator must prove:

- every referenced gameplay, weapon, enemy, placement, event, asset, and localization ID exists;
- no duplicate stable IDs exist;
- all seven locale columns are present for every localization row;
- every DataTable template remains importable as CSV;
- all required M1 files are indexed in `Docs/CONTENT_INDEX.md`;
- no asset row lacks a source/license/status field;
- online-ready contracts do not make local gameplay depend on a server connection.

## Acceptance criteria

The package is ready for UE integration when all module files exist, cross-references pass, the import manifest is complete enough to start a first import pass, the checklist has no unresolved blocking item, and the M1 smoke path can be implemented without inventing new IDs or gameplay rules.

## Known decisions

- Unreal Engine 5.8 is the target installed engine.
- The project is an original IP and must not copy Doom names, characters, maps, textures, sounds, or proprietary assets.
- The package is local-first and online-ready, not online-dependent.
- The user selected keeping the current branch as-is; no commit, merge, push, or branch integration is part of this package.
- External review material is advisory; `Docs/Engineering/M1_CANONICAL_ID_MAP.csv` and the existing project tables resolve all aliases before UE import.
