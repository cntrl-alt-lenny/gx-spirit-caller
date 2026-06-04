[//]: # (markdownlint-disable MD013 MD041)

# Brief 344 — ov014 clean-C wave 1 (thin; gap mirrors prior Mac-lane shapes)

**Brief:** 344 (decomper, Windows lane). Pivot to ov014 (13 funcs `<0x100`).
Survey by symbols.txt sizes (`size=0x…`), verify clone families by reading
seeds. Full recipe library; reshape register-CHOICE inline; catalogue
scheduling/SR/caller-saved/LICM/post-blx misses for the Mac lane. Small overlay
— expect a modest ramp, flag if thin. Target ~6. (Scaffolder's on ov012.)

## Headline — 3 matched; ov014 is thin, gap = prior Mac-lane shapes

**3 shipped (all `.c`), EUR objdiff fuzzy 100%, EUR `ninja sha1` OK.** ov014 has
**no clone families** (the lone 0x7c size-pair is coincidental, as the brief's
ov009/ov012 note warned), and the `<0x100` residue is dominated by the **exact
Mac-lane shapes already catalogued in ov017/ov019** — including the script-step
dispatcher rotation, now seen in a *third* overlay. The clean tier is the two
touch hit-tests + one paired-pane orchestrator. Flagging thin; recommend the
next wave pivot to a fresh overlay.

## The 3 picks

| func | size | shape | recipe |
|---|---|---|---|
| `021b34f0` | 0x78 | touch hit-test (alt input) | ov019 `021b27a0` + operand-order `x+w > px` |
| `021b3440` | 0xb0 | touch hit-test (primary) + lock guard + payload latch | u16→int `>>8` gives orig `asr#8` |
| `021b25b0` | 0x94 | paired-pane per-frame update; returns `(a && b)` | ov019 `021b2610` orchestrator |

All three matched on the **first** attempt — the ov019 touch-predicate and
scene-orchestrator recipes transferred directly.

## Finding — ov014's gap is the prior overlays' Mac-lane catalogue

This is the useful result for routing: ov014 contributes almost nothing *new* —
its unmatched cohort is the same shapes already proven Mac-only:

| ov014 func | % | identical wall already catalogued |
|---|---|---|
| `021b2eec` | (93) | switch-discriminant r0/r1 = ov017 `021b33dc` |
| `021b26ec` | (72) | script-step dispatcher post-blx rotation = ov017 `021b2c8c` / ov019 `021b26d0` — **3rd overlay, same wall** |
| `021b3b9c` | (69) | held-const teardown loop LICM numbering = ov017 `021b6774` |
| `021b4810`/`021b41b8` | 60 | BGCNT bit-manip caller-saved register dance (field → r12 vs reused read reg) |
| `021b3fc4` | 26 | loop teardown strength-reduction (orig 3 pointer IVs) |
| `021b4248` | — | RGB555 bit-pack caller-saved = ov019 `021b28dc` |

Two are *block-layout* near-misses rather than register/SR class, and the
closest in the wave:

- `021b274c` (95.8%): clean 3-bit-bitfield-compare init; **every instruction
  matches**, only two branch displacements differ (one ~17-insn block placed
  differently in the nested-if exit). Nested vs early-return-guard forms both
  tried; neither matched the orig's gotcha-20 block ordering.
- `021b2644` (80%): clean direct-MMIO scene-init; same nested-if block-placement
  diff.

## Recipes that transferred

The ov019 touch-predicate (`Rect` struct + `&&` chain + **comparison
operand-order** `r->x + r->w > px`), the scene orchestrator (`(a && b)` done
flag via `cmp/cmpne`), and the u16-promoted-to-int `>> 8` → `asr#8` all carried
over unchanged. The direct-MMIO DISPCNT clear matched in `021b2644`'s body (the
miss there is purely block layout).

## Recommendation

ov014 is thin (waves total = 3) and adds no new Mac-lane classes — it re-confirms
the dispatcher-rotation / switch-discriminant / held-const-loop / caller-saved-
bit-manip shapes are stable cross-overlay Mac walls. Pivot the next clean-C wave
to a fresh overlay; route the deferred cohort (and the two block-layout
near-misses) to the Mac permuter. The script-step-dispatcher rotation appearing
in 3 overlays is a prime single fix for the Mac lane (one shape, many sites).
