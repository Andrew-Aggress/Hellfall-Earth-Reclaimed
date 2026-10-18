# M1 External Review Decisions

The external review package is accepted as a requirements source, not as an importable replacement for the project canon.

## Accepted

- Enhanced Input action coverage for move, look, fire, and dash.
- Offline-first save/checkpoint behavior.
- HUD regions for health, armor, ammo, objective marker, crosshair, hit marker, and subtitles.
- Seven-locale validation and accessibility checks.
- Server authority boundaries for health, ammo, enemy spawns, and objective state when online.
- AI contract ideas for Razor-Stalker and Phalanx Trooper.

## Canonicalized

- External placement aliases map to the existing `SP_M1_*` and `GATE_M1_Subway` IDs.
- External mission and Mara keys map to the existing `Mission.E1M1.*` and `Narrative.E1M1.Mara.*` keys.
- External weapon aliases map to `WPN_ValkyrieArcCarbine` and `WPN_SingularityDisruptor`.
- External event names map to the existing `M1.Event.Wave.*`, `M1.Event.Relay.*`, `M1.Event.Objective.*`, and `M1.Event.Gate.*` contracts.

## Rejected as runtime source

- Duplicate `M1.*` weapon IDs.
- Duplicate relay/gate event names.
- `1.5s`, `5.0s`, and similar unit-bearing numeric CSV values.
- The external asset manifest column order; the project manifest schema remains authoritative.
- External balance values that conflict with `Docs/ContentTables/WEAPON_CATALOG.csv`.
- `E1M1-##` objective IDs are intentionally encounter-local row IDs; their user-facing identity is the canonical `Mission.E1M1.*` localization key.

## Rule

New content may add a new ID only when no canonical ID exists. Existing IDs, schemas, and balance tables are never silently overridden by an external sample.
