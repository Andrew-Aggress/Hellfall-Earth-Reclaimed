# M1 Blueprint Event Contracts

These event names are the stable contract between level actors, wave manager, objectives, HUD, audio, and VFX. Use Gameplay Tags or strongly typed enums in implementation; do not use free-form display strings as event identifiers.

## Core actors

| Actor | Owns | Emits | Consumes |
|---|---|---|---|
| `BP_M1_WaveManager` | Wave state, spawn locks, active enemy count | `M1.Event.Wave.Started`, `M1.Event.Wave.Cleared`, `M1.Event.Wave.Failed` | Enemy death, objective state, spawn point data |
| `BP_M1_ObjectiveManager` | Main/optional objective progression | `M1.Event.Objective.Updated`, `M1.Event.Objective.Completed`, `M1.Event.Objective.Failed` | Interactions, wave clear, relay health |
| `BP_M1_RelayCore` | Relay health and defense timer | `M1.Event.Relay.Activated`, `M1.Event.Relay.Damaged`, `M1.Event.Relay.Completed`, `M1.Event.Relay.Failed` | Player interaction, enemy damage |
| `BP_M1_GateController` | Subway gate state | `M1.Event.Gate.Opened`, `M1.Event.Gate.Blocked` | Final encounter clear |
| `BP_M1_Pickup` | Pickup availability and grant | `M1.Event.Pickup.Granted`, `M1.Event.Pickup.Depleted` | Player interaction, save state |
| `BP_M1_HUD` | Objective, wave, damage, pickup feedback | None | All player-facing M1 events |

## Event payloads

| Event | Required payload |
|---|---|
| `M1.Event.Wave.Started` | `WaveId`, `EncounterId`, `WaveIndex`, `EnemyCount`, `SpawnRoute` |
| `M1.Event.Wave.Cleared` | `WaveId`, `EncounterId`, `RemainingActiveEnemies`, `RewardId` |
| `M1.Event.Objective.Updated` | `ObjectiveId`, `State`, `Progress`, `Target`, `LocalizationKey` |
| `M1.Event.Relay.Damaged` | `RelayId`, `CurrentHealth`, `MaxHealth`, `DamageSourceId` |
| `M1.Event.Pickup.Granted` | `PickupId`, `PickupType`, `Amount`, `InstigatorId` |
| `M1.Event.Gate.Opened` | `GateId`, `UnlockReason`, `DestinationId` |

## State rules

- Wave start is idempotent: the same `WaveId` cannot start twice.
- Objective completion is idempotent and server-authoritative.
- Relay failure stops spawning, marks the mission state failed, and exposes a retry/return-to-menu action.
- Gate opening is allowed only after `E1M1_ENC_04` is cleared.
- Pickup grant is authoritative and cannot be granted twice to the same player.
- Cosmetic VFX/audio may be locally predicted, but gameplay state must be replicated.
