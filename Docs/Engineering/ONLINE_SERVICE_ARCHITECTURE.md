# Online Service Architecture

## Goals

Support 2–4 player co-op while keeping the game fully playable and testable offline. The gameplay layer must not call EOS directly; it communicates through service-neutral contracts.

## Runtime modes

| Mode | Identity | Session transport | Credentials | Intended use |
|---|---|---|---|---|
| Offline | Local profile | Listen server or standalone | None | Development, solo play, QA, accessibility testing |
| LAN | Local or platform identity | LAN discovery/session | None | Local co-op and network regression tests |
| EOS | EOS identity | EOS sessions and invites | EOS product configuration | Online co-op, friends, presence, platform expansion |

Offline is the default development mode. Switching to EOS is a provider configuration change, not a gameplay rewrite.

## Service contracts

These are conceptual contracts for the first implementation pass. They intentionally avoid locking the project to a C++ or Blueprint signature before the UE project compiles.

### `IOnlineIdentity`

**Responsibilities:** initialize a provider, expose local identity state, sign in/out where supported, and report credential or service failures.

**Inputs:** provider mode, optional local profile ID, optional platform credentials.  
**Outputs:** `SignedOut`, `Local`, `Authenticating`, `SignedIn`, `Unavailable`, or `Error`.  
**Failure states:** missing credentials, offline provider unavailable, authentication timeout, service maintenance.

### `ISessionService`

**Responsibilities:** create, discover, join, leave, destroy, and query co-op sessions for up to four players.

**Inputs:** map/mission ID, difficulty, player limit, privacy, provider mode.  
**Outputs:** session ID, owner, joinability, player count, mission metadata.  
**Failure states:** invalid map, full session, version mismatch, timeout, provider unavailable, permission denied.

### `IPartyService`

**Responsibilities:** maintain a pre-match party, invite members where supported, and transfer the party into a session.

**Inputs:** local party, invite target, session request.  
**Outputs:** party member state, invite state, ready state, host designation.  
**Failure states:** invite unsupported, member left, host left, incompatible build, invite expired.

### `IReconnectService`

**Responsibilities:** detect disconnects, retain a short-lived reconnect token, and restore a player to the authoritative mission when possible.

**Inputs:** session ID, player identity, reconnect token, build version.  
**Outputs:** `Reconnected`, `GracePeriod`, `RequiresRestart`, or `Rejected`.  
**Failure states:** mission ended, token expired, player state invalid, host unavailable, incompatible build.

## Authority and persistence

- The server owns mission state, enemy state, pickup claims, damage validation, objective completion, and reward grants.
- Clients own presentation, input intent, local prediction, and temporary UI state.
- Online progression is validated by the authoritative server before it is committed.
- Offline progression is stored in a local profile and remains playable without EOS.
- Offline progress is not silently merged into online progression. A future sync policy must explicitly resolve conflicts by profile version and server authority.
- Save data must include game version, content revision, difficulty, mission ID, player profile ID, and a schema version.

## Player flow

1. Start game and choose Offline, LAN, or EOS.
2. Initialize identity provider.
3. Create or discover a session.
4. Validate build/content revision before join.
5. Load the mission and assign server authority.
6. Replicate mission state and player readiness.
7. Handle disconnects through the reconnect grace period.
8. Commit mission results through the appropriate persistence provider.

## Test matrix

| Scenario | Expected result |
|---|---|
| Solo Offline | Player starts and completes a mission without network or EOS credentials |
| Two-player LAN host/join | Two clients discover, join, replicate movement and complete an objective |
| EOS host/join | Authenticated players create and join a private co-op session |
| Late join | A new player joins only at an allowed mission checkpoint and receives valid state |
| Disconnect/reconnect | A disconnected player returns during the grace period without duplicating rewards |
| Host loss | Remaining players receive a clear failure or migration outcome; no silent progress corruption |
| Invalid session | Join is rejected with a localized reason and a return-to-menu option |
| Missing EOS credentials | EOS mode reports setup guidance; Offline remains available |
| Version mismatch | Join is blocked before mission load with a localized update message |

## Player-facing failure policy

Every service failure must produce a localized message, a stable error category for analytics/QA, and a safe next action: retry, choose another session, return to menu, or switch to Offline.

## Exit criteria

- Offline mode requires no EOS credentials.
- EOS calls are isolated behind the contracts above.
- All test-matrix scenarios have a defined expected result.
- Server authority and save ownership are explicit.
