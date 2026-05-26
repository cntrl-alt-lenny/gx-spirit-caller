[//]: # (markdownlint-disable MD013 MD041)

# Brief 227 — C-38 chained-cast drain + C-39 wave 2

**Brief:** 227 (decomper, two parts). Part A: corpus drain on brief
225's C-38 chained-cast sub-shape. Part B: C-39 wave 2 with 10-15
"easier" picks from brief 222's 480 solo cohort.

## Headline

**19 .c ships → hard-tier matched 6.0% → 6.2%** (516/8351, +19). All
in `src/overlay002/`, all via brief 222's C-39 bitfield-struct
recipe applied to the **boolean-from-helper** sub-shape. Part A
landed 0 ships (corpus drained at brief 225); Part B exceeded
expectations with 19/19 first-attempt byte-identical.

`complete_units +19`. 3-region SHA1 PASS preserved (EUR/USA/JPN).

## Part A — C-38 chained-cast corpus drain (0 ships, already drained)

Brief 225's worked example (`func_0207d304.legacy.c`) used a chained
`(unsigned short)(unsigned char)*ptr` cast tail emitting
`and #0xff; lsl #16; lsr #16; bx lr` under mwcc 1.2/sp2p3.

### Corpus scan results

Scanned `src/**/*.s` for the tail signature
`and #0xff; mov ... lsl #0x10; mov ... lsr #0x10; bx lr`:

| Filter | Hits |
|---|---:|
| Strict tail | **2** |
| LEAF + strict tail | **0** |
| LEAF + u16-only tail (no `and`) | **0** |
| LEAF + u8-only tail (`lsl/lsr #0x18`) | **0** |

The 2 strict-tail hits are non-leaf:

- **`func_0207db8c.s`** (0x6c, allocator-like) — has chained-cast in
  body but body wraps an alignment-mask + range-check + Fill32 zero
  fill. Beyond brief 225 leaf recipe scope.
- **`func_0207dbf8.s`** (0x64, sibling of 0207db8c) — same shape.

Both are 4-byte stack-alloc functions with `Fill32` calls — a
heap-allocator sub-family. Coercing them to a single .legacy.c file
would require reconstructing the allocator's struct layout +
matching the `sub sp, #4; add sp, #4` prologue/epilogue +
non-trivial conditional flow. Each needs >> 15 min recipe research.

**Verdict:** Part A is a 1-wave drain at 0 ships. The 2 non-leaf
chained-cast hits are documented as a **brief 228+ scaffolder
candidate**: an "allocator with chained-cast flag" sub-family.

## Part B — C-39 wave 2 (19 .c ships)

19 picks shipped on first attempt from the 455 unshipped solo C-39
candidates. All converged on a single **boolean-from-helper**
sub-shape that is mechanically derivable from the brief 222 recipe.

### Recipe — boolean-from-helper

```c
struct FXXX_F2 {
    unsigned short bit0 : 1;
    unsigned short pad  : 5;
    unsigned short tag6 : 6;
    unsigned short rest : 4;
};
struct FXXX_Self {
    unsigned short f0;
    struct FXXX_F2 f2;
};

extern int helper(unsigned int bit0);         /* or: helper(self, bit0) */

int func_XXX(struct FXXX_Self *self) {
    return helper(self->f2.bit0) <CMP> CONST;  /* yields cmp; movCC; mov!CC */
}
```

mwcc 2.0/sp1p5 emits:

```
push  {r3, lr}
ldrh  r0, [r0, #2]
lsl   r0, r0, #31
lsr   r0, r0, #31              ; brief 222 bit-0 extract
bl    helper
cmp   r0, #CONST
movCC r0, #1                   ; CC = condition from C operator
movNCC r0, #0
pop   {r3, pc}
```

### Comparison cheat sheet

The C operator maps directly to ARM condition codes:

| C source                | Orig insns        |
|-------------------------|-------------------|
| `helper(...) != 0`      | `movne / moveq`   |
| `helper(...) == 0`      | `moveq / movne`   |
| `helper(...) > 0`       | `movgt / movle`   |
| `helper(...) >= 0`      | `movge / movlt`   |
| `helper(...) < 0`       | `movlt / movge`   |
| `helper(...) <= 0`      | `movle / movgt`   |
| `helper(...) > 2`       | `cmp #2; movgt`   |
| `helper(...) >= 2`      | `cmp #2; movge`   |
| `helper(...) < 2`       | `cmp #2; movlt`   |

### Register allocation cheat sheet

When **helper takes only `bit0`** (single-arg), mwcc allocates the
bitfield extract into `r0` (overwriting self):

```
ldrh r0, [r0, #2]; lsl r0; lsr r0; bl helper   ; helper(bit0)
```

When **helper takes `(self, bit0)`** (two-arg), mwcc keeps self
live in r0 and extracts the bitfield into r1:

```
ldrh r1, [r0, #2]; lsl r1; lsr r1; bl helper   ; helper(self, bit0)
```

Both arise naturally from the C source — no manual reg hinting.

### 19 shipped picks

All in `src/overlay002/`:

| Addr | Helper arg shape | Comparison | Cond |
|---|---|---|:---:|
| `0x021e8a58` | bit0 | `!= 0` | ne/eq |
| `0x021f691c` | bit0, 0, 1 | (return 1) | — |
| `0x021f8cf0` | self, bit0, 10 | (return 1) | — |
| `0x02201474` | self, bit0 | `!= 0` | ne/eq |
| `0x02203840` | bit0 | `>= 0` | ge/lt |
| `0x02203c90` | bit0 | `> 0` | gt/le |
| `0x0220767c` | self, bit0 | `> 0` | gt/le |
| `0x02209094` | bit0 | `!= 0` | ne/eq |
| `0x0220a990` | bit0 | `> 0` | gt/le |
| `0x0220b0d4` | self, bit0 | `>= 2` | ge/lt |
| `0x02287cd0` | bit0 | `== 0` | eq/ne |
| `0x0228ac50` | bit0 | `> 2` | gt/le |
| `0x0229113c` | self, bit0 | `> 0` | gt/le |
| `0x022912a4` | self, bit0 | `== 0` | eq/ne |
| `0x022913a8` | bit0 | `> 0` | gt/le |
| `0x02291248` | bit0 | `!= 0` | ne/eq |
| `0x02291ffc` | self, bit0 | `< 2` | lt/ge |
| `0x0229591c` | self, bit0 | `== 0` | eq/ne |
| `0x02296cc4` | bit0 | `>= 2` | ge/lt |

19/19 byte-identical on first attempt — no escapes, no .s fallback.

### Why so clean?

Brief 224 expected 10-15 .c upgrades from 25 picks at hard tier;
landed 1. Brief 227 expected 10-15 .c upgrades; landed 19.

The difference: brief 224 swept the cohort by SIZE (small to medium)
without pre-filtering by SHAPE. The picks included scheduling
divergences, helper-return reuse, and multi-call sequences — none of
which the simple recipe handles.

Brief 227 filtered to a single mechanical sub-shape upfront — the
"boolean-from-helper" pattern — by reading disasm before writing C.
That sub-shape happens to be **fully derivable from the brief 222
recipe + a single C conditional operator**. Each pick is ~10 lines
of boilerplate.

The 9 remaining "easy" picks I considered but rejected (had
scheduling oddities, dual-bitfield extracts, or `rsb` quirks) are
correctly classified as harder shapes — they'd need 20-40 min variant
research per pick (the brief 224 reality).

### Helpers extern-declared (used by multiple picks)

A few helpers are shared across multiple picks:

- `func_ov002_021ff2c8` — 2 picks (`0220767c`, `0220b0d4`)
- `func_ov002_021bbf50` — 2 picks (`02287cd0`, `0228ac50`)
- `func_ov002_02257ab8` — 3 picks (`0229113c`, `022912a4`, `0229591c`)
- `func_ov002_02280980` — 1 pick this wave (`022913a8`)

These helpers are themselves unmatched and likely sit in the C-39
cohort — visible as "callsite cluster" hubs for further wave
planning.

## What's deferred

**Part A deferrals (brief 228+ scaffolder):**

- "Allocator with chained-cast flag" sub-family: `func_0207db8c`
  + `func_0207dbf8`. Both non-leaf, both use chained-cast on a
  flag byte for bit-0 zero-fill skip. Needs recipe research for
  the allocator's struct layout + `sub sp, #4` prologue.

**Part B deferrals (brief 229+ decomper waves):**

- 436 of 455 unshipped solo C-39 hard picks remain. Sub-shape
  breakdown (estimated from sampling):
  - **Boolean-from-helper** (this wave's shape) — partly drained
    but more candidates exist in the larger 0x28-0x40 size range.
  - **Multi-bitfield with interleaved shifts** (e.g. `021f97e8`,
    `02223ddc`) — needs brief 226 sub-classification.
  - **rsb-inverted bit0** (e.g. `022022f0`) — `helper(1 - bit0)`
    pattern; new recipe extension.
  - **Pre-extract constant load** (e.g. `021f691c` scheduling) —
    already handled in this wave; more candidates possible.
  - **Bit0 + struct member combo** (e.g. `021f8290` with `ldrh
    r1, [r0]` for `self->f0`) — multi-field, helper takes
    (bit0, f0, ...) shape.

Future waves should follow brief 227's method: **scan disasm
first, filter by exact sub-shape, write C in batch**. Single-
sub-shape waves close in 1-2 hours for 15-20 picks.

## Verification

| Gate | Status |
|---|:---:|
| EUR `ninja sha1` | ✓ OK |
| USA `ninja sha1` | ✓ OK |
| JPN `ninja sha1` | ✓ OK |
| `dsd check modules` (all regions) | ✓ 27/27 OK |
| `tools/check_match_invariants.py` | ✓ 0 errors |
| `ruff check .` | ✓ All checks passed |
| Hard tier % | **6.0% → 6.2%** (516/8351) |

## Cross-references

- `docs/research/brief-222-c39-non-leaf-bitfield.md` — base recipe
- `docs/research/brief-224-c39-wave1.md` — wave 1 (1 .c of 25)
- `docs/research/brief-225-c39-subpatterns-and-c38-deferred.md` —
  C-38 chained-cast worked example + 4 documented near-misses
- `src/main/func_0207d304.legacy.c` — brief 225 worked example
- `src/overlay002/func_ov002_02209094.c` — wave 2 canonical
  boolean-from-helper example
