---
status: complete
branch: feat/greeting-name
status_description: "Every criterion met in R-3; waits for the owner to merge the PR."
issue: https://github.com/michielvha/vh-adlc-ship-fixture/issues/130
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
      Evidence: `./test.sh`, `31d8784`, printed `PASS` (R-3), none
- [x] AC-02: `./greet.sh Grace` prints `Hello, Grace.`
      Evidence: `./test.sh`, `31d8784`, printed `PASS` (R-3), none
- [x] AC-03: `./greet.sh` with no argument prints `Hello, world.`
      Evidence: `./test.sh`, `31d8784`, printed `PASS` (R-3), none

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
| 2026-01-01 | R-1 | spec | `4ff2968` | fable | procedural | Fixture review. |
| 2026-01-01 | R-1 | spec | `4ff2968` | n/a | n/a | accepted by owner |
| 2026-01-02 | R-2 | implementation | `1ea784d` | fable | procedural | Every criterion met. |
| 2026-10-19 | R-3 | implementation | `31d8784` | claude-fable-5-1 | procedural | Every criterion met; evidence lines lacked a commit. |

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
EVIDENCE: ./greet.sh Ada piped through od -c, and ./test.sh, at 31d8784 in /tmp/vh-adlc-S13.4-xq8Pbu/project-greeting-name, printed exactly Hello, Ada. followed by one newline, and test.sh printed PASS with exit status 0, none

CRITERION: AC-02 `./greet.sh Grace` prints `Hello, Grace.`
VERDICT: met
EVIDENCE: ./greet.sh Grace, and ./test.sh, at 31d8784 in /tmp/vh-adlc-S13.4-xq8Pbu/project-greeting-name, printed Hello, Grace. and test.sh printed PASS with exit status 0, none

CRITERION: AC-03 `./greet.sh` with no argument prints `Hello, world.`
VERDICT: met
EVIDENCE: ./greet.sh with no argument piped through od -c, and ./test.sh, at 31d8784 in /tmp/vh-adlc-S13.4-xq8Pbu/project-greeting-name, printed exactly Hello, world. followed by one newline, and test.sh printed PASS with exit status 0, none

FINDING: F-01
KIND: factual
SEVERITY: should-fix
WHERE: Acceptance Criteria
EVIDENCE: /tmp/vh-adlc-S13.4-xq8Pbu/project-greeting-name/docs/internal/plans/greeting-name.md lines 28, 30 and 32 each read "Evidence: `./test.sh` printed `PASS`." The standard's evidence form is "<command or action>, <target commit>, <observed result>, <limitations>"; these lines name no target commit and no limitations, so a reader cannot tell which commit the tick was taken at. vh-adlc lint passes because evidence_line only matches the prefix.
PROPOSAL: Rewrite each evidence line in the four part form, naming the commit the test was run at (1ea784d or the commit that records this review) and "none" for limitations.

FINDING: F-02
KIND: judgement
SEVERITY: nit
WHERE: Tasks
EVIDENCE: Line 42 of the document lists one task, "T1 `greet.sh` - `./test.sh` passes", while git show --stat 1ea784d shows the task commit changed greet.sh and test.sh. The standard asks each task to name the file it touches and to order a failing test first; no task names test.sh and no failing test task precedes T1.
PROPOSAL: Tasks are not normative, so this costs no revision. Add a ticked task for test.sh pointing at 1ea784d, or extend T1 to name both files, so the plan matches the history it records.

FINDING: F-03
KIND: factual
SEVERITY: nit
WHERE: Frontmatter covers
EVIDENCE: covers lists lib/ (document line 9), and git ls-files at 31d8784 shows no lib directory and no file under it. The entry is harmless for vh-adlc fresh, which reported feature_tree clean, but it names a path that does not exist.
PROPOSAL: Leave it for now, since covers is normative and dropping the entry would reset the acceptance; remove lib/ in the next revision that touches the baseline anyway.
