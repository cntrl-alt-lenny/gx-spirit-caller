# Brief 222 — C-39 pilot: non-leaf C-37 via bitfield recipe

**Brief:** 222 (scaffolder). Extend brief 218's bitfield-struct
recipe from C-37 leaf shape to the non-leaf C-37 shape brief
220 identified (455 candidates, 20.6% of unclassified hard
tier).

## Headline

**Recipe holds — 3 of 5 pilot picks ship byte-identical**
under default mwcc 2.0/sp1p5 with brief 218's bitfield-struct
recipe (a `unsigned short field : 1` halfword bitfield).
Classified as **C-39** in `codegen-walls.md` with detector +
5 unit tests. 2 picks deferred as "near-miss" for brief 224+:
one had a complex scheduling mismatch (multi-bitfield + dead-
code preload), one was a 396-byte switch-table dispatch with
10 helper calls.

Above the brief's ≥3 threshold for extending the C-37 detector.

## Pilot results

| Pick | Size | Shape | Result |
|------|-----:|-------|--------|
| `func_ov002_0223fd10` | 28 B | canonical bit-extract + helper + return 1 | **MATCH** |
| `func_ov002_02231f2c` | 32 B | + literal-31 helper arg | **MATCH** |
| `func_ov002_021f609c` | 64 B | multi-bitfield + if-skip body + helper | **MATCH** |
| `func_ov010_021b238c` | 104 B | bit-0 + signed halfword arith + conditional body | near-miss (~85%) |
| `func_ov002_0222bc1c` | 396 B | switch-table with 10 helper calls | beyond pilot scope |

## The recipe (worked example for `func_ov002_0223fd10`)

Orig disasm (28 bytes, 7 ARM insns, no internal pool):

```
push  {r3, lr}
ldrh  r1, [r0, #2]                  ; halfword load from struct offset 2
lsl   r1, r1, #31                   ; bit 0 -> bit 31
lsr   r1, r1, #31                   ; back to bit 0 (zero-extended)
bl    func_ov002_0223dad0           ; helper(self, bit0)
mov   r0, #1                         ; return 1
pop   {r3, pc}
```

Matching C source (compiles to byte-identical bytes under
default `mwcc 2.0/sp1p5 -O4,p`):

```c
struct Self {
    unsigned short pad0;            /* offset 0 */
    unsigned short bit0  : 1;        /* offset 2, bit 0 */
    unsigned short rest  : 15;
};

extern int func_ov002_0223dad0(struct Self *self, unsigned int bit);

int func_ov002_0223fd10(struct Self *self) {
    func_ov002_0223dad0(self, self->bit0);
    return 1;
}
```

The key element is the **halfword bitfield** (`unsigned short
... : 1`). mwcc 2.0/sp1p5 emits `ldrh` + canonical `lsl #31;
lsr #31` shift pair for the bitfield read, bypassing the
mask peephole (`ands #1` / `tst #1`) that direct shift casts
would trigger.

## Variant matrix (per pick)

### Pick 1: `func_ov002_0223fd10` (28 B, canonical)

| Variant | Result |
|---------|--------|
| u16 bitfield (`bit0 : 1` in `unsigned short`) | **MATCH** 2.0/sp1p5 |
| u32 bitfield (`bit16 : 1` in `unsigned int`) | non-match — `ldr` instead of `ldrh` |
| nested halfword struct (`struct Inner { bit0 : 1; rest : 15; }`) | **MATCH** 2.0/sp1p5 |

### Pick 2: `func_ov002_02231f2c` (32 B, +literal arg)

Same u16 bitfield recipe matched byte-identical on the first try.
The literal-31 helper arg (`helper(self->bit0, 31)`) emits as
`mov r1, #31` correctly without any source-side tweak.

### Pick 3: `func_ov002_021f609c` (64 B, multi-bitfield + if-skip)

Required two corrections from initial attempt:

1. **Field width**: orig has `lsl #17; lsr #23` (9-bit field at
   offset 6); first attempt used 7-bit field (`lsr #25`).
   Decoded from shift amounts: `width = 32 - max(L, R)`,
   `offset = L + R - 32`. Recipe fix: `unsigned short field9 : 9`
   at offset 6 (after a 6-bit pad).
2. **Branch shape**: orig has `beq <end>` (explicit branch);
   first attempt with `if (...) return X` form emitted
   `moveq r0, #1; popeq` (predicated return). Recipe fix: use
   `if (cond) { ... }` natural form so mwcc emits the branch
   to skip the body.

Both corrections together produced byte-identical match.

### Pick 4: `func_ov010_021b238c` (104 B, near-miss)

The bit-extract pattern matched, but orig **preloads** signed
halfword fields BEFORE the lsl/lsr (instruction-scheduling
order):

```
ldr   r0, [r4, #112]
ldrsh r2, [r4, #86]        ; orig preloads signed halfwords
ldrsh r1, [r4, #78]
lsl   r0, r0, #31           ; bit-extract starts AFTER the preloads
lsr   r0, r0, #31
cmp   r0, #1
sub   r1, r2, r1            ; orig computes delta (then never uses it)
ldr   r2, [r4, #4]
bne   <skip body>
```

mwcc 2.0 reordered:
- Loads the bit-extract source first, computes lsl/lsr
- Then loads other locals
- delta computation is DCE'd because unused

The dead-code preload pattern in orig suggests a source-level
artifact (a local `int delta = a - b;` that mwcc keeps live in
some other codegen branch but DCE'd here). Without finding the
exact source shape that preserves the dead store + matches the
scheduling, this pick stays as `~85% close`.

**Classification:** scheduling wall, not source wall. Out of
scope for C-39 (which is purely about the bit-extract code
path). Brief 224+ scaffolder candidate if more picks in this
sub-shape surface.

### Pick 5: `func_ov002_0222bc1c` (396 B, switch-table)

A switch dispatch with 10 helper calls, each branch doing
similar bit-extract patterns. Beyond pilot scope — would
require:
- Decoding the dispatch table layout
- Per-case bitfield work matching each branch's bit-extract
- Coercing mwcc's table-dispatch shape

Deferred; brief 224+ scaffolder candidate.

## Why the recipe works (mechanism)

mwcc 2.0/sp1p5's bit-mask peephole fires when the compiler's
lowering pipeline sees a direct `& 1` or `(x << 31) >> 31`
expression: it recognises the pattern as a single-bit
extraction and emits `ands r0, r0, #1` (or `tst r0, #1`) —
one instruction instead of three.

**Bitfield reads go through a different code path.** When the
source has `s->bit0` where `bit0` is declared as a 1-bit
bitfield, the compiler's bitfield-access generator emits the
canonical shift sequence (`lsl rD, rS, #N; lsr rD, rD, #N`)
because that's how ARM's ISA expresses arbitrary-bit-position
extraction. The lowering pipeline doesn't recognise this
sequence as a candidate for the mask peephole — the bitfield
code path is upstream of the peephole.

This is the same insight from brief 218's Shape B recipe — the
bitfield-extract path is independent of whether the function
is leaf or non-leaf, so the recipe generalises.

## Recognition cue (C-39 detector)

`tools/predict_walls.py::detect_walls` fires C-39 when ALL of:

  - Function entry is `push {…, lr}` (non-leaf marker — `lr`
    in the push register list, i.e. bit 14 of the reg mask).
  - Body contains `lsl rX, rY, #31` (encoding `e1a0_?f8_?`).
  - Body contains `lsr rX, rZ, #31` (encoding `e1a0_?fa_?`).
  - Body contains a `bl` instruction (any condition).
  - C-37 has NOT already fired (the leaf tail-pattern takes
    priority — C-37 picks ship under that recipe).

5 unit tests cover canonical match, literal-arg variant,
non-shadowing-C-37, non-fire-without-lsl/lsr, non-fire-on-leaf.

## Hit count

Across the 9,849 EUR function corpus: **1467 C-39 hits**.
Hard-tier unmatched slice:

- **1457 hard-tier picks fire C-39** (out of 7908 unmatched
  post-pilot-ships) — 18.4% of hard tier.
- **480 are SOLO C-39** (no other walls fire) — these are the
  cleanest decomper batch-drain prospects.
- The remaining 977 fire C-39 + other walls (mostly C-1 / C-23
  compounds) — the bit-extract is one feature of a larger
  composite shape; the dominant wall's recipe takes priority.

Brief 220's original estimate of 454 unclassified candidates
was the LOWER bound (only picks where NO other detector
fired). The 1457 is the broader population the detector
catches; the 480 solo subset is the comparable apples-to-
apples figure.

This makes C-39 the **biggest classified bit-extract opportunity
in hard tier** — larger even than C-38 (222 hard picks).
Brief 223+ decomper can drain the 480 solo C-39 picks
mechanically with the locked recipe.

## Brief 222+ scoping

For brief 223+ decomper:

- **Mechanical C-39 drain**: with detector live, decomper
  can batch the ~454 picks. Recipe is locked: u16 bitfield
  + bitfield-read access + match the function structure.
  Expected throughput: ~10-20 picks per round for
  straightforward shapes; complex multi-bitfield shapes
  (like pilot 3) need per-pick struct work.

For brief 224+ scaffolder:

- **Scheduling-divergence sub-wall** (pilot 4 family): if
  more picks in the "bit-extract + dead-preload" shape
  surface, investigate the source idiom that preserves
  mwcc's instruction ordering.
- **Switch-table dispatch C-39** (pilot 5 family): the
  hard-tier survey may have multiple switch-table picks with
  bit-extract per case. Could be a sub-wall with its own
  recipe.

## Cross-references

- `docs/research/codegen-walls.md` § C-39 — full taxonomy
  entry.
- `docs/research/bit-test-0-or-1-idiom.md` — brief 214 +
  218's C-37 leaf recipe (Shape A and Shape B).
- `docs/research/hard-tier-wall-survey.md` — brief 220's
  candidate identification.
- `tools/predict_walls.py` § C-39 detector — implementation.
- `tests/test_predict_walls.py::TestC39Detection` — 5 test
  cases.

## Files shipped

| File | Status |
|------|--------|
| `src/overlay002/func_ov002_0223fd10.c` | NEW worked example |
| `src/overlay002/func_ov002_02231f2c.c` | NEW worked example |
| `src/overlay002/func_ov002_021f609c.c` | NEW worked example |
| `config/eur/arm9/overlays/ov002/delinks.txt` | 3 new TU entries |
| `tools/predict_walls.py` | C-39 detector |
| `tests/test_predict_walls.py` | 5 C-39 tests |
| `docs/research/codegen-walls.md` | C-39 entry + counter bump (36 → 39 patterns) |
| `docs/research/brief-222-c39-non-leaf-bitfield.md` | this file |
