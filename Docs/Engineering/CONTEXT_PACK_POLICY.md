# Codex Context Pack Policy

## Purpose

Give each Codex agent the smallest reliable context needed to complete its task. Prefer targeted evidence over loading the whole repository.

## Canonical sources

- Start with `Docs/CONTENT_INDEX.md` to locate authoritative documentation.
- Use the most specific domain document as the source of truth: `Docs/Engineering/API_CONTRACTS.md` for interfaces, the relevant Gameplay/Narrative/Missions document for behavior, and ContentTables for structured data.
- Treat source code and configuration as authoritative for implemented behavior; treat docs as intent when they disagree.
- Record important decisions in the relevant canonical document, not in an agent-only note.

## Task-specific context packs

Build a small pack before editing:

1. Task statement and acceptance criteria.
2. One canonical spec plus only the directly related contracts, schemas, or examples.
3. Exact files to inspect or change, with relevant symbols or sections.
4. Constraints: allowed scope, platform, compatibility, tests, and required output.
5. A short known-state summary and open questions.

Prefer excerpts, file paths, and symbol names. Load full files only when structure or interactions cannot be understood from targeted excerpts.

## Summaries

At the end of a task, leave a compact handoff summary:

```text
Goal: …
Changed: …
Decisions: …
Validation: …
Open risks/questions: …
Next useful context: …
```

Keep summaries factual, dated when useful, and link to files rather than repeating their contents.

## Do not load by default

- The entire repository, generated output, binaries, caches, vendor/dependency trees, or unrelated assets.
- Large localization tables, dialogue files, or content catalogs for an engineering task unless the task names them.
- Historical plans or obsolete notes when a current canonical spec exists.
- Repeated copies of the same requirement, full logs, or unchanged files already covered by a summary.

## Prompt templates

### Implementation

```text
Task: <one outcome>
Acceptance: <observable checks>
Context: <canonical paths and targeted sections>
Scope: change only <files/area>; do not change <excluded areas>
Constraints: <compatibility, style, performance, tests>
First inspect: <symbols/files>
Report: changed files, validation, risks, and follow-up context.
```

### Investigation

```text
Question: <specific question>
Evidence to inspect: <paths/symbols/log range>
Do not modify files.
Return: finding, evidence, confidence, and smallest recommended next step.
```

## Refresh rules

Refresh the context pack when the task changes scope, a canonical file changes, implementation and docs disagree, a dependency/API version changes, or an agent has made two unsuccessful attempts. Re-read only the affected source and update the summary; do not automatically reload the whole pack.

Before finalizing, verify the requested file scope, run the smallest relevant validation, and include any unresolved ambiguity in the handoff.
