---
status: complete
branch: feat/greeting-name
status_description: "Every criterion met and reviewed in R-3; waiting for the owner to merge the PR."
issue: https://github.com/michielvha/vh-adlc-ship-fixture/issues/72
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
| 2026-01-01 | R-1 | spec | `1e044ff` | fable | procedural | Fixture review. |
| 2026-01-01 | R-1 | spec | `1e044ff` | n/a | n/a | accepted by owner |
| 2026-01-02 | R-2 | implementation | `30e8b69` | fable | procedural | Every criterion met. |
| 2026-10-19 | R-3 | implementation | `ba7bcc8` | claude-fable-5-1 | procedural | All three criteria met after the usage doc fix; one should-fix and two nits on the document. |

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
EVIDENCE: ran `./greet.sh Ada` and `./test.sh` in /tmp/vh-adlc-S13.4-DrilTz/project-greeting-name, commit ba7bcc89833261742de31b88ed4d1084e20ee42d, `./greet.sh Ada` printed `Hello, Ada.` with exit code 0 and `./test.sh` printed `PASS` with exit code 0 (test.sh:4 checks this exact input and output), none

CRITERION: AC-02 `./greet.sh Grace` prints `Hello, Grace.`
VERDICT: met
EVIDENCE: ran `./greet.sh Grace` and `./test.sh` in /tmp/vh-adlc-S13.4-DrilTz/project-greeting-name, commit ba7bcc89833261742de31b88ed4d1084e20ee42d, `./greet.sh Grace` printed `Hello, Grace.` with exit code 0 and `./test.sh` printed `PASS` with exit code 0 (test.sh:5 checks this exact input and output), none

CRITERION: AC-03 `./greet.sh` with no argument prints `Hello, world.`
VERDICT: met
EVIDENCE: ran `./greet.sh` with no argument and `./test.sh` in /tmp/vh-adlc-S13.4-DrilTz/project-greeting-name, commit ba7bcc89833261742de31b88ed4d1084e20ee42d, `./greet.sh` printed `Hello, world.` with exit code 0 and `./test.sh` printed `PASS` with exit code 0 (test.sh:6 checks this case), greet.sh:2 uses `${1:-world}` so an explicit empty string argument also prints `Hello, world.`, which the criterion does not cover and the test does not check

FINDING: F-01
KIND: factual
SEVERITY: should-fix
WHERE: Acceptance Criteria
EVIDENCE: docs/internal/plans/greeting-name.md:31, :33 and :35 each read `Evidence: ./test.sh printed PASS.`; the standard's evidence line is `<command or action>, <target commit>, <observed result>, <limitations>` (feature-documents.md:93), and none of the three names the commit the test ran at or any limitation. `vh-adlc lint` passes because `all_met` only checks that an evidence line exists.
PROPOSAL: Rewrite each evidence line in the four part form, naming the commit the test was run at (30e8b69 or the current head) and `none` for limitations, so a reader can tell which tree the tick describes.

FINDING: F-02
KIND: factual
SEVERITY: nit
WHERE: Tasks
EVIDENCE: The only task, T1 at docs/internal/plans/greeting-name.md:47, names `greet.sh`. Commit 30e8b69 also changed `test.sh` (`git show --stat 30e8b69`), and commit ba7bcc8 changed the covered path `docs/usage.md` with no task naming it. `vh-adlc fresh` reports R-2 stale with `covered-changed` for docs/usage.md, which is why this review was needed.
PROPOSAL: Add a task for the `docs/usage.md` change (and, if the plan is to be read as the standard's failing test first order, one for `test.sh`) so every commit on the branch maps to a task; Tasks is not normative, so this is not a revision.

FINDING: F-03
KIND: factual
SEVERITY: nit
WHERE: Frontmatter (covers)
EVIDENCE: `covers` lists `lib/` at docs/internal/plans/greeting-name.md:10, but `ls lib` in the worktree returns "No such file or directory" and `git ls-files` shows no path under `lib/`.
PROPOSAL: Leave it for now, since `covers` is normative and removing the entry would reset the document to draft; drop `lib/` at the next normative revision, or create nothing under it.
