---
status: complete
branch: feat/greeting-name
status_description: "greet.sh takes a name; every criterion met in R-3. Waits for the PR to merge."
issue: https://github.com/michielvha/vh-adlc-ship-fixture/issues/60
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
| 2026-01-01 | R-1 | spec | `f5d1ba0` | fable | procedural | Fixture review. |
| 2026-01-01 | R-1 | spec | `f5d1ba0` | n/a | n/a | accepted by owner |
| 2026-01-02 | R-2 | implementation | `858ad8b` | fable | procedural | Every criterion met. |
| 2026-10-19 | R-3 | implementation | `312ca29` | claude-fable-5-1 | procedural | Every criterion met after the usage page fix; two document findings. |

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
EVIDENCE: ./greet.sh Ada and ./test.sh, 312ca2992d2ae29e72577799ee585b089ec79051, ./greet.sh Ada printed Hello, Ada. with exit 0 and ./test.sh printed PASS with exit 0, none

CRITERION: AC-02 `./greet.sh Grace` prints `Hello, Grace.`
VERDICT: met
EVIDENCE: ./greet.sh Grace and ./test.sh, 312ca2992d2ae29e72577799ee585b089ec79051, ./greet.sh Grace printed Hello, Grace. with exit 0 and ./test.sh printed PASS with exit 0, none

CRITERION: AC-03 `./greet.sh` with no argument prints `Hello, world.`
VERDICT: met
EVIDENCE: ./greet.sh with no argument and ./test.sh, 312ca2992d2ae29e72577799ee585b089ec79051, ./greet.sh printed Hello, world. with exit 0 and ./test.sh printed PASS with exit 0, none

FINDING: F-01
KIND: factual
SEVERITY: should-fix
WHERE: Acceptance Criteria
EVIDENCE: /tmp/vh-adlc-S13.4-NnD1Qx/project-greeting-name/docs/internal/plans/greeting-name.md:31, 33 and 35 each read "Evidence: `./test.sh` printed `PASS`." with no target commit and no limitations, while conventions/feature-documents.md at cd0d55e line 93 gives the form "Evidence: <command or action>, <target commit>, <observed result>, <limitations>". The lines cannot be tied to the commit the test ran at. vh-adlc lint passes, so the binary does not enforce this.
PROPOSAL: Rewrite each evidence line in the four part form, naming the commit the test ran at, for example "Evidence: ./test.sh, 312ca29, printed PASS, none".

FINDING: F-02
KIND: factual
SEVERITY: nit
WHERE: Frontmatter
EVIDENCE: `covers` lists `lib/` (/tmp/vh-adlc-S13.4-NnD1Qx/project-greeting-name/docs/internal/plans/greeting-name.md:10), but `ls -la lib` at 312ca29 reports "No such file or directory" and `git log --all --oneline -- lib` returns no commits.
PROPOSAL: Drop `lib/` from `covers` unless a lib directory is planned for this feature; `covers` is normative, so make the change as a revision.
