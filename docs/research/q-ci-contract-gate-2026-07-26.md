# CI-contract gate — make the merge gates prove they can gate

Adds `tools/check_ci_contract.py` + `.github/required-checks.txt`, which
statically prove that every REQUIRED status check can actually report a
conclusion. Closes the failure class behind PR #1365, where a required check
carried a `paths:` filter and silently deadlocked every PR that fell outside it.

## Why this class needed a machine

The campaign has now hit **four** distinct gate defects, and the striking thing
is what they have in common: three of the four were invisible from the PR page.

| Defect | Shape | How long it hid |
| --- | --- | --- |
| `compile-check` region filter (#1356) | ran, but could never fail meaningfully | since the gate was added |
| `cross_file_name_drift` regex (#1359) | ran, failed for a fake reason | ~4 weeks |
| pytest CI/local divergence (#1360) | passed on one machine, failed on another | ~2 days |
| `drift-check` required + filtered (#1365) | **never ran at all** | months |

A gate that never runs and a gate that can never fail both render as "fine" to
a human skimming a PR. Neither is detectable by reading a green tick. That is
precisely the kind of invariant a machine should hold, and nothing in the repo
was holding it.

Worse, the failure is *self-masking*: a broken required check disables the
merge protection it was supposed to provide, so the very mechanism that would
surface the problem is the one that is broken.

## What the checker enforces

Statically, offline, no token:

1. **Every required context resolves.** A required check that matches no job
   blocks every PR forever. This catches the rename case — change a job's
   `name:` and the context it used to satisfy silently ceases to exist.
2. **Every required context comes from an unconditional workflow.** No `paths`,
   `paths-ignore`, `branches`, or `branches-ignore` on `pull_request`. A
   filtered-out run does not report "success"; it does not report at all.
3. **No required context is ambiguous.** GitHub matches contexts by name, so
   two workflows producing the same context make the outcome depend on
   finishing order.

`--verify-ruleset` additionally diffs the committed contract against GitHub's
live ruleset via `gh`, and **skips cleanly** when `gh` is absent or
unauthenticated — a missing token is not drift, and this must never turn a
network blip into a red gate.

## Context-name derivation

Mirrors GitHub's own rules, because getting this subtly wrong would make the
tool confidently useless:

- job with no `name:` → context is the **job id**
- job with `name: Foo` → context is `Foo`
- matrix job → one context per combination, `${{ matrix.KEY }}` substituted
  (verified against the real `Compile changed C (eur|usa|jpn)`)
- any other `${{ … }}` → reported **UNRESOLVABLE**, never guessed

One parsing subtlety is load-bearing: `pull_request:` with an empty body parses
to `None`, which means *every PR*, not *absent*. Conflating those two is the
whole bug. It has its own test. Likewise a bare `on:` key resolves to the
boolean `True` under YAML 1.1, so both spellings are handled.

## Verification — reproduced before asserting

The regression anchor was proven against a real re-introduction of the bug, not
just asserted:

- Re-added the `paths:` filter to `generated-files-drift.yml` → checker exits
  **1** with `REQUIRED CHECK IS CONDITIONAL`. Restored → exits **0**, file
  byte-identical (`git diff` empty).
- **A first attempt at that repro silently failed**: the patch used `\n`
  line-endings against a CRLF file, matched nothing, and the checker "passed" a
  file it had never actually broken. The retry asserts the patch applied before
  trusting the result. Worth recording — a test that cannot fail is the same
  defect this tool exists to find, and it very nearly shipped inside the fix
  for it.
- Renamed a required context → `REQUIRED CHECK NEVER REPORTS`, with a
  case-sensitivity hint when the mismatch is only case.
- `--verify-ruleset` against the live repo: contract matches (3 checks).
- 20 unit tests, synthetic fixtures only, no network/toolchain, none
  skip-gated. Full suite: 3074 passed, 16 skipped.

## Finding surfaced on the first real run

`main-baseline` is produced by **two** workflows — `analyzer.yml` and
`match-invariants.yml`. It is not currently required, so this is not an error
today, and no action is taken here. But if it is ever added to the required
list, its reported conclusion becomes a race between the two workflows. Left
documented rather than renamed, because renaming a job context is exactly the
kind of change that should be made deliberately and paired with a ruleset edit.

## Closing the recursion

`tests.yml` was itself `paths:`-filtered to `tests/**` + `tools/**.py`, so this
checker would not have run on the PR that adds a filter to `lint.yml` or
`generated-files-drift.yml` — it would have carried the exact blind spot it
detects. Added `.github/workflows/**` and `.github/required-checks.txt` to that
filter, with an in-file comment marking them load-bearing.

## Tooling budget

New tool justified under **"catch a demonstrated failure class"**: the class
cost roughly four days of red `main` across two workflows, one permanently
blocked PR (#1360), and a compile gate that produced no signal for the entire
EUR-first campaign. Cost is one static parse of `.github/workflows/`, already
covered by the existing `Tests` workflow — **no new workflow added**.
