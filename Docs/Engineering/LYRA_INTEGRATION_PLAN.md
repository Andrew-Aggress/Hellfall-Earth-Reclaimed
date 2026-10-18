# Lyra Integration Plan

## Purpose

Lyra is an optional reference and integration source for Hellfall: Earth Reclaimed. Hellfall keeps its own gameplay identity, content, naming, art direction, narrative, and release content.

## Decision table

| Subsystem | Decision | Hellfall boundary | Rationale |
|---|---|---|---|
| Input and rebinding | Use pattern | Enhanced Input actions and mapping contexts remain Hellfall-owned | Lyra demonstrates scalable input layering; Hellfall needs its own controls and accessibility defaults |
| Ability and weapon flow | Use pattern | GAS abilities, effects, tags, and weapon data use Hellfall IDs and tuning | The pattern supports network prediction and modular combat without importing Lyra content |
| Inventory and equipment | Use pattern | Hellfall owns item definitions, pickups, upgrades, and progression rules | Reuse architecture concepts, not Lyra item names or content |
| HUD and menus | Build custom | CommonUI/CommonInput foundations with Hellfall widgets and localization keys | Hellfall needs a distinct visual language and seven-language layout validation |
| Game Feature plugins | Use pattern | Hellfall feature plugins are named and scoped under its own modules | Modular loading helps episode and co-op content stay isolated |
| Sessions and parties | Use pattern | Hellfall session contracts wrap EOS or LAN/offline providers | Lyra provides useful flow examples; service credentials and product settings remain project-specific |
| Bots and encounters | Build custom | Hellfall StateTree/AI behavior, encounter director, and enemy roster | Enemy behavior, pacing, and combat readability are core original design work |
| EOS integration | Use pattern | EOS is optional behind an online service abstraction | Development must work without credentials and without an internet connection |
| Sample maps and modes | Do not import | No Lyra maps, branded modes, or sample progression in shipping content | Avoid identity bleed, hidden dependencies, and unreviewed license scope |
| Characters, weapons, UI art, audio | Do not import | Use Hellfall-owned or separately licensed assets only | Sample content is not a substitute for the project's art and license review |

## Staged integration

### Stage 0 — Reference only

Read Lyra documentation and inspect patterns without copying content. Keep Hellfall's current project descriptor and documentation as the source of truth.

### Stage 1 — Interface alignment

Compare Hellfall's `API_CONTRACTS.md` and `MULTIPLAYER_PLAN.md` against Lyra concepts. Define adapters and data contracts, but do not make Hellfall depend on Lyra project paths.

### Stage 2 — Optional plugin adoption

After UE 5.8.3 is fully verified, enable only the smallest required built-in or standalone plugins. Check compile status, startup maps, and packaging after each change. Record every adopted plugin in the project documentation.

### Stage 3 — Multiplayer test integration

Test offline, LAN, and EOS-backed sessions independently. Add a minimal Hellfall combat map and one original weapon before adding larger content. Keep rollback instructions for every optional integration.

## Identity and license guardrails

- Do not copy Lyra names, maps, characters, branded UI, dialogue, sounds, or sample progression into Hellfall shipping content.
- Do not rename Lyra assets and treat them as original assets.
- Record any retained external asset in `Docs/Production/ASSET_LICENSE_REGISTER.csv` before it enters a playable build.
- Keep Lyra in its own folder and repository location; never merge its full `Content` directory into Hellfall.
- Do not claim Lyra or EOS is installed until the files and project launch are independently verified.
- Hellfall's references define mood and visual goals only; they do not authorize copying protected game elements.

## Exit criteria

- Every multiplayer subsystem has a decision-table row.
- Hellfall can build and run without Lyra content.
- Offline development remains available without EOS credentials.
- Any optional Lyra-derived integration has an owner, test, rollback note, and license review.
