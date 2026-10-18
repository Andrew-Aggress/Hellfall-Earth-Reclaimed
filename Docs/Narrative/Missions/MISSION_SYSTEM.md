# Mission and Objective System

## Mission types

### Main mission

Required for campaign progression. It has a clear start, active, completed, and failed state.

### Optional mission

Rewards exploration, rescue, secret discovery, or additional combat. It must never prevent campaign completion.

### Dynamic combat objective

Created during a level event, such as defending a relay, surviving an ambush, or escaping a collapsing arena.

### Hidden objective

Triggered by exploration, a secret area, a lore object, or a specific action. Hidden objectives are revealed only after activation.

## Mission state machine

```text
Locked -> Available -> Active -> Completed
                         |
                         -> Failed -> Retryable
```

Optional state:

```text
Hidden -> Revealed -> Available -> Active -> Completed
```

## Objective types

- Reach a location.
- Eliminate a target.
- Eliminate a number of enemies.
- Activate a terminal.
- Recover an item.
- Defend an objective for a duration.
- Escort an NPC or vehicle.
- Survive an encounter.
- Find a secret.
- Choose a dialogue response.
- Complete a mission without triggering an alarm.

## Objective presentation

The HUD should display one primary objective and up to three secondary objectives. Completed objectives remain briefly visible, then move to the mission log.

Every objective requires:

```text
Objective ID
Localization key
Objective type
Activation condition
Completion condition
Failure condition, if any
Optional marker
Reward
```

## E1M1 mission definition

### Main mission: Breach Point

1. Exit the recovery chamber.
2. Recover the Valkyrie Arc-Carbine.
3. Eliminate the first Razor-Stalker group.
4. Restore power to the transit gate.
5. Open the subway gate.
6. Reach the surface.

### Optional mission: Aegis Memory

Find the hidden maintenance chamber and recover the final recording of an Aegis evacuation officer.

Reward:

- campaign record;
- Arc Cell ammunition;
- optional Mara dialogue in E1M2.

### Dynamic objective: Hold the Junction

After the player activates the power junction, survive three enemy waves while the relay reboots.

Failure condition:

- the relay core is destroyed.

Reward:

- access to a shortcut;
- additional armor pickup;
- improved mission score.

## Mission failure philosophy

Avoid frequent hard failure. Most failed objectives should create a new combat state, reduce the reward, or close an optional route. The main campaign should remain readable and forward-moving.

## Rewards

- ammunition;
- health or armor;
- weapon upgrades;
- lore records;
- alternate dialogue;
- score multiplier;
- cosmetic player markers;
- access to secrets or shortcuts.

No reward should make the game mandatory-pay-to-win or dependent on external purchases.
