# ov004 odd-aligned layout cascade (brief 179 falsification)

**Status:** Brief 179's "1–3 byte veneer pool shift at low n" model is
falsified by empirical reproduction. The actual situation is a
**multi-segment .rodata layout cascade** (+1/+2/+4 byte shift jumps
spread across ~25 KB of .rodata, then a +4 shift through .init/.ctor
absorbed by the .ctor zero-pad before .data). A pure pool-shift
patcher cannot close SHA1 here — a full layout reconstruction (likely
map-file driven) is required. See "Variant E reformulation" below.

## Context

Brief 173 ([PR #612](https://github.com/cntrl-alt-lenny/gx-spirit-caller/pull/612))
sampled 3 source-level Variants (A/B/C) + 1 bundle analog (D) on
`data_ov004_021ded69`, the smaller of the 2 odd-aligned candidates
that block path-2 sub-2 progression. All 4 variants failed for the
same root cause: mwldarm enforces per-TU minimum alignment on
`.rodata` regardless of source-side `aligned(1)` / `.align 0` /
section directives. Brief 173's variant matrix:

| Variant | Recipe | Shift | SHA1 | Notes |
|---|---|---:|:---:|---|
| A | `__attribute__((aligned(1)))` C | +1 | FAIL | mwldarm placed chunk at `0x021ded6a`. |
| B | `.s` + `.align 0` mwasmarm | +3 | FAIL | mwldarm placed chunk at `0x021ded6c`. |
| C | Pattern 3 multi-symbol chunk | n/a | FAIL | `func_ov004_*_unk` thumb classify collision. |
| D | Bundle recipe analog | n/a | dsd reject | trailing pad overlaps next data symbol. |

Brief 173 closed by proposing **Variant E**: extend
`tools/patch_ov004_veneers.py` to handle 2-byte (or 1–3 byte) veneer
pool shifts at low n. Brief 179 was scoped from that hand-off and
asked cloud to apply brief 164's walk-forward methodology with
`MAX_SHIFT_BYTES = 3` as a safety bound. This note reports the
empirical Part-1 finding and falsifies the brief 179 model.

## Reproduction setup

| Field | Value |
|---|---|
| Region under test | EUR |
| Branch | `cloud/patcher-variant-e-2byte-pool-shift` |
| Baseline | 3-region SHA1 PASS at n=2 (post-brief-171 main). |
| Variant tested | A — `__attribute__((aligned(1))) const unsigned char data_ov004_021ded69[8780]` |
| Source file added | `src/overlay004/data/data_ov004_021ded69.c` |
| delinks entry added | `.rodata start:0x021ded69 end:0x021e0fb5` |
| Build chain | `tools/configure.py eur` → `ninja sha1` |

Reverted before commit per brief 173/179 precedent — no source
claims ship from this brief.

## Empirical finding 1 — veneer count is 0, not "low n with shift"

Brief 179's model assumed a low-n state (n ≥ 1) with a pool that's
shifted by 1–3 bytes. The scanner would detect the misaligned pool,
splice it, and the rest of the patcher chain would handle the
cascade analogously to brief 164/168.

**Reality:** mwldarm's veneer suppression at the Variant A claim
removes BOTH remaining veneers — exactly as brief 173's `Veneer
count: 0` row reported. The built `arm9_ov004.bin` contains zero
`VENEER_PREFIX` (`78 47 c0 46 04 f0 1f e5`) matches. The existing
patcher's "already patched" short-circuit (line 781) returns the
input unchanged — there is nothing for the pool-shift scanner to
detect or splice.

```
veneer prefix matches in built: 0
veneer prefix matches in orig:  0
```

The pool-shift framing is therefore inapplicable: there's no pool.
A different geometric problem is what breaks SHA1.

## Empirical finding 2 — multi-segment layout cascade in .rodata

The built bin size matches orig (268,192 bytes — 0x417a0). But the
two are wildly divergent in content:

```
total diff bytes vs orig: 163,787
```

Per-section breakdown:

| Section | fo range | diff bytes |
|---|---|---:|
| `.text` | 0..0x148d8 | 15 (all at `kind:load` reloc positions) |
| `.rodata` | 0x148d8..0x3fcfc | 163,727 (layout cascade) |
| `.init + .ctor + pad` | 0x3fcfc..0x3fd40 | 43 (shifted +4 then absorbed) |
| `.data` | 0x3fd40..end | 2 (load-reloc target values) |

The `.text` and `.data` cases are routine `kind:load` un-shifts —
already handled by the existing `_apply_load_rewrites` once we let
the patcher run. The `.rodata` 163 K-byte diff is the real problem.

### Layout-shift segment table

Walking the linker map (`build/eur/arm9.o.xMAP`) for OV004 symbols
and computing `delta = built_va − orig_va` for each, the cumulative
shift jumps at exactly 3 points inside `.rodata`:

| segment | orig VA range | shift | cause |
|---|---|---:|---|
| pre-claim | `[0x021de638, 0x021ded69)` | +0 | identical to orig. |
| claim + immediate neighbours | `[0x021ded69, 0x021e2efc)` | **+1** | claim's TU section aligned by mwldarm to 2-byte boundary (`aligned(1)` rounded up). |
| middle block | `[0x021e2efc, 0x02200dbc)` | **+2** | additional 1 byte added at `data_ov004_021e2efc.o`'s TU boundary. |
| late `.rodata` | `[0x02200dbc, 0x02209a5c)` | **+4** | additional 2 bytes added at `data_ov004_02200dbc.o`'s TU boundary. |
| `.init` + `.ctor` | `[0x02209a5c, 0x02209a8c)` | +4 | `.init`/`.ctor` shift right by 4 because `.rodata` grew 4 bytes. |
| `.ctor` pad → `.data` | `[0x02209a8c, 0x02209aa0)` | varies | pad is 16 bytes in built vs 20 in orig — absorbs the +4 cumulative. |
| `.data` | `[0x02209aa0, …)` | +0 | anchored at the same VA, content identical. |

`.data`'s VA is fixed by `OV004_DATA_START = ALIGN(32)` in the LCF.
mwldarm absorbs the +4 cumulative shift by emitting 4 fewer zero
pad bytes between `.ctor` end and `.data` start (16 instead of 20).
Total bin size therefore matches orig.

### Why the model assumed only 1 shift point

Brief 173's text described the variant outcome as "+1 byte shift"
or "+3 byte shift" — the **claim's own** built-VA delta from orig.
That number characterises the FIRST jump in the cascade. Brief 179
generalised "1–3 byte shift" from those samples without sampling
the downstream cascade — which contains 2 ADDITIONAL jumps from
other odd-aligned TU sections (the unclaimed `dsd_gap` TUs).

The cascade segments are TU-boundary-dependent. Specifically:

- `data_ov004_021e2efc.o`'s `.rodata` has a 2-byte minimum alignment
  in the .o file (mwldarm rounds the section start up to the next
  2-aligned VA), forcing +1 byte additional pad on top of the
  pre-existing +1 from the claim.
- `data_ov004_02200dbc.o`'s `.rodata` has a 4-byte minimum
  alignment, forcing +2 bytes additional pad on top of the
  pre-existing +2.

The cumulative pad count is `1 + 1 + 2 = 4` bytes — exactly the
`.rodata` growth absorbed by the `.ctor` pad shrink.

## Empirical finding 3 — patcher can recover .text + .data trivially

The 15 `.text` diffs and 2 `.data` diffs are all `kind:load` reloc
target VAs that mwldarm wrote with the shifted symbol VAs (e.g.
`0x02200dc0` instead of `0x02200dbc`). Each is at a `from_va` in
relocs.txt. The existing `_apply_load_rewrites` would fix all 17
in a single sweep — but only runs when veneers are present (the
n>0 path). The first patcher extension required for Variant E is
to **run `_apply_load_rewrites` + `_reencode_arm_bls` unconditionally**,
not gated on `veneer_count > 0`.

Empirically (prototype script):

```
diffs after layout-only reconstruction: 21,847
diffs after + load rewrites:            20,825
diffs after + BL re-encoding:           20,819
```

The bulk (20 K+) of remaining diffs is in `.rodata` — that's the
layout cascade problem proper.

## Empirical finding 4 — `.rodata` layout reconstruction is tractable

Prototype script (Python, ~80 lines) reconstructs the orig `.rodata`
layout by:

1. Parsing `build/eur/arm9.o.xMAP` for each OV004 `.rodata` / `.init`
   / `.ctor` symbol's built VA + size + section.
2. For each `(orig_va, built_va, size)` tuple, copying
   `built[built_va − BASE : built_va − BASE + size]` to
   `output[orig_va − BASE : orig_va − BASE + size]`.
3. Pad bytes between symbols default to zero (output starts as
   all-zeros).

This reduces the .rodata diff from 163 K bytes to ~21 K. The
remaining 21 K are bytes inside unnamed `_dsd_gap@ov004_X.o`
`.rodata` sections — the map records the section start (zero-size
marker) but not the section's full bounds, so the reconstruction
misses those regions.

A full reconstruction would need to:

- Track per-TU `.rodata` section bounds (not just per-symbol).
- The map shows e.g. `021DE638 00000000 .rodata .rodata (_dsd_gap@ov004_36.o)`
  — extending that section to the next `.rodata` entry (regardless
  of TU) gives the full TU section span in built.
- Compute the orig span from the orig VAs of the symbols within
  that TU section.
- Copy the whole TU section.

Estimated implementation: 200–400 LOC patcher extension + map
parser + tests. Substantial but bounded.

## Variant E reformulation

Brief 179's "1–3 byte pool shift" model is inappropriate. The
actual fix needed is:

1. **Run un-shift unconditionally** — let `_apply_load_rewrites` +
   `_reencode_arm_bls` always run, not gated on `veneer_count > 0`.
   This trivially closes the `.text` + `.data` diffs.
2. **Layout reconstruction from map** — parse the linker map for
   each TU's `.rodata` / `.init` / `.ctor` built-VA span, compute
   the orig-VA span from delinks + symbols.txt, and relocate each
   span from built fo to orig fo. The .ctor zero pad is regenerated
   in the orig 20-byte shape.
3. **MAX_SHIFT_BYTES = 4** safety bound (not 3 — the empirical
   cascade reaches +4 by the .init boundary). A larger cumulative
   shift would indicate a structural regression.

The brief 164 walk-forward methodology IS still applicable —
applied to the `.ctor` pad-cluster shape after the layout
reconstruction, not to a hypothetical misaligned pool.

## Recommended hand-off

**Brief 180 candidate (cloud):** implement Variant E proper.

- Plumb `build/eur/arm9.o.xMAP` (or per-region equivalent) as a
  new patcher input (`--map` CLI arg, wired through the rom_config
  ninja rule).
- Write a map parser that yields `{orig_va: (built_va, size,
  section, tu)}` for OV004 symbols + per-TU section bounds.
- Extend `patch_ov004` to detect layout cascade (any non-zero
  shift in the map for an OV004 `.rodata`/.init/.ctor symbol) and
  apply the reconstruction.
- Run load rewrites + BL re-encoding unconditionally (already
  needed even without layout reconstruction — silences the n=0
  `.text` 15-byte diff).
- New regression tests: pin n=0 SHA1-PASS at `data_ov004_021ded69`
  Variant A; pin n=0 + shift=3 (Variant B); pin n=2 unchanged.

**Brief 181+ candidate (decomper, after brief 180 lands):** ship
path-2 final wave — claim `data_ov004_021ded69` (+ optionally
`data_ov004_021e191c`) via Variant A. Drops n=2 → n=0. Path-2
structural floor closed.

## What this brief 179 PR ships

- This research note (documenting the falsification).
- No patcher / source / delinks changes (all reverted).
- 3-region SHA1 PASS preserved on current main (n=2 baseline
  unaffected).
- W7 patcher chain unchanged: 134 → 142 → 146 → 150 → 162 → 164
  → 168. Brief 180 (if scoped) is the next link.

## Files inspected

- `tools/patch_ov004_veneers.py` (current patcher; brief 134/142
  /146/150/162/164/168 chain).
- `tests/test_patch_ov004_veneers.py` (existing patcher tests; no
  new tests added this brief).
- `config/eur/arm9/overlays/ov004/delinks.txt` (section + per-TU
  claim ranges; temporarily edited + reverted).
- `config/eur/arm9/overlays/ov004/symbols.txt` (odd-aligned
  candidate enumeration; unchanged).
- `build/eur/arm9.o.xMAP` (linker map; key new diagnostic source
  for Variant E proper).
- `extract/eur/arm9_overlays/ov004.bin` (orig, oracle for diff
  measurement only).

## See also

- [`ov004-odd-aligned-slot-recipe.md`](ov004-odd-aligned-slot-recipe.md)
  — brief 173's recipe falsification + Variant E proposal.
- [`ov004-thunk-section-fix.md`](ov004-thunk-section-fix.md) —
  full W7 mitigation tier history.
- [`ov004-rodata-pointer-targets.md`](ov004-rodata-pointer-targets.md)
  — brief 159 reverse-lookup (319 loads target
  `data_ov004_021ded69`).
