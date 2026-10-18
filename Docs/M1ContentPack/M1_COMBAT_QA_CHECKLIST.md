# M1 Combat Slice — QA Smoke Checklist

## Build and startup

- [ ] Project opens with no missing plugin or asset errors.
- [ ] M1 map loads in Development build without editor-only dependencies.
- [ ] Player spawns inside the Spawn Bunker with 100 health and 50 armor.
- [ ] FOV, input mapping, mouse sensitivity, and controller bindings are usable.
- [ ] All M1 HUD strings resolve through localization keys.

## Route and objectives

- [ ] E1M1-01 completes after leaving the recovery chamber.
- [ ] E1M1-02 grants exactly one Valkyrie Arc-Carbine.
- [ ] E1M1-03 completes only after the first Razor-Stalker is defeated.
- [ ] E1M1-04 activates the relay and starts the correct objective state.
- [ ] E1M1-05 requires the full 20-second defense timer unless the relay fails.
- [ ] E1M1-06 opens the subway gate only after all active final-wave enemies are defeated.
- [ ] E1M1-07 completes at the Surface Exit volume.
- [ ] Reloading the map preserves or resets objective state according to the save policy, never a partial invalid state.

## Enemy behavior

- [ ] Razor-Stalker uses navigation and cannot attack through solid cover.
- [ ] Razor-Stalker lunge has a visible/ audible telegraph before damage.
- [ ] Razor-Stalker stagger triggers at 30 damage within 0.4 seconds.
- [ ] Razor-Stalker death removes threat state and does not respawn unexpectedly.
- [ ] Phalanx Trooper shield faces the player and blocks/reduces front damage.
- [ ] Phalanx Trooper rear weak point is reachable and has distinct feedback.
- [ ] Enemies do not spawn inside the player, relay, pickups, or blocking geometry.
- [ ] Waves cannot start twice after reconnect, reload, or repeated interaction.

## Weapons and pickups

- [ ] Valkyrie Arc-Carbine fires at the intended 9 shots/second.
- [ ] Damage, critical multiplier, spread, and ammunition match `M1_COMBAT_BALANCE.csv`.
- [ ] Muzzle and impact effects do not remain attached after weapon destruction or map travel.
- [ ] Health Cell restores 25 health without exceeding maximum.
- [ ] Armor Plate restores 20 armor without exceeding maximum.
- [ ] Arc Cell Crate restores 45 ammunition and cannot be duplicated.
- [ ] Secret-room rewards are optional and do not block the main route.

## VFX, audio, and readability

- [ ] Every event in `M1_VFX_AUDIO_EVENTS.csv` has a placeholder or production asset reference.
- [ ] Lunge, shield hit, weak-point hit, relay warning, and wave-start cues remain distinguishable during combat.
- [ ] Objective audio is not masked by automatic weapon fire.
- [ ] VFX quality tiers have a valid Low/Medium/High fallback.
- [ ] Networked cosmetic events do not duplicate for local and remote players.
- [ ] Subtitle or UI keys exist for objective, wave, secret, gate, and failure messages.

## Performance and stability

- [ ] Representative M1 scene targets 60 FPS at 1440p High on the project baseline hardware.
- [ ] No frame exceeds the 16.7 ms target during a full defense wave without a documented exception.
- [ ] No persistent log spam appears during a complete run.
- [ ] No memory or actor count grows after restarting the map three times.
- [ ] Packaged Development build completes the M1 route without crash, soft lock, or missing asset.

## Localization smoke pass

- [ ] Test `en`, `uk`, `ru`, `de`, `pl`, `fr`, and `it`.
- [ ] Cyrillic glyphs render in HUD, subtitles, menus, and objective notifications.
- [ ] Polish diacritics render correctly.
- [ ] German/French expansion does not clip objective or wave text.
- [ ] Missing translation falls back to English without exposing a key name.

## Sign-off

Record build version, map revision, platform, resolution, language, tester, date, and blocking defects before marking M1 Combat Slice `Ready for UE integration`.
