# M1 Integration Ready Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox syntax for tracking.

**Goal:** Convert the approved M1 design and the reviewed external material into one canonical, validated integration package ready for Unreal Engine 5.8.

**Architecture:** Keep the existing project documents and tables as the source of truth. Add focused integration documents and templates that reference existing IDs rather than introducing aliases. A PowerShell validator will enforce stable IDs, localization coverage, CSV shape, asset metadata, and local-first online readiness.

**Tech Stack:** Markdown, UTF-8 CSV, PowerShell validation, Unreal Engine 5.8 conventions, Enhanced Input, Gameplay Tags, Blueprint/DataTable import contracts.

**Spec:** `Docs/superpowers/specs/2026-10-18-m1-integration-ready-design.md`

## Global Constraints

- Target Unreal Engine version is 5.8.
- M1 must be fully playable offline; online support is contract-ready but not required for the first build.
- Existing canonical IDs remain authoritative; do not create duplicate aliases for events, weapons, placements, or localization keys.
- Supported locales are English, Ukrainian, Russian, German, Polish, French, and Italian.
- Original-IP rule: do not copy Doom names, characters, maps, textures, sounds, or proprietary assets.
- Do not commit, merge, push, or change branches; the user selected keeping the current branch as-is.

## Review Focus

- Duplicate or drifted IDs from the external package: validator must reject aliases such as `Mission.M1.Obj1` when the canonical E1M1 key exists.
- CSV fields containing UE-incompatible values such as `1.5s` or `N/A`: validator must require numeric-or-empty values according to the schema.
- Missing translations or fallback-only rows: validator must require all seven locale columns and report empty values.
- Asset manifest rows with incomplete provenance or budgets: validator must require source, license, status, and memory/import metadata.
- Online rules accidentally making local play server-dependent: offline smoke validation must confirm no server prerequisite is listed in the M1 flow.

---

### Task 1: Canonicalize external review decisions

**Files:**
- Modify: `Docs/superpowers/specs/2026-10-18-m1-integration-ready-design.md`
- Create: `Docs/Engineering/M1_CANONICAL_ID_MAP.csv`
- Create: `Docs/Engineering/M1_EXTERNAL_REVIEW_DECISIONS.md`

**Interfaces:**
- Consumes: existing placement, localization, weapon, wave, and Blueprint event files.
- Produces: one explicit alias-to-canonical map consumed by the validator and integration documents.

- [ ] **Step 1: Write the failing validation fixture**

Add a validator test case containing the reviewed aliases `HF_Start_Point`, `HF_Heavy_Gate_01`, `Mission.M1.Obj1`, `M1.Weapon.Valkyrie`, and `M1.Event.RelayDefense_Start`; expected result is a canonical-ID error.

- [ ] **Step 2: Run the fixture and verify it fails**

Run the validator in strict mode. Expected: each alias is reported as non-canonical.

- [ ] **Step 3: Add the canonical map and decision record**

Map aliases to `SP_M1_Spawn_Player`, `GATE_M1_Subway`, the relevant `Mission.E1M1.*` keys, `WPN_ValkyrieArcCarbine`, and the existing `M1.Event.Relay.*`/`M1.Event.Gate.Opened` events. Record that external numeric balance values are advisory and the existing weapon catalog remains authoritative.

- [ ] **Step 4: Run the fixture and verify it passes**

Run the validator against the canonical map. Expected: aliases are resolved only through the documented map and no duplicate runtime IDs are emitted.

- [ ] **Step 5: Verify the spec remains consistent**

Run a placeholder and terminology scan over the spec and decision record. Expected: no unresolved placeholders or conflicting ID source-of-truth statements.

### Task 2: Create gameplay, AI, weapon, save, and online integration documents

**Files:**
- Create: `Docs/Engineering/M1_GAMEPLAY_INTEGRATION.md`
- Create: `Docs/ContentTables/M1_WEAPONS_AND_ABILITIES.csv`
- Create: `Docs/Engineering/M1_AI_BEHAVIOR_CONTRACTS.md`
- Create: `Docs/Engineering/M1_SAVE_SETTINGS_INPUT.md`
- Create: `Docs/Engineering/M1_ONLINE_READY_CONTRACT.md`

**Interfaces:**
- Consumes: Task 1 canonical map, `M1_COMBAT_WAVES.csv`, `WEAPON_CATALOG.csv`, placement map, Blueprint event contracts.
- Produces: exact IDs, states, authority rules, and tuning fields for UE DataTables and Blueprint implementation.

- [ ] **Step 1: Write schema checks first**

Define expected headers and required IDs for the weapon/ability CSV, plus required headings and canonical event names for the Markdown contracts.

- [ ] **Step 2: Run checks before implementation**

Expected: checks fail because the five new module files do not yet exist.

- [ ] **Step 3: Implement the module documents and table**

Use existing IDs such as `WPN_ValkyrieArcCarbine`, `WPN_SingularityDisruptor`, `EN_RazorStalker`, `EN_PhalanxTrooper`, `SP_M1_Spawn_Player`, `GATE_M1_Subway`, and `M1.Event.Gate.Opened`. Store durations as numeric seconds, not strings with units. Cover the complete M1 flow and local-first online rules.

- [ ] **Step 4: Run schema and cross-reference checks**

Expected: all required IDs resolve to existing canonical rows, weapon values parse as CSV-compatible numeric fields, and local flow contains no server prerequisite.

### Task 3: Create localization, HUD, asset manifest, and integration checklist

**Files:**
- Create: `Docs/Localization/M1_LOCALIZATION_PACK.csv`
- Create: `Docs/UI/M1_UI_HUD_SPEC.md`
- Modify: `Docs/ContentTables/ASSET_IMPORT_MANIFEST.csv`
- Create: `Docs/Engineering/M1_INTEGRATION_CHECKLIST.md`

**Interfaces:**
- Consumes: existing M1 string keys, Mara dialogue keys, asset naming rules, import manifest schema, and Blueprint event contracts.
- Produces: import-ready translation source, HUD rules, complete asset queue, and exact UE setup order.

- [ ] **Step 1: Add failing localization and manifest checks**

Require seven locale columns for every localization row and require source/license/status plus import budget metadata for every asset row.

- [ ] **Step 2: Run checks and verify failure on incomplete fixtures**

Expected: empty or incomplete fixture rows are rejected.

- [ ] **Step 3: Implement canonical localization and import records**

Use existing `Mission.E1M1.*`, `Mission.E1M1.Pickup.*`, and `Narrative.E1M1.Mara.*` keys. Preserve the canonical asset manifest columns and add only documented rows/values; do not replace its schema with the external sample schema.

- [ ] **Step 4: Implement HUD and integration checklist**

Document 16:9, 21:9, and 4K checks, subtitle fallback, accessibility, DataTable import order, Gameplay Tags, Enhanced Input, Blueprint actors, Niagara/audio hooks, and offline smoke test.

- [ ] **Step 5: Run localization, manifest, and checklist validation**

Expected: seven locales are present, no required translation is empty, every asset has provenance, and the checklist references existing files.

### Task 4: Build the package validator

**Files:**
- Create: `Tools/ValidateM1IntegrationReady.ps1`
- Modify: `Docs/CONTENT_INDEX.md`

**Interfaces:**
- Consumes: all prior task files and existing M1 tables.
- Produces: deterministic PASS/FAIL output with counts and actionable diagnostics.

- [ ] **Step 1: Write failing validator assertions**

Cover duplicate IDs, unknown enemy/weapon/event/localization IDs, missing locale columns, malformed numeric durations, incomplete asset metadata, missing index entries, and online dependency markers.

- [ ] **Step 2: Run the validator before implementation**

Expected: command fails because the validator does not exist.

- [ ] **Step 3: Implement strict validation**

Use PowerShell `Import-Csv`, exact header comparisons, canonical map resolution, and non-zero exit codes for blockers. Output summary counts for files, rows, locales, events, assets, and errors.

- [ ] **Step 4: Add all package entries to the content index**

Expected: every new module is discoverable from `Docs/CONTENT_INDEX.md`.

- [ ] **Step 5: Run the validator in normal and strict modes**

Expected: both modes pass on the canonical package; strict mode reports no unresolved aliases or missing metadata.

### Task 5: Final integration audit

**Files:**
- Modify: `Docs/M1ContentPack/M1_CONTENT_PACK.md`
- Modify: `Docs/CONTENT_INDEX.md`
- Create: `Docs/M1ContentPack/M1_INTEGRATION_AUDIT.md`

**Interfaces:**
- Consumes: all previous task outputs and the approved design specification.
- Produces: final readiness report for the Unreal integration phase.

- [ ] **Step 1: Run the complete validator and existing M1 checks**

Expected: existing M1 Combat Slice validation and the new integration validator both pass.

- [ ] **Step 2: Perform a fresh cross-reference audit**

Check every module against the spec, existing canonical tables, seven locale requirements, original-IP rule, and offline-first rule.

- [ ] **Step 3: Write the readiness report**

Record file counts, table row counts, canonical ID policy, known deferred work (UE implementation, final assets, voice recording, online backend), and the exact first UE integration sequence.

- [ ] **Step 4: Run final verification**

Expected output: `M1 Integration Ready validation: PASS`, zero blockers, and a clear list of post-UE tasks.
