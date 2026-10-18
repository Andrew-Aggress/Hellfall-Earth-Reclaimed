# Multiplayer Plan

## Recommended first online mode

### Cooperative Campaign

- 2–4 players;
- drop-in/drop-out support where practical;
- shared campaign mission progression;
- individual weapons, health, armor, and ammunition;
- revive system instead of immediate team wipe;
- synchronized doors, switches, objectives, pickups, and boss phases;
- host migration is a later milestone;
- dedicated servers are a later milestone.

The first playable prototype remains single-player, but all gameplay systems should avoid assumptions that only one player exists.

## Network authority

The server or listen-server host is authoritative for:

- enemy AI decisions;
- damage and health;
- weapon hit validation;
- pickups;
- doors and switches;
- mission state;
- boss phases;
- player death and revive;
- campaign progression.

Clients are responsible for local input, camera, prediction, cosmetic effects, and responsive UI. Important gameplay results must be confirmed by the server.

## Multiplayer player roles

Players should not have rigid classes in the first version. Instead, weapon choice and optional equipment create soft roles:

- assault: sustained damage;
- breacher: close-range damage and stagger;
- support: armor, ammo, or temporary protection;
- control: area denial and enemy repositioning.

## Cooperative systems

### Revive

When a player reaches zero health, they enter a downed state for a limited duration. Another player can revive them. If all players are downed, the encounter resets or the team returns to the latest checkpoint.

### Dynamic difficulty

Enemy count, elite probability, health scaling, and encounter composition may scale according to player count. Do not simply multiply enemy health; preserve fast combat and readable kill feedback.

### Dialogue

Mission dialogue is broadcast to all players. Optional interactions have a short interaction lock or shared conversation state. Radio dialogue must remain audible to the whole team without interrupting movement.

### Missions

The server owns mission state. All players see the same primary objective, while optional objectives may track individual discoveries and shared completion rewards.

## Future PvP mode

PvP should be treated as a separate mode rather than forcing the campaign systems to serve competitive play.

Possible modes:

- arena deathmatch;
- team deathmatch;
- relay assault;
- gateway control;
- weapon rotation challenge.

PvP requires separate balance, spawn logic, hit validation, anti-cheat planning, matchmaking, and dedicated server infrastructure.

## Development order

1. Build and validate single-player vertical slice.
2. Add replicated player movement and basic player state.
3. Replicate weapon firing and damage.
4. Replicate one enemy and one combat arena.
5. Add shared objectives and pickups.
6. Add revive and checkpoint recovery.
7. Test 2-player LAN session.
8. Test online session and latency conditions.
9. Expand to 4-player cooperative campaign.
10. Design PvP only after co-op is stable.

## Technical requirements

Use Unreal Engine networking primitives from the beginning:

- replicated properties;
- server RPCs;
- client RPCs;
- multicast RPCs only for appropriate cosmetic events;
- replicated gameplay tags;
- network relevancy;
- dormancy for inactive actors;
- predictable projectile and hit effects;
- server-authoritative mission subsystem.

Do not add online complexity to the first prototype before the offline combat loop is fun and stable.
