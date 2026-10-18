# Offline Production Package Design

**Date:** 2026-10-18  
**Project:** Hellfall: Earth Reclaimed  
**Status:** Proposed

## Goal

Prepare the project for efficient Unreal Engine integration while UE and Lyra are being installed, without downloading large third-party packages or coupling Hellfall's identity to Lyra.

## Constraints

- Unreal Engine target: 5.8.3.
- Hellfall is an original modern 2026 arena FPS; references are mood and visual direction only.
- Lyra is an optional architecture reference and multiplayer foundation, not a source of copied game identity or unreviewed assets.
- Target online scope: 2–4 player co-op with an offline fallback.
- Target localization: English, Ukrainian, Russian, German, Polish, French, Italian.
- No large Fab packs are downloaded automatically.
- Every external asset must have a source and license record before shipping.

## Deliverables

### 1. Lyra integration plan

`Docs/Engineering/LYRA_INTEGRATION_PLAN.md` maps reusable patterns to Hellfall systems, identifies what remains custom, and defines a staged integration boundary.

### 2. Online service architecture

`Docs/Engineering/ONLINE_SERVICE_ARCHITECTURE.md` defines the EOS/session abstraction, local/offline fallback, host/join flow, reconnection expectations, and data ownership. It is implementation-neutral until the UE project is compiled.

### 3. Asset license register

`Docs/Production/ASSET_LICENSE_REGISTER.csv` provides one row per external asset or pack with source, provider, license, UE-only restrictions, attribution need, local path, status, and reviewer.

### 4. UE import pipeline

`Docs/Engineering/UE_IMPORT_PIPELINE.md` defines folder conventions, naming, import settings, validation gates, localization handling, performance budgets, and source-control rules for models, materials, animation, VFX, audio, and fonts.

## Design principles

- Keep the game-specific gameplay layer independent from external sample projects.
- Prefer Unreal built-ins before third-party plugins.
- Use small data contracts and tables so agents can work in parallel without loading the whole repository.
- Treat license metadata as production data, not an afterthought.
- Make every deliverable useful before UE opens, then extend it with verified editor settings.

## Acceptance criteria

- All four deliverables exist in the specified paths.
- Lyra plan distinguishes reference patterns from content that must not be copied.
- Online architecture supports offline mode without EOS credentials.
- Asset register has explicit columns for provenance and license status.
- Import pipeline covers the seven supported languages and the existing M1 naming rules.
- No document claims that Lyra, EOS, or Fab content is installed unless independently verified.
- Cross-references use existing project paths and names.

## Out of scope

- Downloading Lyra or Fab assets.
- Creating EOS product credentials.
- Compiling C++ or opening Unreal Editor.
- Migrating Hellfall to Lyra as a base project.
- Replacing existing narrative, gameplay, or art direction documents.
