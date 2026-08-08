# The ALIGNALL(2) wall is avoidable by TU composition — a working recipe (cm-restock-carve-3)

**Status: CONFIRMED WORKING, on one verified pair, under a precondition
narrower than first written.** Pairing two adjacent 2-byte-misaligned
symbols as separate named globals of the same type, in address order,
in one TU, avoids the `ALIGNALL(2)` cascade — verified via a full
3-region-capable build (EUR SHA1 PASS) and direct byte-level comparison
against pristine ROM at the symbols themselves *and* at both neighboring
already-shipped TUs (the cascade would show up there first).

**The precondition is 4-alignment at BOTH ends of the composed span, not
just a multiple-of-4 size.** The composed TU must start 4-aligned AND
have a size divisible by 4. Size alone is necessary but not sufficient,
and the difference is not academic: `ov006`'s four `kv_t` symbols
(`data_ov006_021ce38a` / `_3ae` / `_3d6` / `_3fe`) each already have a
size divisible by 4 (36/40/40/40) yet every one starts at `%4 == 2`,
and their whole contiguous run begins at `0x021ce38a` — so no
self-composition of that group can ever produce a 4-aligned span.

**This recipe therefore does NOT unlock wave 1's four declined `kv_t`
symbols** (an earlier draft of this document claimed it resolved that
question; it does not). Reaching those needs *backward absorption* into
`data_ov006_021ce372`'s extent — the other half of the composition
question, which this wave did not test, and which
`cm-restock-carve-1` Part 5 attempt #1 already recorded as rejected by
dsd's containment check. That half remains genuinely open.

What this wave did settle: *TU composition* can beat the cascade where
*source form* cannot, on a pair whose composed span is 4-aligned at both
ends. Wave 1 (`cm-restock-carve-1`) declined the 4 `kv_t` symbols after
3 workarounds failed; wave 2 (`cm-restock-carve-2`) could report 100%
only because every one of main's 58 candidates happened to be 4-aligned.
Note that two of wave 1's three attempts (backward absorption, and the
single large bundle TU) were themselves *TU-composition* attempts rather
than source-level ones — see the section below, which describes them
correctly.

## Why this is a different question than the ones already answered

Two prior research threads already explored *adjacent* territory and
both are worth distinguishing from this finding:

- **`ov004-odd-aligned-slot-recipe.md`** (brief 173): tested a
  **1-byte-misaligned `.rodata`** symbol in `ov004`. All 4 variants
  (A/B/C/D, including a bundle) failed — but D's bundle failed for a
  *different* reason than an alignment cascade: extending the TU to a
  4-aligned end required absorbing 3,943 bytes of an unrelated next
  symbol, which dsd's containment validator rejects. That's a
  **geometry** failure (the next real symbol boundary was too far
  away), not evidence that bundling itself doesn't work.
- **`cluster-b-size-1-2-recipe.md`** (brief 152): tested a
  **4-aligned-start, sub-4-byte-total-size** `.data` scalar (1 byte,
  padded with 3 known-zero neighbor bytes to reach a 4-byte multiple).
  This is the *single-symbol-plus-zero-padding* case — it already
  proved the section-size-multiple-of-4 mechanism works, but never
  tested two *independently-referenced, non-zero* symbols declared
  together, nor tested a symbol whose own **start** address (not just
  its size) is misaligned.
- **Wave 1's own `kv_t` attempts** (this project, `cm-restock-carve-1`,
  4 declined symbols): tried a *large* multi-symbol bundle (many
  named globals in one TU) and hit mwcc *reordering* the declarations,
  landing symbols at wrong addresses — a failure mode neither of the
  two docs above encountered, because neither tested more than one
  named (non-padding) global per TU.

This wave's candidates are **2-byte-misaligned at the symbol's own
start address** (`addr % 4 == 2`), and the open question was
specifically: does composing exactly two such symbols together, as two
*named* globals (not one opaque array + zero padding), (a) avoid the
size-cascade, and (b) survive mwcc's declaration-order handling at a
much smaller scale than wave 1's failed bundle?

## The test

**Candidates:** `data_ov016_021b9000` (0x021b9000, 10 bytes, ends at
`0x021b900a` — `addr%4==0`, `end%4==2`) and `data_ov016_021b900a`
(0x021b900a, 10 bytes, ends at `0x021b9014` — `addr%4==2`,
`end%4==0`). Both are real, independently-addressed symbols — not an
artificial pairing: `src/overlay016/func_ov016_021b2d4c.s` loads each
by its own literal-pool `.word` as a direct base pointer for two
fast-path branches (`relocs.txt:120-121`,
`from:0x021b2f54/0x021b2f58 kind:load to:0x021b9000/0x021b900a
module:overlay(16)`), and a second call site
(`relocs.txt:162-163`) indexes across the *same* pair with a
`mov r0,#0xa; mul r0,r1,r0` (stride=10) computation — i.e. this is
genuinely one 10-byte-stride record array that dsd's boundary
deduction split into two placeholder symbols because two fast-path
branches happen to reference elements 0 and 1 by direct literal
instead of by indexed arithmetic. (A 3rd element, `data_ov016_021b9014`,
is accessed the same way but is out of scope for this bounded
experiment — it's 4-aligned and carved separately as a normal Part-1
candidate this same wave.)

**Recipe:**

```c
typedef struct {
    unsigned short f0;
    unsigned short f2;
    unsigned short f4;
    unsigned short f6;
    unsigned short f8;
} Ov016Record021b9000;

Ov016Record021b9000 data_ov016_021b9000 = { 0x00e4, 0x00a5, 0x1a1a, 0x0002, 0x0000 };
Ov016Record021b9000 data_ov016_021b900a = { 0x0012, 0x003b, 0x15dc, 0x0002, 0x0002 };
```

Two separate named globals, same type, declared in address order, one
`.c` file, one `delinks.txt` TU spanning both
(`.data start:0x021b9000 end:0x021b9014`, 20 bytes total).

**File:** [`src/overlay016/data/data_ov016_021b9000.c`](../../src/overlay016/data/data_ov016_021b9000.c).

## Result

1. **Compiled `.o` inspection** (ELF section header, before linking):
   `.data` section size = 20 bytes (a multiple of 4). Symbol table:
   `data_ov016_021b9000` at in-section offset `0x0`,
   `data_ov016_021b900a` at in-section offset `0xa` (=10) — **mwcc
   preserved declaration order**, unlike wave 1's larger bundle. This
   is the key difference from the falsified attempt: 2 named globals
   in address order stayed in place; wave 1's bundle had many more
   and got reordered.
2. **Full EUR link + SHA1**: `gx-spirit-caller_eur.nds: OK` (exact
   pristine baserom hash).
3. **Direct byte comparison** (`extract/eur/arm9_overlays/ov016.bin`
   vs `build/eur/build/arm9_ov016.bin`, pristine vs built):
   - The experiment pair's own 20 bytes: MATCH.
   - The preceding already-shipped TU (`0x021b8e5c`, 32 bytes): MATCH.
   - **The immediately-following already-shipped TU (`0x021b940c`,
     16 bytes) — the exact place a +2 cascade would first appear:
     MATCH.** This is the decisive check; a cascade would shift this
     TU's expected bytes into occupying different file positions.
   - A further-downstream still-gap-filled region
     (`data_ov016_021b91ac`, 112 bytes): MATCH.
   - `pristine len == build len` for the whole `ov016.bin` (29,888
     bytes both sides) — no net size drift anywhere in the module.

**Verdict: the ALIGNALL(2) cascade is avoidable by TU composition**,
specifically: pair (or group) adjacent misaligned symbols as separate
named globals, in address order, in one TU, such that the composed span
is **4-aligned at both ends** — a 4-aligned start address AND a combined
`.data` section size divisible by 4. Size alone is not sufficient; a
group whose members all have `%4==0` sizes but whose run starts at
`%4==2` (e.g. `ov006`'s four `kv_t` symbols) can never self-compose into
an aligned span, and this recipe does not reach it. No source-level
alignment hint, `.s` rewrite, or padding trick is needed — the
existing `cluster-b-size-1-2-recipe.md` mechanism (size-is-a-4-multiple
avoids the cascade) generalizes from "one real symbol + zero padding"
to "two real, independently-referenced symbols," and mwcc's
declaration-reordering risk (wave 1's failure mode) does not manifest
at this smaller 2-symbol scale.

## Scope and next steps (not done this wave)

This was a single bounded test per the wave-3 kickoff's explicit
scope — it was not a mandate to carve the remaining population. Of
this project's 35 total 2-byte-misaligned struct candidates (this
wave's Part 2 population), many come in the same "two adjacent
misaligned symbols whose sizes are individually `%4==2` but sum to a
multiple of 4" shape (e.g. `ov005`'s 4 candidates split into two such
pairs; `ov017` and `ov019` show the identical pattern).

⚠️ **A future wave must screen on the both-ends criterion before
assuming applicability. 11 of the 35 fail it structurally** — their
run's start address is `%4==2` with no 4-aligned composition available
from the group itself, so this recipe cannot reach them no matter how
the members are paired. `ov006`'s four `kv_t` symbols are the worked
example above. Those 11 need the untested backward-absorption half, not
this recipe. Screen first, then apply — the main additional risk to
check per-candidate is whether
**more than 2** symbols need bundling to reach a 4-byte-multiple total
(this test only confirmed n=2; the declaration-order risk that broke
wave 1 was specifically correlated with *bundle size*, so a 3+ symbol
group should be spot-tested for reordering before being trusted, not
assumed safe by extrapolation) — and whether each candidate's `relocs.txt`
confirms no unexpected cross-TU reference the way this pair's did.

## See also

- [`ov004-odd-aligned-slot-recipe.md`](ov004-odd-aligned-slot-recipe.md) —
  the 1-byte-misaligned `.rodata` case; a different, harder geometry
  (bundle would need to absorb thousands of unrelated bytes).
- [`cluster-b-size-1-2-recipe.md`](cluster-b-size-1-2-recipe.md) —
  the original size-multiple-of-4 mechanism, proven for a single
  symbol plus zero-padding; this document generalizes it to two real
  symbols.
- [`cm-restock-carve-1-2026-08-06.md`](data/cm-restock-carve-1-2026-08-06.md) —
  wave 1, where the large multi-symbol bundle attempt's mwcc-reordering
  failure was first documented.
