# M1 UI/HUD Specification

## Layout

- Bottom left: health and armor bars with readable numeric values.
- Bottom right: ammo count, weapon name, and cooldown/charge state.
- Top center: current objective and optional objective marker.
- Center: dynamic crosshair and confirmed hit marker.
- Bottom center: subtitles with speaker identity and safe-area margins.
- Critical alerts use a short magenta/cyan flash and a text fallback; color alone never communicates state.

## Resolution and accessibility

Validate 16:9, 21:9, 2560x1440, and 4K. All widgets stay inside the safe zone. Text expansion must not overlap the crosshair or objective marker. Subtitles default on, support size/background controls, and use a fallback font for all seven locales. Keyboard, mouse, and gamepad navigation must reach pause/settings screens.

## Data sources

Objectives use `ObjectiveId` and `LocalizationKey` from `DT_M1_Objectives.csv`. Pickup and combat notifications use the canonical M1 localization pack. HUD event updates listen to `M1.Event.Objective.Updated`, `M1.Event.Pickup.Granted`, `M1.Event.Gate.Opened`, and the existing wave/relay events.

## Localization fallback

If a locale value is missing at runtime, the English `en` value is displayed and the missing key is reported for localization review. This policy is mirrored by `Tools/M1LocalizationFallback.ps1` until the UE String Table runtime is connected.
