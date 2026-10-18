# M1 AI Behavior Contracts

## Shared contract

Every M1 enemy uses `Idle`, `Alert`, `Engage`, `Stagger`, and `Dead` states. Perception is server-authoritative online. Navigation uses the level NavMesh and never teleports an enemy through a closed gate. Death emits the existing combat event and releases the wave slot exactly once.

## Razor-Stalker — `EN_RazorStalker`

- Role: fast melee pressure.
- Perception: sight 2000uu, hearing 1500uu.
- Engage: pursue the last confirmed player position, choose the shortest valid route, and close distance quickly.
- Attack: telegraph 0.5s before strike; telegraph is the primary stagger vulnerability window.
- Recovery: after a missed strike, reposition for 0.35s before attacking again.
- Failure safety: if navigation fails, move to the last valid nav point and re-query rather than applying damage.

## Phalanx Trooper — `EN_PhalanxTrooper`

- Role: shielded ranged anchor.
- Perception: sight 3000uu, hearing 2000uu.
- Engage: hold a valid chokepoint and maintain line of sight before firing.
- Frontal shield: blocks frontal damage while active; rear power core receives 2.5x damage.
- Shield overload: enters `Stagger` for 2.0s and exposes the core from all directions.
- Attack: burst energy fire with an explicit telegraph event for VFX/audio synchronization.

## Difficulty modifiers

Difficulty changes health, reaction delay, and attack accuracy only. It must not bypass objective rules, gate state rules, or placement safety rules.
