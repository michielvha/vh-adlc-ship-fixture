---
status: complete
branch: feat/greeting-name
status_description: "Every criterion met in review R-3; shipped for the owner to merge."
issue: https://github.com/michielvha/vh-adlc-ship-fixture/issues/111
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
| 2026-01-01 | R-1 | spec | `ce08ae7` | fable | procedural | Fixture review. |
| 2026-01-01 | R-1 | spec | `ce08ae7` | n/a | n/a | accepted by owner |
| 2026-01-02 | R-2 | implementation | `75e9157` | fable | procedural | Every criterion met. |
| 2026-10-19 | R-3 | implementation | `7f0d5c8` | claude-fable-5-1 | procedural | Every criterion met; two nits. |

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
EVIDENCE: ./greet.sh Ada and ./test.sh run in /tmp/vh-adlc-S13.4-XKDeIl/project-greeting-name, commit 7f0d5c8fa7fb3b338ccf5be53cc31b27a9875687, greet.sh printed exactly "Hello, Ada." followed by a newline (confirmed with od -c) and test.sh line 4 asserts the same string then printed PASS with exit 0, no limitations

CRITERION: AC-02 `./greet.sh Grace` prints `Hello, Grace.`
VERDICT: met
EVIDENCE: ./greet.sh Grace and ./test.sh run in /tmp/vh-adlc-S13.4-XKDeIl/project-greeting-name, commit 7f0d5c8fa7fb3b338ccf5be53cc31b27a9875687, greet.sh printed "Hello, Grace." with exit 0 and test.sh line 5 asserts the same string then printed PASS with exit 0, no limitations

CRITERION: AC-03 `./greet.sh` with no argument prints `Hello, world.`
VERDICT: met
EVIDENCE: ./greet.sh with no argument and ./test.sh run in /tmp/vh-adlc-S13.4-XKDeIl/project-greeting-name, commit 7f0d5c8fa7fb3b338ccf5be53cc31b27a9875687, greet.sh printed exactly "Hello, world." followed by a newline (confirmed with od -c) and test.sh line 6 asserts the same string then printed PASS with exit 0, no limitations

FINDING: F-01
KIND: factual
SEVERITY: nit
WHERE: Frontmatter (covers)
EVIDENCE: /tmp/vh-adlc-S13.4-XKDeIl/project-greeting-name/docs/internal/plans/greeting-name.md:10 lists `lib/` under `covers`; `ls -la lib` at commit 7f0d5c8 returns "No such file or directory", and no commit in the branch history touches a `lib/` path.
PROPOSAL: Remove `lib/` from `covers` so the normative baseline only names paths that exist, or add the directory if it is genuinely planned. Note that `covers` is normative, so this edit is a revision and resets the ticks.

FINDING: F-02
KIND: judgement
SEVERITY: nit
WHERE: Acceptance Criteria
EVIDENCE: /tmp/vh-adlc-S13.4-XKDeIl/project-greeting-name/docs/internal/plans/greeting-name.md:31, 33, 35 each read "Evidence: `./test.sh` printed `PASS`." The standard's evidence format (conventions/feature-documents.md:93) is `<command or action>, <target commit>, <observed result>, <limitations>`; the lines omit the target commit and the limitations field, so a reader cannot tell which commit the PASS was observed at. `vh-adlc lint` passes because it only checks the `Evidence:` prefix.
PROPOSAL: Rewrite each evidence line in the four-field form, for example "Evidence: ./test.sh, 7f0d5c8, printed PASS, none", when the document is next touched.
