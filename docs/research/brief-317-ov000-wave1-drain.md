[//]: # (markdownlint-disable MD013 MD041)

# Brief 317 — pivot to ov000: co-drain wave 1 (fresh overlay)

**Brief:** 317 (scaffolder, co-drain). ov006's hand-matchable vein is mined
(brief-314 thinning verdict), so the second stream pivots to **ov000** —
next-richest untapped. Collision-free vs the decomper (on ov004): own
`src/overlay000/`, own ov000 `delinks.txt`, own `ov000_core.h`. Per-pick gate
= **EUR objdiff 100%** (direct-mwcc); the brain runs the 3-region SHA1 on merge.

## Headline

**11 shipped (all `.c`), all EUR objdiff 100%**, all drop out of a clean
ov000 re-delink, and **EUR `ninja sha1` PASSES** with the wave applied. ov000
matched `.c`: 12 → **23**. The pivot is well-justified — the survey shows a
**rich vein** (see (A)) — and this wave establishes the ov000 footing: the two
dominant globals (the active-object pointer + the config struct), a starter
`ov000_core.h`, and the recurring recipes. The dominant *small* shape is a
stride-44 bitfield-insert family that **near-misses** (banked for wave 2).

## (A) Survey — `size_census.py --module ov000 --shape`

```
ov000 unmatched shapes (86 funcs):  simple 61 · dispatcher 13 · permuter 12
hand-drainable 74 (simple + dispatcher)
```

**74 hand-drainable** — a strong cohort (the brief's ~63 `<0x100` estimate,
confirmed). Two dominant data structures anchor it (both byte-proven this wave,
captured in `ov000_core.h`):

- **`*data_ov000_021c73e0`** — pointer to the "active object" (a big struct;
  live (x,y,z) at int[12..14], prev snapshot at [33..35], delta at [54..56], a
  u16 status at byte +0x13e). The set-object-params family keys off it.
- **`data_ov000_021c758c`** / **`021c75c4`** — paired config structs (mode bits
  at +0x2a4 with mask `0x807fffff`, a callback fp at +0x174, packed fields at
  +0x2a8…). The mode/VRAM functions key off these.

### ⚠️ Overlay-swap aliasing check (gotcha 18) — clear this wave

ov000 shares base `0x021aaee0` with ov002 (overlay-swap). I cross-checked:
**0 ov000-unmatched funcs sit at an ov002 func address**, and **no dotted /
alias symbols** in ov000 `symbols.txt`. So gotcha 18 does not bite the current
cohort. The only oddity: a few callees are dsd placeholders
`func_ov000_…_unk` (e.g. `021b0b38_unk`, `021b11d0_unk`) — the
overlay-overlap-zone cross-calls; `extern` + bl-reloc still matches, flagged in
the header in case one ever needs a body.

## (B) The 11 picks

| shape / family | funcs |
|---|---|
| set-object-params (via `*021c73e0`) | `021aa898` · `021aaa58` · `021aa9cc` |
| VRAM-clear, mode-selected base (clone pair) | `021adb9c` · `021adbdc` |
| mode-bits RMW + chain | `021af420` (orchestrator) · `021af3f0` (set + tail-call) |
| guarded call | `021acaac` (flush+clear) · `021adb70` (indirect callback) |
| predicate / arith | `021aecf8` (`!021e5c()`) · `021add24` (`(a2>>1)-(a1*f(a0)>>2)`) |

## Banked recipes & gotchas (ov000 wave 1)

- **Eager paired-pool load (recurring)**: the `021c758c`/`021c75c4` config pair
  is loaded *both up front* in the orig; a lazy ternary loads the 2nd only in
  one branch. Fix: hoist the 2nd pool to a **top-level local pointer**
  (`char *m = data_ov000_021c75c4;`) so it's live early. (`021adb9c`,
  `021adb70`.)
- **Early-return value reuse**: `if (x == 0) return x;` returns the
  already-loaded 0 (`popeq`), avoiding an explicit `moveq r0,#0`. Writing
  `return 0` instead adds one instruction. (`021acaac`.)
- **`bx ip` indirect tail-call**: `return func_021ad464(1);` tail-calls through
  a *pooled* function pointer (the target is in a far section) — matches with
  no coaxing. (`021af3f0`.)
- **mode-bits RMW**: `field = (field & 0x807fffff) | bitN` — the non-immediate
  mask `0x807fffff` is pooled; `| bitN` is an `orr` immediate.

### NEAR-MISS — stride-44 bitfield-insert family (`021c7530`, banked)

The dominant *small* ov000 shape: `row[idx].byte_field |= / &=~ v` on a 44-byte
row array. Modeled as an 8-bit bitfield (`struct Ov000Row { …; unsigned b12:8;
…}`), `021ab4bc` reaches **12v12 byte-for-byte except the `bic`/`and` pair is
emitted in the opposite order** — a 2-instruction scheduling swap in mwcc's
bitfield-insert that did **not** flip across `|=`, `= a|b`, `b|a`, or explicit
int-masking. Likely a different mwcc sub-rev or ship-as-`.s`. There are ~6+
members (`021ab4bc/4ec/520/5ac/688/564`) — a high-value wave-2 unlock if the
order can be coaxed.

## Verification

| Gate | Status |
|---|:---:|
| EUR objdiff (direct-mwcc, per-pick) | **11/11 byte-identical** |
| clean re-delink drop-out | **11/11** out of the ov000 gap objects |
| EUR `ninja sha1` | **OK** (full ROM byte-identical) |
| overlay-swap aliasing (gotcha 18) | checked — no ov000/ov002 collisions, no dotted aliases |
| ov000 `delinks.txt` | 11 `complete .text` blocks (matched-set subtracted; overlap 0) |
| `ruff` / `tests/` / `check_match_invariants` | clean / pass / 0 errors |

`src/overlay000/` gains 11 `.c` + the new `ov000_core.h`; EUR ov000
`delinks.txt` +11 `complete`. No tool / USA / JPN change.

## Recommendation for the brain

1. **ov000 is a rich vein (74 hand-drainable) — keep the scaffolder here for
   several waves.** Wave 1 set the footing (globals, struct map, header,
   recipes); waves 2–3 should sustain.
2. **The stride-44 bitfield-insert family is the wave-2 prize** (~6+ members,
   one recipe) — if the `bic`/`and` order can be flipped (try the legacy mwcc
   revs, or ship-as-`.s`), it unlocks a cluster.
3. ov000 is **bitfield-dense** vs ov006 — expect more gotcha-6 / insert-order
   work; the clean call/store/orchestrator shapes (this wave) are the
   reliable path meanwhile.

## Cross-references

- `docs/research/brief-314-ov006-wave6-drain.md` — the ov006 thinning verdict
  that triggered this pivot.
- `docs/research/brief-300-ov006-premap.md` — the cross-overlay reachability
  ranking (ov004 > ov000 > ov008) behind the ov000 choice.
- `src/overlay000/ov000_core.h` — the byte-proven ov000 globals/struct map.
