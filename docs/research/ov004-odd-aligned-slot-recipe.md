# ov004 odd-aligned `.rodata` slot recipe research (brief 173)

**Status:** ALL 3 brief-173 variants FAIL. Source-level recipes
cannot cleanly land an odd-aligned `.rodata` symbol in ov004.
Variant D (patcher extension) is proposed as the path forward.

## Context

Brief 171 (PR #608) reached n=2 ov004 veneer count via a 5-claim
band-1 cascade. The 2 remaining veneers target loads inside
**odd-aligned containing symbols** at addr % 4 == 1:

- `data_ov004_021ded69` (8780 bytes, 319 loads — the smaller-pool
  candidate per brief 159's reverse-lookup)
- `data_ov004_021e191c` (size + load count larger)

Brief 160 finding #4 documented the cascade root cause:

> `021e2b15` (addr % 4 == 1) claim shifted the veneer pool by 2
> bytes → patcher contiguity check failed. Pattern 1 `.c` form
> has no alignment-padding override; mwldarm places downstream
> sections aligned to the slot's natural 1-byte alignment.

This brief tested 3 source-level recipe variants on
`data_ov004_021ded69` (the smaller of the 2 odd-aligned
candidates) plus a Variant D bundle-recipe analog. All failed.

## Test setup

| Field | Value |
|---|---|
| Target slot | `data_ov004_021ded69` |
| VA | `0x021ded69` (`addr % 4 == 1`) |
| Size | 8780 bytes (`0x224c`) |
| File offset | `0x15009` (ov004 base VA `0x021c9d60`) |
| Next data symbol | `data_ov004_021e0fb5` (also odd-aligned) |
| Section | `.rodata` (`0x021de638..0x02209a5c`, `align:4`) |
| Loads into chunk | 319 (per `docs/research/ov004-rodata-pointer-targets.md`) |

Baseline before each variant: 3-region SHA1 PASS at n=2 (current
main, post-brief-171). Each variant was tested in isolation
against EUR; each REVERTED before testing the next.

## Variant outcomes

| Variant | Recipe | Veneer count | SHA1 | Byte diffs | Notes |
|---|---|---:|:---:|---:|---|
| A | `__attribute__((aligned(1))) const unsigned char[N]` | 0 | **FAIL** | 163,787 | mwldarm placed chunk at `0x021ded6a` (+1 byte alignment shift); `aligned(1)` ignored. |
| B | mwasmarm `.s` + `.align 0` | 0 | **FAIL** | 148,019 | mwldarm placed chunk at `0x021ded6c` (+3 byte alignment shift to 4-aligned VA). |
| C | Pattern 3 multi-symbol chunk (`0x021de638..0x021e191c`) | 0 | **FAIL** | 167,519 | Built bin SHRANK by 288 bytes (`-288`). Chunk overlaps with 5 `func_ov004_*_unk` thumb function symbols that dsd classifies as `.text` — those symbols disappear from the link, accumulating into the size delta. |
| D | Bundle recipe analog (1 pad + symbol + 3 pad, 4-aligned bounds) | n/a | **dsd error** | n/a | dsd rejects: extending the chunk end to 4-aligned `0x021e0fb8` includes the first 3 bytes of `data_ov004_021e0fb5` (next data symbol). dsd validates symbol containment → fails because `data_ov004_021e0fb5`'s extent (`0x021e0fb5..0x021e191c`) isn't fully covered. Equivalent to Variant C without the multi-symbol globals — same constraint. |

### Variant A diagnostic detail

Built chunk starts at `0x021ded6a` instead of `0x021ded69`:

```text
fo=0x15009 (va=0x021ded69): orig=0xb5  built=0x00  <<<
fo=0x1500a (va=0x021ded6a): orig=0x81  built=0xb5  <<<
fo=0x1500b (va=0x021ded6b): orig=0xb0  built=0x81  <<<
```

The first byte of `data_ov004_021ded69` (orig `0xb5`) lands at
file offset `0x1500a` instead of `0x15009`. Every literal-pool
slot in `.text` that targets an address inside this chunk has
its target shifted by +1, producing thousands of single-byte
`+4` patches scattered through `.text` (e.g. `0xbc → 0xc0`,
`0xd0 → 0xd4`).

The patcher's `_apply_load_rewrites` writes the orig VA into
each `kind:load` slot, but the actual chunk lives at `+1` VA
relative to the orig; the chunk's bytes no longer match orig at
those VAs.

### Variant B diagnostic detail

mwasmarm `.align 0` is a NO-OP — mwldarm still pads the section
to 4-alignment. Built chunk starts at `0x021ded6c` (+3 bytes,
the next 4-aligned VA after `0x021ded69`):

```text
fo=0x15009 (va=0x021ded69): orig=0xb5  built=0x00  <<<
fo=0x1500a (va=0x021ded6a): orig=0x81  built=0x00  <<<
fo=0x1500b (va=0x021ded6b): orig=0xb0  built=0x00  <<<
fo=0x1500c (va=0x021ded6c): orig=0x00  built=0xb5  <<<
```

3 bytes of zero-pad inserted by mwldarm; the chunk's first byte
shifts to `0x021ded6c`. Worse than Variant A (more cascade,
more bytes affected downstream).

### Variant C diagnostic detail

Chunk start `0x021de638` (`.rodata` section start, 4-aligned) +
end `0x021e191c` (next 4-aligned data symbol). Generator
correctly emits 5 `.global` labels for the data symbols in the
range, omitting the 5 `func_ov004_*_unk` thumb symbols (which
dsd classifies as `.text` despite their addresses being inside
the `.rodata` chunk).

Built binary is **288 bytes SMALLER** than orig. Likely the
linker drops the phantom function symbols (since they're not
defined in any `.text` TU) but their address space still
"counts" in orig — the multi-symbol Pattern 3 chunk redefines
those addresses as data, shrinking the apparent layout.

The first 4 bytes are also shifted (`fo=0x15004: orig=0x69
built=0x5e`) — a literal-pool pointer that used to point at
`0x021ded69` now points elsewhere because the symbol moved.

### Variant D diagnostic detail

Tried bundle recipe analog: 4-aligned start (`0x021ded68`, 1
pad byte) + 4-aligned end (`0x021e0fb8`, 3 pad bytes past the
odd-aligned symbol end). Avoids Variant C's multi-symbol claim.

dsd rejects at delink time:

> Error: Last symbol 'data_ov004_021e0fb5' in section '.rodata'
> of file 'src/overlay004/data/data_ov004_021ded68_bundle.s' has
> the range 0x021e0fb5..0x021e191c but is not contained within
> the file's section range (0x021ded68..0x021e0fb8)

The 3 trailing pad bytes overlap with `data_ov004_021e0fb5`'s
start. dsd's symbol-containment validator requires that any
symbol whose addr falls inside a TU's claimed range must be
fully contained — `data_ov004_021e0fb5` extends another 3943
bytes past my chunk end.

The only way to extend the chunk to fully contain
`data_ov004_021e0fb5` is to grow to `0x021e191c` — that's
Variant C, with the same multi-symbol cross-overlay problem.

## Root cause

**mwldarm enforces a minimum 4-byte alignment on `.rodata`
section placement, regardless of source-side `__attribute__`
or `.align` directives.** This is structural — the LCF
(`build/eur/arm9.lcf`) declares `.rodata` with `align:4`, and
mwldarm pads section starts to that alignment when laying out
the link.

The orig binary's odd-aligned data placements are produced by
mwldarm's WHOLE-`.rodata` per-section layout (the bytes are
contiguous from `.rodata` start; symbol boundaries inside the
section don't get alignment padding). Per-TU claims trigger
the alignment because each TU contributes a separate
`.rodata` SECTION (not a sub-range), and per-section alignment
applies.

## Falsification summary

Brief 173's three source-level variants (A, B, C) + the
bundle-recipe analog (D) all FAIL for the same root cause —
mwldarm's per-section 4-byte alignment. The path-2 structural
floor at n=2 is not surmountable via source-level recipe alone.

## Variant E proposal (brief 174+ candidate)

The remaining tractable approach is a **patcher extension** to
handle 2-byte (or 1-3 byte) veneer pool shifts at low n. The
existing `tools/patch_ov004_veneers.py` requires the veneer
pool to be at a 4-aligned file offset (per the canonical
prefix scanner). Extension scope:

1. **Detect** a misaligned pool: scan for `VENEER_PREFIX` at
   any 2-byte (or 1-byte) boundary instead of only 4-byte.
2. **Splice** at the actual found offset (whether 4-aligned or
   not).
3. **Re-encode** any post-splice section to compensate for the
   chunk's natural alignment.

Risk caveats:

- **False-positive pool matches**: relaxing the scan boundary
  increases the chance of false-positive `VENEER_PREFIX`
  matches in `.text`. Brief 134's `HISTORICAL_MAX_VENEER_COUNT
  = 86` cap mitigates somewhat; finer-grained discrimination
  (e.g., contiguity + target VA validation) may be needed.
- **Patcher complexity**: each new mwldarm geometry adds
  cluster-shape detection logic (brief 146 → 150 → 162 → 164
  → 168 chain). Adding a "misaligned pool" path is another
  branch.

Alternative paths considered + ruled out:

- **LCF script edit** to force odd-aligned section placement:
  dsd auto-generates the LCF; modifying generation would
  require dsd-level changes (out of scope for cloud).
- **Source-level reorganisation** (move odd-aligned symbol
  away from the `.rodata` boundary): mwldarm's overlay-blind
  veneer-emission decision doesn't depend on section position
  per brief 132; no recipe-side fix exists.

## Hand-off

- **Brief 174 candidate**: cloud — extend
  `patch_ov004_veneers.py` to handle 2-byte pool shifts at low
  n. Analogous to brief 164's walk-forward generalisation.
  After landing, source-claim a single odd-aligned candidate
  (e.g. `data_ov004_021ded69`) and verify n=2 → n=1 SHA1 PASS.
- **Brief 175 candidate**: decomper — if brief 174 lands the
  patcher extension, ship the path-2 final wave (both
  `data_ov004_021ded69` + `data_ov004_021e191c`) dropping
  n=2 → n=0. Structural floor closed.

## Files inspected

- `extract/eur/arm9_overlays/ov004.bin` (orig bytes)
- `config/eur/arm9/overlays/ov004/symbols.txt` (symbol map)
- `config/eur/arm9/overlays/ov004/delinks.txt` (section bounds
  + claim ranges)
- `tools/cluster_c_pattern3_gen.py` (Variant C generator —
  requires 4-aligned start AND end per W6 risk safeguard)
- `tools/patch_ov004_veneers.py` (current patcher; would
  need Variant E extension)

## See also

- [`ov004-rodata-pointer-targets.md`](ov004-rodata-pointer-targets.md)
  — brief 159's reverse-lookup table of which `.text` loads
  target which `.rodata` containing symbols (319 loads into
  `data_ov004_021ded69`).
- [`ov004-thunk-section-fix.md`](ov004-thunk-section-fix.md) —
  full W7 mitigation tier history (Phase 1 ALIGNALL → Phase 2
  falsification → Phase 3 post-link patcher).
- [`cluster-b-size-1-2-recipe.md`](cluster-b-size-1-2-recipe.md)
  — brief 152's bundle recipe for the analogous size-1
  alignment cascade (which DID work for `.data`; the ov004
  `.rodata` case has more constraints — multi-symbol overlap
  with `.text` function classification).
