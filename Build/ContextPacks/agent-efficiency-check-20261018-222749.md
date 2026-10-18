# Hellfall Context Pack

Task: agent-efficiency-check
Generated: 2026-10-18 22:27:49 +03:00

Only the following canonical sources were included:
- D:\Щуцький Андрій\MY-GPT\Projects\Hellfall-Earth-Reclaimed\README.md
- D:\Щуцький Андрій\MY-GPT\Projects\Hellfall-Earth-Reclaimed\Docs\CONTENT_INDEX.md
- Docs\Engineering\API_CONTRACTS.md

---

## D:\Щуцький Андрій\MY-GPT\Projects\Hellfall-Earth-Reclaimed\README.md

# Hellfall: Earth Reclaimed

Original high-speed arena FPS for Unreal Engine 5.8.3.

## Current status

The project workspace is prepared. The Unreal Engine project files will be generated after Unreal Engine 5.8.3 finishes installing.

## First milestone

M1 вЂ” Greybox Combat Slice:

- first-person character and fast movement;
- Enhanced Input;
- Valkyrie Arc-Carbine prototype;
- Razor-Stalker prototype enemy;
- greybox combat arena;
- health, armor, ammo, HUD, save/load foundation;
- localization foundation for English, Ukrainian, Russian, German, Polish, French, and Italian.

## Online direction

The planned online mode is a 2вЂ“4 player cooperative campaign. The first milestone is single-player, but core gameplay systems must remain network-ready. Competitive PvP is a separate later milestone.

## Engine

- Unreal Engine 5.8.3
- Windows x64
- C++ gameplay module with Blueprint content assembly


## D:\Щуцький Андрій\MY-GPT\Projects\Hellfall-Earth-Reclaimed\Docs\CONTENT_INDEX.md

# Hellfall Documentation Index

## Narrative

- `Narrative/NARRATIVE_BIBLE.md`
- `Narrative/CAMPAIGN_OVERVIEW.md`
- `Narrative/Dialogue/PROLOGUE_AND_E1M1.md`
- `Narrative/Dialogue/NPC_DIALOGUE_SAMPLES.md`
- `Narrative/Dialogue/EPISODE_2_DIALOGUE.md`
- `Narrative/Missions/E1M1_Breach_Point.md`
- `Narrative/Missions/E1_CAMPAIGN_MISSIONS.md`
- `Narrative/Missions/MISSION_SYSTEM.md`
- `Missions/EPISODE_1_CONTENT_SPEC.md`
- `Missions/EPISODE_2_CONTENT_SPEC.md`
- `Missions/EPISODE_3_CONTENT_SPEC.md`
- `Missions/EPISODE_4_CONTENT_SPEC.md`

## Gameplay

- `Gameplay/NPC_AI_AND_DIALOGUE.md`
- `Gameplay/MULTIPLAYER_PLAN.md`
- `Gameplay/CORE_GAMEPLAY_SPEC.md`
- `Gameplay/ENEMY_ROSTER.md`
- `Gameplay/BOSS_DESIGN_SPEC.md`
- `Gameplay/WEAPON_UPGRADE_SYSTEM.md`
- `Gameplay/HUD_AND_MENU_SPEC.md`
- `Gameplay/SAVE_SETTINGS_AND_PROGRESSION.md`

## M1 Content Pack

- `M1ContentPack/M1_CONTENT_PACK.md`
- `M1ContentPack/Localization/M1_STRING_KEYS.csv`
- `M1ContentPack/Assets/M1_ASSET_NAMING.md`

## Production

- `AUDIO/AUDIO_AND_VOICE_SPEC.md`
- `LOCALIZATION_PRODUCTION_GUIDE.md`
- `QA_TEST_PLAN.md`
- `PRODUCTION_BACKLOG.md`
- `ReferencePack/REFERENCE-PACK.md`
- `ReferencePack/REFERENCE-INDEX.md`

## Content tables

- `ContentTables/WEAPON_CATALOG.csv`
- `ContentTables/ENEMY_BALANCE.csv`
- `ContentTables/PICKUP_CATALOG.csv`
- `ContentTables/LEVEL_FLOW.csv`
- `ContentTables/VOICE_LINE_CATALOG.csv`
- `ContentTables/ASSET_BACKLOG.csv`
- `ContentTables/LORE_RECORDS.md`

## Additional production documents

- `Localization/M1_LOCALIZATION_7_LANGUAGES.csv`
- `Art/ASSET_BRIEFS.md`
- `Levels/LEVEL_SCHEMATICS.md`
- `Engineering/API_CONTRACTS.md`
- `Marketing/STORE_PAGE_DRAFT.md`


## Docs\Engineering\API_CONTRACTS.md

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

