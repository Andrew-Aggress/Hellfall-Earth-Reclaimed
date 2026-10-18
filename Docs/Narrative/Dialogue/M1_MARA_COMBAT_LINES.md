# M1 Mara Combat and Mission Lines

All lines use `FText`/String Tables and the seven-language localization workflow. These are English source lines; translations are added through the localization table after the lines are approved.

| Key | Trigger | Mara line | Delivery | Subtitle priority |
|---|---|---|---|---|
| `Narrative.E1M1.Mara.EnterCorridor` | Player exits recovery chamber | “The maintenance line is open. Keep your weapon ready.” | Calm tactical | Medium |
| `Narrative.E1M1.Mara.RazorAlert` | First Razor-Stalker detects player | “Motion ahead. Fast contact. Do not let it close the distance.” | Immediate warning | High |
| `Narrative.E1M1.Mara.RazorStagger` | First stagger event | “That burst disrupted its balance. Repeat the timing.” | Coaching | Medium |
| `Narrative.E1M1.Mara.JunctionOnline` | Junction console activated | “Power is rerouting to the transit relay. The network noticed us.” | Tension rise | High |
| `Narrative.E1M1.Mara.RelayDefenseStart` | Relay defense begins | “Relay reboot started. Hold the chamber for twenty seconds.” | Mission command | High |
| `Narrative.E1M1.Mara.RelayDamaged` | Relay below 70% health | “Relay integrity is dropping. Move the pressure away from the core.” | Urgent | High |
| `Narrative.E1M1.Mara.PhalanxRevealed` | First Phalanx Trooper enters | “Shielded unit. Its rear armor is weaker than the front.” | Tactical callout | High |
| `Narrative.E1M1.Mara.RelayComplete` | Relay reaches 100% | “Transit power restored. The gate is responding.” | Confirmation | Medium |
| `Narrative.E1M1.Mara.SecretFound` | Aegis room revealed | “That chamber was hidden from the evacuation map. Someone wanted it preserved.” | Optional lore | Low |
| `Narrative.E1M1.Mara.SubwayFinalWave` | Final arena starts | “More contacts below. Clear the platform and keep the exit in sight.” | Combat command | High |
| `Narrative.E1M1.Mara.GateOpen` | Subway gate opens | “Gate open. Surface air is contaminated but breathable.” | Transition | Medium |
| `Narrative.E1M1.Mara.LevelComplete` | Player reaches surface | “The city is still converting. We interrupt it here.” | Closing beat | High |

## Playback rules

- Do not repeat the same warning more than once per encounter unless the state changes materially.
- High-priority lines interrupt low-priority lore, but never interrupt a critical hit or damage cue.
- In co-op, play mission lines for the whole party once; local pickup confirmations remain local.
- If voice is unavailable, subtitles and a HUD event remain sufficient to understand the objective.
