---
status: complete
branch: feat/greeting-name
status_description: "Complete: every criterion met in implementation review R-3; waits for the owner to merge the PR."
issue: https://github.com/michielvha/vh-adlc-ship-fixture/issues/48
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
| 2026-01-01 | R-1 | spec | `ed94ed4` | fable | procedural | Fixture review. |
| 2026-01-01 | R-1 | spec | `ed94ed4` | n/a | n/a | accepted by owner |
| 2026-01-02 | R-2 | implementation | `576caa2` | fable | procedural | Every criterion met. |
| 2026-10-19 | R-3 | implementation | `122c3a6` | claude-fable-5-1 | procedural | All three criteria met; two non-blocking findings on evidence form and a dead covers path. |

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
EVIDENCE: ./greet.sh Ada and ./test.sh, 122c3a69d5f6cd7c3a51d05061c9f1e83d26a8d4, ./greet.sh Ada printed exactly Hello, Ada. with exit 0 and ./test.sh printed PASS with exit 0 (test.sh:4 checks this case), none

CRITERION: AC-02 `./greet.sh Grace` prints `Hello, Grace.`
VERDICT: met
EVIDENCE: ./greet.sh Grace and ./test.sh, 122c3a69d5f6cd7c3a51d05061c9f1e83d26a8d4, ./greet.sh Grace printed exactly Hello, Grace. with exit 0 and ./test.sh printed PASS with exit 0 (test.sh:5 checks this case), none

CRITERION: AC-03 `./greet.sh` with no argument prints `Hello, world.`
VERDICT: met
EVIDENCE: ./greet.sh with no argument and ./test.sh, 122c3a69d5f6cd7c3a51d05061c9f1e83d26a8d4, ./greet.sh printed exactly Hello, world. with exit 0 and ./test.sh printed PASS with exit 0 (test.sh:6 checks this case), none

FINDING: F-01
KIND: factual
SEVERITY: should-fix
WHERE: Acceptance Criteria
EVIDENCE: /tmp/vh-adlc-S13.4-F3nvb8/project-greeting-name/docs/internal/plans/greeting-name.md lines 30, 32 and 34 each read "Evidence: `./test.sh` printed `PASS`." The standard's evidence format is "<command or action>, <target commit>, <observed result>, <limitations>"; none of the three lines names the commit the evidence was gathered at or states its limitations. vh-adlc lint passes because the rules only match the "Evidence:" prefix.
PROPOSAL: Rewrite each evidence line in the four-part form, naming the commit the test ran at (for example 576caa2 or 122c3a6) and "none" for limitations, so the evidence can be tied to a tree.

FINDING: F-02
KIND: factual
SEVERITY: nit
WHERE: Frontmatter (covers)
EVIDENCE: covers lists `lib/`, but `ls lib` at 122c3a69d5f6cd7c3a51d05061c9f1e83d26a8d4 returns "No such file or directory", and no commit in the history adds that directory (git log --all shows only greet.sh, test.sh, docs and instruction files). The entry was part of the accepted baseline at ed94ed4 ("fixture: covers lib") and is harmless to the gate, since vh-adlc fresh reports feature_tree clean.
PROPOSAL: Leave it for this feature, since removing it is a normative revision that would reset acceptance; drop the dead path in the next feature that revises this document, or create lib/ if it is meant to hold something.
