# Unreal Engine Import Pipeline

## Purpose

Every asset must pass this pipeline before it enters a playable build. The pipeline is designed for UE 5.8.3 and the Hellfall reference, naming, localization, and license documents.

## Folder structure

```text
/Game/Hellfall/
  Art/Environment
  Art/Characters
  Art/Weapons
  Art/Enemies
  Materials
  VFX
  Audio
  UI
  Data
  Input
  Levels
  Localization
```

Use the M1 prefixes: `BP_`, `W_`, `DA_`, `DT_`, `MI_`, `M_`, `SM_`, `SK_`, `T_`, `NS_`, `S_`, `SC_`, `VO_`, `ST_`, `L_`, `IA_`, and `IMC_`. Preserve the established `HF_` prefix when an existing system already uses it.

## Universal intake

1. Assign an asset ID from `ASSET_BACKLOG.csv`.
2. Add provenance and license information to `ASSET_LICENSE_REGISTER.csv`.
3. Confirm the source file is not a reference-only image.
4. Normalize units to centimeters, orientation to Unreal conventions, and naming to the M1 rules.
5. Place source files outside `Content/` and imported assets inside the correct `/Game/Hellfall/` folder.
6. Record owner, source revision, import date, and review status.

## Asset-class rules

### Static meshes

- Use Nanite only after silhouette, material count, and platform suitability review.
- Set a meaningful pivot and centimeter scale; remove hidden construction geometry.
- Create simple collision for pickups and gameplay props; use custom collision for walkable environment pieces.
- Validate lightmap or Lumen assumptions, UVs, material slots, and world-space alignment.
- Add LODs for non-Nanite meshes and distant decorative props.

### Skeletal meshes and characters

- Validate skeleton orientation, bone names, retargeting pose, physics asset, and socket names.
- Keep first-person weapon meshes separate from world meshes.
- Verify weak-point and damage-state material masks for enemies.
- Test idle, movement, attack, hit, stagger, and death animations before `Ready`.

### Animations

- Confirm target skeleton and retarget source.
- Check root motion policy, frame rate, compression, additive settings, and montage sections.
- Name animation assets by action and actor, for example `A_RazorStalker_Lunge`.

### Textures and materials

- Use power-of-two dimensions and justify 4K/8K textures for hero assets.
- Prefer material instances over duplicated master materials.
- Use Unreal-compatible normal maps and pack ORM channels where appropriate.
- Check mip generation, streaming, sRGB, virtual texturing, emissive intensity, and mask channels.

### Niagara and VFX

- Use scalable emitters with Low/Medium/High quality tiers.
- Validate bounds, GPU/CPU choice, overdraw, lifetime, collision, and network ownership.
- Test muzzle flash, impacts, shields, rifts, damage feedback, and boss effects at gameplay distance.

### Audio and voice

- Import with the audio rules in `AUDIO_AND_VOICE_SPEC.md`.
- Set loudness, looping, attenuation, concurrency, priority, and compression intentionally.
- Store voice lines with stable `VO_` keys and link each line to its localization metadata.
- Check subtitles against the recorded line before approval.

### UI, fonts, and localization data

- Use `FText`, String Tables, and stable keys; never hardcode player-facing text.
- Use a composite font covering Latin, Cyrillic, Polish diacritics, and fallback glyphs.
- Validate UI at 16:9, ultrawide, minimum supported resolution, and controller navigation.
- Keep localized assets under `/Game/Hellfall/Localization/` or UE's generated localization paths.

## Performance gates

- Nanite suitability recorded for each environment mesh; non-Nanite meshes require at least one tested distance LOD.
- Environment modules target no more than 4 material slots; hero weapons/characters target no more than 8 unless approved.
- Texture targets are 2K for standard assets, 4K for hero assets, and 8K only with an explicit visual justification.
- Material instance used when the shader logic is shared; unique master shaders require a review note.
- Collision targets are no more than 16 simple hulls for a gameplay prop and no more than 32 for a major environment piece.
- Niagara effects define Low/Medium/High tiers and target no more than 500 live particles per local weapon effect at High quality unless profiled.
- Audio compression and memory impact are recorded; short SFX should use compressed runtime audio and voice assets require streaming review.
- A baseline PC target is 60 FPS at 1440p High; any asset that pushes a representative scene beyond a 16.7 ms frame budget is blocked pending optimization.
- Per-asset memory or package impact is recorded in `Docs/ContentTables/ASSET_IMPORT_MANIFEST.csv`.

## Ready gate

An asset may be marked `Ready` only when all checks below pass:

- naming and folder path;
- scale, pivot, orientation, and transforms;
- collision, skeleton, sockets, or physics asset where applicable;
- materials, textures, UVs, and masks;
- performance budget and scalability;
- localization and font coverage where applicable;
- license register entry;
- in-editor smoke test;
- reviewer and date recorded.
- import-manifest row with source revision, import date, measured settings, and budget result.

## Seven-language localization check

Required cultures:

```text
en — English
uk — Ukrainian
ru — Russian
de — German
pl — Polish
fr — French
it — Italian
```

For every player-facing string, test source text, translation presence, placeholders, markup, plural forms, Cyrillic glyphs, Polish diacritics, and 30% expansion tolerance for German/French. Verify fallback to English and check clipping in HUD, subtitles, menus, mission objectives, and error messages.

## Source-control rules

- Before release, commit source files and metadata; do not commit generated caches or DerivedDataCache. During initial setup, untracked scaffold files are allowed until the first repository snapshot is intentionally created.
- Use Git LFS for large source assets where appropriate.
- Keep imported assets reproducible from the source file and documented settings.
- Do not replace an approved asset in place without updating its source revision and license row.

## Import manifest

Use `Docs/ContentTables/ASSET_IMPORT_MANIFEST.csv` as the canonical record for the measured import settings and budget result of each production asset.
