[//]: # (markdownlint-disable MD013 MD041)

# Brief 332 — ov017 clean-C wave 1 (fresh overlay)

**Brief:** 332 (decomper, Windows lane; permuter parked). Pivot off ov020
(its §WALL is genuinely Mac-only, brief 330) to a fresh overlay — **ov017**
(~24 funcs `<0x100`). Bring the full Windows recipe library; spot-check early
whether ov017's walls reshape (per-overlay, ov005 yes vs ov020 no). Target
~10-12. Per-pick gate EUR objdiff 100%.

## Headline

**10 shipped (all `.c`), EUR objdiff fuzzy 100%, EUR `ninja sha1` OK.**
`ov017_core.h` promoted. ov017 is a two-pane scene/menu controller —
call-wrapper / predicate / cell-builder dominated, like ov011 (NOT
scheduling-walled like ov020). Productive vein; a 3-member cell-config family
cloned mechanically.

## The 10 picks

| # | func | size | shape |
|---|---|---|---|
| 1 | `021b2c48` | 0x44 | scene-enter wrapper (2 controllers + entry seq) |
| 2 | `021b2bdc` | 0x6c | scene-poll wrapper (`a && b` ready) |
| 3 | `021b2ce4` | 0x78 | touch hit-test (point-in-rect) **[sib]** |
| 4 | `021b2d5c` | 0x78 | hit-test, alt input source **[sib]** |
| 5 | `021b4090` | 0x48 | box-offset stack builder + pass-through args |
| 6 | `021b30d4` | 0x58 | scene tick + BG-mosaic MMIO clear |
| 7 | `021b7330` | 0x78 | guarded event dispatch (3 flag handlers) |
| 8 | `021b73a8` | 0xe8 | cell-config window builder A **[sib]** |
| 9 | `021b7490` | 0xe8 | cell-config window builder B **[sib]** |
| 10 | `021b7578` | 0x114 | cell-config window builder C (+count guard) **[sib]** |

The cell-config trio (8/9/10) is the `func_0201ef90` 10-arg recipe (ov011
`021cd048` lineage): reconstruct the stack frame — `&field-group` pointer args
in r0-r3, the 6 trailing ints/ptrs as stack args (`stmib` fusion). Seed shipped
100% first try; the two siblings cloned by transcribing offsets/literals.

## Reshape spot-check — ov017 IS mostly reshape-able (vs ov020's 0/N)

The brief's per-overlay question. ov017's near-misses are control-flow /
structure / signature class — they flip cleanly on Windows direct-mwcc:

- **Shared return-0 epilogue** (021b2ce4, 58%→100%): chained `if (c) return 0;`
  early-fails *predicate inline*; the orig branches each fail to ONE shared
  epilogue. Collapse to `if (A && B && C && D) return 1; return 0;` — the `&&`
  short-circuit branches to the shared `return 0`. (Fixed the sibling too.)
- **Drop an unnecessary local pointer** (021b30d4, 68%→100%): a `volatile int
  *reg = 0x04000000` forced the base register; the inline
  `*(volatile int*)0x04000000 …` / `*(volatile int*)0x04001000 …` let mwcc
  *derive* the second address (`add r2,r1,#0x1000`) and allocate as the orig.
- **Fix the callee signature** (021b7330, 80%→100%): a handler is `f(self,tbl)`
  (tbl in **r1**, self kept in r0 from the param — orig omits `mov r0,r4`).
  Mis-declaring it `f(tbl)` put tbl in r0, clobbering self AND mis-allocating
  the flag base. The right signature flips both.

**1 deferred** (`021b2c8c` script-step dispatcher): a clean 3-register rotation
in the post-`blx` idx++ block (`{base,zero,idx}` = orig r0,r1,r2 vs r2,r0,r1).
Three levers (inline / cached-ptr / pre-increment) = 72 / 68 / 72%. This is the
"load-dest reg-numbering" class ov011 also deferred — genuinely allocator, not
a layout/signature issue. Catalogued in `ov017_core.h` §WALL for the Mac lane.

**Verdict:** reshape-ability is per-overlay and per-miss-CLASS. ov017's
control-flow/structure/signature misses reshape on Windows; only a pure
register-rotation resisted. Unlike ov020 (scheduling/allocator, 0/N), ov017 is
a productive Windows clean-C overlay.

## Verification

| Gate | Status |
|---|:---:|
| EUR objdiff fuzzy, per-pick | **10/10 = 100%** |
| EUR `ninja sha1` | **OK** (byte-identical ROM with all 10 carved) |
| ov017 `delinks.txt` | 10 `complete .text` blocks appended (EUR only) |
| 3-region `ninja sha1` | **deferred to brain** |

EUR-only config; no tool change, no USA/JPN change, no renames.
`src/overlay017/` gains 10 `.c` + `ov017_core.h`.

## Recommendation for the brain

1. **ov017 is a good clean-C vein — wave 2 worth it.** ~14 accessible funcs
   remain; families = the cell-config builders (more panes), the controller
   state-machines (021b33dc/312c/7010, bigger), the popcount/MMIO singletons.
2. **The cell-config recipe generalizes** (ov011 + ov017) — keep it banked.
3. **Run 3-region SHA1 on merge.**

## Cross-references

- `docs/research/brief-330-ov020-clean-c-wave2.md` — the ov020 Mac-only verdict
  that motivated this pivot.
- `src/overlay011/ov011_core.h` §VERIFIED (brief 313) — the cell-config recipe.
- `src/overlay017/ov017_core.h` — vocabulary + reshape spot-check + §WALL.
