# cm-main-wall-filtered-sweep-1: a pre-dispatch wall detector, tested honestly — clean null (2026-08-17)

## Purpose

`cm-main-tier-sweep-7` (#1502) closed the callee-count question (real,
pooled-significant, but not deterministic round-to-round — a tiebreaker,
not a targeting strategy; the brain's merge-time correction is accepted
here without re-litigation, see `cm-main-tier-sweep-7`'s corrected
counterfactual table). It also found two register-choice wall families
concentrated entirely in its 4+-callee arm. This round's mandate: build a
**mechanical, `.s`-body-only** detector for those families, and — the
actual point — **dispatch the flagged arm too**, so the detector's real
precision is measured, not assumed.

**THE CALLEE-COUNT QUESTION STAYS CLOSED.** Nothing in this round
re-opens it; it is not discussed further here except as prior context.

## Detector construction (`tools/wall_prefilter.py`)

Two independent signals, OR-combined:

### P-51 (changed-bool-field register reuse)

A fixed 6-instruction ARM sequence, read directly off 5 known members
before writing the regex: load a struct/record field, unconditionally
zero the holding register, conditionally store it back to the **same**
address, conditionally reuse the **same** register for a "changed" flag,
then test it again. Register/address identity is enforced via regex
backreferences, not just shape.

Calibrated against all **18** confirmed P-51 members (positives) and all
**43** of sweep-7's shipped functions (negatives, fetched from git history
at the pre-merge commit `36f516555^1`, since a shipped function's original
`.s` no longer exists on disk):

| | Result |
|---|---|
| Recall | 18/18 (100%) |
| False positives | 1/43 (2.3%) |

**The 1 false positive is a finding, not a bug.** `func_ov004_021d552c`
matches the P-51 byte signature exactly, yet shipped in sweep-7 via
`char *self = (char*)selfv; if (*(int*)(self+0x38) != 0) { *(int*)(self+0x38)
= 0; flag = 1; }` — a raw pointer-cast field access, not the typed
`rec.field` struct access the entry's documented failed-coercion list
(store-c, `!!`, temp-variable) was tried against. One exception in 19
known instances does not retract "permanent," but it is a concrete,
untried lever for the other 17 P-51 members — flagged for a future,
separately-scoped round, not chased here.

### register-numbering-permutation-cascade proxy

Sweep-7's second family has **no single formal taxonomy entry** — three
inconsistent tag spellings covering what the evidence suggests is one
phenomenon, overlapping P-30/P-36 territory. Hand-reading all 9 tagged
members found no shape common to all of them: prologue callee-saved
register count alone ranges 0–8 across the 9, so no single threshold
rule works.

Built a 4-signal vote instead: (a) any single `bl` target invoked 2+
times, (b) 4+ callee-saved registers (r4–r11) pushed in the prologue,
(c) 6+ total `bl`/`blx` instructions in the body, (d) a loop (backward
branch to an earlier local label) with a `bl` inside it. Swept the vote
threshold against the same 9 positives / 43 negatives and picked **≥3-of-4**
specifically to hit this round's stated <15%-flagged-precision target
(≥2-of-4 gave 6/9 recall but a 30% false-positive rate — too noisy to
trust):

| Threshold | Recall (9 positives) | False-positive rate (43 negatives) |
|---|---|---|
| ≥2/4 | 6/9 (67%) | 13/43 (30.2%) |
| **≥3/4 (used)** | **4/9 (44%)** | **4/43 (9.3%)** |
| ≥4/4 | 2/9 (22%) | 3/43 (7.0%) |

**Combined calibration** (both signals OR'd): 22/27 recall (81.5%), 4/43
false positives (9.3% — the 1 genuine P-51 exception above plus 3
permutation-proxy over-triggers).

## Pool construction — a disclosed deviation from the planned 30/60 split

Pool: every EUR candidate (non-`P-NN`-permanent) `.s` file, `.text` size
≤192B, not already in `attempts.tsv`, with ≥4 `bl`/`blx` instructions in
the body. This is this round's own literal, reproducible definition of
"callee count" — sweep-5/6/7's internal `n_call` metric was computed
per-round and never committed as a reusable tool or a saved pool
snapshot, so it can't be exactly reproduced; this is a clean substitute
measuring the same underlying quantity. **Not restricted to
ov004/006/011** — that restriction was sweep-7's matched-pair-specific
design (needed a same-module 0–1-vs-4+ comparison), not a standing
constraint, so this round draws from the full EUR candidate population.

Scan found **209 qualifying candidates project-wide** (main 138, ov002 35,
plus a long tail across 13 more overlays). Running the calibrated
detector over this fresh pool: **only 19 flag** — P-51 fired **zero**
times (its known members are apparently already fully catalogued; the
family never had a chance to appear in an *unattempted* pool), so every
flag came from the permutation-cascade proxy alone.

The kickoff asked for 30 flagged + 60 passed. **Only 19 flagged
candidates exist in the entire qualifying population at the calibrated
threshold.** Dispatched all 19 rather than loosen the detector to hit an
arbitrary count — doing so would have directly undermined the precision
claim the round exists to measure. Passed arm: seeded-random sample of 60
from the 190 available (`seed=20260817`, reproducible). Flagged/passed
were **not disclosed to the dispatched batches** — candidates were mixed
within each batch with no arm label, specifically so a batch couldn't
unconsciously spend less effort on a "predicted wall" and bias the
measurement.

| Arm | n | size range | mean | median |
|---|---:|---|---:|---:|
| Flagged | 19 | 108–192B | 155.8B | 168B |
| Passed | 60 | 76–192B | 145.1B | 144B |

**Stated prior** (per kickoff): flagged <15%, passed >55%.

## Result: a clean null

5 worktrees × ~16, pool frozen before any batch touched a candidate,
disjoint partitions (no candidate assigned to two batches), one worktree
= one agent. All 5 merged into the consolidated branch with **zero
conflicts** (disjoint file sets; the one shared new file,
`tools/record_shipped.py`, resolved cleanly because it was already
committed to the integration branch before any batch branched, so every
side's content was byte-identical).

| | Shipped | Total | Rate |
|---|---:|---:|---:|
| **Flagged** | 11 | 19 | **57.9%** |
| **Passed** | 37 | 60 | **61.7%** |
| Combined | 48 | 79 | 60.8% |

**Fisher's exact test (two-sided, manual `math.comb` hypergeometric
implementation, re-validated to 4 decimal places against all 3 known
prior p-values — sweep-5's 0.0209, sweep-6's 0.0792, their pooled
0.0025 — before trusting it on new data): p = 0.7927.**

This is not a weak signal — it is a clean null. The flagged arm shipped
at essentially the same rate as the passed arm, nowhere near the stated
<15%/>55% prior. Broken down by module (in case the pool's ~66%-main
composition was masking something module-specific): flagged-main 8/14
(57.1%) vs passed-main 21/35 (60.0%); flagged-overlay 3/5 (60.0%) vs
passed-overlay 16/25 (64.0%). The null holds in both slices — this is
not a main-vs-overlay artifact.

**Interpretation.** P-51 — the high-confidence half of the detector
(100% recall, 1 exception in 43 negatives) — never got a chance to be
tested this round: it fired zero times on a genuinely fresh,
unattempted pool, because its known members are apparently already
exhaustively catalogued. What actually got measured was the
permutation-cascade proxy alone, and it does **not** transfer: a
composite calibrated on 9 members from three specific overlay modules
(ov004/006/011) does not predict wall risk in a broader, cross-module
pool, despite a respectable 9.3% false-positive rate against its own
calibration negatives. The proxy's individual signals (register
pressure, repeated-callee, loop-wraps-a-call) are generic
complexity/density correlates, not a wall-specific fingerprint — P-51's
mechanical, address/register-backreferenced regex is qualitatively
different and nothing here calls that half into question.

**Recommendation for future rounds:** do not deploy the
permutation-cascade proxy as a pre-dispatch filter as-is. If this family
is worth pursuing further, it needs calibration data from outside
ov004/006/011 before another precision claim is attempted — this round
supplies exactly that (19 flagged, disjoint from the calibration set,
with known outcomes) as a starting point, not a finished answer. Keep
P-51 itself as a park-on-sight signal; it remains high-confidence, just
untested against a fresh pool this round (nothing here weakens it).

## Byte total, tier mix, natural-C split

**48 functions shipped, 7,128 bytes.** Verified two independent ways:
(1) summed from each shipped row's `attempts.tsv` `text_size` column
(populated by `record_shipped.py` reading the delinks.txt span at record
time); (2) recomputed from scratch directly against the consolidated
branch's `delinks.txt` `.text start:/end:` spans, a fully separate code
path — **both give exactly 7,128 B.**

Tier mix: 44 default (mwcc 2.0/sp1p5), 4 `.legacy.c` (mwcc 1.2/sp2p3,
all 4 from batch3: `func_0209dd30`, `func_0209e788`, `func_020a3e34`,
`func_020a6614`), 0 `.legacy_sp3`, 0 `.thumb`.

**All natural C, zero `asm`/`GLOBAL_ASM` escapes** — checked every one of
the 48 shipped source files for an `asm`/`__asm`/`GLOBAL_ASM` marker: 0/48.

## Per-batch results

| Batch | Shipped | Parked | Ship rate |
|---|---:|---:|---:|
| 1 | 9 | 7 | 56.3% |
| 2 | 12 | 4 | 75.0% |
| 3 | 8 | 8 | 50.0% |
| 4 | 8 | 8 | 50.0% |
| 5 | 11 | 4 | 73.3% |
| **Total** | **48** | **31** | **60.8%** |

This 60.8% overall rate is well above every prior round's headline in
this campaign (sweep-7: 43%; sweep-4's 75% remains the high-water mark
but was a differently-shaped, callee-independent pool). The gap between
this round's rate and prior rounds' is a separate, real finding from the
detector's own null — see "other findings" below for candidate
explanations (boilerplate-header false alarm, lever accumulation).

## Other findings (not this round's headline, but real and worth keeping)

- **P-23 catalog correction.** `func_ov002_02253304` is explicitly listed
  in `codegen-walls.md` as a confirmed P-23 permanent member (82.9%
  ceiling, 7 exhausted variations). It shipped clean this round — the
  real fix was declaring an unrelated callee's return type `signed int`
  instead of `unsigned int` (forcing `LT` instead of `CS` on a `<5`
  compare in the caller), not anything touching the `mla` register
  pairing P-23 describes. The other 3 P-20/P-23-territory parks this
  round held as documented. Needs a correction pass in `codegen-walls.md`
  narrowing P-23's membership.
- **P-42 independently confirmed twice** (`func_0206bd74`, `func_02074dcc`,
  batch3). Was previously "tentative, single instance"
  (`func_020b03fc`); now a 3-instance pattern — worth promoting out of
  tentative status.
- **OQ-1 (dead-branch preservation) independently confirmed a second
  time** (`func_0204f8f0`, batch2, 21.4%): a provably-false
  `unsigned char < 0` guard the original ROM's compiler keeps but every
  C reproduction folds away. Was a single-instance open question
  (`func_0204a960`); now 2 independent hits.
- **New/reconfirmed lever, found independently by 2 batches:** declaring
  a bit-packed field as an actual C bitfield struct member
  (`unsigned x : N;`) reproduces the double-shift instruction pair the
  ROM emits; the semantically-identical manual mask/shift
  (`x & mask`, `(x<<a)>>a`) always collapses to a single instruction
  under mwcc's optimizer regardless of source phrasing. Shipped 3
  candidates in batch5 and 2 in batch2 on its own. Not currently
  reflected in `codegen-walls.md`'s P-4/P-8/C-25 entries.
- **Boilerplate-header false alarm, independently caught by 2 batches.**
  14/16 (batch1) and all 16 (batch3) candidates carried a "whole-function
  ship-as-.s (GLOBAL_ASM endgame, brief 302/419)... reg-alloc-walled,
  no C match" header. Both batches independently verified (git blame:
  one mechanical 2,600-file bulk-formatting commit; zero prior
  `attempts.tsv` rows for any of the 16) that this is boilerplate, not
  individual proof of unmatchability — confirmed directly by roughly
  half of each batch shipping clean. This explains part of why this
  round's ship rate is so much higher than sweep-7's: a meaningful slice
  of the "4+-callee ≤192B" pool was never a wall, just never
  individually attempted.
- **Genuine structural edge case, correctly declined without burning an
  attempt** (`func_02020ff8`, batch1): one `delinks.txt` range actually
  contains 3 merged original functions (a dsd delink-merge artifact from
  2 never-`pop{pc}` infinite-loop trap routines). The 2 inner ones are
  referenced by literal `.L_`-prefixed assembly labels from 6 other
  still-unmatched files *outside this round's scope* — converting would
  break those callers' links. No project precedent for this shape;
  parked as `structural`, not attempted as C.
- **Self-caught false alarm, worth the process note** (`func_ov007_021b2e00`,
  batch4): fastmatch reported 100% resolved, yet a real `ninja sha1`
  failed reproducibly, surviving a full clean rebuild. Root cause: the
  batch's own stash-based ninja-collision workaround had left a
  *different* candidate's `.s` renamed to `.s.stash` while `delinks.txt`
  still referenced the missing plain name — a dangling reference
  elsewhere in the same tree, unrelated to this candidate's own code.
  Both the false "parked, tool-anomaly" row and the corrected "shipped"
  row are preserved in `attempts.tsv` (append-only ledger, intentional);
  the shipped row is the true final state, confirmed against the
  consolidated branch's `delinks.txt`.
- **Fresh-worktree bootstrap gap, hit independently by 3 of 5 batches**
  (2, 3, 5): a newly-created worktree has no `build/eur/delinks/`
  reference objects (needs one `ninja delink` run) and no
  `arm-none-eabi-objdump` pre-downloaded (needs
  `python tools/download_tool.py arm-binutils v15.2.1-1.1 --path
  tools/arm-none-eabi`). Both one-time, ~15–30s fixes, but hitting the
  same gap independently 3 times in one round means it belongs in the
  WORKTREE-PARALLEL SWEEP PROTOCOL's standing preflight, not a per-batch
  workaround.
- **`park_one.py` doesn't auto-reconfigure** (batch1): switching a
  candidate between parked and shipped states can leave `build.ninja`
  unaware of a newly-created/removed `.c`, producing a misleading
  "multiple rules generate X" or "no functions in compiled .o" error
  until `configure.py` is re-run. Worth a tooling fix (auto-reconfigure
  on flip) in a future round.

## Gate

`python tools/gate3.py --scope all --clean` — full 3-region rebuild + sha1 +
pytest. All three regions PASS byte-for-byte (verbatim):

```
gx-spirit-caller_eur.nds: OK
[eur] SHA1 PASS
gx-spirit-caller_usa.nds: OK
[usa] SHA1 PASS
gx-spirit-caller_jpn.nds: OK
[jpn] SHA1 PASS
```

First pass also failed pytest on 3 stale generated-file checks (expected —
`docs/research/README.md`, `docs/state-table.md`, and `docs/tools-index.md`
(133 tools now, from this round's 2 new ones) all go stale the moment a
new round doc or new tool lands; `python tools/generate_state_table.py`
and `python tools/generate_tool_index.py` regenerated the first two
immediately, and `python tools/generate_research_index.py` regenerates
the research index LAST, after this doc's own content is final).
`gate3.py --clean` also deleted the 3 heatmap SVGs under `assets/` as
expected — restored via `git restore assets/` before committing, so the
PR diff stays scoped to this round's actual changes. Re-ran `python -m pytest -q tests` directly after the first two
regenerations (full 3-region rebuild unaffected by doc/index changes, so
not re-run — the sha1 lines above stand): 3,247 passed, 15 skipped, only
the deliberately-still-deferred research-index test failing. Final
regeneration (`python tools/generate_research_index.py`, 3,096 notes) +
one more `pytest -q tests` run: **3,248 passed, 15 skipped, 0 failed.**

`check_activation_invariant.py`: 48 `.c` added == 48 `.s` deleted == 48
delinks activations, `OK`. `check_delink_dupes.py`: `OK` (81
`delinks.txt`, no duplicate `.text` addresses).

## Ledger

80 new `attempts.tsv` rows (79 candidates + 1 intentional duplicate —
`func_ov007_021b2e00`'s self-corrected park→ship, see "self-caught false
alarm" above; append-only ledger by design). **Every shipped candidate
has its own `result=shipped` row via the new `tools/record_shipped.py`**
— the ship-side counterpart to `park_one.py` this round adds, closing the
gap `cm-ledger-park-bias` found (5 of the last 8 rounds recorded zero
shipped rows). `validate_attempts.py` exits 0 (73 lines of pre-existing
+ 2 new `shape-conflict` soft warnings, no hard errors).

## Process

5 worktrees × ~16 candidates, disjoint partitions written into the
dispatch prompts up front, zero merge conflicts across all 5 (disjoint
file sets end to end). `origin/main` drift checked before merging (fetch
+ `merge-base --is-ancestor` — clean, no rebase needed). Worktree
cleanup (`git worktree remove`) deferred until after this PR merges —
`cm-main-tier-sweep-7` noted removal can be slow for large post-merge
worktree directories (no lock file or lingering process, just directory
size); not a blocker for this PR.
