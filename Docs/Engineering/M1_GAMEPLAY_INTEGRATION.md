# M1 Gameplay Integration Flow

## Authoritative flow

1. `SP_M1_Spawn_Player` initializes the player, HUD, input, and checkpoint state.
2. `E1M1_ENC_01` starts when the player enters the maintenance corridor and uses `SP_M1_Razor_Corridor_A`.
3. `E1M1_ENC_02` starts after the power junction console interaction and uses the north/south/east Razor routes.
4. `E1M1_ENC_03` starts when `OBJ_M1_RelayConsole` activates the relay. The relay objective owns the defense state and health.
5. Relay waves W04–W07 use the existing relay placement IDs. W07 introduces `EN_PhalanxTrooper` on `SP_M1_Relay_UpperCatwalk`.
6. On `M1.Event.Relay.Completed`, the objective manager completes `Mission.E1M1.Objective.HoldRelay`.
7. `E1M1_ENC_04` runs in the subway gate arena. The gate stays closed until the final encounter is cleared.
8. `M1.Event.Gate.Opened` unlocks `GATE_M1_Subway`; reaching the surface exit completes `Mission.E1M1.Objective.ReachSurface`.

## Ownership and failure

- `BP_M1_WaveManager` owns encounter order, active enemy count, wave clear, and retry-safe idempotency.
- `BP_M1_ObjectiveManager` owns mission state and emits objective events.
- `BP_M1_RelayCore` owns relay health and defense failure.
- `BP_M1_GateController` only reacts to the canonical gate event; proximity never opens it.
- Relay failure resets the current encounter, restores the relay to its configured checkpoint health, and does not duplicate rewards.
- A player death reloads the latest checkpoint and resets active encounter actors.

## Rewards and completion

Wave rewards use the existing reward IDs in `M1_COMBAT_WAVES.csv`. The level is complete only after the extraction trigger is entered and the final objective event is committed.
