---
status: complete
branch: feat/greeting-name
status_description: "Complete: greet.sh takes a name, every criterion met in R-3. Waits for the owner to merge."
issue: https://github.com/michielvha/vh-adlc-ship-fixture/issues/15
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
| 2026-01-01 | R-1 | spec | `9034eb6` | fable | procedural | Fixture review. |
| 2026-01-01 | R-1 | spec | `9034eb6` | n/a | n/a | accepted by owner |
| 2026-01-02 | R-2 | implementation | `189c1dd` | fable | procedural | Every criterion met. |
| 2026-10-18 | R-3 | implementation | `c07e36e` | claude-fable-5-1 | procedural | All three criteria met after the usage doc fix; three non-blocking findings. |

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
EVIDENCE: `./greet.sh Ada` and `./test.sh` run from the repository root, commit c07e36e9ab7847c1c227fd81a7fa582d72f8ae6e with a clean tree, `./greet.sh Ada` printed `Hello, Ada.` with exit 0 and `./test.sh` printed `PASS` with exit 0, test.sh only passes when run from the repository root because it calls `./greet.sh` by relative path

CRITERION: AC-02 `./greet.sh Grace` prints `Hello, Grace.`
VERDICT: met
EVIDENCE: `./greet.sh Grace` and `./test.sh` run from the repository root, commit c07e36e9ab7847c1c227fd81a7fa582d72f8ae6e with a clean tree, `./greet.sh Grace` printed `Hello, Grace.` with exit 0 and `./test.sh` printed `PASS` with exit 0, test.sh only passes when run from the repository root because it calls `./greet.sh` by relative path

CRITERION: AC-03 `./greet.sh` with no argument prints `Hello, world.`
VERDICT: met
EVIDENCE: `./greet.sh` with no argument and `./test.sh` run from the repository root, commit c07e36e9ab7847c1c227fd81a7fa582d72f8ae6e with a clean tree, `./greet.sh` printed `Hello, world.` with exit 0 and `./test.sh` printed `PASS` with exit 0, test.sh only passes when run from the repository root because it calls `./greet.sh` by relative path

FINDING: F-01
KIND: judgement
SEVERITY: should-fix
WHERE: Acceptance Criteria
EVIDENCE: Each evidence line in /tmp/vh-adlc-S13.4-Jb5jID/project-greeting-name/docs/internal/plans/greeting-name.md reads only "Evidence: `./test.sh` printed `PASS`." (lines 27, 29, 31). The convention's evidence form is "<command or action>, <target commit>, <observed result>, <limitations>"; the target commit and the limitations are missing, so a reader cannot tell which commit the tick was observed at.
PROPOSAL: Rewrite each evidence line with the four parts, naming the commit the test was run at (189c1dd or the current HEAD) and stating "none" or the cwd limitation under limitations.

FINDING: F-02
KIND: factual
SEVERITY: nit
WHERE: Frontmatter (covers)
EVIDENCE: `covers` lists `lib/`, but `git ls-files lib` returns nothing and `test -d lib` reports no such directory at commit c07e36e9ab7847c1c227fd81a7fa582d72f8ae6e. No commit on the branch ever added it.
PROPOSAL: Remove `lib/` from `covers`, or add the directory if it is genuinely intended to hold code for this feature. Note that `covers` is normative, so this change is a revision and resets the acceptance.

FINDING: F-03
KIND: judgement
SEVERITY: nit
WHERE: Test Plan
EVIDENCE: Running `/tmp/vh-adlc-S13.4-Jb5jID/project-greeting-name/test.sh` from `/tmp` printed "./greet.sh: No such file or directory" then "FAIL: got , want Hello, Ada." with exit 1, because test.sh line 4 to 6 call `./greet.sh` relative to the caller's cwd. The CI workflow in .github/workflows/ci.yml runs from the checkout root, so CI is unaffected.
PROPOSAL: Have test.sh resolve greet.sh relative to its own location (for example `cd "$(dirname "$0")"` on its first line) so the proof named in the Test Plan passes wherever it is invoked from.
