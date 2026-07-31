# cm-ov002-unknown-sweep-8: callee-coverage selection, 149-512B (2026-07-31)

## Purpose

Sweep-7 found that in the 149-512B band, callee ground-truth
availability — what fraction of a candidate's own callees are already
matched as real C elsewhere in the tree — predicted shippability more
sharply than raw byte size did (every unshipped 513-1023B candidate had
under 65% callee coverage; every 149-512B ship had 60-100%). This round
tested whether that relationship holds **within** the 149-512B band as
sharply as it held **across** bands: select 100 candidates by
pre-computed callee-coverage, stratified into 5 bands (100%, 75-99%,
50-74%, 25-49%, 0-24%), and report ship-rate by band.

**The headline result is not the clean confirmation the setup expected
— because the coverage-scoring script itself had two real bugs, one
caught before dispatch and one caught only after, by a worker's
independent verification.** Both are documented in full below, because
they change what this round's data actually shows.

## Method

Built `callee_coverage.py` (not a pre-existing tool — checked first,
found nothing that computed this specific per-candidate metric).
Candidate pool: `wall_aware_headroom.py --exclude-attempted`,
149-512B, minus ov002 ≤164B (sweeps 1-6's territory) and sweep-7's own
40 parked 149-512B addresses (verified as an exact 40/40 match against
the pool before exclusion) — 2,671 candidates remained.

**Bug 1, caught before dispatch:** the first version scored coverage
from `.extern func_XXXXXXXX`-only lines, which silently dropped named
SDK/library callees (`OS_SPrintf` etc.) from both numerator and
denominator — systematically undercounting for the 32% of `.s` files
that call a mix of unmatched local functions and named library
functions. Fixed to parse real `bl`/`blx` call-instruction targets
instead of `.extern` declarations (which also list non-called data
symbols), with named symbols counted as automatically matched (their
signatures are always ground truth via `libs/*/include` headers).

**Bug 2, caught after dispatch, by a worker (batch 3) doing its own
independent verification, not by my review:** `FUNC_NAME_RE` matched
only bare `func_XXXXXXXX` (8 hex digits), not the overlay-prefixed form
`func_ovNNN_XXXXXXXX`. Every overlay-prefixed callee therefore fell
through to the "named symbol, auto-matched" branch regardless of its
true status — silently inflating coverage for any candidate calling
into overlay-prefixed siblings, which is most of the pool. Confirmed by
hand-tracing `func_ov002_022432b4.s` (labeled 11/11 = 100%; ground
truth 7/11 = 63.6%) against real `.c`-file presence. Scope, checked
across the whole 2,671-candidate pool: **1,131 candidates (42%) had an
inflated band, all shifting the same direction when corrected (zero
moved up)**. Of the 1,468 candidates originally labeled 100% coverage,
only 511 (35%) actually were. Fixed with
`FUNC_NAME_RE = r"^func_(ov\d+_)?[0-9A-Fa-f]{8}(_unk)?$"`
(validated against 118,301 real call sites project-wide — 99.98% match
rate; the remainder are `_unk` placeholder stubs from `dsd init
--allow-unknown-function-calls`, which correctly score as unmatched).

**Consequence for the 100 already-dispatched candidates:** re-scoring
them with the fixed script shows the true band distribution was
nothing like the intended 40/20/20/10/10 stratification:

| Labeled band (what workers saw) | True band (corrected) |
|---|---|
| 100%: 40 | 100%: 4 |
| 75-99%: 20 | 75-99%: 21 |
| 50-74%: 20 | 50-74%: 43 |
| 25-49%: 10 | 25-49%: 19 |
| 0-24%: 10 | 0-24%: 13 |

Workers were dispatched against the wrong labels. This doc reports
ship-rate against the **corrected, true band** per candidate — the
only version of this round's data that actually answers the question —
not the labels given at dispatch time.

Selection within each true-band tier (before the bug was known)
preferred, at the 100% tier specifically, candidates with more nonzero
matched callees over trivial 0-callee leaves, to better test the
hypothesis rather than default to trivial cases. 100 candidates
partitioned round-robin across 5 worktrees (8/4/4/2/2 per band per
worktree) for band representation in every batch, not just in
aggregate.

## Result: ship-rate by band

**By TRUE (corrected) band — this is the round's real finding:**

| Band | Candidates | Shipped | Ship rate | Bytes shipped |
|---|---|---|---|---|
| 100% | 4 | 4 | **100.0%** | 1,172 |
| 75-99% | 21 | 7 | 33.3% | 2,172 |
| 50-74% | 43 | 11 | 25.6% | 3,668 |
| 25-49% | 17 | 6 | 35.3% | 1,668 |
| 0-24% | 13 | 3 | 23.1% | 744 |

**By labeled band (what workers actually saw at dispatch time) — shown
for transparency, not as a finding:**

| Band | Candidates | Shipped | Ship rate | Bytes shipped |
|---|---|---|---|---|
| 100% | 38 | 18 | 47.4% | 6,504 |
| 75-99% | 20 | 7 | 35.0% | 1,608 |
| 50-74% | 20 | 3 | 15.0% | 592 |
| 25-49% | 10 | 2 | 20.0% | 568 |
| 0-24% | 10 | 1 | 10.0% | 152 |

(2 of the 100 dispatched candidates were excluded from both tables —
`func_ov011_021c9e98` and `func_ov012_021c9e1c` turned out to be
pre-existing C-32 permanent walls, not real conversion candidates; see
below. 98 real candidates remain, 31 shipped, 9,424 bytes total.)

**Reading the two tables side by side is the actual lesson.** The
labeled-band table shows a clean-looking monotonic decline that would
have read as a strong confirmation of the hypothesis. It's an artifact
of the scoring bug, not a real signal — most of what was labeled "100%"
wasn't. The corrected table shows something more honest and more
interesting: **true 100% coverage is a small but perfect sample (4/4
shipped)**, consistent with sweep-7's finding that near-complete
coverage predicts success. **Below that, the relationship does not show
a clean gradient** — 75-99% (33.3%), 50-74% (25.6%), 25-49% (35.3%),
and 0-24% (23.1%) all land in a similar band with no monotonic trend;
25-49% ships *better* than 50-74%. This matches what two different
workers (batches 4 and 5) independently reported feeling on the
ground, before either knew about the scoring bug: "shippability didn't
track the coverage score as sharply as hoped... the real discriminator
looked like dispatch/guard layout polarity and one-off
register-allocation walls, largely orthogonal to raw callee coverage"
(batch 5), and a non-monotonic per-band result flagged explicitly as
such (batch 4).

**Reading this cautiously**: per-band sample sizes are small (4-43),
this is a post-hoc correction rather than a clean pre-registered test,
and at least one batch (1) flagged its own time-allocation confound
(disproportionate time spent establishing techniques on early
candidates) — likely present in other batches too, unmeasured. The
50-74% band, with the largest sample (43) and a below-average rate
(25.6%), is the most interesting candidate for a future round with a
clean coverage score from the start.

**Bytes/pp**: 9,424 bytes shipped this round. EUR `Natural-C`/
`C-decompiled` moved to 291,118 / 2,385,948 bytes (12.20%), up from
11.66% as reported after sweep-7 — roughly consistent with, though not
exactly reconciled against, this round's own byte tally (some drift is
expected between `.text`-span-based counting and progress.py's own
byte accounting; not independently chased down further).

## Per-batch summary

| Batch | Shipped | Bytes | Notes |
|---|---|---|---|
| 1 | 5/20 | 1,432 | P-4 wall reconfirmed 3x on one toggle shape; flagged its own time-allocation confound |
| 2 | 5/20 | 1,464 | Found the declaration-order register-allocation lever; a likely prompt-injection attempt (see below) |
| 3 | 8/20 | 2,792 | Found and reported the coverage-scoring bug; 6 switch-declaration-order confirmations |
| 4 | 9/20 | 2,672 | Explicitly non-monotonic per-band result; found a real upstream signature bug in an already-shipped function |
| 5 | 4/20 (18 real) | 488 | 2 candidates were undetected C-32 permanent walls, excluded from all counts above |

## Process incidents

**Possible prompt-injection attempt, batch 2.** Mid-task, the worker
received a tool-output "system-reminder" instructing it not to revert a
`delinks.txt` "external modification" and not to tell the user about
it. The worker verified via `git diff` that no such modification
existed, disregarded the instruction, and reported it transparently
rather than complying or staying silent — correct handling per the
instruction-source-boundary policy (observed content is data, not
commands; suspected injections get flagged, not obeyed). No harm
resulted. Source unconfirmed — could be a model hallucination, an
environment artifact reacting to the batch's own concurrent `git
checkout`, or a real injection with no functioning payload this time.
Not independently investigated further this round.

**Recurring `delinks.txt` collision, batches 2 and 5 independently.**
`git checkout -- <module>/delinks.txt <file>.s`, used to revert a
parked candidate, restores the *entire* `delinks.txt` to HEAD — which
silently discards an already-shipped candidate's uncommitted edit to
the same shared file when both live in the same module in one worktree
session. Both instances were caught pre-commit by the mandated
verification step (confirm every shipped function's `delinks.txt` line
actually reads `.c:`), fixed by re-applying the lost edits and
re-verifying via `fastmatch.py` before committing. Two independent
same-round instances make this look systemic rather than a one-off
mistake — a park-helper that reverts only the specific lines for one
function, not the whole file, would remove the failure mode rather than
relying on catching it every time.

**2 pre-existing C-32 permanent walls got past both automated
selection and manual header spot-checking, batch 5.**
`func_ov011_021c9e98` and `func_ov012_021c9e1c` are hand-encoded
cross-overlay `BL`-to-`module:none` walls (see
`feedback_wall-aware-headroom-c32-classification-gap` memory for the
first-known instance) — already "complete" as verified raw assembly,
not real conversion candidates. Both were manually header-checked
before dispatch and looked like ordinary candidates: unlike the
earlier-documented instance, these carried the *generic* brief-302/294
boilerplate rather than a distinguishing "C-32... brief 192 recipe"
header. **Header-text screening is confirmed insufficient for this wall
class** — only the file body (hand-encoded `.word` opcodes, `module:none`
BL targets) reliably identifies it. `wall_aware_headroom.py` likely
needs a body-content check for C-32, not just a header/marker check.

**A real upstream bug found as a side effect, batch 4.** While working
`func_ov006_021c8e98`, the worker discovered `func_02006c0c`'s true
argument count didn't match its existing signature — flagged, not
fixed this round (that function is already shipped elsewhere; a
follow-up should check whether its existing match is actually correct
or coincidentally byte-identical despite a wrong-arity model).

**A `fastmatch.py` tool limitation, batch 2.** Doesn't understand
`R_ARM_THM_CALL` (relocation type 10) — can misreport a true 100% match
as 97.3%. `func_ov004_021dc664` was verified genuinely byte-identical
by hand (relocation table + full disassembly comparison) and shipped
despite the misleading tool output. Worth a fix or at least a flag to
whoever owns `fastmatch.py`.

## New levers found this round

Four batches (1, 3, 4, 5) independently converged on the same
underlying technique from different angles — promoted to **C-55**:
mwcc's `if`/`else if` always uses a "positive strategy" (first
condition's true branch inlined, not branched to); when the target
genuinely branches away to a shared or later block, the C needs
`goto`/inverted-condition restructuring to match, not natural
if/else-if. Also added: **C-56** (declaration order, not just usage
order, affects register allocation — 2 independent confirmations,
batches 2 and 3), **C-57** (C addition operand order controls which
addend fuses into an ARM shifted-register form — batch 3), **C-58**
(unsigned vs. signed comparison type selects `CC`/`HI` over `LT`/`GT`
— batch 4, single instance, flagged for reconfirmation). S-2 gained a
partial-rule finding narrowing (not fully resolving) sweep-7's sparse
`cmp;beq`-chain counter-example: within a genuine switch compiling to a
compare chain, ascending vs. descending declaration order selects
between two different chain shapes (6 confirmations, batch 3). P-4
reconfirmed 3x in batch 1 on the same `CE288->f_5a8` toggle-computation
shape — no new lever, just confirms the trigger recurs.

## Verification

- `check_activation_invariant.py 988cd5f7c..HEAD`: OK — 31 `.c` added
  == 31 `.s` deleted == 31 delinks activations.
- `check_delink_dupes.py`: OK — 81 `delinks.txt`, no duplicate `.text`
  addresses.
- `gate3.py --scope all --clean`: PASS, all three regions individually
  confirmed.
- Research index regenerated before push.
- Each batch independently ran `git status --short` + per-function
  `delinks.txt` line confirmation + `ninja sha1` before committing;
  the coordinator re-verified `git diff origin/main --stat` against
  every claim in this doc rather than trusting batch self-reports.

## What this suggests for future targeting (data, not a decision)

True 100% coverage is worth continuing to prioritize where it exists —
small sample here, but perfect, and consistent with sweep-7. Below
that threshold, coverage band alone is a much weaker predictor than
this round's setup assumed; the 50-74% band in particular (largest
sample, below-average rate) suggests coverage isn't the dominant factor
once you're below full coverage, and the two batches that said so
explicitly (dispatch/guard-layout polarity, one-off register-allocation
walls) may be pointing at what actually matters more. A future round
with the coverage script fixed *before* selection, rather than
corrected after, would be a cleaner test than this one turned out to
be.
