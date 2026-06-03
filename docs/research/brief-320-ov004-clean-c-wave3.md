[//]: # (markdownlint-disable MD013 MD041)

# Brief 320 — ov004 clean-C wave 3 (+ thinning flag)

**Brief:** 320 (decomper). Continue the ov004 ARM `<0x100` drain (waves 1-2 =
32 `.c`). Recipe unchanged; gate = `ninja sha1` (NOT `ninja check`). Family-first.
Target ~12-18. **If ov004's reachable thins, flag it.**

## Headline — the easy clean tier is THINNING

**6 shipped, 3-region `ninja sha1` = OK.** Down from 17 (wave 1) and 15 (wave 2).
The easy accessor / message / cell-config / handle-free shapes are largely
drained; the remaining `<0x100` cohort is now **dominated by reg-wall families**
(below) that need a permuter pass, not clean-C. 58 ARM `<0x100` remain but ~19+
are the `changed`-bool family alone.

## The 6 picks

| func | shape |
|---|---|
| `021d3818` | MMIO/sound window teardown (0208e2f4/0208c884 + 021d8798 + record release) |
| `021da91c` | e500.C90 page toggle + **tail-call** to 02037208 |
| `021cbf84` | cell-config (sibling of 021da898, ternary 6th arg) |
| `021d3d2c` | SE 232 + flag-dispatched stream/record teardown |
| `021d13dc` | status-15 + open/closed panel dispatch |
| `021cea48` | confirm/cancel cursor — nested message family |

## Recipes banked (wave 3)

1. **Tail call.** A `void` function whose last statement is `func_X(args)` and
   which needs no frame compiles to `bx ip` (jump), matching the orig
   (`021da91c`). The dcheck now normalises `bx <reg>` (objdump renders it as
   `msr SP_hyp, <reg>, lsl pc`).
2. **A `mov r0,#0` before a dispatch branch is the callee's ARGUMENT.** `021d13dc`
   calls `021d1118(0)` / `021d0f98(0)` — the dispatch helpers take an int; the
   stray `mov r0,#0` was arg 0, not a dead store.
3. **`-N` literal quirk extends to any sink.** `func_0208e2f4(reg, 28, -16)` →
   `mov r1,#28; sub r2,r1,#44` (mwcc reuses the prior literal, doesn't `mvn`).
   Same mechanism as the message-family `(ID, -1, …)`.
4. **Re-read a field rather than cache it** when the orig reloads it (`021cea48`
   buf[1] = `*(b+0x22C)` after the in-place update, not the cached `v`).
5. **Cell-config base: cache vs reload.** When b500 accesses are separated by
   calls, the orig RELOADS the base (no `char *b` cache → `021cbf84`); cache only
   when the base is genuinely held across no call.

## Walls — the thinning (all reg-alloc / permuter tail)

- **`changed`-bool family (~19 funcs)** — the dominant remainder; uniform
  1-register miss (carried from wave 2). Single biggest permuter unlock.
- **Loop strength-reduction** (`021d7854`, `021dab1c`): mwcc keeps a separate
  `i*N` offset counter; the orig uses an inline `add rX, base, i, lsl #k`. Not
  C-steerable (pointer-advance is a *different* SR).
- **fn-ptr-by-struct-field reg** (`021d5b14`, 1 reg); block-layout+reg
  (`021dabcc`); two-const message reg-swap (`021d13dc`'s siblings `021d12b0`…);
  jump tables (`021d3bc0`, `021ced78`); magic-number division (`021d3de4`);
  stack-heavy cell-config sinks (`021ca0a4`, `021cb778`, `021cb568`).

## Verification

| Gate | Status |
|---|:---:|
| EUR / USA / JPN `ninja sha1` | **OK** |
| `check_match_invariants.py` | 0 errors (5046 warns, pre-existing + benign ov004 drift) |
| `ruff check .` | clean |
| `tests/` | passed |
| `ninja check` | NOT run (benign ov004 label drift, per the brief) |

EUR-only config change (+6 `complete` blocks); `ov004_core.h` §VERIFIED extended.

## Recommendation for the brain (thinning flag raised)

ov004's **easy clean-C `<0x100` is thinning** (17 → 15 → 6 over three waves).
Three options for the brain:

1. **Permuter pass on the `changed`-bool family (~19 funcs)** — the single
   biggest unlock; every member is a uniform 1-register miss the permuter handles.
   This would turn the bulk of the remaining `<0x100` cohort green.
2. **Continue clean-C at diminishing returns** (~6/wave) — the scattered
   non-family shapes (sequences, message variants, MMIO) still exist.
3. **Pivot to a fresh overlay** (ov000 is the scaffolder's; ov008/ov010/ov016
   from the original survey are untouched).

The 0x100-0x200 ov004 tier is also entirely untouched (larger composites).

## Cross-references

- `docs/research/brief-318-ov004-clean-c-wave2.md` — wave 2 (where the
  `changed`-bool family was first catalogued).
- `src/overlay004/ov004_core.h` — §VERIFIED updated with the wave-3 picks.
