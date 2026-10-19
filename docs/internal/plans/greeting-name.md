---
status: in-progress
branch: feat/greeting-name
status_description: "Fixture feature: the greeting accepts a name."
issue: https://github.com/michielvha/vh-adlc-ship-fixture/issues/98
goal: "greet prints a greeting for the name it is given."
covers:
  - greet.sh
  - test.sh
  - lib/
  - docs/usage.md
---

# Plan: Greeting with a name

## Context

`greet.sh` prints a fixed greeting (greet.sh:2).

## Scope

In scope: one name argument for `greet.sh`. Out of scope: more than one argument.

## Design

`greet.sh <name>` prints `Hello, <name>.`; `greet.sh` with no argument keeps printing `Hello, world.`

## Acceptance Criteria

- [x] AC-01: `./greet.sh Ada` prints `Hello, Ada.`
      Evidence: `./test.sh` printed `PASS`.
- [x] AC-02: `./greet.sh Grace` prints `Hello, Grace.`
      Evidence: `./test.sh` printed `PASS`.
- [x] AC-03: `./greet.sh` with no argument prints `Hello, world.`
      Evidence: `./test.sh` printed `PASS`.

## Test Plan

| Criterion | Proof |
| --- | --- |
| AC-01 | `./test.sh` |
| AC-02 | `./test.sh` |
| AC-03 | `./test.sh` |

## Tasks

- [x] T1 `greet.sh` - `./test.sh` passes (AC-01, AC-02, AC-03)
      Evidence: `./test.sh` printed `PASS`.

## Open Questions

None.

## Review Log

| Date | Review | Kind | Commit | Model | Isolation | Outcome |
| --- | --- | --- | --- | --- | --- | --- |
| 2026-01-01 | R-1 | spec | `6888e66` | fable | procedural | Fixture review. |
| 2026-01-01 | R-1 | spec | `6888e66` | n/a | n/a | accepted by owner |
| 2026-01-02 | R-2 | implementation | `ab3963c` | fable | procedural | Every criterion met. |
| 2026-10-19 | R-3 | implementation | `546659e` | claude-fable-5-1 | procedural | Every criterion met; three non-blocking findings. |

### R-1

NO FINDINGS

### R-2

CRITERION: AC-01 `./greet.sh Ada` prints `Hello, Ada.`
VERDICT: met
EVIDENCE: ./test.sh, the reviewed commit, printed PASS, none

CRITERION: AC-02 `./greet.sh Grace` prints `Hello, Grace.`
VERDICT: met
EVIDENCE: ./test.sh, the reviewed commit, printed PASS, none

CRITERION: AC-03 `./greet.sh` with no argument prints `Hello, world.`
VERDICT: met
EVIDENCE: ./test.sh, the reviewed commit, printed PASS, none

### R-3

CRITERION: AC-01 `./greet.sh Ada` prints `Hello, Ada.`
VERDICT: met
EVIDENCE: ./greet.sh Ada and ./test.sh run in /tmp/vh-adlc-S13.4-OC085Y/project-greeting-name, 546659ee3f7cc4124a140d837d5ff4e1ee115503 with a clean tree, greet.sh printed exactly Hello, Ada. followed by one newline (checked with od -c) and test.sh line 4 checks the same string and the script printed PASS with exit 0, none

CRITERION: AC-02 `./greet.sh Grace` prints `Hello, Grace.`
VERDICT: met
EVIDENCE: ./greet.sh Grace and ./test.sh run in /tmp/vh-adlc-S13.4-OC085Y/project-greeting-name, 546659ee3f7cc4124a140d837d5ff4e1ee115503 with a clean tree, greet.sh printed Hello, Grace. with exit 0 and test.sh line 5 checks the same string and the script printed PASS with exit 0, none

CRITERION: AC-03 `./greet.sh` with no argument prints `Hello, world.`
VERDICT: met
EVIDENCE: ./greet.sh with no argument and ./test.sh run in /tmp/vh-adlc-S13.4-OC085Y/project-greeting-name, 546659ee3f7cc4124a140d837d5ff4e1ee115503 with a clean tree, greet.sh printed Hello, world. with exit 0 and test.sh line 6 checks the same string and the script printed PASS with exit 0, none

FINDING: F-01
KIND: factual
SEVERITY: should-fix
WHERE: Acceptance Criteria
EVIDENCE: Each tick carries the line "Evidence: `./test.sh` printed `PASS`." (docs/internal/plans/greeting-name.md:28, :30, :32). The standard's evidence format is "<command or action>, <target commit>, <observed result>, <limitations>"; these lines name no target commit and no limitations, so a reader cannot tell which tree the PASS was observed on. `vh-adlc lint` at a20f7d0 passes because it only checks that an evidence line exists.
PROPOSAL: Rewrite the three evidence lines to name the commit the test was run at (for example 546659e) and state "none" for limitations, so the tick is tied to a tree.

FINDING: F-02
KIND: factual
SEVERITY: nit
WHERE: Frontmatter (covers)
EVIDENCE: `covers` lists `lib/` (docs/internal/plans/greeting-name.md:9), but `git ls-files` at 546659e shows no `lib/` path and `ls lib` reports "No such file or directory". The entry can never match a change.
PROPOSAL: Leave it for this feature, since `covers` is normative and editing it would drop the document to draft and reset the acceptance; remove the dead `lib/` entry in the next feature that revises this document.

FINDING: F-03
KIND: judgement
SEVERITY: nit
WHERE: Tasks
EVIDENCE: T1 names only `greet.sh` (docs/internal/plans/greeting-name.md:44), yet commit ab3963c also changed `test.sh` (git show ab3963c --stat lists greet.sh and test.sh). The standard asks for one task per file with the failing test ordered first, and the recorded plan does not reflect the test change that was made.
PROPOSAL: No change needed now because checked tasks are kept on re-planning; for future features split the failing test and the change into separate tasks so the task list matches the commits.
