[//]: # (markdownlint-disable MD013 MD041)

# Brief 260 — classify the global-ptr-chase class + refine the over-firing predict_walls cues

**Status:** both deliverables settled. Direct-mwcc only (no ROM build,
no SHA1). Every coercibility verdict is a real mwcc compile this session
vs the `dsd`-delinked orig bytes; the detector refinement's tests are
red-on-bad-input verified.

## Headline

- **(A) The global-ptr-chase class is COERCIBLE** — a new C-39 sub-shape
  (**C-39g**), recovered both of brief 259's resisters byte-identical.
  The lever is **arg-liveness matching** (gotcha 7's mechanism): the
  `global->ptr->field` chase temps occupy whatever registers are NOT
  held by live incoming args, so match the orig's exact signature.
- **(B) StyleA + C-23 cues refined** — StyleA now requires an lr-saving
  prologue (frameless-leaf `bx lr` excluded); C-23 now requires an
  actual MMIO pool literal (no-MMIO duplicate/clustered pool refs
  excluded). Cuts ~214 + ~236 over-fires (brief 256 counts). Tests
  updated; the 4 new/changed skip-tests RED on the pre-refinement
  detector (verified by stash-and-rerun).

## (A) Global-ptr-chase — C-39g (coercible)

Brief 259 deferred `0223ba28` (43%) and `02273b54` (69%): the
`global->ptr->field` chase temps land in low registers vs orig's
r3/ip. Both recovered byte-identical; the unifying lever is
**arg-liveness matching**.

### `0223ba28` — forward the args (chase to r3/ip)

```text
push {r3, lr}
ldr  r3, [pc, #..]        ; &global
ldr  r3, [r3, #0x48c]     ; global->ptr   (chase → r3)
ldrh ip, [r3, #2]         ; ptr->f2       (field → ip)
lsl r3,ip,#17; lsl ip,ip,#31; lsr r3,r3,#31; eor r3,r3,ip,lsr#31  ; bit14 ^ bit0
cmp  r0, r3               ; r0 = arg0 (live)
movne r0,#0; popne
bl   func_ov002_0223b864  ; helper(arg0, arg1, arg2)
pop  {r3, pc}
```

Recipe: `int f(int a0, int a1, int a2){ p=g.ptr; if(a0==(p->f2.bit0 ^
p->f2.bit14)) return helper(a0,a1,a2); return 0; }`. **Forwarding
`a1`/`a2` keeps r1/r2 live → the chase is pushed to r3/ip** →
byte-identical (14/14 words). Contrast `v2` (`helper(a0,0,0)`, no
forward) → chase to r1/r2 = the 43% miss. (gotcha 4: source `bit0 ^
bit14` gives orig's bit14-first extract order.)

### `02273b54` — declare `void` (global to r0)

```text
push {r3, lr}
ldr  r0, [pc, #..]        ; &global → r0
ldrh r1, [r0, #22]        ; global->f22 ; bit1 branch
beq
ldr  r0, [r0]             ; global->word0 (reuses r0)
mov  r1, #500
lsl r0,#31; lsr r0,#31    ; bit0
bl   func_ov002_021df780; mov r0,#1; pop
```

The function takes **no args**; the global loads into r0 and is reused.
Recipe: `int f(void){ if(g.f22.bit1) return helper(g.word0.bit0,500),1;
return h2(); }` → byte-identical (16/16). A stray live arg would push
the global to r1 (the 69% miss the decomper hit).

### Verdict + falsification

**COERCIBLE.** Unifying principle: the chase temp registers = the
registers NOT occupied by live incoming args. Reconstruct the orig's
exact arg signature (forward what it forwards; `void` if none).
**Falsification (ran):** `0223ba28` v0 (forward) byte-identical vs v2
(no forward) → r1/r2 miss; `02273b54` `void` byte-identical. A match
that did NOT require matching the arg-liveness would disprove the
lever — none found; the v0-vs-v2 contrast is the proof.

**Distinct from the CSE field-temp P-11 plateau (brief 258):** there the
helper's args are all self-derived, so r1/r2 are unavoidably free and
there is no lever. Here the function's arg-liveness IS the lever →
coercible. Filed **C-39g** + **gotcha 15**.

## (B) predict_walls refinement (brief 256's follow-up)

Brief 256 found the StyleA and C-23 cues over-fire badly on the
"Track-2" cohort. Refined both in `tools/predict_walls.py`:

- **StyleA**: added an `has_lr_save` gate — fire only when the
  prologue saves `lr` (`stmfd`/`stmdb`/`push {…, lr}`). A frameless
  leaf (no lr-save) ending in `bx lr` is the native leaf epilogue on
  both tiers; routing is irrelevant (brief 256: those ship on the
  default tier). The cue text now says "real Style-A".
- **C-23**: now REQUIRES an MMIO pool literal (`mmio_lits >= 1`). The
  brief-199 `duplicate_refs` / `clustered_pool` signals no longer fire
  on their own — brief 256 showed by direct mwcc that mwcc 2.0 reloads
  non-MMIO pool ptrs (it does not fold), so those picks ship on the
  default tier and the cue was a false positive. The two signals
  survive only as extra cue context when MMIO is present. The
  brief-199 DTCM duplicate-ref true positive (`0x027ffc00`) still fires
  (it counts as `mmio_dtcm`).

### Tests + the red-on-bad-input gate

`tests/test_predict_walls.py`: 125 pass. Changed/new tests and their
gate status (verified by stashing the detector and rerunning against
the pre-refinement code):

| Test | Assertion | REDs on old detector? |
|---|---|---|
| `test_frameless_leaf_bx_lr_skips_style_a` (new) | not StyleA | **yes** |
| `test_duplicate_pool_ref_no_mmio_skips` (was `…_pool_ref`, IN) | not C-23 | **yes** |
| `test_clustered_pool_no_mmio_skips` (was `…within_0x20`, IN) | not C-23 | **yes** |
| `test_three_pc_loads_no_signal_no_match` (was IN) | not C-23 | **yes** |
| `test_real_style_a_with_callee_save_fires` (new) | StyleA | no (regression guard) |
| `test_duplicate_pool_ref_with_mmio_keeps_cue` (new) | C-23 + "duplicate" cue | no (regression guard) |

The 4 skip-tests all failed (red) on the pre-refinement detector,
confirming they exercise the refinement; the 2 positives guard against
over-correction.

### End-to-end on real picks

| Pick | Before | After |
|---|---|---|
| `func_02082210` (frameless leaf) | StyleA | **(no wall)** |
| `func_0208f284` (real Style-A) | StyleA | StyleA (kept, new cue) |
| `func_ov006_021b8d30` (no-MMIO C-23) | C-23 | **C-42** (its true natural-recipe class) |

The no-MMIO C-23 pick correctly falls through to the C-42 hint — the
refinement both cuts the FP and reveals the right classification. Per
brief 256's structural counts this removes ~214 StyleA frameless-leaf
+ ~236 no-MMIO C-23 mis-flags, so the over-fire worklist and future
scans are now trustworthy.

## What did NOT pan out

1. **The global-chase was not a plateau.** It read like the CSE
   field-temp P-11 (entry-loaded temps in low regs), but the decisive
   difference is that these functions forward incoming args — so
   arg-liveness is an available lever. Brief 259's decomper missed it
   by not reconstructing the exact arg signature (one pick wanted args
   forwarded, the other wanted `void`).
2. **The C-23 refinement is a deliberate FP-for-FN trade.** Requiring
   MMIO means a hypothetical true non-MMIO-fold C-23 would now be a
   false negative. Brief 256's direct-mwcc evidence (mwcc 2.0 reloads,
   doesn't fold, non-MMIO pool ptrs) says those are rare-to-nonexistent
   in practice, and the brain chose trustworthiness of the worklist
   over that tail risk. Documented, not hidden.

## Falsification-test ledger (this session)

| Claim | Test | Result |
|---|---|---|
| global-chase coercible (C-39g) | `0223ba28` v0 vs v2; `02273b54` void | v0/void byte-identical; v2 → r1/r2 miss |
| arg-liveness is the lever | forward-args vs no-forward | contrast confirms |
| StyleA refinement cuts frameless leaves | `func_02082210` | now "(no wall)" |
| C-23 refinement cuts no-MMIO | `func_ov006_021b8d30` | now C-42, not C-23 |
| detector tests guard the change | stash + rerun on old code | 4 skip-tests red |

## Cross-references

- `docs/research/brief-259-c39-ov002-drain-wave3.md` — the global-chase
  resisters this recovers.
- `docs/research/brief-256-c39-table-index-and-overfire-scope.md` — the
  over-fire scope this refinement acts on.
- `docs/research/brief-258-c39-cse-field-temp-and-taxonomy.md` — the CSE
  field-temp P-11 this is distinct from.
- `docs/research/codegen-walls.md` § C-39g + recipe-gotchas.md gotcha 15.
- `tools/predict_walls.py` (StyleA + C-23 cues) +
  `tests/test_predict_walls.py`.
