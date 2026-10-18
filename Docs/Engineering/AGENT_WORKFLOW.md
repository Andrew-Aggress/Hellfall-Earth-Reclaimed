# Multi-Agent Workflow

## Purpose

Use small, owned tasks that move one milestone toward a playable, testable build. The milestone backlog and its acceptance tests are the source of truth; agents do not expand scope without updating them.

## Roles and boundaries

| Role | Owns | Does not own |
|---|---|---|
| Design | Player experience, mission flow, combat rules, tuning targets, acceptance criteria | Production code or final asset implementation |
| Engineering | C++/Blueprint systems, integration, tools, performance, save/network contracts | Unapproved gameplay direction or final narrative/content decisions |
| Content | Levels, encounters, assets, dialogue, localization data, authored tuning tables | Core systems or changing contracts without Engineering review |
| QA | Test plans, regression checks, reproduction steps, milestone sign-off evidence | Fixing defects or redefining acceptance criteria |

One agent may cover multiple roles on a small task, but ownership must still be named explicitly.

## Task boundaries

- Start from one backlog item or defect with a measurable outcome.
- Define the files/systems in scope, dependencies, acceptance checks, and out-of-scope work before starting.
- Keep changes atomic: one feature, fix, content slice, or testable refactor per task.
- Treat APIs, replicated state, data schemas, and save formats as shared contracts. Record contract changes before dependent work begins.
- Do not modify another agent's active files or silently absorb adjacent work; create a follow-up task instead.

## Handoff sequence

1. **Design → Engineering/Content:** provide intent, player-facing behavior, constraints, tuning targets, edge cases, and acceptance criteria.
2. **Engineering → Content/QA:** provide the usable build/system, exposed parameters, setup notes, known limitations, and a smoke-test path.
3. **Content → QA:** provide the authored slice, asset/data references, prerequisites, expected results, and any known deviations.
4. **QA → Owner:** provide pass/fail evidence, repro steps for failures, severity, and the build or commit tested. The owner fixes; QA verifies.

Every handoff includes: task ID, current status, owner, changed files or assets, dependencies, validation performed, known risks, and the next action. Link the handoff to the relevant backlog item or issue.

## Definition of done

A task is done only when:

- the stated acceptance criteria pass in the target build/configuration;
- implementation and content are integrated, not merely present in isolation;
- relevant automated checks, smoke tests, or a documented manual test have passed;
- multiplayer, save/load, performance, localization, and platform impact are checked when applicable;
- QA has evidence for the result, or the owner has documented why QA review is not applicable;
- documentation, data tables, contracts, and known limitations are updated;
- the change is committed in a reviewable unit and the task is marked complete with no unowned follow-up.

## Avoiding duplicate work

- Before starting, search the backlog, active task board, recent commits, and handoff notes for the same feature, system, asset, or defect.
- Claim a task with one owner and a clear scope. Use a short-lived file/system lock or an explicit `IN PROGRESS` note for contested areas.
- Keep one canonical implementation and one source-of-truth data table; link to it instead of creating parallel copies.
- Reuse existing contracts, helpers, assets, and test fixtures. If a replacement is justified, deprecate the old one in the same task.
- Ask the current owner before touching overlapping files. If ownership is unclear, stop and resolve it in the task record before editing.
- Close or supersede stale tasks explicitly; never restart an apparently unfinished task without checking its last handoff.

## Working states

`READY` → `IN PROGRESS` → `HANDOFF` → `QA` → `DONE`

Use `BLOCKED` when a dependency or decision prevents progress. A blocked task must name the blocker, responsible party, and next unblock action; it must not be duplicated by starting an uncoordinated parallel task.
