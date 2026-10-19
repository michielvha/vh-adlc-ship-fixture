---
status: in-progress
branch: feat/greeting-name
status_description: "Fixture feature: the greeting accepts a name."
issue: https://github.com/michielvha/vh-adlc-ship-fixture/issues/86
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
| 2026-01-01 | R-1 | spec | `f82b8db` | fable | procedural | Fixture review. |
| 2026-01-01 | R-1 | spec | `f82b8db` | n/a | n/a | accepted by owner |
| 2026-01-02 | R-2 | implementation | `24d95b3` | fable | procedural | Every criterion met. |
| 2026-10-19 | R-3 | implementation | `1d4c60d` | claude-fable-5-1 | procedural | All three criteria met after the usage doc fix; three nits. |

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
EVIDENCE: ./test.sh and ./greet.sh Ada, 1d4c60d5840a0ffb53a24ca8e2ac52f70de30752, test.sh printed PASS with exit 0 and the direct call printed Hello, Ada., none

CRITERION: AC-02 `./greet.sh Grace` prints `Hello, Grace.`
VERDICT: met
EVIDENCE: ./test.sh and ./greet.sh Grace, 1d4c60d5840a0ffb53a24ca8e2ac52f70de30752, test.sh printed PASS with exit 0 and the direct call printed Hello, Grace., none

CRITERION: AC-03 `./greet.sh` with no argument prints `Hello, world.`
VERDICT: met
EVIDENCE: ./test.sh and ./greet.sh with no argument, 1d4c60d5840a0ffb53a24ca8e2ac52f70de30752, test.sh printed PASS with exit 0 and the direct call printed Hello, world., none

FINDING: F-01
KIND: factual
SEVERITY: nit
WHERE: Acceptance Criteria
EVIDENCE: /tmp/vh-adlc-S13.4-63ME6h/project-greeting-name/docs/internal/plans/greeting-name.md:31, 33 and 35 read "Evidence: `./test.sh` printed `PASS`." with no target commit and no limitations; conventions/feature-documents.md:93 at 5e7dd7c asks for command, target commit, observed result, limitations. vh-adlc lint passed, so the binary does not enforce this.
PROPOSAL: Add the commit each run targeted and "none" for limitations to the three evidence lines.

FINDING: F-02
KIND: factual
SEVERITY: nit
WHERE: Frontmatter
EVIDENCE: `covers` lists `lib/` (greeting-name.md:10) but `ls -la lib` in the worktree at 1d4c60d returns "No such file or directory", and no commit on the branch adds it.
PROPOSAL: Drop `lib/` from `covers`, or leave it only if a later task is expected to create that directory. Note that `covers` is normative, so the change is a revision.

FINDING: F-03
KIND: factual
SEVERITY: nit
WHERE: Tasks
EVIDENCE: Commit 1d4c60d changes docs/usage.md, a covered path, and commit 24d95b3 changes test.sh as well as greet.sh, but the only task T1 (greeting-name.md:47) names `greet.sh` alone. conventions/feature-documents.md:114 says each task names the file it touches, one commit per task.
PROPOSAL: Record the usage.md update and the test.sh change as tasks so the task list matches the commits on the branch. The usage text itself is accurate: docs/usage.md:3 and 4 match the observed output for `./greet.sh Ada` and `./greet.sh`.
