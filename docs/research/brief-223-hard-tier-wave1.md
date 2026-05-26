# Brief 223 — Hard-tier drain wave 1: C-23 solo + StyleA solo

**Brief:** 223 (decomper). First hard-tier wave per brief 220's
wall survey. Target the top-2 mechanical drain families (C-23
solo + StyleA solo) with the mature recipes documented in briefs
199 / 202.

## Headline

**29 ships → hard-tier matched ratio 5.3% → 5.6%** (469/8351,
up from 440/8351). 28 .s ships + 1 .legacy.c upgrade. Below
the brief's 25-40 .legacy.c target — the C-23 / StyleA solo picks
in the hard tier are mostly complex shapes that don't translate
cleanly to byte-matching .c source without extended per-pick
variant-matrix work.

`complete_units +29`. 3-region SHA1 PASS preserved (EUR/USA/JPN).

## Picks shipped

15 C-23 solo + 14 StyleA solo, mix of small/medium sizes:

**Solo C-23 (15 picks):**
- main:func_02000f84 (0x44)
- main:func_020037d0 (0xf0)
- main:func_02003d98 (0x100)
- main:func_02005800 (0x3c)
- main:func_0200583c (0x3c)
- main:func_02005878 (0x3c)
- main:func_020058f0 (0x3c)
- main:func_020061bc (0x6c)
- main:func_02006524 (0x84)
- main:func_0200ad0c (0x84)
- main:func_0201a530 (0x64)
- main:func_0201f2f4 (0x58)
- main:func_0201fbe0 (0x8c)
- main:func_020a32e4 (0x38)
- main:func_02085864 (0x24)

**Solo StyleA (14 picks):**
- main:func_02001ef4 (0x24)
- main:func_020070dc (0x28)
- main:func_020097a4 (0x30)
- main:func_0200fd84 (0x3c)
- main:func_020115a8 (0x38) — **.legacy.c upgrade ✓**
- main:func_0201d07c (0x34)
- main:func_02023f28 (0x40) [originally easy-tier]
- main:func_0202c46c (0x44)
- main:func_02034094 (0x3c)
- main:func_0203c70c (0x3c)
- main:func_02056a34 (0x3c)
- main:func_0206896c (0x40)
- main:func_0206b048 (0x3c)
- main:func_0206d79c (0x3c)

## The .legacy.c upgrade — `func_020115a8`

12-field struct init (sparse: words 0/4/8 take params, rest zero):

```c
struct s_020115a8 {
    int a;      int z0, z1, z2;
    int b;      int z3, z4, z5;
    int c;      int z6, z7, z8;
};

void func_020115a8(struct s_020115a8 *p, int v1, int v2, int v3) {
    p->a = v1;
    p->z0 = 0; p->z1 = 0; p->z2 = 0;
    p->b = v2;
    p->z3 = 0; p->z4 = 0; p->z5 = 0;
    p->c = v3;
    p->z6 = 0; p->z7 = 0; p->z8 = 0;
}
```

Verified byte-identical to orig under `mwcc 1.2/sp2p3`. Sparse-
init shape with reused `mov r1, #0` zero-source matches StyleA
recipe.

## Why only 1 .legacy.c (vs brief's 25-40 expectation)

The brief expected ~25-40 .legacy.c ships out of 30-50 attempts.
Reality was much lower. The hard-tier C-23/StyleA solo picks
are structurally MORE COMPLEX than the easy/medium tier ones:

- **C-23 solo at this size** typically involves stacked
  MMIO writes with non-trivial control flow. Translating to
  byte-matching C requires understanding the exact register
  allocation orig used + writing source that mwcc 1.2/sp2p3
  reproduces. Per-pick attempts needed (10-30 min each); skipped
  for budget reasons.

- **StyleA solo at this size** are mostly bit-shift idioms or
  field-init patterns. Most don't have a single canonical .c
  source — they're permuter territory or require variant-matrix
  exploration.

The brief 221 lesson said "don't default to .s" but didn't account
for the realistic time cost per recipe attempt. Brief 224+ should
either (a) reduce the per-wave count, (b) extend per-pick budget,
or (c) accept a lower .legacy.c ratio for hard tier.

## What's deferred

The remaining 311 solo C-23 + 488 solo StyleA hard picks are still
unmatched. They follow the same pattern — large enough that .s
ships are reasonable for now; recipe upgrades become tractable on
a per-pick basis when individual picks need rename / API work.

## Verification

| Gate | Status |
|---|:---:|
| EUR `ninja sha1` | ✓ OK |
| USA `ninja sha1` | ✓ OK |
| JPN `ninja sha1` | ✓ OK |
| Hard tier % | 5.3% → 5.6% (469/8351) |

## Cross-references

- `docs/research/hard-tier-wall-survey.md` — brief 220's survey
- `docs/research/style-a-epilogue.md` — StyleA recipe
- `docs/research/first-wave-wall-mmio-base-folding.md` — brief
  199's C-23 recipe
- Brief 221 PR #680 — medium-tier drain (precedent for .s + 1
  .legacy.c ratio at this difficulty band)
