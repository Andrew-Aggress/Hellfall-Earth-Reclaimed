# NPC, AI, Dialogue, and Mission Logic

## 1. NPC categories

### Combat enemies

Combat enemies are controlled by an AI Controller and a small state machine. They do not use long dialogue scenes during combat. They communicate through short barks, radio effects, animation cues, and threat reactions.

### Mission NPCs

Mission NPCs are non-combat characters or remote personalities that provide objectives, world information, warnings, and mission state changes. They should be usable through proximity triggers, interaction prompts, or radio messages.

### Ambient NPCs

Ambient NPCs exist to make locations feel inhabited. They can perform loops such as repairing equipment, hiding, carrying supplies, scanning doors, or reacting to combat. Their lines are optional and never block progress.

## 2. Enemy AI state machine

Initial states:

```text
Disabled
Idle
Patrol
Investigate
Alert
Chase
Attack
Reposition
Stunned
Flee
Dead
```

### State logic

```text
Disabled:
  Wait for encounter activation or mission trigger.

Idle:
  Play idle animation.
  Listen for noise and perception events.
  Transition to Investigate when a suspicious event is detected.

Patrol:
  Follow patrol points.
  Transition to Alert when the player is seen or heard.

Investigate:
  Move to the last known sound or visual location.
  Search for a limited duration.
  Return to Patrol or enter Alert.

Alert:
  Face the threat direction.
  Broadcast an alert to nearby allies.
  Transition to Chase when the player is confirmed.

Chase:
  Pursue the player using navigation.
  Select a tactical position.
  Transition to Attack when in range.
  Transition to Reposition when blocked or exposed.

Attack:
  Check cooldown, line of sight, and attack range.
  Perform melee or ranged attack.
  Transition to Chase if the player leaves range.
  Transition to Stunned when a stagger threshold is reached.

Reposition:
  Find cover, flank route, or higher ground.
  Return to Attack or Chase.

Stunned:
  Disable attack for a short duration.
  Play hit reaction.
  Return to Chase or Attack.

Flee:
  Used only by support or civilian NPCs.
  Move toward a safe location.

Dead:
  Disable perception and collision logic as appropriate.
  Play death reaction.
  Notify encounter and mission systems.
```

## 3. Razor-Stalker behavior

The Razor-Stalker is a fast melee enemy.

### Perception

- visual detection cone;
- short-range hearing;
- reaction to weapon impact and explosions;
- shared alert with nearby Razor-Stalkers;
- loses accuracy when blinded by a strong energy burst.

### Combat behavior

- approach quickly but avoid stacking with allies;
- choose left or right attack angle;
- perform a short lunge with a readable warning animation;
- retreat briefly after missing a lunge;
- become vulnerable after hitting a wall or heavy cover;
- prioritize isolated players, not already engaged targets.

### Readability requirements

- cyan energy veins indicate active aggression;
- magenta flash indicates a lunge charge;
- stagger animation must be visible from the player's combat distance;
- attack wind-up must be short but readable.

## 4. Phalanx Trooper behavior

The Phalanx Trooper is a slow armored ranged unit.

- keeps the shield toward the player;
- searches for cover when exposed;
- advances in short bursts;
- coordinates with Razor-Stalkers;
- lowers the shield while firing;
- becomes vulnerable from the rear or after explosive impact;
- broadcasts a short alert when its shield fails.

## 5. NPC interaction flow

```text
Player enters interaction radius
  -> Show localized interaction prompt
  -> Player presses Interact
  -> Freeze or slow only the conversation camera if appropriate
  -> Start dialogue sequence
  -> Evaluate conditions
  -> Display line or response options
  -> Apply mission, reputation, item, or world-state effects
  -> End conversation
  -> Save important state
```

Combat should never be permanently paused by optional dialogue. Radio dialogue may continue while the player moves and fights.

## 6. Dialogue conditions

Dialogue lines can depend on:

- current mission;
- completed missions;
- player has found a secret;
- player has a specific weapon;
- boss defeated;
- optional rescue completed;
- number of encounters cleared;
- current difficulty;
- language and subtitle settings.

Example condition:

```text
If Mission.E1M3.Completed == true
and WorldState.RelayOneRestored == true
then play Mara.E1M4.AfterRelay
```

## 7. NPC communication channels

### Radio

Used for Mara, distant allies, enemy commanders, and mission updates. The player keeps full movement and combat control.

### Direct interaction

Used for survivors, Dr. Soren, terminals, and optional lore. The player may choose responses where the choice changes information or reward, but never blocks the main campaign.

### Environmental voice

Used for emergency announcements, corrupted recordings, automated systems, and enemy broadcast signals.

## 8. Implementation targets for UE5

Recommended systems:

- `AHellfallAIController`
- `UHellfallEnemyStateComponent`
- `UHellfallPerceptionComponent`
- `UHellfallDialogueSubsystem`
- `UHellfallMissionSubsystem`
- `UHellfallDialogueDataAsset`
- `UHellfallMissionDataAsset`
- `UHellfallObjectiveComponent`

Use data assets for dialogue, mission objectives, rewards, conditions, and localization keys. Do not hardcode player-facing text in C++.
