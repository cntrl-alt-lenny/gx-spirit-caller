[//]: # (markdownlint-disable MD013 MD041)

# Brief 347 — pivot to ov013: clean-C wave 1 (small overlay)

**Brief:** 347 (scaffolder, co-drain). ov012 wave 1 (6 matched, #861) is at
target; pivot to a fresh overlay. Pick **ov013** (8 funcs `<0x100`) — a small
overlay, expect a thin ramp and flag it. Survey by `symbols.txt` sizes; verify
clone families by reading seeds (coincidental pairs keep showing up). Full recipe
library. Own `src/overlay013/` + the ov013 `delinks.txt` + a new `ov013_core.h`.
Per-pick gate = EUR objdiff 100%; the brain runs the 3-region SHA1 on merge.
Decomper is on ov007 — steer clear. Target ~5.

## Headline

**5 shipped (all `.c`), all EUR objdiff 100% + `ninja rom` OK — hit the ~5 target
exactly.** 5 of 6 attempts matched (four first-try); the recipe library
transferred to a **7th overlay**. ov013 is a small paged-menu overlay (tab/page
slides, a BLDALPHA fader, a slot→cell map) — the thin tail the brief predicted.

## The 5 picks (by recipe)

| func | size | recipe |
|---|---|---|
| `021cb644` | 0x30 | graphics-up **init** (clean call sequence) |
| `021ca618` | 0x74 | slot→cell **map** — dense `switch` returning constants (branch-table) |
| `021ca5d4` | 0x44 | dual-engine **BLDALPHA** pack (bind 0x4000014, derive +0x1000) |
| `021ca294` | 0x24 | page **count** — `(n + 2) / 3` (constant-divisor smull magic) |
| `021ca68c` | 0x80 | page **switch** — bitfield insert + nibble + bind + branch-swap |

## Levers (all re-proven; one reshape needed)

- **Constant-divisor magic** (`021ca294`): `/3` with a literal divisor inlines the
  `smull 0x55555556` sequence and matches as a plain `/` — no helper call needed
  (contrast the variable-divisor `func_020b3870` rule).
- **`switch` returning constants → branch-table** (`021ca618`): mwcc emits the
  `addls pc, pc, r0 lsl#2` computed-goto with `mov r0,#K; bx lr` bodies for a
  dense 0..7 switch. Write the switch literally; no value-table reshape.
- **Dual-engine MMIO pair** (`021ca5d4`): bind `reg = 0x4000014`, write the sub
  engine via `(char*)reg + 0x1000` — same idiom as ov003/ov012 display pairs.
- **`021ca68c` took two reshapes (81 → 100):** (1) bind `data_cbc3c` to a local at
  the TOP — the orig hoists it to a callee-saved reg to survive the calls before
  its single use; (2) swap the `if/else` so the orig's fall-through arm comes
  first (`if (reverse) fwd; else rev;`) to match the `beq` + block order. The
  bitfield insert into bits [20:18] is the shift form
  `(x & ~0x1c0000) | (((unsigned)p << 0x1d) >> 0xb)`.

## Survey note (reinforced)

The one size-histogram pair (0x138: `021ca024` / `021ca15c`) is **coincidental
again** — both use the `func_0201d47c` struct-config helper but have different
prologues and bodies. ov009 / ov012 / ov013 have now all had **zero** real clone
families; the rule "read the seeds, don't trust histogram pairs" is firm.

## Deferred / untried (→ Mac/permuter lane)

- `021cb700` (~80% expected) — blx dispatch over `data_021040ac[0xb6c]`, IDENTICAL
  to ov012 `021cc01c` / ov009 `021ad7d4` (post-blx register rotation, not
  C-steerable). Not attempted — known wall.
- `021cb674` has a relative `bl #-0x194e8` to a far helper; `021ca70c` is nested
  state→pool-word selection; `021ca024` / `021ca15c` (0x138) are bitfield-heavy
  escaping-struct config; `021c9d74` / `021ca2b8` / `021ca42c` / `021ca7cc`
  (0x174–0xe78) are the big bodies.

## Verification

| Gate | Status |
|---|:---:|
| EUR objdiff (per-unit + `report.json`) | **5/5 = 100.0** |
| in-tree build + link (`ninja rom`) | compiled + linked, ROM written |
| ov013 `delinks.txt` | +5 `complete .text`; gap set 14 → 9 (−5, clean re-dis) |
| `check_match_invariants.py` | **0 errors** |
| `ruff check tools/ tests/` | clean |
| 3-region `ninja sha1` | deferred to the brain on merge (per brief) |

Pre-flight: branched from fresh `origin/main` (`8ee5c71`, after #861); cleaned
stale gaps + re-`dis`. New `ov013_core.h` (reference only). No deferred
near-misses were wired (all 5 delink entries are matched).

## Recommendation

ov013 was the thin overlay the brief flagged — **5 at target** is the clean tier
drained. The remaining 9 are the post-blx coin-flip, a relative-bl helper, nested
selection, two bitfield-struct funcs, and the big bodies — all Mac/permuter
material. Pivot the next scaffolder wave to another fresh overlay; route ov013's
residue to the permuter/m2c lane.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
