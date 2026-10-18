# Core Gameplay Specification

## Combat loop

```text
Read space -> choose route -> enter arena -> maintain momentum -> prioritize threats -> collect resources -> discover shortcut -> reach next encounter
```

## Movement principles

- forward momentum is rewarded;
- stopping is sometimes useful but never required for basic shooting;
- vertical routes should offer tactical advantages;
- every arena has at least two viable escape directions;
- sliding is a movement tool, not only a crouch animation;
- air control is strong enough to correct mistakes;
- hazards are telegraphed by color, sound, and animation.

## Damage model

Damage types:

```text
Kinetic
Energy
Explosive
Melee
Environmental
Dimensional
```

Armor absorbs a percentage of incoming damage before health. Some enemies resist one damage type and expose a weakness to another. Damage reactions must remain readable even during high-density encounters.

## Resource philosophy

- ammunition is generous but not infinite;
- health and armor are placed to reward movement through danger;
- secrets provide convenience and mastery rewards;
- no resource pickup should require pixel hunting during a combat emergency;
- pickups use consistent colors and silhouettes.

## Encounter composition

Each major arena should combine:

- pressure enemy;
- ranged threat;
- support or control unit;
- movement challenge;
- resource decision;
- clear completion state.

## Difficulty levels

### Cadet

Reduced enemy damage, generous resources, longer attack telegraphs.

### Operative

Default intended experience.

### Veteran

More aggressive enemy coordination, fewer resources, shorter recovery windows.

### Aegis

High damage, stronger elite composition, reduced auto-recovery.

### Nightmare

Very high damage, altered encounters, no automatic health recovery, additional enemy variants, and remixed arena routes.

## Scoring

The Style Meter increases through:

- movement speed;
- weapon variety;
- weak-point hits;
- multi-kills;
- environmental kills;
- secret discovery;
- completing encounters without damage.

The meter decays when the player stops, repeats one weapon too long, or takes avoidable damage.
