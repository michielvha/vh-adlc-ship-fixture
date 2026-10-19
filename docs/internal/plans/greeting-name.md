---
status: complete
branch: feat/greeting-name
status_description: "Complete: every criterion met and reviewed in R-2; the PR waits for the owner to merge."
issue: https://github.com/michielvha/vh-adlc-ship-fixture/issues/77
goal: "greet prints a greeting for the name it is given."
covers:
  - greet.sh
  - test.sh
  - lib/
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
| 2026-01-01 | R-1 | spec | `2d4213b` | fable | procedural | Fixture review. |
| 2026-01-01 | R-1 | spec | `2d4213b` | n/a | n/a | accepted by owner |
| 2026-01-02 | R-2 | implementation | `190e5a8` | fable | procedural | Every criterion met. |

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
