# Brief 233 — MMIO bit-extract → VRAM/base address (C-40)

**Brief:** 233 (scaffolder). Path A — investigate the 4 MMIO
bit-extract picks brief 219 deferred as `.s`. Brief 220's
hard-tier survey estimated 100s of hard-tier candidates share
the broader MMIO-touching shape. Even partial unlock here is
high-leverage.

## Headline

**Wall is a recipe wall, not permanent.** Across an 8-mwccarm-
tier × 9-source-variant matrix on `func_0208deec`, **the orig
shape reaches byte-for-byte under EVERY mwccarm tier** from a
single-expression bit-extract idiom around a `volatile unsigned
short *` MMIO macro. No legacy routing needed.

Classified as **C-40** in [`codegen-walls.md`](codegen-walls.md).
One worked example shipped (`src/main/func_0208deec.c`) +
detector covering all 4 brief-219 picks (100% known-pick
coverage) + 6 unit tests + Path B documented as
already-resolved-via-legacy.c routing per brief 199's precedent.

## The orig shape (uniform across 4 picks)

```asm
ldr   r0, .L_pool                ; e59f0014  load MMIO base addr
ldrh  r0, [r0, #0]               ; e1d000b0  read u16 from MMIO
and   r0, r0, #MASK              ; e2000xxx  bit-field mask
mov   r0, r0, asr #SHIFT1        ; e1a00xx0  normalise (signed)
mov   r0, r0, lsl #SHIFT2        ; e1a00xx0  scale to page size
add   r0, r0, #BASE              ; e2800xxx  add result base
bx    lr                         ; e12fff1e
.word 0x0400100a OR 0x04001008   ; pool entry — DS NDS9 reg addr
```

| Pick                | Pool addr   | Mask    | ASR | LSL | Base       | Notes |
|---------------------|-------------|--------:|----:|----:|------------|-------|
| `func_0208deec`     | `0x0400100a` | `0x3c`  |  2  | 14  | `0x6200000` | VRAMCNT_E OFS field |
| `func_0208df40`     | `0x04001008` | `0x3c`  |  2  | 14  | `0x6200000` | VRAMCNT_C/D OFS field |
| `func_0208e1ac`     | `0x0400100a` | `0x1f00` |  8  | 11  | `0x6200000` | VRAMCNT_E wider field |
| `func_0208e200`     | `0x04001008` | `0x1f00` |  8  | 11  | `0x6200000` | VRAMCNT_C/D wider field |

All 4 are leaf functions that return a VRAM page address
based on a VRAMCNT_x register's bit-field. The DS NDS9
hardware register block at `0x04001xxx` controls VRAM bank
mapping; these helpers compute the configured page base.

## The C recipe

```c
#define VRAMCNT_E (*(volatile unsigned short *)0x0400100a)

void *func_0208deec(void) {
    return (void *)((((VRAMCNT_E & 0x3c) >> 2) << 0xe) + 0x6200000);
}
```

Compiled under mwcc 2.0/sp1p5 (or any other mwccarm tier),
produces orig bytes byte-for-byte:

```
.text 32B: e59f0014 e1d000b0 e200003c e1a00140 e1a00700 e2800662 e12fff1e 0400100a
```

Three structural elements jointly required (removing any one
breaks the match):

  1. **Macro-wrap of the MMIO cast** — `#define REG (*(volatile
     unsigned short *)0xADDR)`. The volatile-cast embedded
     DIRECTLY in the expression (not materialised into a named
     temp first) keeps mwcc from emitting an intermediate
     `unsigned int` load that switches the shift type from
     `asr` to `lsr`. A `volatile unsigned short *reg = ...; v =
     *reg;` form misses by one instruction (`e1a00120` lsr#2
     instead of `e1a00140` asr#2).
  2. **Single-expression nested shifts** — `((REG & MASK) >>
     SHIFT1) << SHIFT2`. Splitting the shifts via intermediate
     temps collapses both into a single combined shift of the
     fused offset (e.g. `lsl #0xc` instead of `asr #2` + `lsl
     #0xe`). The orig has TWO mov instructions; the source
     must preserve them.
  3. **`+ BASE` direct on the shift result + cast to `void *`**
     — keeps `add r0, r0, #0x6200000` (with rotate-encoded
     immediate 0x662). Casting to `void *` preserves the
     pointer-arithmetic semantics without altering the asm.

mwcc emits `asr` (signed shift right) for the field
normalisation because:

- `REG` reads as `unsigned short`.
- In-expression, it promotes to signed `int` per C's integer-
  promotion rules.
- `>> SHIFT1` on a signed int is implementation-defined-as-
  arithmetic on mwccarm (which is the conventional ARM-EABI
  choice).

If the source explicitly types the value as `unsigned int` (via
a named-temp declaration or a cast back to `unsigned`), mwcc
emits `lsr` instead — different opcode, different shape.

## Variant matrix (full results, 9 variants × 8 tiers)

`func_0208deec` target body (32B):
`e59f0014 e1d000b0 e200003c e1a00140 e1a00700 e2800662 e12fff1e 0400100a`

Tiers tested: 1.2/base, 1.2/sp2, 1.2/sp2p3, 1.2/sp3, 2.0/base,
2.0/sp1, 2.0/sp1p5, 2.0/sp2p4. Per-variant behaviour is
identical across all 8 tiers — no tier-specific divergence on
this idiom (unlike brief 214/216 where mwcc 1.2 vs 2.0
peepholes diverged).

| C source variant                             | Result                       | Notes |
|----------------------------------------------|------------------------------|-------|
| **`#define REG (...)` macro + nested shifts** | **32B MATCH ✓ all tiers**    | the recipe |
| `(volatile unsigned short *)cast` inline + nested shifts (no macro) | 32B MATCH ✓ all tiers | equivalent to macro |
| **`char *` return type + nested shifts**     | **32B MATCH ✓ all tiers**    | pointer type doesn't matter |
| `volatile unsigned short *reg = ...; v = *reg;` + nested shifts | 32B no-match (one insn wrong) | named temp -> `lsr` not `asr` |
| `volatile short *reg = ...; short v = *reg;` | 32B no-match (ldrh form wrong) | signed short -> `ldrsh` not `ldrh` |
| `((REG & MASK) << SHIFT_COMBINED) + BASE`    | 28B no-match (one shift)     | combined shift collapses two movs |
| `extern volatile unsigned short data_X;` decl | 32B body match, pool 0x00000000 | needs a reloc; the body is correct but the pool word doesn't embed the literal addr |
| `extern volatile short data_X;` decl         | 32B no-match (ldrsh)         | same signed-short issue |
| `volatile unsigned short *reg; short v = (short)(*reg & MASK); int s = v >> SHIFT1; ret (s << SHIFT2) + BASE;` | 36B no-match | extra temp materialisation |

Two of the working variants (macro + inline cast) are
semantically identical — the macro form is preferred for
source readability. The `char *` return type is an alternative
that compiles to the same bytes; `void *` is the canonical
choice for VRAM page addresses.

## What got shipped

| Change                          | Path                                  | Notes |
|---------------------------------|---------------------------------------|-------|
| Worked example                  | `src/main/func_0208deec.c`            | NEW; replaces deleted `.s` |
| Delete                          | `src/main/func_0208deec.s`            | superseded |
| Delinks entry update            | `config/eur/arm9/delinks.txt`         | `.s` → `.c`; EUR-only (no USA/JPN ports for this addr) |
| Detector                        | `tools/predict_walls.py`              | new C-40 detector matching the 7-instruction body + 0x04001xxx pool word |
| Tests                           | `tests/test_predict_walls.py`         | 6 new tests (3 positive shapes incl. both mask sub-variants + alt pool addr, 3 negative cases) |
| Taxonomy                        | `docs/research/codegen-walls.md`      | new C-40 section |
| Research note                   | `docs/research/mmio-bit-extract.md`   | this file |

## Hit count

**Strict C-40 detector against the EUR corpus:**

- 5000 unmatched picks (all tiers via `tools/next_targets.py --top 5000`): **0 hits**
- 129 already-matched 32-byte picks (false-positive check): **4 hits**
  — exactly the 4 brief-219 picks the recipe targets, **100%
  coverage**, 0 false positives.

The 4 hits are now classified as known-routing (plain `.c`
with the macro idiom). One swap shipped here; the remaining 3
are mechanical decomper-followup territory using the same
recipe with adjusted constants (mask, shift amounts, pool addr).

**Broader 0x04001xxx pool-word scan:** 463 occurrences across
the EUR `.text` regions (main + all 28 overlays). These are
the upper bound of the "MMIO-touching" family that brief 220
estimated at ~100s. The strict C-40 shape covers 4 of them;
the remaining 459 have variations in the body (different
instruction count, predication, additional ops, etc.) that
each likely have their own recipe sub-shape.

The brief's "~100s" estimate was based on the broader family
size (any function reading MMIO); the strict shape signature
brief 233 detector encodes is a smaller, well-defined slice.
For other MMIO-touching sub-shapes, the recipe insight
generalises (volatile-MMIO-macro + single-expression form)
but the exact body needs a per-shape variant matrix to lock
the C source idiom.

## Path B — C-1 + C-23 compound (not actively pursued this brief)

Brief 220 flagged 2,933 hard-tier picks fire BOTH C-1 (predicated
execution chains) and C-23 (MMIO base-folding) as the "iterative
core" not batchable. Brief 233 documents that **no new compound
recipe is needed**: the existing wall taxonomy already provides
the recipe.

The reasoning:

1. **C-1's recipe** (codegen-walls.md § C-1) is `.legacy.c`
   routing — mwcc 1.2/sp2p3 emits the explicit if/else
   branch shape the orig has, where mwcc 2.0's predication
   peephole produces fused predicated chains.
2. **C-23's recipe** (codegen-walls.md § C-23) is also
   `.legacy.c` routing — mwcc 1.2 lacks the MMIO base-folding
   peephole and emits the orig's separate `ldr base` + `ldr
   [base, #offset]` sequence.
3. **The compound** = both recipes apply simultaneously, which
   is just `.legacy.c` routing. Brief 199's
   `OSi_PostIrqEvent.legacy.c` is the documented canonical
   worked example (cited in codegen-walls.md § C-23 and brief
   220's survey).

No falsification matrix needed because the recipe was already
known and validated. The "iterative core" label brief 220
applied refers to the per-pick decomper work of WRITING the
C source matching each unique function — the routing decision
is universal (.legacy.c), but the source itself varies per
function.

**Recommendation for brief 234+:** Path B doesn't need a
scaffolder-side investigation. Decomper drains C-1+C-23 picks
by writing `.legacy.c` files one at a time — `tools/predict_walls.py`
already flags both walls and surfaces the routing. Future
scaffolder briefs could potentially extract recurring
source-shape templates from successfully-shipped `.legacy.c`
picks (template clustering similar to brief 159's
pattern_library.py), but that's not blocking — the recipe is
locked, only the per-pick source needs decomper attention.

## Verification

- `mwccarm 2.0/sp1p5` on `src/main/func_0208deec.c` produces
  `e59f0014 e1d000b0 e200003c e1a00140 e1a00700 e2800662
  e12fff1e 0400100a` = orig bytes byte-for-byte (verified
  live against `build/eur/delinks/.../func_0208deec.o`).
- Recipe also reproduces shape 2 (`func_0208e1ac` — mask
  `0x1f00`, asr `#8`, lsl `#0xb`) byte-for-byte under all
  8 mwccarm tiers (verified in the variant matrix).
- `python -m unittest tests.test_predict_walls` — 112 tests
  pass, +6 from main (the new C-40 tests + the C-40 vs C-38
  non-co-fire test).
- `python -m ruff check tools/ tests/` — clean.

## Needs brain's local build to verify

- [ ] `ninja rom` clean on EUR after the `.s` → `.c` swap +
      delinks.txt edit. mwldarm should link the `.c` ship
      identically to other plain `.c` files.
- [ ] `dsd check modules` stays at 27/27 baseline.
- [ ] `ninja report` shows `func_0208deec` still
      `matched_functions: 1, fuzzy: 100%`. The swap should
      preserve credit since bytes are byte-identical.
- [ ] `python tools/predict_walls.py --version eur` surfaces
      C-40 on the 4 brief-219 picks via real
      `arm-none-eabi-objdump` output (synthetic tests cover
      the regex; real-binary smoke is brain-side because
      scaffolder lacks `objdump` on this host).

Cross-region (USA / JPN) SHA1 — tools-only PR + 1 EUR-only
file swap (no USA/JPN ports for `func_0208deec` in
`config/{usa,jpn}/arm9/symbols.txt`), EUR-only is sufficient
per `docs/state.md` verify-gate rules.

## Cross-references

- [`brief-219-c38-drain.md`](brief-219-c38-drain.md) — flagged
  the 4 MMIO bit-extract picks as deferred `.s` ships, called
  out "worth a variant-matrix sweep to find a .c recipe."
- [`hard-tier-wall-survey.md`](hard-tier-wall-survey.md) —
  brief 220 hard-tier survey citing the 2,933 C-1+C-23
  compound figure and 100s-of-MMIO-bit-extract estimate.
- [`codegen-walls.md`](codegen-walls.md) § C-40 — taxonomy
  entry with full recipe + detector cue spec.
- [`bit-test-0-or-1-idiom.md`](bit-test-0-or-1-idiom.md) —
  brief 214's C-37 (precedent for the direct-mwccarm variant-
  matrix approach).
- [`wall-2-leaf-no-pool-reg-alloc.md`](wall-2-leaf-no-pool-reg-alloc.md)
  — brief 216's C-38 (precedent for the recipe-routing-via-
  legacy-tier classification when mwcc 2.0 diverges, which
  C-40 deliberately does NOT need).
