# M1 Combat Slice — Placement Map

## Coordinate convention

Use `L_FirstSlice_Arena` local coordinates with X increasing along the main route from Spawn Bunker to Surface Exit, Y increasing toward the upper catwalk, and Z increasing vertically. Final centimeters are assigned in Unreal; these IDs are the stable design contract.

## Spatial flow

```text
[SPAWN_BUNKER]
      |
[MAINT_CORRIDOR] ---- [SECRET_AEGIS_ROOM]
      |
[POWER_JUNCTION] ---- [UPPER_CATWALK]
      |
[RELAY_CHAMBER] -> [SUBWAY_GATE_ARENA] -> [SURFACE_EXIT]
```

## Required placement IDs

| ID | Type | Area | Purpose |
|---|---|---|---|
| SP_M1_Spawn_Player | PlayerStart | Spawn Bunker | Safe initial spawn |
| SP_M1_Razor_Corridor_A | EnemySpawn | Maintenance Corridor | E1M1_ENC_01 tutorial threat |
| SP_M1_Razor_Junction_North | EnemySpawn | Power Junction | E1M1_ENC_02 angle one |
| SP_M1_Razor_Junction_South | EnemySpawn | Power Junction | E1M1_ENC_02 angle two |
| SP_M1_Razor_Junction_East | EnemySpawn | Power Junction | Delayed reinforcement |
| SP_M1_Relay_DoorWest | EnemySpawn | Relay Chamber | Defense wave 1/final melee |
| SP_M1_Relay_DoorEast | EnemySpawn | Relay Chamber | Defense wave 2/final melee |
| SP_M1_Relay_UpperCatwalk | EnemySpawn | Upper Catwalk | Phalanx support position |
| SP_M1_Subway_LowerWest | EnemySpawn | Subway Gate Arena | Final opener |
| SP_M1_Subway_LowerEast | EnemySpawn | Subway Gate Arena | Final opener |
| SP_M1_Subway_UpperPlatforms | EnemySpawn | Subway Gate Arena | Phalanx crossfire |
| SP_M1_Subway_FlankTunnel | EnemySpawn | Subway Gate Arena | Late Razor flank |
| PU_M1_Health_AfterJunction | Pickup | Power Junction | 25 health after Encounter 02 |
| PU_M1_ArcCell_BeforeRelay | Pickup | Relay approach | 45 arc cells before defense |
| PU_M1_Armor_AegisRoom | Pickup | Secret Aegis Room | 20 armor optional reward |
| OBJ_M1_RelayConsole | Objective | Power Junction | Activates relay defense |
| OBJ_M1_RelayCore | Objective | Relay Chamber | 1,000 relay health |
| GATE_M1_Subway | Gate | Subway Gate Arena | Opens after final encounter |
| EXIT_M1_Surface | ExitVolume | Surface Exit | Completes E1M1-07 |
| SECRET_M1_AegisPanel | SecretTrigger | Maintenance Corridor | Reveals optional room |

## Placement rules

- Every enemy spawn must have a clear navigation route and a fallback point.
- No spawn may overlap the player start, relay core, pickup, cover collision, or another active spawn.
- The Phalanx upper position must be reachable by the player through at least two routes.
- The secret entrance must never block the main route or objective triggers.
- Pickup visibility should teach the next combat decision: health after Junction, ammo before Relay, armor in the secret.
