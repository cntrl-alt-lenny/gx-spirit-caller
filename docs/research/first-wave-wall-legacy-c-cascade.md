# First-wave wall — `.legacy.c` cascade (C-33)

**Brief:** 194 (scaffolder). Brief 193 (PR #640) found that
adding any new `.legacy.c` to `src/main/` for a function past a
size threshold trips the brief 180 patcher's MAX_SHIFT_BYTES
cap, blocking ALL future StyleA / C-15 routing for functions
> ~0x50 bytes in main. The decomper observed shifts of +32 to
+64 bytes on `_dsd_gap@ov004_41.o (.text)` and hypothesised
"mwcc 1.2/sp2p3 emits more `.text` bytes for the same C than
2.0/sp1p5 does; some threshold relocates an interwork veneer
ov004 expects at a stable VA."

This note diagnoses the cascade empirically, documents the
patcher fix, and provides the recognition recipe brief 195+
needs to plan around it.

## The empirical finding

Reproducing on pick #2 (`func_0200b2f4`, 0x68 bytes, C-15 wall
per brief 193 attribution) via a naive `.legacy.c` claim:

```text
error: build/eur/build/arm9_ov004.bin: TU _dsd_gap@ov004_41.o
       (.text) has shift +64 bytes (|shift| > MAX_SHIFT_BYTES
       = 4); structural regression suspected — bail rather than
       relocate a TU section whose layout cause we have not
       characterised.
```

Same error as PR #640's report. The patcher bails on the FIRST
TU it encounters that exceeds the cap.

## Instrumentation

`tools/patch_ov004_veneers.py` gains a `--dump-shifts` flag that
prints each TU's section / shift / built+orig VA, sorted by
|shift| descending:

```bash
python tools/patch_ov004_veneers.py \
    --binary build/eur/build/arm9_ov004.bin \
    --relocs config/eur/arm9/overlays/ov004/relocs.txt \
    --delinks config/eur/arm9/overlays/ov004/delinks.txt \
    --map build/eur/arm9.o.xMAP \
    --dump-shifts
```

For the `func_0200b2f4.legacy.c` reproduction, the dump shows
**120 TU sections, ALL shifted by +64 to +68 bytes**:

| Section | TUs in section | Modal shift | Range |
|---|---:|---:|---|
| `.text` | 35 | +64 | uniform |
| `.rodata` | 28 | +68 | 22 at +68; 5 at +64..+67 (brief 180 cascade region) |
| `.init` | 1 | +68 | — |
| `.ctor` | 1 | +68 | — |
| `.data` | 56 | +64 | uniform |

Aggregate (sorted by frequency):

```text
  56 .data +64
  35 .text +64
  22 .rodata +68
   5 .rodata +64..+67   # brief 180 cascade vestige
   1 .init +68
   1 .ctor +68
```

**The cascade is highly STRUCTURED**: per-section modal shift +
small intra-section spread (only `.rodata` has any spread, and
the spread is ≤ 4 — exactly the brief 180 cascade pattern).

## Why the +64 shift is virtual

The linker map reports `OV004_TEXT_START = 0x021c9da0`, which is
+64 bytes from orig's `0x021c9d60`. Naively this suggests
mwldarm padded the start of ov004 with 64 bytes.

**Byte comparison of built vs orig `arm9_ov004.bin`** disproves
that:

- Both binaries are 268,192 (`0x417a0`) bytes total.
- `built[0x00..0x40]` ≈ `orig[0x00..0x40]` (one BL imm24 byte
  differs at offset 0x24 — the reloc fixup).
- `func_ov004_021c9d60`'s push instruction (`e92d4008`) is at
  FO 0 in BOTH binaries.

So mwldarm's "+64 shift" in the map is a VIRTUAL accounting
artifact: the LCF's `. = ALIGN(32); OV004_TEXT_START = .;` makes
mwldarm record VAs at a 32-aligned position past the previous
overlay's end, but the actual `.bin` file content is packed
starting at FO 0 regardless.

The actual PHYSICAL byte shifts in `arm9_ov004.bin` are still
small:

- `.text`: 0 (TU bytes at orig FOs)
- `.rodata`: 0..+4 (brief 180 cascade vestige — already handled
  by the patcher)
- `.data`: 0

## Why the cap mis-fires

Brief 180's `MAX_SHIFT_BYTES = 4` was set to bail on shifts
exceeding the documented brief 179 cascade range of +0/+1/+2/
+4 bytes. The cap was measured against ZERO (the orig section
start).

When ARM9 grows due to a `.legacy.c` addition, ov004's
LCF-recorded VAs jump up by ~64 B. The map's reported shifts
include this LCF virtual padding ON TOP of the actual physical
byte cascade. So a TU with physical_shift=0 reports as +64; a
TU at the brief 180 cascade boundary reports as +68; etc.

The brief 180 cap was over-conservative for this case — a
uniform +64 shift in the map is structurally safe (bytes are
still at orig FOs in the .bin), not a layout regression.

## The fix — per-section modal-deviation cap

Brief 194 refines `MAX_SHIFT_BYTES` to measure deviation from
the PER-SECTION MODAL shift, not from zero:

```python
def _section_modal_shifts(tu_sections):
    """Per-section (modal_shift, consensus_fraction).
    Modal = most common shift value; ties break toward |0|."""
    ...

def _layout_reconstruct(data, tu_sections, orig_sections):
    modal = _section_modal_shifts(tu_sections)
    text_modal = modal.get(".text", (0, 1.0))[0]
    for tu in tu_sections:
        section_modal, consensus = modal.get(tu.section, (0, 1.0))
        deviation = tu.shift - section_modal
        if (
            abs(deviation) > MAX_SHIFT_BYTES
            or consensus < MODAL_CONSENSUS_FRACTION
        ):
            raise PatchError(...)
        # Brief 194 physical-FO formula
        physical_byte_shift = tu.shift - text_modal
        orig_fo = tu.orig_start_va - base_va
        built_fo = orig_fo + physical_byte_shift
        output[orig_fo:orig_fo + size] = data[built_fo:built_fo + size]
```

The cap now catches the actual target (TU moving INDEPENDENTLY
from its section's bulk — a genuine structural regression):

- Uniform +64 shift across all `.text` TUs: modal = +64,
  deviation = 0 for every TU → no raise. ✓
- Brief 180 cascade (TUs at +0/+1/+2/+4): modal = +0,
  max deviation = +4 ≤ MAX_SHIFT_BYTES → no raise. ✓
- Outlier TU at shift +75 in a section where modal is +64:
  deviation = +11 > MAX_SHIFT_BYTES → raise. ✓ (the intended
  catch behaviour preserved)

A `MODAL_CONSENSUS_FRACTION = 0.5` threshold also catches the
edge case of no clear majority (synthetic / pathological inputs).

The physical FO formula `built_fo = orig_fo + (tu.shift -
text_modal)` accounts for the LCF virtual padding correctly:

- TU at the .text modal: physical_byte_shift = 0 → built_fo =
  orig_fo (no copy needed; the bytes are already at orig FOs).
- TU at .rodata modal +4 from .text modal: physical_byte_shift
  = +4 → built_fo = orig_fo + 4 (the brief 180 cascade vestige).

## Verification

3-region `ninja sha1` PASS preserved at baseline (no claim):

```text
gx-spirit-caller_eur.nds: OK  (1da50df7c…b4f75)
gx-spirit-caller_usa.nds: OK  (9e53dcc7…c2a83)
gx-spirit-caller_jpn.nds: OK  (761fbfc6…424f6)
```

With the deliberate cascade trigger (naive `.legacy.c` claim of
pick #2), the patcher runs through cleanly:

```text
patched build/eur/build/arm9_ov004.bin:
   layout-reconstructed 120 TU sections,
   rewrote 2441 load literals,
   re-encoded 1438 ARM BLs
```

The build PIPELINE completes; ov004's bin is byte-identical to
orig (only main itself differs because the `.legacy.c`'s
function body doesn't match — that's the separable byte-match
problem, not the cascade).

## What the fix does and doesn't do

**Does:** unblock the BUILD pipeline for `.legacy.c` claims in
`src/main/` for functions > 0x50 bytes. The patcher no longer
bails on the LCF-virtual cascade. Future StyleA / C-15 routing
in main is now structurally viable.

**Doesn't:** byte-match the function itself. The `.legacy.c`
recipe routes the function through mwcc 1.2/sp2p3 to address
the underlying StyleA / C-15 wall; whether that emits bytes
matching the orig is a separate concern. Brief 193 noted
several picks where even the right routing tier emits
diverging bytes (Cluster E — mwcc reg-alloc / scheduling
drift). The patcher fix is necessary but not sufficient for a
byte-match.

## The 3 affected picks (brief 193 PR #640 Cluster F)

| Pick | Module | Addr | Size | Underlying wall | Notes |
|---|---|---|---:|---|---|
| #2 | `main` | `0x0200b2f4` | `0x68` | C-15 (`mvn r4, #0`) | orig epilogue is Style B (`pop {..., pc}`) — mwcc 2.0 may actually match if the early-return predication can be coaxed |
| #5 | `main` | `0x02096434` | `0x6c` | StyleA + MMIO fold | Cluster F + hardware-register fold (C-23 territory) — needs `.legacy.c` AND C-23 recipe |
| #7 | `main` | `0x02023f7c` | `0x70` | (none / Cluster E) | mwcc reg-alloc drift, not really `.legacy.c`-related — permuter case |

Pre-brief-194: all three trip `MAX_SHIFT_BYTES` and the build
fails. Brief 194: all three BUILD through; byte-matching is a
per-pick permuter / source-shape problem.

Note: **Pick #2 may actually compile cleanly as `.c` (mwcc
2.0/sp1p5)**. The orig disasm shows a Style B epilogue and a
prologue that matches mwcc 2.0's `push {r3, r4, …, lr}` register
list — the C-15 wall recipe routes through `.legacy.c` but that
produces a LARGER function (sp prologue + Style A epilogue
extras). Brief 195+ may find that re-routing pick #2 to `.c`
plus light permutation is cheaper than the `.legacy.c` route.

## Recognition cue for the classifier

[`tools/predict_walls.py`](../../tools/predict_walls.py)'s new
`detect_legacy_c_cascade_risk()` flags a function when:

1. `module == "main"` (the cascade is specific to ARM9 growth;
   `src/overlay*/` `.legacy.c` doesn't reproduce it).
2. `size > 0x50` (empirical threshold from PR #640: brief 190's
   0x28..0x34 SNDi wrappers didn't trigger; brief 193's 0x68+
   candidates did).
3. At least one of `StyleA` / `C-15` is already detected (the
   cascade is gated on `.legacy.c` routing tier, not the wall
   shape alone).

The detector emits a `C-33` `WallPrediction` alongside the
underlying wall, with a routing-hint cue pointing the decomper
at this brief.

## Test coverage

**`tests/test_patch_ov004_veneers.py`** gains:

- `TestSectionModalShifts` — per-section modal computation
  (unanimous, majority-with-outliers, tie-break, per-section
  independence).
- `TestLegacyCCascadeFix` — uniform-shift acceptance, mixed
  per-section modal (`.text` baseline + `.rodata` modal-delta),
  outlier-in-section raises, low-consensus raises, threshold
  exposure as module constant.
- `TestDumpTuShifts` — `--dump-shifts` diagnostic format, sort
  order (|shift| descending), over-cap marker (`*`), empty
  input.

**`tests/test_predict_walls.py`** gains
`TestLegacyCCascadeDetection`:

- main + StyleA + size > 0x50 flags.
- main + C-15 + size > 0x50 flags.
- main + StyleA + size < 0x50 does NOT flag (brief 190 SNDi).
- main + StyleA + size == 0x50 does NOT flag (strict >).
- overlay + StyleA + size > 0x50 does NOT flag (module-scoped).
- main + no StyleA/C-15 does NOT flag (routing-tier gate).
- main + only C-22 (non-legacy-routing wall) does NOT flag.
- main + C-15 + C-22 (mixed) flags (C-15 enough).
- Threshold exposed as module constant.

## Cross-references

- [`docs/research/codegen-walls.md` § C-33](codegen-walls.md#c-33)
  — canonical taxonomy entry.
- [`docs/research/ov004-odd-aligned-layout-cascade.md`](ov004-odd-aligned-layout-cascade.md)
  — brief 179 cascade-mechanism research (sibling: smaller,
  pre-LCF-padding cascade).
- [Brief 193 PR #640](https://github.com/cntrl-alt-lenny/gx-spirit-caller/pull/640)
  — original empirical discovery (Cluster F: 3 picks
  blocked).
- Brief 180 patcher (`tools/patch_ov004_veneers.py`'s
  `_layout_reconstruct`) — the relevant prior for layout-
  reconstruction algorithm and `MAX_SHIFT_BYTES` cap.
- Brief 186 patcher gap closure — sibling parser fix for
  trailing-range + `.ctor` shift inheritance; brief 194's
  cap-revision sits on top of brief 186's parser corrections.
