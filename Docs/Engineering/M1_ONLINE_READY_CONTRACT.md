# M1 Online-Ready Contract

## Local-first rule

E1M1 must launch, play, save, retry, and complete in **Offline Mode** without a server connection. Online services are optional and must not be initialized as a prerequisite for the local flow.

## Authority

In an online session, the server owns health, ammo, damage, enemy spawns, wave progression, relay health, objective state, pickups, and gate state. Clients may predict movement, dash, and local weapon presentation, but the server confirms gameplay outcomes.

## Events and RPC intent

- `Server_RequestFire`: validates weapon state and resolves damage.
- `Server_RequestInteract`: validates relay, pickup, and gate interactions.
- `Client_PlayHitMarker`: cosmetic feedback after confirmed hit.
- `Multicast_EnemyDeath`: synchronized cosmetic death event after server state changes.
- `M1.Event.Gate.Opened`: replicated with `GateId`, `UnlockReason`, and `DestinationId`.

## Late join and reconnect

Late joiners receive current objective, wave, relay, pickup, and gate state. Reconnect restores the latest checkpoint and never replays already committed rewards. Cosmetic VFX/audio may restart locally without changing gameplay state.
