# M1 Content Pack — Greybox Combat Slice

## 1. Design target

M1 should feel like a complete 8–12 minute combat slice, not a technical test. The player must understand the movement, weapon, enemy threat, arena loop, secret, and mission objective without external explanation.

Target experience:

```text
Explore -> discover weapon -> fight -> activate relay -> survive waves -> find secret -> open gate -> escape
```

## 2. Player tuning

| Parameter | Target value | Notes |
|---|---:|---|
| Health | 100 | Display as integer |
| Armor | 50 | Absorbs 40% of incoming damage |
| Walk speed | 650 cm/s | Configurable |
| Sprint speed | 950 cm/s | Fast arena movement |
| Jump velocity | 620 cm/s | Tune after greybox test |
| Air control | 0.75 | Responsive but not unlimited |
| Slide duration | 0.85 s | Ends when speed falls below threshold |
| Slide cooldown | 0.35 s | Prevents continuous abuse |
| FOV | 105 degrees | User-configurable 90–120 |
| Interaction range | 250 cm | Prompt appears inside range |

## 3. Weapon: Valkyrie Arc-Carbine

### Role

Reliable automatic energy rifle for medium-range combat. It teaches the player to maintain momentum and aim for weak points.

### Gameplay values

| Parameter | Value |
|---|---:|
| Fire mode | Automatic |
| Fire rate | 9 shots/sec |
| Magazine | 30 arc cells |
| Reserve ammo | 120 arc cells |
| Damage per shot | 12 |
| Critical multiplier | 1.75x |
| Effective range | 4,000 cm |
| Spread | 0.8 degrees standing; 1.4 moving |
| Recoil | Low, predictable vertical |
| Reload | None in M1 |
| Muzzle effect | Cyan electrical flash |
| Impact effect | Small arc burst and sparks |

### Alternate fire — deferred

Do not implement in the first slice. Reserve the input and data field for a short-range charged arc burst in a later milestone.

### Audio direction

Short mechanical energy pulse, sharp high-frequency arc crack, low mechanical body impact, distinct empty-ammo warning.

## 4. Enemy: Razor-Stalker

### Role

Fast melee pressure unit. It forces the player to keep moving and use the arena’s vertical space.

### Gameplay values

| Parameter | Value |
|---|---:|
| Health | 90 |
| Move speed | 520 cm/s |
| Chase speed | 720 cm/s |
| Melee damage | 18 |
| Lunge damage | 28 |
| Lunge range | 550 cm |
| Attack cooldown | 1.35 s |
| Stagger threshold | 30 damage within 0.4 s |
| Detection range | 2,400 cm |
| Search duration | 4 s |
| Weak point | Exposed cyan energy tendon |

### Encounter behavior

1. One Razor-Stalker demonstrates the threat.
2. Two units attack from separate angles.
3. Three units are introduced after the player receives ammunition.
4. Final arena mixes Razor-Stalkers with one Phalanx Trooper.

### Animation requirements

- idle crouch;
- alert reaction;
- sprint;
- lunge preparation;
- lunge attack;
- wall impact stagger;
- hit reaction;
- death reaction;
- frozen or disabled placeholder pose.

## 5. Arena: L_FirstSlice_Arena

### Layout flow

```text
[Spawn Bunker]
      |
[Maintenance Corridor] ---- [Hidden Aegis Room]
      |
[Power Junction] ---- [Upper Catwalk]
      |
[Relay Chamber] -> [Subway Gate Arena] -> [Surface Exit]
```

### Required spaces

#### Spawn Bunker

Quiet room with movement prompts, no enemies, one visible locked door.

#### Maintenance Corridor

First weapon pickup. Narrow space that opens into the first combat zone.

#### Power Junction

Main arena with two routes, four cover objects, an elevated platform, and the first relay objective.

#### Hidden Aegis Room

Optional secret with a lore recording, armor pickup, and ammunition. The entrance is revealed by a damaged wall panel after the player activates the relay.

#### Relay Chamber

Small defensive encounter. The player holds the room for 20 seconds while the relay reboots.

#### Subway Gate Arena

Final arena with three enemy waves, a locked gate, a central hazard, and a visible exit route.

## 6. Mission objectives

### Main mission — Breach Point

| ID | Objective | Completion condition |
|---|---|---|
| E1M1-01 | Exit the recovery chamber | Player reaches corridor trigger |
| E1M1-02 | Recover the Valkyrie Arc-Carbine | Player interacts with weapon pickup |
| E1M1-03 | Eliminate the first threat | First Razor-Stalker encounter cleared |
| E1M1-04 | Restore power to the transit relay | Player activates the junction console |
| E1M1-05 | Hold the relay chamber | Survive 20 seconds and protect relay |
| E1M1-06 | Open the subway gate | Gate control is activated |
| E1M1-07 | Reach the surface | Player enters final exit volume |

### Optional mission — Aegis Memory

Find the hidden maintenance room and recover the last evacuation recording.

Reward:

- one armor pickup;
- one Arc Cell pickup;
- lore record;
- additional Mara line in E1M2.

## 7. Encounter schedule

### Encounter 01 — Corridor

- 1 Razor-Stalker;
- no reinforcement;
- teaches melee warning and movement.

### Encounter 02 — Power Junction

- 2 Razor-Stalkers;
- 1 delayed reinforcement;
- health pickup appears after completion.

### Encounter 03 — Relay Defense

- Wave 1: 2 Razor-Stalkers;
- Wave 2: 3 Razor-Stalkers from two entrances;
- Wave 3: 2 Razor-Stalkers plus 1 Phalanx Trooper;
- relay health: 1,000;
- player has access to cover and an elevated route.

### Encounter 04 — Subway Gate

- 3 Razor-Stalkers;
- 2 Phalanx Troopers;
- one late flank route;
- gate opens after all active enemies are defeated.

## 8. Pickups

### Health Cell

- restores 25 health;
- cannot exceed maximum;
- emissive white-cyan core;
- respawn disabled in M1.

### Armor Plate

- restores 20 armor;
- cannot exceed maximum;
- dark plate with yellow hazard stripe;
- placed in the secret room.

### Arc Cell Crate

- restores 45 ammunition;
- cyan electrical pulse;
- placed before the relay defense.

## 9. Asset list

### Required for greybox

- player capsule and first-person arms placeholder;
- Valkyrie Arc-Carbine placeholder mesh;
- Razor-Stalker placeholder mesh;
- Phalanx Trooper placeholder mesh;
- modular floor, wall, ramp, catwalk, stairs, door, and cover meshes;
- relay console;
- subway gate;
- health, armor, and ammo pickups;
- cyan, magenta, yellow, and red emissive materials;
- NavMeshBoundsVolume;
- basic Niagara muzzle, impact, and energy effects;
- placeholder weapon, enemy, door, and relay audio.

### Production asset follow-up

- final first-person weapon model;
- final enemy models and animations;
- PBR materials in Substance Painter;
- environment trim sheets;
- decals and damage states;
- final VFX;
- final sound effects and voice lines.

## 10. Acceptance tests

- Player can complete E1M1 without getting stuck.
- Player can reach the secret without breaking the main route.
- All objectives update correctly after reload.
- Razor-Stalker never attacks through solid cover.
- Phalanx Trooper shield faces the player and exposes its rear weak point.
- Relay defense ends only when the timer completes or the relay fails.
- All HUD strings use localization keys.
- Arena maintains the target frame rate in a packaged Development build.

## 11. Integration Ready status

The canonical M1 integration package is stored in the Engineering, ContentTables, Localization, and UI folders. External review material is mapped through `M1_CANONICAL_ID_MAP.csv`; no external aliases are runtime IDs. Run `Tools/ValidateM1IntegrationReady.ps1 -Strict` before importing into Unreal Engine.
