---
status: complete
branch: feat/greeting-name
status_description: "Complete: every criterion met in review R-3; waits for the PR to merge."
issue: https://github.com/michielvha/vh-adlc-ship-fixture/issues/35
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
| 2026-01-01 | R-1 | spec | `de9f5a9` | fable | procedural | Fixture review. |
| 2026-01-01 | R-1 | spec | `de9f5a9` | n/a | n/a | accepted by owner |
| 2026-01-02 | R-2 | implementation | `e790d42` | fable | procedural | Every criterion met. |
| 2026-10-18 | R-3 | implementation | `d1b76c7` | claude-fable-5-1 | procedural | All three criteria met, with three nits after the usage doc fix. |

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
EVIDENCE: ran `./greet.sh Ada` from the repository root and piped it through `od -c`, then ran `./test.sh`, at d1b76c719c01f7346c495f32c961b50c97010e33 with a clean tree, stdout was exactly `Hello, Ada.` plus one trailing newline with exit 0 and `./test.sh` printed `PASS` with exit 0 (test.sh:4 compares the same call to `Hello, Ada.`), none

CRITERION: AC-02 `./greet.sh Grace` prints `Hello, Grace.`
VERDICT: met
EVIDENCE: ran `./greet.sh Grace` from the repository root, then ran `./test.sh`, at d1b76c719c01f7346c495f32c961b50c97010e33 with a clean tree, stdout was `Hello, Grace.` with exit 0 and `./test.sh` printed `PASS` with exit 0 (test.sh:5 compares the same call to `Hello, Grace.`), none

CRITERION: AC-03 `./greet.sh` with no argument prints `Hello, world.`
VERDICT: met
EVIDENCE: ran `./greet.sh` with no argument from the repository root and piped it through `od -c`, then ran `./test.sh`, at d1b76c719c01f7346c495f32c961b50c97010e33 with a clean tree, stdout was exactly `Hello, world.` plus one trailing newline with exit 0 and `./test.sh` printed `PASS` with exit 0 (test.sh:6 compares the same call to `Hello, world.`; greet.sh:2 is `echo "Hello, ${1:-world}."`), none

FINDING: F-01
KIND: judgement
SEVERITY: nit
WHERE: Acceptance Criteria
EVIDENCE: docs/internal/plans/greeting-name.md:31, 33, 35 and 48 each read `Evidence: ./test.sh printed PASS.`; the standard's evidence shape is `<command or action>, <target commit>, <observed result>, <limitations>`, and none of these lines names the commit the result was observed at
PROPOSAL: Add the observed commit to each evidence line (for example `./test.sh, e790d42, printed PASS, none`) so a reader can tell which tree the tick describes without consulting the Review Log.

FINDING: F-02
KIND: factual
SEVERITY: nit
WHERE: Tasks
EVIDENCE: `git show --stat d1b76c7` lists only docs/usage.md, a path in `covers`, and `git show --stat e790d42` lists greet.sh, test.sh and the document; Tasks has one entry, T1, naming only `greet.sh`, so the test change and the usage doc change have no task
PROPOSAL: Add a ticked task for docs/usage.md (the commit d1b76c7) and name test.sh in T1 or in a separate ticked task, so each commit on the branch maps to one task as the standard asks.

FINDING: F-03
KIND: factual
SEVERITY: nit
WHERE: Frontmatter (covers)
EVIDENCE: `covers` lists `lib/`; `git ls-files` at d1b76c7 shows no lib/ entry and `ls lib` fails with "No such file or directory"
PROPOSAL: Leave it if a lib/ directory is planned for this feature; otherwise drop it in the next normative revision, since `covers` is normative and changing it alone resets the acceptance.
