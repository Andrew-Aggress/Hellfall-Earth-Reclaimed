# M1 Save, Settings, and Input

## Save/checkpoint

Save slot: `SaveSlot_Primary`. Payload includes player transform, health, armor, ammo, active objective IDs and states, inventory, difficulty, locale, and last checkpoint ID. Missing or invalid fields use defaults and are logged without blocking level load.

Checkpoint IDs use `CP_M1_Start`, `CP_M1_Relay`, and `CP_M1_Subway`. Active encounter actors are reconstructed from the checkpoint and are never serialized as arbitrary runtime pointers.

## Enhanced Input

| Action | Keyboard/mouse | Gamepad |
|---|---|---|
| `M1.Input.Move` | WASD | Left stick |
| `M1.Input.Look` | Mouse | Right stick |
| `M1.Input.Fire` | Left mouse | Right trigger |
| `M1.Input.Dash` | Left Shift | South face button |
| `M1.Input.Interact` | E | West face button |
| `M1.Input.Pause` | Escape | Menu |

All actions must support rebinding, dead-zone settings, and a safe keyboard fallback.

## Settings and accessibility

Subtitles default to on; size and background opacity are adjustable. Supported color filters are protanopia, deuteranopia, and tritanopia. Difficulty presets are Story, Normal, and Hardcore. Locale values are `en`, `uk`, `ru`, `de`, `pl`, `fr`, and `it`.
