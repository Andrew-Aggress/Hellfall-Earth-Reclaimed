# Production Asset Briefs

## Valkyrie Arc-Carbine

Purpose: first-person automatic energy rifle.

Requirements:

- readable silhouette at 90–110 FOV;
- first-person and world mesh variants;
- separate magazine/arc-cell module;
- emissive energy core;
- heat vents and impact wear;
- 4K texture set for hero version;
- LODs for world pickup;
- collision simplified for pickup and dropped state;
- animation sockets for muzzle, shell-free firing, and effects.

Material channels:

```text
Base Color, Normal, Roughness, Metallic, Ambient Occlusion, Emissive, Mask
```

## Razor-Stalker

Requirements:

- humanoid-readable threat silhouette despite quadrupedal anatomy;
- full skeletal rig;
- idle, patrol, sprint, lunge, miss, hit, stagger, death;
- readable cyan energy tendons;
- weak-point material mask;
- separate collision bodies for head, torso, limbs, and weak point;
- performance-friendly mid and low LODs.

## Phalanx Trooper

Requirements:

- shield as separate mesh and effect;
- shield front/rear readability;
- shield break animation;
- weapon socket;
- armor damage states;
- rear weak-point material mask;
- walk, aim, fire, stagger, shield raise, shield break, death animations.

## Modular environment kit

Each kit must include:

- wall segments;
- floor modules;
- ceiling modules;
- corners;
- doors;
- stairs and ramps;
- catwalks;
- cover objects;
- pipes and cables;
- decals;
- trim sheet materials;
- collision-ready variants.

## Niagara effects

- Valkyrie muzzle flash;
- energy impact;
- shield hit;
- relay startup;
- dimensional rift;
- Nanite Pod spawn;
- boss phase transition;
- player damage feedback.

## Substance Painter export preset

Export maps compatible with Unreal Engine PBR conventions:

- Base Color;
- Normal DirectX;
- Roughness;
- Metallic;
- Ambient Occlusion;
- Emissive;
- packed masks where appropriate.
