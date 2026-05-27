[//]: # (markdownlint-disable MD013 MD041)

# Brief 239 — C-39e sub-pattern + C-42 audit + recipe gotchas + calcrom sweep

**Status:** 4 deliverables, mixed outcomes.

- **(A) Brief 236 C-39e deferred picks** — LOCKED. Both picks
  (021e27c0, 02206608) ship byte-identical under natural recipes.
  Not a new sub-shape — the existing C-39e recipe generalises.
- **(B) C-42 detector audit** — Detector solid. 97.3% true-positive
  rate (2.7% FP, below 5% threshold). Tightened detector to
  exclude large-stack-frame buffer-pass thunks (removes the 15
  FPs). Added 9-way sub-shape histogram for decomper drain
  pre-tagging.
- **(C) Recipe gotchas reference doc** — Created
  `docs/research/recipe-gotchas.md` with 6 gotchas catalogued
  (the 2 brief 237 surfaced + 4 historical from briefs 226/229).
- **(D) Calcrom-driven completeness sweep** — 0 actionable ships.
  The brief's premise (mf > cu = missing complete markers) turns
  out to be a misinterpretation: all 9 affected overlays have
  100% complete delinks entries. The mf − cu delta is just
  multi-fn-per-TU natural counting.

3-region SHA1 PASS (EUR/USA/JPN). +2 complete_units (from A).

## (A) C-39e deferred picks — both locked

### Brief 236's deferral

Brief 236 deferred 2 picks (021e27c0, 02206608) noting "complex
multi-branch structures — body diverges from canonical C-39e
3-step." Brief 239 ran the variant matrix.

### Result: both ship under natural recipes

**`021e27c0` (84 B, 22 insns)** — `bne`-skip-helper1 + cross-call
compare + conditional helper3:

```c
int func(int self_thing, int arg1) {
    int n;
    if (arg1 == 0) {
        n = helper1();
    } else {
        n = arg1;
    }
    int m = helper2(self_thing);
    if (n == m) return m;
    unsigned short tag = (unsigned short)(((self_thing ? 0x8000 : 0)) | 0x52);
    return helper3(tag, (unsigned short)n, 0, 0);
}
```

Natural if-else form (NOT early-return) matches orig. The `bne`
skip in orig comes from the if-else lowering — mwcc preserves
it.

**`02206608` (96 B, 24 insns)** — bit-equality test + helper-branch
with merged tail call:

```c
int func(Self *self, Self *arg1) {
    if (arg1 == 0) return 0;
    if (arg1->f2.bit0 == self->f2.bit0) return 0;
    if (helper(arg1->f0) == 0 && arg1->f2.field2 != 0) return 0;
    return helper2(arg1);
}
```

Key trick: the `&& field2 != 0` short-circuit MERGES the two
helper2 call paths (orig has `bne` jumping past the field
check to the single `bl helper2` at the tail). The naive form
`if (helper != 0) return helper2(); ... return helper2();` emits
DUPLICATE bl helper2 calls.

This is a new gotcha — documented in `recipe-gotchas.md` as
"merge duplicate-call paths via `&&`."

### Verdict

The existing C-39e recipe generalises to complex body shapes.
No C-39e1 sub-classification needed. Both picks ship byte-
identical.

## (B) C-42 detector audit

### Methodology

Ran predict_walls.py on full ROM with brief 237's C-42 detector.
Cross-referenced with next_targets unmatched list.

### Cohort

- **851 picks fire C-42 total** (vs brief 237's estimate of 861;
  delta from drained picks)
- **554 unmatched** C-42 picks (drain target for brief 240+)
- **15 false positives** (2.7%) — functions with `sub sp, sp,
  #N>16` (large stack frame = buffer-pass thunks, need different
  recipes)

### FP rate well below 5% threshold

Detector is solid. Tightened slightly to exclude large-stack-frame
picks (eliminates the 15 FPs).

### Sub-shape histogram (554 unmatched picks)

Classification by `bl` count, pool count, and post-call ops:

| Sub-shape | Picks | % | Description |
|---|---:|---:|---|
| **A3_single_bl_plain** | **189 (34.1%)** | 1 helper, no pool/bool tail |
| B5_two_bl_plain | 92 (16.6%) | 2 helpers, no fancy state |
| C_three_or_more_bl | 91 (16.4%) | 3+ helper calls |
| A2_single_bl_pool_arg | 53 (9.6%) | 1 helper with pool-loaded arg |
| B3_two_bl_save_r4 | 42 (7.6%) | mov r4, r0 across 2nd call |
| B1_two_bl_with_early_return | 41 (7.4%) | popeq between calls |
| B2_two_bl_with_field_write | 36 (6.5%) | helper + str field |
| B4_two_bl_pool_args | 10 (1.8%) | both calls take pool args |

The dominant sub-shape (A3, 189 picks, 34%) is single-bl with no
fancy tail — the simplest possible thunk shape.

### Detector update

Updated `tools/predict_walls.py` C-42 detector:
- Added stack-frame filter (excludes `sub sp, sp, #N > 16`)
- Added sub-shape hint in cue text (`(NbI/Mpool)` format) for
  decomper drain pre-tagging

Sample updated cue:
```
Multi-call thunk (1bl/0pool) — small (≤64 B) function with
helper calls but no bitfield/MMIO/predicate walls. Brief 237
hint: ships under natural C with no special idiom. ...
```

## (C) Recipe gotchas reference

### Created `docs/research/recipe-gotchas.md`

6 gotchas catalogued, sourced from prior briefs:

1. **`return r` vs `return 0`** (brief 237) — extra `moveq r0,
   #0` after helper null-check if you use `return 0;` instead of
   `return r;` with a named local.
2. **`extern char data[]` vs `extern int g_arg`** (brief 237) —
   array decl avoids the extra `ldr rD, [rD]` deref that scalar
   extern emits.
3. **Ternary polarity** (brief 229) — `m >= 1 ? 2 : 0` emits
   `movge; movlt`; `m < 1 ? 0 : 2` emits `movlt; movge`.
4. **XOR operand ordering** (brief 226) — mwcc schedules the
   right operand's bit-extract first. Match orig's order.
5. **`if-then` vs early-return for `bmi` shape** (brief 226) —
   C-39a requires if-then; early-return collapses to conditional
   execution.
6. **`mask < 0xff` triggers C-1 predication** (brief 218) — small
   masks emit `tst + movne/moveq`; bitfield-extract bypasses the
   peephole.

Plus a pre-flight checklist for new picks. Brief 240+ should
read this before each pilot.

## (D) Calcrom completeness sweep — 0 actionable

### The brief's premise

> calcrom.py identifies 8 overlays where matched_functions
> exceeds complete_units (units that already match byte-
> identically but are not yet flagged complete).

### Investigation

For each of the 9 affected overlays (ov005, ov006, ov007, ov009,
ov014, ov016, ov017, ov019, ov021), parsed `delinks.txt` directly
and checked for entries WITHOUT the `complete` marker.

**Result**: every single `.text` entry in every affected overlay
is ALREADY `complete`. Zero incomplete delinks entries exist.

### What `matched_functions > complete_units` actually means

The delta is the natural counting difference between:

- **matched_functions**: sum across all units of "how many fns
  in this unit match orig" (per-function count)
- **complete_units**: sum across all units of "is this unit
  flagged complete?" (per-unit binary)

When a TU contains multiple matched functions (multi-fn TU), it
contributes N to mf and 1 to cu. So mf > cu is the NATURAL state
for any overlay with multi-fn TUs.

For ov006: 80 matched_functions across 69 complete_units = avg
1.16 fns/TU. Some TUs have 3-5 fns each.

For ov005: 32 matched fns / 24 complete units = avg 1.33 fns/TU.

### Verdict

No bookkeeping gap exists. The brief's interpretation of calcrom
output as a "missing complete markers" indicator is incorrect —
the delta is just the metric units differing (fns vs files).

### Recommendation for brain

The `calcrom.py` output is useful for module-level visibility
but `mf − cu` is not actionable as a "freebie ships" indicator.
A more meaningful metric for bookkeeping gaps would be a direct
scan of delinks.txt for `.text` entries lacking the `complete`
marker — which, in the current state, returns 0 for every
overlay.

If brain wants a different bookkeeping audit (e.g., gap-object
fns that are byte-identical to orig but live in `_dsd_gap@*.o`
rather than dedicated `.s`/`.c` files), that's a different
analysis — and likely orthogonal to what calcrom reports.

## Detector + tests

`tools/predict_walls.py` extended:

- C-42 detector: stack-frame filter + sub-shape hint cue
- No new unit tests needed (existing C-42 tests still pass)

All 119 tests pass after detector update.

## Shipped worked examples (2)

- `src/overlay002/func_ov002_021e27c0.c` (84 B) — C-39e bne-skip
  + cross-call compare variant
- `src/overlay002/func_ov002_02206608.c` (96 B) — C-39e
  bit-equality + merged-tail variant

Both demonstrate the C-39e recipe generalisation for complex
body shapes.

## Cross-references

- `docs/research/codegen-walls.md` — full wall taxonomy
- `docs/research/recipe-gotchas.md` — NEW pre-flight reference
- `docs/research/brief-236-c39-wave7-and-c39e-cohort.md` — A
  picks deferred
- `docs/research/brief-237-hard-tier-landscape-survey.md` — C-42
  classification + cluster analysis
- `tools/calcrom.py` (PR #707) — calcrom tool
- `tools/predict_walls.py` — C-42 detector
