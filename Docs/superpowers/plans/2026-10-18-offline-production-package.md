# Offline Production Package Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Prepare four production documents that make Hellfall ready for efficient Unreal Engine and Lyra integration without downloading large external packages.

**Architecture:** Keep Hellfall's gameplay and content identity independent from Lyra. Document stable boundaries first: Lyra patterns, online service abstraction, asset provenance, and Unreal import rules. Use existing project tables and naming conventions as the source of truth.

**Tech Stack:** Unreal Engine 5.8.3, EOS-compatible session concepts, Niagara, GAS, StateTree, PCG, CommonUI, Enhanced Input, MetaSounds, PowerShell validation, CSV asset metadata.

**Spec:** `Docs/superpowers/specs/2026-10-18-offline-production-package-design.md`

## Global Constraints

- Unreal Engine target: 5.8.3.
- Hellfall is an original modern 2026 arena FPS; references are mood and visual direction only.
- Lyra is an optional architecture reference, not a source of copied game identity or unreviewed assets.
- Target online scope: 2–4 player co-op with an offline fallback.
- Target localization: English, Ukrainian, Russian, German, Polish, French, Italian.
- No large Fab packs are downloaded automatically.
- Every external asset must have a source and license record before shipping.

## Review Focus

- Lyra content accidentally treated as shippable Hellfall content — Task 1 includes explicit allowed/prohibited boundaries.
- EOS credentials unavailable — Task 2 includes an offline path that requires no credentials.
- Asset license or provenance missing — Task 3 includes required metadata columns and a blocked status.
- Imported assets break naming, scale, or performance budgets — Task 4 includes validation gates and budgets.
- Localized fonts or text fail for one of seven cultures — Task 4 includes composite-font and localization checks.

---

### Task 1: Lyra Integration Boundary

**Files:**
- Create: `Docs/Engineering/LYRA_INTEGRATION_PLAN.md`
- Read: `Docs/Engineering/API_CONTRACTS.md`, `Docs/Gameplay/MULTIPLAYER_PLAN.md`, `README.md`

**Interfaces:**
- Consumes: existing gameplay/network requirements and enabled project plugins.
- Produces: a staged map of Lyra patterns to Hellfall systems, with explicit keep/custom/reject decisions.

- [ ] **Step 1: Define the decision table**

  Include rows for input, ability/weapon flow, inventory/equipment, UI, game features, sessions, bots, EOS, and sample content. Each row must specify `Use pattern`, `Build custom`, or `Do not import`, plus rationale.

- [ ] **Step 2: Define staged integration**

  Document Stage 0 reference-only, Stage 1 interface alignment, Stage 2 optional plugin adoption after UE verification, and Stage 3 multiplayer test integration.

- [ ] **Step 3: Add license and identity guardrails**

  State that Hellfall must not copy Lyra names, maps, characters, branded UI, or unreviewed assets into the shipped game.

- [ ] **Step 4: Validate**

  Confirm every subsystem in `MULTIPLAYER_PLAN.md` maps to one decision-table row and no section claims Lyra is installed.

### Task 2: Online Service Architecture

**Files:**
- Create: `Docs/Engineering/ONLINE_SERVICE_ARCHITECTURE.md`
- Read: `Docs/Gameplay/MULTIPLAYER_PLAN.md`, `Docs/Engineering/API_CONTRACTS.md`, `Docs/Gameplay/SAVE_SETTINGS_AND_PROGRESSION.md`

**Interfaces:**
- Consumes: 2–4 player co-op requirements and save/progression constraints.
- Produces: service-neutral contracts for identity, sessions, invite/join, reconnect, host authority, and offline fallback.

- [ ] **Step 1: Define runtime modes**

  Specify `Offline`, `LAN`, and `EOS` modes, with EOS optional during development and no credential requirement for Offline.

- [ ] **Step 2: Define service contracts**

  Document `IOnlineIdentity`, `ISessionService`, `IPartyService`, and `IReconnectService` responsibilities, inputs, outputs, and failure states without committing to C++ signatures yet.

- [ ] **Step 3: Define authority and persistence**

  State that gameplay authority is server-owned, progression is validated server-side when online, and local progress remains usable offline with explicit sync conflict rules.

- [ ] **Step 4: Define test matrix**

  Cover solo offline, 2-player LAN, EOS host/join, late join, disconnect/reconnect, host loss, invalid session, and missing credentials.

- [ ] **Step 5: Validate**

  Confirm the offline path is complete without EOS and that all failure states have a player-facing outcome.

### Task 3: Asset License Register

**Files:**
- Create: `Docs/Production/ASSET_LICENSE_REGISTER.csv`
- Read: `Docs/ContentTables/ASSET_BACKLOG.csv`, `Docs/ReferencePack/REFERENCE-INDEX.md`, `Docs/Art/ASSET_BRIEFS.md`

**Interfaces:**
- Consumes: current asset backlog and reference-pack inventory.
- Produces: a machine-readable provenance register used by art, engineering, QA, and release review.

- [ ] **Step 1: Create the CSV schema**

  Use these headers exactly: `AssetId,AssetName,Category,Source,SourceUrl,Provider,License,UEOnly,AttributionRequired,AIAllowed,LocalPath,Status,Reviewer,Notes`.

- [ ] **Step 2: Add project-owned rows**

  Add rows for the existing Hellfall reference images and mark them `ReferenceOnly` unless a separate production license is documented.

- [ ] **Step 3: Add planned external sources**

  Add Lyra, Fab Free, EOS SDK, Blender, Substance Painter, and MetaSounds as `Planned` or `Installed` only where verified. Never mark a source `Approved` without license evidence.

- [ ] **Step 4: Validate CSV integrity**

  Check that every row has an AssetId, Source, License, Status, and Notes value; commas and line breaks must remain correctly quoted.

### Task 4: Unreal Import Pipeline

**Files:**
- Create: `Docs/Engineering/UE_IMPORT_PIPELINE.md`
- Read: `Docs/M1ContentPack/Assets/M1_ASSET_NAMING.md`, `Docs/Art/ASSET_BRIEFS.md`, `Docs/Audio/AUDIO_AND_VOICE_SPEC.md`, `Docs/LOCALIZATION_PRODUCTION_GUIDE.md`

**Interfaces:**
- Consumes: existing naming conventions, asset briefs, audio rules, and seven-language localization requirements.
- Produces: repeatable import and validation gates for assets before they enter the playable build.

- [ ] **Step 1: Define folder and naming rules**

  Cover `/Game/Hellfall/`, environment, characters, weapons, enemies, UI, audio, VFX, materials, and localization paths; preserve the existing `HF_` naming convention where already defined.

- [ ] **Step 2: Define per-asset import rules**

  Cover static meshes, skeletal meshes, animations, textures, materials, Niagara systems, audio, fonts, and localized text/data.

- [ ] **Step 3: Define performance budgets**

  Require Nanite suitability review, texture-size justification, material instance preference, LOD/collision checks, Niagara scalability, audio compression, and memory notes.

- [ ] **Step 4: Define validation gates**

  Require naming, scale, pivot, collision, skeleton, material, localization, license, and in-editor smoke checks before an asset is marked `Ready`.

- [ ] **Step 5: Define seven-language localization checks**

  Include `en`, `uk`, `ru`, `de`, `pl`, `fr`, and `it`; require composite-font coverage and fallback testing.

- [ ] **Step 6: Validate**

  Confirm every asset class in `ASSET_BACKLOG.csv` has an import rule and every target culture appears in the localization checklist.

## Final verification

- [ ] Confirm all four deliverables exist at the exact paths above.
- [ ] Search all four files for unfinished placeholder markers and unverified installation claims.
- [ ] Validate the CSV header and row field counts.
- [ ] Validate cross-references to existing files.
- [ ] Run `git diff --check` after the documents are created.
