---
status: planned
status_description: "Fixture feature: the greeting accepts a name."
issue: https://github.com/michielvha/vh-adlc-ship-fixture/issues/17
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

- [ ] AC-01: `./greet.sh Ada` prints `Hello, Ada.`
- [ ] AC-02: `./greet.sh Grace` prints `Hello, Grace.`
- [ ] AC-03: `./greet.sh` with no argument prints `Hello, world.`

## Test Plan

| Criterion | Proof |
| --- | --- |
| AC-01 | `./test.sh` |
| AC-02 | `./test.sh` |
| AC-03 | `./test.sh` |

## Tasks

None yet.

## Open Questions

None.

## Review Log

| Date | Review | Kind | Commit | Model | Isolation | Outcome |
| --- | --- | --- | --- | --- | --- | --- |
| 2026-01-01 | R-1 | spec | `eb57fea` | fable | procedural | Fixture review. |
| 2026-01-01 | R-1 | spec | `eb57fea` | n/a | n/a | accepted by owner |

### R-1

NO FINDINGS
