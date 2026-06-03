[//]: # (markdownlint-disable MD013 MD041)

# Brief 324 — ov016 clean-C wave 1 (overlay pivot off ov010)

**Brief:** 324 (decomper). Pivot off ov010's wall-dominated tail (15 shipped, 6
reg-alloc/framing defers) to a fresh overlay: **ov016** (5 funcs pre-matched, 61
unmatched / 33 hand-drainable by census). Collision-free — the scaffolder stays
on ov008. Playbook as ov010/ov004: survey `--shape`, small-first, `ov016_core.h`
(cached-base + the divmod gotcha carried), `m2c_feed` → coerce, audit carve
sizes, gate = 3-region `ninja sha1`.

## Headline

**15 shipped, 3-region `ninja sha1` = EUR / USA / JPN all OK.** Top of the 12–18
target. ov016's easy tier is genuinely richer than ov010's was — the wave found
two clean **families** that did most of the lifting, plus a steady run of
guarded-release / teardown / forward shapes. Attempt rate ~15/25 of the shapes
examined. (A 16th candidate, `021b3560`, turned out already-matched on main from
brief 250 — the worklist's stale-gap scan false-flagged it; reverted untouched.)

## The 15 picks

| family | funcs |
|---|---|
| **row-group rebuild** (4-member family, N=0..3) | `021b8a30`, `021b894c`, `021b8b10`, `021b8bf4` |
| **sprite-cell draw** (12-arg builder) | `021b3498` (layer 2, +28), `021b509c` (layer 1, +44) |
| **struct-pack-forward** → 3498 | `021b3594` (from src record; sibling `021b3560` pre-matched) |
| guarded handle-release | `021b4204` (unk56), `021b2cf4` (unk144+DISPCNT), `021b35dc` (3 fills+release) |
| teardown / sequence | `021b6324`, `021b27cc`, `021b2788`, `021b39e4` |
| record swap | `021b2280` (84-byte SWAP through a temp) |

The **row-group family** (`021b8a30`…) is the wave's anchor: one template — 4×
config-register + guarded-release + 10-arg `func_0201ef90` build + `func_0201ede4`
handle store — with a clean arithmetic progression (palette `p+460+N`, guard
field `84+92N`, store `data_021bb1a4+(12+4N)`, per-row builder constants). Head
matched first try; all three siblings matched first try after tabulating offsets.

## Recipes banked (wave 1)

1. **MMIO double-RMW base register** — use **absolute addresses**, not a shared
   `char *reg` local. `*(int*)0x04000000 &= ~7936; *(int*)0x04001000 &= ~7936;`
   numbers the base `r1` (matching orig); the shared-local form forces `r2`
   (a uniform 1-reg miss). Fixed `021b27cc`/`021b2cf4` — a transferable trick for
   any DISPCNT/engine-pair RMW.
2. **`func_02094688` is MI_CpuCopy(SRC, DST, n)** — src-first. The 3-copy swap
   idiom (`tmp<-b; b<-a; a<-tmp`) nails the arg order (`021b2280`).
3. **12-arg object builder** `func_0201e964(layer, obj.unk44, &coords, 0,0,0,
   cellH, cellW, 0,0,0,0)` — `coords` is a 2-int local at the *top* of the frame;
   mwcc reserves the 8-word outgoing-arg region below it automatically
   (`021b3498`/`509c`). Same `0201e964` template as ov000's object-builder.
4. **10-arg `func_0201ef90`** `(a, a+4, a+8, r3c, sp0c, 1, arg1, 1, -1, guard)` —
   the `-1` is `mov #1; sub #2` (reuse the prior literal `1`) (8a30 family).
5. **Constant-divisor `/10` inlines as smull-magic** (`0x66666667`) and matches —
   only *variable* divisors hit the `_s32_div_f` trap and need the explicit
   `func_020b3870` (the carried divmod gotcha; not needed anywhere this wave).
6. **`+1723` auto-splits to `add #187; add #1536`** (deterministic mwcc order).
7. **Hit-test as a single `&&` return** branches every early-exit to a shared
   `return 0` epilogue (matching orig) instead of inline conditional pops.

## Walls — the thinning (reg-alloc / dispatcher / loop tail)

- **Hit-test reg-swap** (`021b287c`/`28f4`): the `&&` form is **30/30 byte-exact
  except a uniform `r1<->r2` swap** (rect-coord vs screen-coord). Flipping the C
  operands inverts the branch (`bgt`↔`blt`), so unsteerable — a clean permuter
  target (2 funcs).
- **fn-ptr dispatch** (`021b2824`): inline conditional-return vs branched
  epilogue + reg rename.
- loop / dispatcher / recursion: `021b23b4`, `021b5244`, `021b5390` (jump table),
  `021b7694`, `021b7718`, `021b75c8`, `021b22d8` (recursive quicksort).
- bitfield-pack command builders (`021b6074`, `021b2a8c`, `021b5188`);
  fixed-point mul-loop (`021b3a78`); magic-`/10` number format (`021b5fb0`);
  ambiguous 10-arg (`021b398c`); magic-const-heavy stat draw (`021b7504`).

## Verification

| Gate | Status |
|---|:---:|
| EUR / USA / JPN `ninja sha1` | **OK** (byte-identical, all 15 carved) |
| `check_match_invariants.py` | 0 errors (5091 warns, pre-existing placeholder names) |
| `ruff check .` | clean |
| `tests/` | passed |
| `ninja check` | NOT run (benign label drift, per the brief) |

EUR-only config change (+15 `complete` blocks); `src/overlay016/` gains 15 `.c` +
`ov016_core.h`. All 15 carve sizes audited against the gap symbol table before the
gate (per the brief's brief-322 lesson) — 0 mismatches. (`021b3560`'s block was
already on main from brief 250; my carve script correctly skipped the duplicate,
and the stale `.c` rewrite was reverted.)

## Recommendation for the brain

ov016 wave 1 was a **strong pivot** (15, top of target) — better than ov010's,
thanks to the two families. For wave 2:

1. **Permuter pass** on the deferred reg-swap pair (`021b287c`/`28f4`) and the
   `021b2824` dispatcher — uniform 1-instr misses.
2. **Continue ov016** — a handful of mid-tier composites remain (`021b22d8`
   recursion, `021b398c`/`7504` constant-heavy), but the cheap clean shapes are
   largely drained; expect ~6–10 with rising defer rate.
3. The 0x100+ ov016 tier and the bitfield-pack / loop families are `.s`/permuter
   territory.

## Cross-references

- `src/overlay016/ov016_core.h` — §VERIFIED + the carried DIVMOD block.
- `docs/research/brief-322-ov010-clean-c-wave1.md` — the prior wave (divmod
  recipe origin; the carve-size audit lesson).
