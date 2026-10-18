# Engineering API Contracts

## Damage interface

```text
ApplyDamage(DamageAmount, DamageType, Instigator, Causer)
GetHealth()
GetArmor()
CanReceiveDamage()
OnDamageReceived
OnDeath
```

## Weapon contract

```text
CanFire()
StartFire()
StopFire()
FireOnce()
ConsumeAmmo()
GetWeaponDefinition()
OnWeaponFired
OnAmmoChanged
```

## Enemy contract

```text
GetEnemyDefinition()
GetCurrentState()
SetEnemyState()
GetTargetActor()
CanAttackTarget()
RequestReposition()
OnEnemyAlerted
OnEnemyKilled
```

## Mission contract

```text
StartMission(MissionId)
ActivateObjective(ObjectiveId)
CompleteObjective(ObjectiveId)
FailObjective(ObjectiveId)
CompleteMission(MissionId)
GetMissionState(MissionId)
OnObjectiveUpdated
OnMissionCompleted
```

## Dialogue contract

```text
StartDialogue(DialogueId)
CanPlayDialogue(DialogueId, WorldState)
PlayLine(LineId)
StopDialogue()
SetDialoguePriority()
OnLineStarted
OnLineFinished
OnDialogueCompleted
```

## Multiplayer contract

Server authority owns:

- damage;
- enemy state;
- pickups;
- mission progression;
- boss phases;
- revive;
- shared dialogue state.

Client owns:

- input;
- camera;
- local prediction;
- cosmetic effects;
- local subtitle presentation.
