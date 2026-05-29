[//]: # (markdownlint-disable MD013 MD041)

# Brief 263 — Over-fire cohort drain, wave 1

**Brief:** 263 (decomper). Pivot off the mined-out C-39 vein to the
584-pick over-fire cohort (brief 256 sized + tiered; brief 260 refined
the detector). (A) Drain ~30-40 picks cheapest-first: StyleA-real
(`.legacy.c`) → frameless-leaf (default) → C23-noMMIO (default).
(B) Sweep the 2 C-39g picks via gotcha 15.

## Headline

**35 .c shipped, all objdiff 100 % + 3-region SHA1 PASS** — **35/35
attempted = 100 % yield**, every pick via an EXISTING recipe (routing or
natural C), zero cold-RE. Brief 256's thesis holds: the over-fire cohort
is genuinely cheap. Tiers confirmed empirically (compiled byte-identical,
not by label): StyleA-real → `.legacy.c` (sp2p3); frameless-leaf and
C23-noMMIO → default sp1p5.

## Yield by tier (for sizing the remaining cohort)

| Tier | Routing | Shipped | Yield | Notes |
|---|---|---:|---:|---|
| C-39g (gotcha 15) | default `.c` | 2 | 2/2 | both brief-260 resisters, byte-identical |
| StyleA-real | `.legacy.c` sp2p3 | 22 | 22/22 | mechanical; 12 are one helper family |
| frameless-leaf | default `.c` | 9 | 9/9 | leaf transcription; incl. byteswap, C-39 bit-compare |
| C23-noMMIO | default `.c` | 2 | 2/2 | incl. an LCG `base+idx*stride` |
| **total** | | **35** | **35/35** | |

**Worklist sizes I measured this wave** (refined predict_walls +
structural triage over unmatched functions):

```text
StyleA (lr-save) unmatched      : 614  (main 605, rest scattered)
C-23 (real-MMIO) unmatched      : 220  (main 98, ov006 17, ov002 15, ...)
frameless-leaf <=0x40 unmatched : 217  (main 130, ov002 54, ...)
C23-noMMIO <=0x40 unmatched     :  29  (main 15, ...)  [<=0x40 slice only]
```

The StyleA count (614) is larger than brief 256's "132 StyleA-real"
because brief 256 counted *solo*-StyleA ≤0x80; this counts every
lr-save StyleA prediction. Either way the cheap front is several hundred
picks — **multiple drain waves of high-yield work remain.**

## (A) The drain — recipes by family

**StyleA-real (22, `.legacy.c`).** All small (0x24-0x2c). The 1.2/sp2p3
tier emits the `stmfd {lr}; sub sp,#4 … add sp; ldmfd {lr}; bx lr`
shape; sp1p5 emits `push {r3,lr}` (wrong). Families:

- **`func_02094c94` 5-arg helper (12)** — `helper(code, a0[, a1], 0, 0)`,
  a stack arg. Three arg-shapes (1-arg / no-arg `r1=-1` / 2-arg) all
  ship from the same source shape: `02094cec` `02094dac` `02095244`
  `020952a4` (1-arg), `02094d80` (`-1`), `02094e0c` `02094e38`
  `02094e64` `02094ee8` `02094f48` `02094f74` `02095218` (2-arg).
- **`func_02094688` arg-shuffle (3)** — `02097ce8` `02097d38` `02097d0c`.
- **global = helper() (2)** — `0208f284` `0208f368`.
- **misc (5)** — `02094c70` (two void calls), `0206ed54` `0206ee18`
  (6-arg stack helper `h(a0,a1,a2,0,0,a3)`), `02073f84`
  (`h2((u16)h1(a0,a1,0))`), `020a0978` (stack-halfword builder).

**frameless-leaf (9, default `.c`).** Native leaf `bx lr` on both tiers
(no routing). Struct-init `020865ac` `02086c60` `0229e128` (ov002)
`021d3a58` (ov004); pack→global `02082210` `02082234`; C-39 bit-compare
`022869ac` `02287e38` (ov002, gotcha 6 bitfield); byteswap16 `020689b8`.

**C23-noMMIO (2, default `.c`).** `020872fc` (zero 3 globals),
`0202162c` (`base + s->f4 * 0x618`). The "no-MMIO clustered-pool" cue
ships natural on sp1p5 — confirms the over-fire.

## (B) C-39g — 2 shipped via gotcha 15

`func_ov002_0223ba28` (forward `a1`/`a2` → `global->ptr->f2` chase to
r3/ip) and `func_ov002_02273b54` (`void` → global to r0). Both
byte-identical, exactly per brief 260's arg-liveness recipe. (gotcha 4
`bit0 ^ bit14` for 0223ba28's extract order.)

## Non-shippers

**None this wave (35/35).** Caveat for honest sizing: picks were chosen
**clean-shape-first** within each bucket. A few trickier frameless-leaf
shapes were left untouched (e.g. `02092904` cache-maintenance `mcr`
loop; multi-branch predicated range checks). The 100 % yield reflects
that selection — but note even the non-trivial probes (byteswap, LCG
stride, reg-alloc-sensitive triple-global-zero) shipped first-try, so
the default tier looks genuinely cheap well past the trivial front.

## Process note

One StyleA sub-batch (9 c94-family files) first failed the gate due to a
**zsh word-splitting bug in my shell loop** (files mis-named with a
space, empty helper code) — NOT a recipe failure. Caught via the
per-batch `ninja sha1` gate, rewritten via Python, shipped. Lesson:
generate source files with Python, not `for … in` over space-joined
strings in zsh.

## Recommendation

Continue the over-fire drain (waves 2+). Cheapest order still holds:
StyleA-real `.legacy.c` (614 available, mechanical) → frameless-leaf
small → C23-noMMIO small. A scaffolder pass could auto-generate the
StyleA `func_02094c94` / `func_02094688`-style helper-family stubs from
disasm (the arg-shape is regular). The C23-noMMIO medium tail
(>0x80, ~159) is real per-pick decomp, lower priority.

## Verification

| Gate | Status |
|---|:---:|
| EUR `ninja sha1` | OK |
| USA `ninja sha1` | OK |
| JPN `ninja sha1` | OK |
| objdiff per-pick | 35/35 at 100 % |
| `tools/check_match_invariants.py` | 0 errors (4516 pre-existing warns) |
| `ruff check .` | clean |
| `tests/` (full suite) | 2267 passed |

## Cross-references

- `docs/research/brief-256-c39-table-index-and-overfire-scope.md` — the
  cohort sizing + tier triage this wave drains.
- `docs/research/brief-260-global-chase-class-and-predict-walls-refine.md`
  — C-39g (gotcha 15) recipe + the refined StyleA/C-23 detector.
- `docs/research/recipe-gotchas.md` — gotcha 10 (`.legacy.c` routing),
  gotcha 15 (C-39g arg-liveness), gotcha 6 (bitfield extract).
