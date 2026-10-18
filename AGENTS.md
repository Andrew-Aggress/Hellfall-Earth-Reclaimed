# Hellfall: Earth Reclaimed — Agent Operating Rules

## Mission

Build an original, modern 2026 arena FPS in Unreal Engine. Use the reference pack for mood and visual direction only; do not copy protected game names, characters, maps, assets, text, or audio.

## Canonical context order

1. `README.md`
2. `Docs/CONTENT_INDEX.md`
3. The task-specific document(s) named in the request
4. The smallest relevant table under `Docs/ContentTables/`
5. `Docs/Engineering/API_CONTRACTS.md` for implementation work

Do not load the entire documentation tree unless performing an audit.

## Agent rules

- One task, one owner, one declared write scope.
- Read the canonical context order before editing.
- Prefer small, reviewable patches over broad rewrites.
- Never invent lore, IDs, string keys, or gameplay values that conflict with existing tables.
- Keep runtime code, design data, localization, and art briefs in their designated folders.
- Record new IDs in the relevant index/table immediately.
- Do not modify generated or imported binary assets without an explicit task.
- End every task with: changed files, validation performed, blockers, and next handoff.

## Definition of done

A task is complete only when the requested files exist, references are internally consistent, localization keys are accounted for, and a lightweight validation has been run or its blocker is documented.

## Efficient handoff format

`Goal:` one sentence  
`Read:` exact files used  
`Changed:` exact files changed  
`Validated:` checks run and result  
`Next:` one concrete follow-up

