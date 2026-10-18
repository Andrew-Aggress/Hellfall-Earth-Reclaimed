# Weapon Upgrade System

## Design goal

Weapon upgrades should change decision-making, not simply increase damage. Each weapon has two upgrade branches with three tiers each. The player can unlock upgrades using recovered Aegis components.

## Upgrade currency

**Aegis Components** are found in missions, secret rooms, optional objectives, and boss arenas. They are shared across the campaign save.

## Valkyrie Arc-Carbine upgrades

### Branch A — Precision Arc

1. Reduced movement spread.
2. Increased weak-point multiplier.
3. Chained critical hit jumps to a nearby enemy.

### Branch B — Overload Arc

1. Increased stagger buildup.
2. Small impact shockwave after sustained fire.
3. Charged burst alternate fire unlocked.

## Singularity Disruptor upgrades

### Branch A — Compression

- larger pull radius;
- longer enemy suspension;
- stronger final implosion.

### Branch B — Fracture

- creates two secondary gravity wells;
- damages armored enemies more effectively;
- leaves a short-lived area-denial field.

## Upgrade rules

- upgrades are permanent after purchase;
- the player can preview both branches before spending components;
- upgrade descriptions use localized `FText`;
- multiplayer unlocks are synchronized by the server;
- upgrades must remain optional for campaign completion.
