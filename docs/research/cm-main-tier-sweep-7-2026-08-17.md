# cm-main-tier-sweep-7: one properly-powered confirmation, and the gap disappears at the round level but survives at the pooled level (2026-08-17)

## Purpose

Sweep-5 (main, 10/25 vs 19/25 shipped, LOW vs HIGH callee count) and
sweep-6 (ov002, 6/25 vs 13/25) each ran a matched-pair experiment at
n=25/arm. Sweep-5 alone reached Fisher p=0.021; sweep-6 alone reached
only p=0.079 (not significant on its own); pooled, the two rounds gave
32% vs 64%, p=0.0025. At n=25/arm a 28-point gap cannot mathematically
reach p<0.05 on its own — both rounds spent 50 candidates each on an
experiment that individually couldn't conclude. This round's mandate
had two parts: **Part 1**, one properly-powered confirmation (50 per
arm, not 25) on the largest remaining unswept population, stated to
CLOSE the question either way; **Part 2**, exploit the accumulated
~600-candidate model to pick the best remaining band and report the
actual rate against the model's prediction, treating a large miss as
itself a finding.

## Part 1 — the properly-powered confirmation

**Design.** No single remaining module had 50 candidates in the
0-1-callee band (overlay006 had 33, overlay004 had 20, overlay011
had 22, each individually insufficient), so this round pooled all
three into one combined candidate population — a disclosed adaptation
of the design, not a silent substitution. overlay002 was deliberately
excluded despite `wall_aware_headroom.py` showing 1,767 raw
candidates there: sweep-6 already established that tool undercounts
ov002's true attempt history by more than half, and ov002 is where
the matched-pair design has already run once (sweep-6).

50 LOW (0-1 calls) and 50 HIGH (4+ calls) candidates were drawn from
the pooled overlay004+006+011 population, each HIGH candidate picked
by nearest-size match to a LOW candidate (no reuse), so the two arms
are matched on size by construction:

| Arm | n | size range | mean | median | modules | tier mix (pre-classified) |
|---|---:|---|---:|---:|---|---|
| LOW (0-1 calls) | 50 | 72-388 B | 161.1 B | 142 B | ov006=25, ov011=13, ov004=12 | default 19, legacy_sp3 3, legacy 2, ambiguous 12, leaf-no-signal 14 |
| HIGH (4+ calls) | 50 | 76-388 B | 186.8 B | 176 B | ov004=22, ov006=18, ov011=10 | default 20, legacy_sp3 5, legacy 0, ambiguous 22, leaf-no-signal 3 |

The pool was frozen (both JSON snapshots saved) before any batch
touched a candidate. Every candidate's tier was independently verified
by reading its `.s` epilogue directly during the batch's own work,
not trusted from the pre-pass classifier alone — see "classifier
verification" below.

**Stated prior.** Consistent with the pooled sweep-5/6 model going
into this round (32% vs 64%), the range set before dispatch was
approximately LOW 30-35%, HIGH 55-65%, a ~25-30 point gap.

**Result:**

| Batch | LOW (0-1 calls) | HIGH (4+ calls) | Gap |
|---|---:|---:|---:|
| 1 | 4/10 (40%) | 3/10 (30%) | -10 |
| 2 | 2/10 (20%) | 5/10 (50%) | +30 |
| 3 | 4/10 (40%) | 4/10 (40%) | 0 |
| 4 | 5/10 (50%) | 5/10 (50%) | 0 |
| 5 | 2/10 (20%) | 1/10 (10%) | -10 |
| **Total** | **17/50 (34.0%)** | **18/50 (36.0%)** | **+2** |

**Fisher's exact test (two-sided, manual `math.comb` hypergeometric
implementation, re-validated this round to 4 decimal places against
all 3 known priors — sweep-5's 0.0209≈0.021, sweep-6's 0.0792≈0.079,
their pooled 0.0025≈0.0025 — before trusting it on new data): p =
1.0000.** Two of five batches ran LOW *above* HIGH; two tied; only one
showed the predicted direction. This is a clean null, not a weak
signal — the gap the round was designed to confirm did not appear
*within this round's own data*.

Every number above was recomputed directly against primary sources
during consolidation (`delinks.txt` matched-status + `attempts.tsv`
park rows for every one of the 100 pool addresses, cross-checked
against the frozen pool JSONs), not carried forward from batch
self-reports.

### Why the gap vanished: two wall families, entirely HIGH-side

Two register-choice wall families that either predate this round or
were newly confirmed by it landed **exclusively** in the HIGH arm
across the whole round, despite roughly half the dispatched pool
being LOW candidates:

- **Changed-bool family** (new formal entry
  [P-51](codegen-walls.md), promoted this round from
  `src/overlay004/ov004_core.h`'s module-local notes): `int c=0;
  if(rec.field){rec.field=0;c=1;} if(c)...` — the original reuses the
  just-emptied field's dead register for `c`; mwcc always allocates a
  fresh one. Documented "unsteerable" since brief 320 (store-c, `!!`,
  temp-variable coercions all previously failed; re-attempted fresh
  this round, still no coercion found). 12 sweep-7 ledger rows match
  this pattern — 10 genuinely new members plus 2 re-parks of
  already-documented-but-never-logged pre-existing members (see
  reconciliation note below) — **all 12 at n_call 4-12, zero at
  n_call 0-1**, verified address-by-address against the frozen pool
  JSONs' own `n_call` field, not batch self-reports.
- **Register-numbering-permutation-cascade family** (structure and
  word count correct, only physical register assignment wrong,
  overlapping P-30/P-36 territory): 9 ledger rows across three
  inconsistent tag spellings this round used for what is, on the
  evidence, the same underlying phenomenon (`register-numbering-
  permutation-cascade` bare ×2, the same string with a
  `-P36-adjacent` suffix ×4, and `P-30-adjacent-register-choice` ×3 —
  a tagging-hygiene gap across batches, disclosed here rather than
  silently unified). **All 9 at n_call 4-23, zero at n_call 0-1**,
  same direct-verification method.

Together these 21 ledger rows (12 + 9, no overlap) are register-
allocator-choice walls with no known coercion, and every single one
of them fell in a 4+-callee pool rather than a 0-1-callee one.

> **BRAIN CORRECTION (2026-08-17, at merge).** The counterfactual as
> originally written credited all 21 rows to the Part 1 HIGH arm and
> concluded a restored 22-point gap. **Only 12 of the 21 are in Part 1
> at all** — the other 9 are Part 2 pool rows, as this round's own
> Part 2 section states. Re-derived directly from the `brief` column
> of the 108 ledger rows this PR adds: changed-bool family 9 in Part 1
> / 3 in Part 2; permutation family 3 in Part 1 / 6 in Part 2. The
> corrected counterfactual is therefore:
>
> | Credit applied to Part 1 HIGH | HIGH | vs LOW 17/50 (34%) | Fisher p |
> |---|---:|---|---:|
> | none (as measured) | 18/50 (36%) | +2 pt | 1.0000 |
> | half of the 12 Part 1 walls (6) | 24/50 (48%) | +14 pt | 0.2223 |
> | all 12 Part 1 walls | 30/50 (60%) | +26 pt | 0.0158 |
>
> So the half-credit counterfactual does **not** restore the gap to
> significance and lands below the stated 55-65% prior; only crediting
> *every* Part 1 wall row does. The wall concentration remains a real
> and evidenced partial explanation for the null — the 12 Part 1 rows
> genuinely are all in the HIGH arm, which is not a chance pattern —
> but it does not rescue the round's HIGH arm back into the prior on
> any conservative accounting. The null stands on its own terms.

This is consistent with, not a refutation of, the pooled model: the
callee-count effect appears to be real, but this round's specific
HIGH-arm draw happened to concentrate an unusually large share of two
adjacent, currently-uncoercible register-choice walls.

### Does the question stay closed? Pooling all three rounds

Sweep-5 + sweep-6 + this round's Part 1, combined (200 matched-pair
candidates, 100/arm — 25 + 25 + 50 per arm; the "300 candidates,
150/arm" originally written here contradicted the denominators in the
table below and in the Fisher test, corrected by the brain at merge):

| Round | LOW shipped | HIGH shipped |
|---|---:|---:|
| sweep-5 (main) | 10/25 | 19/25 |
| sweep-6 (ov002) | 6/25 | 13/25 |
| sweep-7 Part 1 (pooled ov004/006/011) | 17/50 | 18/50 |
| **Pooled total** | **33/100 (33.0%)** | **50/100 (50.0%)** |

**Fisher's exact test on the pooled total: p = 0.0214** — significant
at the conventional p<0.05 threshold, despite this round's own arm
contributing a clean null. The honest conclusion is not a simple
"closed" or "not closed": the callee-count effect is real and
statistically supported across the accumulated pooled evidence (a
17-point gap, p=0.02), but it is not deterministic round-to-round — a
single round's HIGH arm can absorb enough concentrated, uncoercible
register-choice walls to erase the gap entirely in that round's own
data, as this one did. Per the kickoff's own framing, this — the
gap's disappearance under a well-designed, honestly-reported null,
with a mechanistic explanation that both accounts for the miss and is
consistent with the pooled signal surviving — counts as the more
interesting of the two possible outcomes, not a failure of the
design.

## Part 2 — exploit dispatch on the best remaining band

**Design.** 50 candidates, 4+ callees only, drawn from the same
pooled overlay004+006+011 population, restricted to what remained
after Part 1 consumed nearly the entire population at or below
~192 B. Resulting pool: 200-376 B, mean 298.2 B, median 304 B —
substantially larger than Part 1 HIGH's 186.8 B mean.

| | n | size range | mean | median | modules | tier mix |
|---|---:|---|---:|---:|---|---|
| Part 2 pool | 50 | 200-376 B | 298.2 B | 304 B | ov006=22, ov011=11, ov004=17 | default 31, legacy_sp3 8, ambiguous 9, leaf-no-signal 2 |

**Stated prior:** ~30-50%, below Part 1 HIGH's 36% and well below the
pooled model's un-decayed HIGH rate, to account for the sweep-4
calls+size logistic fit showing size actively suppresses ship
probability above ~192 B — this pool's 298 B mean sits well into that
decay region.

**Result:**

| Batch | Shipped |
|---|---:|
| 1 | 1/10 (10%) |
| 2 | 2/10 (20%) |
| 3 | 1/10 (10%) |
| 4 | 2/10 (20%) |
| 5 | 2/10 (20%) |
| **Total** | **8/50 (16.0%)** |

**16.0% is a large miss even against the low end of the stated
30-50% range.** Two effects compound here, both already visible in
this round's own data: (1) the known size-decay effect, now probed at
a size band (200-376 B) larger than any prior matched-pair arm; (2)
the same register-choice wall concentration documented above — 3 more
changed-bool-family rows and 6 more register-numbering-cascade rows
landed in this Part 2 pool alone (both counted in the P-51/reconcile
totals above), i.e. the walls that erased Part 1's gap did not stay
behind in Part 1's pool; they continued into the larger-size tail at
the same or higher density. The miss is real and the mechanism behind
it is the same one already documented for Part 1, not a separate
unexplained phenomenon.

## Classifier verification

The kickoff's explicit mandate was to fix or independently verify the
tier pre-classifier before relying on it, since sweep-6's had a 50%
false-positive rate (any `sub sp,#4` flagged as legacy_sp3, missing
that default tier can emit the same instruction when r3 is a genuine
callee-save). This round reused sweep-4's `tier_classify.py`
(r3-in-push checked before the subsp-only fallback), independently
re-verified against 3 of sweep-6's own 4 documented misclassifications
before trusting it, and required every batch to verify tier by reading
the `.s` epilogue directly rather than trusting the pre-pass label.

Consolidation cross-checked every one of the 43 shipped candidates'
actual compiled tier (from its `delinks.txt` filename extension —
`.c`/`.legacy.c`/`.legacy_sp3.c`) against its pre-pass `pretier` label.
19 of the 43 shipped candidates had a *definite* pre-pass guess
(the rest were pre-labeled `ambiguous(...)` or `leaf-no-signal`,
correctly declining to guess). **Disagreements: 0/19 (0%).** One
near-miss was self-caught mid-batch rather than reaching a final
disagreement: batch p2batch2 initially assumed `legacy_sp3` for two
siblings matching their pretier label, caught the mismatch during
self-review, and empirically verified `default` was correct before
either candidate's park row was finalized — both ultimately parked
(unrelated residual), so the near-miss never reached the shipped set,
but it is exactly the failure mode the round's classifier mandate was
designed to catch, and it was caught.

## Ledger reconciliation

**C-32 handling.** Three sweep-7 candidates were newly discovered
this round to be C-32 cross-overlay hardcoded-BL walls and correctly
parked with normal ledger rows (`0x021cf358`, `0x021ca9e8`,
`0x021cf0c8`). A fourth candidate in Part 1 batch 5's HIGH pool,
`0x021d07b0`, was **not** a new discovery: its `.s` file already
carried a header comment — `C-32 cross-overlay BL wall — brief 192
recipe` — predating this round entirely. It surfaced in this round's
"unattempted candidate" pool only because `--exclude-attempted`
filters by `attempts.tsv` address membership, and this pre-existing
wall had never been logged there (it was walled and shipped as hand-
written `.s` years before `park_one.py` existed). Batch 5 correctly
recognized it as already-resolved and did not re-attempt or re-park
it — the right call, but it left the ledger inconsistent with the
other three genuinely-new C-32 rows this round. Fixed during
consolidation: `0x021d07b0` now has a ledger row (`park_class=C-32`,
matching the other three's shape string) so it will not resurface as
an apparent candidate in a future sweep's pool construction.
`tools/validate_attempts.py` ran clean (exit 0) both before and after
this addition.

**Register-numbering-permutation-cascade tagging.** See Part 1's
wall-concentration section above — three distinct tag spellings used
across batches for what the evidence indicates is one phenomenon,
disclosed rather than silently merged.

## Combined totals

- **43 functions shipped** (17 Part 1 LOW + 18 Part 1 HIGH + 8 Part 2),
  **8,116 bytes** (2,572 + 3,244 + 2,300), **all natural C, zero `asm`
  escapes** — recomputed directly from `delinks.txt` `.text`
  start/end spans for all 43, not estimated.
- **107 `attempts.tsv` park rows added this round, 106 unique
  addresses** (one duplicate: `0x021cb63c`, parked twice under the
  p2batch2 tier self-correction described above — both rows are
  legitimate, the address was genuinely re-attempted under a
  corrected tier assumption).
- **`wall_aware_headroom.py --json --exclude-attempted` file-count
  delta** (a *count*, not a byte figure — see sweep-5's standing
  correction of sweep-4's own mistake here), measured via a detached
  worktree at the round's merge-base (`547e00272`, confirmed the
  current `origin/main` tip with no further drift) against current
  HEAD:

  | Module | Before | After | Δ |
  |---|---:|---:|---:|
  | overlay004 | 133 | 82 | -51 |
  | overlay006 | 136 | 71 | -65 |
  | overlay011 | 80 | 47 | -33 |
  | **Total** | **349** | **200** | **-149** |

  This reconciles exactly: 149 = 43 shipped (left the candidate pool
  by matching) + 106 unique newly-parked addresses (left the pool via
  `--exclude-attempted`).

## New codegen-walls.md entries

- **[P-51](codegen-walls.md)** — the changed-bool-field family
  described above, promoted from `ov004_core.h`'s module-local notes
  to the formal catalog with its full 18-member evidence chain (8
  pre-existing + 10 new) and this round's callee-count concentration
  finding.

Several other single- or few-instance patterns were flagged by
individual batches during the round (a field-caching variant distinct
from C-73, a third C-65 failure mode, a predication-non-conversion
mirror of P-31, dead-call-result register-reuse at a return site, an
mla-fusion-resistance mirror of P-29, a constant-fold mask collapse).
None were re-verified against primary source during this
consolidation pass with the same rigor as P-51, so none are being
added as formal entries this round — they remain in the batch reports
and this round's `attempts.tsv` `park_class` tags for a future
catalog pass to pick up, rather than being catalogued from
secondhand batch summaries.

## Provenance

cm-main-tier-sweep-7 (2026-08-14 to 2026-08-17). Part 1: 5 worktrees
(`mainsweep7-batch1`-`batch5`), pool frozen before dispatch. Part 2: 5
more worktrees (`mainsweep7-p2batch1`-`p2batch5`), branched from the
post-Part-1-merge consolidated tree. All 10 worktrees merged with zero
conflicts; activation invariant and delink-dupes checks both clean at
each consolidation point.
