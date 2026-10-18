# Hellfall: Earth Reclaimed

Hellfall: Earth Reclaimed is an original high-speed science-fiction arena FPS built for Unreal Engine 5.8.3. It combines aggressive movement, readable combat encounters, heavy industrial environments, hostile extradimensional biology, and a dark neon visual identity designed for modern 2026 hardware.

The project is inspired by the energy and clarity of classic arena shooters, but it is an original intellectual property. It does not use Doom names, characters, maps, textures, sounds, or proprietary assets.

## Vision

Earth is being converted by an extradimensional force that has ruptured the planet’s infrastructure. The player is an elite operative moving through ruined megacities, orbital military stations, weapons foundries, transit networks, and unstable singularity zones. Each level is built around forward momentum, layered combat spaces, readable enemy roles, secrets, and escalating set pieces.

The visual direction combines physically based industrial materials, damaged military and orbital architecture, cyan energy systems, magenta extradimensional corruption, volumetric smoke, sparks, debris, portals, reactive lighting, and modern 2026-quality rendering with scalable performance targets.

## Current milestone — M1: Greybox Combat Slice

M1 is the first playable vertical slice, titled **Breach Point**. It establishes the project’s core combat loop and integration contracts.

The player progresses through:

1. Recovery chamber and maintenance corridor.
2. First Razor-Stalker contact.
3. Power junction and branching combat routes.
4. Transit relay activation and relay defense.
5. Phalanx Trooper reveal with shield/weak-point gameplay.
6. Subway gate arena and final combat wave.
7. Surface extraction and mission completion.

M1 systems include fast first-person movement, Enhanced Input, the Valkyrie Arc-Carbine, Singularity Disruptor contract, Evade Dash ability, Razor-Stalker and Phalanx Trooper AI contracts, health/armor/ammo, pickups, objectives, checkpoints, relay defense, wave management, HUD, subtitles, localization, accessibility, VFX/audio events, performance baselines, and local-first online-ready authority rules.

## Online direction

The long-term online mode is a 2–4 player cooperative campaign. M1 is intentionally local-first: it must launch and complete in Offline Mode without a server connection. Gameplay authority contracts are already documented for future LAN/EOS integration.

When online, the server will own health, ammo, damage, enemy spawning, wave progression, relay state, objectives, pickups, and gates. Clients may predict movement, dash, and cosmetic weapon presentation. Competitive PvP is not part of the current milestone.

## Localization

Supported languages are English, Ukrainian, Russian, German, Polish, French, and Italian. The project uses stable localization keys, English fallback behavior, subtitle-safe UI layouts, and validation for missing translations and text expansion.

## Technology

- Unreal Engine 5.8.3;
- C++ gameplay module with Blueprint content assembly;
- Enhanced Input;
- Gameplay Ability System, Gameplay Tags, and Gameplay Tasks;
- Niagara for VFX;
- CommonUI/CommonInput for scalable interface work;
- StateTree, AI Module, Navigation System, and PCG;
- Substance 3D Painter for material authoring;
- Blender for modeling and technical asset preparation;
- Windows 10/11 x64 development target.

## Repository structure

```text
Hellfall-Earth-Reclaimed/
├── Config/                         Unreal project configuration
├── Content/                        Unreal content placeholder structure
├── Docs/                           Design, narrative, art, audio, data, and QA
├── Source/                         C++ module scaffold
├── Tools/                          Validation and production utilities
└── HellfallEarthReclaimed.uproject
```

## Integration status

The documentation and data package is **Conditionally Ready for UE integration**. Prepared and validated items include the canonical ID map, M1 placement map, Blueprint event contracts, gameplay/AI/save/settings/online contracts, four DataTable templates, 33 localization rows across seven languages, 10 asset manifest rows with provenance and budgets, HUD rules, integration checklist, strict PowerShell validator, positive/negative validation tests, localization fallback test, and final M1 audit.

The remaining engine-dependent work is:

1. Open the project in Unreal Engine 5.8.3.
2. Import the M1 DataTables.
3. Create and compile the Blueprint/C++ gameplay actors.
4. Build the E1M1 blockout.
5. Connect Niagara, audio, HUD, input, and localization systems.
6. Run the first packaged Development build and performance capture.

## Validation

Run the strict integration validator from the project root:

```powershell
.\Tools\ValidateM1IntegrationReady.ps1 -Strict
```

Run the complete pre-UE regression suite:

```powershell
.\Tools\TestM1CanonicalIds.ps1
.\Tools\TestM1Contracts.ps1
.\Tools\TestM1ContentInputs.ps1
.\Tools\TestM1Validator.ps1
.\Tools\TestM1ValidatorNegative.ps1
.\Tools\TestM1LocalizationFallback.ps1
.\Tools\TestM1FinalAudit.ps1
```

## Project principles

- Stable IDs are more important than temporary naming convenience.
- Existing canonical tables are the source of truth.
- Local gameplay must never depend on online services.
- Visual quality must be modern, but readability and performance come first.
- Every production asset needs provenance, licensing status, import budgets, and a clear owner.
- New content must remain original and legally distinct from third-party IP.
- Gameplay contracts are designed before Blueprint implementation to reduce rework.

## License and asset policy

This repository is a private development project unless a separate license is added. User-provided references, generated concept art, third-party software, and production assets must be tracked through the project’s asset license register before shipping use. Reference images are mood and design references, not automatically cleared production assets.

## Project status

**Pre-alpha / M1 integration preparation**

The repository contains the design, data, validation, and integration foundation. It is not yet a finished game or a distributable build.
