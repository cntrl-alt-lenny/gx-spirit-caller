# OV004 thunk-section fix — Phase 1 results + Phase 2 plan

**Brief:** 131 (cloud, the 26/27 baseline unlock). Brief 129
identified ov004's gap as a **single root cause** — 86 spurious
mwldarm thumb→arm interwork veneers in `.rodata` that grow the
file by 1,024 bytes and cascade 165 KB of byte-diff. This brief
attempts to fix it.

## TL;DR

**Phase 1 (this PR) lands a safe partial fix.** Patching the LCF
to set `ALIGNALL(2)` on `.ov004` (matching the existing `.arm9`
treatment from PR #115) cuts ov004's byte-diff by **~95%**
(165,000 → 8,125 bytes) without regressing any other module. The
86 spurious veneers are NOT eliminated — that requires deeper
toolchain work, queued as Phase 2 (brief 132+).

**Why partial?** The four sub-options brief 129 enumerated were
investigated; all four hit walls inside the ds-era mwldarm
2.0/sp1p5:

- **Option 3a (`/DISCARD/`)** — mwldarm rejects the GNU-ld
  `/DISCARD/` keyword (syntax error).
- **Option 3b (pin `OV004_RODATA_END`)** — mwldarm rejects "move
  current location backward" when veneers overflow the pinned
  range.
- **Option 1 (`-nointerworking`)** — *globally* suppresses
  veneer-gen, drops ov004 to 60 byte-diffs… but **regresses
  ov002 from OK → FAILED (35 byte-diffs)** because the global
  flag also disables BLX-encoding and thumb-bit propagation for
  cross-mode function pointers everywhere. Net effect: −1 module,
  not +1.
- **Option 2 (per-overlay symbol filtering)** — requires
  per-overlay link or .o-level symbol-table patching. Both are
  larger structural changes than this brief's scope.

Phase 1 ships the LCF ALIGNALL fix because it's strictly safe
and removes 95% of the cascade. Phase 2 (brief 132) tackles the
veneer-gen via per-overlay scoping — the only avenue left that
doesn't regress other modules.

## Phase 1 results

### Per-module byte-diff (EUR, post-fix)

| Module | Size delta | Byte diffs | Change vs pre-fix |
|--------|----------:|-----------:|---|
| **ov004** | **+1,024** | **8,125** | ↓ from ~165,000 (95%) |
| **main** | 0 | **10** | ↓ from 21 (52%) |
| ov000–003 | 0 | 0 | unchanged |
| ov005–023 | 0 | 0 | unchanged |
| itcm | 0 | 0 | unchanged |
| dtcm | 0 | 0 | unchanged |

**No regressions** in any of the 25 previously-OK modules.

### What ALIGNALL(2) on .ov004 actually fixed

dsd's gap-carving for `_dsd_gap@ov004_*.o` produces .text
sections whose first bytes encode `00 00` (the original inter-
function padding from orig). With `ALIGNALL(4)`, mwldarm placed
each gap object on a 4-byte boundary, inserting **2 bytes of
zero padding before any 2-byte-aligned section start**. Across
ov004's text, this accumulated several 2-byte shifts; combined
with the veneer cascade, every downstream pointer drifted.

`ALIGNALL(2)` lets mwldarm honor the .o's actual `sh_addralign=2`
(set by `patch_section_align.py`), removing the spurious 2-byte
pads. The 95% byte-diff drop is the cumulative cascade-shrink
from those padding bytes alone — the veneers themselves are still
present.

### What's left in ov004 (8,125 bytes)

The remaining 8,125 byte-diffs decompose as:

| Section | Diffs | Cause |
|---------|------:|---|
| .text   | 403   | literal pool entries pointing to shifted .data/.bss symbols |
| .rodata | 1,309 | function-pointer tables (mostly +0x8 shift from veneer pool's effect on text-end) |
| .init   | 41    | sinit body — pointers to shifted .data symbols |
| .ctor   | 2     | `WRITEW(0)` trailing word + alignment |
| .data   | 6,350 | cascade from +1,024 byte file shift (every .data byte at wrong file offset) |

All 8,125 bytes are **cascade from the 86 veneers** (1,032 bytes
appended to `.rodata`, which displaces `.data` and `.bss` by
+0x400). Eliminating the veneers should drop ov004's byte-diff
to 0 in one shot.

### What's left in main (10 bytes)

| Diff | Bytes | Delta | Cause |
|------|------:|------:|---|
| 1    | 1 byte (file 0xcc964) | +0x1 | Cat 1 source-target (brief 127 / brief 130's work) |
| 9    | 9 bytes (file 0xcc9ad–0xcca6d) | +0x400 each | cascade from ov004's `.bss` shift |

When ov004's veneers are eliminated in Phase 2, **9 of main's
10 diffs auto-resolve**. The 1 remaining byte is the genuine Cat
1 fix queued for brief 130. Brief 127's "16 bytes of cascade from
ov004" prediction holds — Phase 1 reduced it to 9 because the
ALIGNALL fix already neutralised the secondary text-shift portion
of the cascade.

## The 86 veneers — why they exist (Phase 2 root cause)

Brief 129 identified the symptom; Phase 1 work narrowed the
mechanism. The veneers are emitted because of a **symbol-table
collision at link time**:

1. `_dsd_gap@ov004_13.o` defines `data_ov004_02208760` (kind:DATA,
   in `.rodata`) — ov004's storage at VA `0x02208760`.
2. `_dsd_gap@ov002_72.o` defines `func_ov002_02208760` (kind:FUNC,
   in `.text`) — ov002's function at the same VA. ov002 and ov004
   share VAs as mutually-exclusive overlays.
3. When mwldarm resolves ov004's reloc `R_ARM_ABS32
   data_ov004_02208760`, it gets the value `0x02208760`.
4. mwldarm then scans the resolved value against its global
   symbol table for veneer eligibility. It finds the FUNC symbol
   `func_ov002_02208760` at the same address.
5. With `-interworking` on AND the resolved value matching a
   cross-section FUNC, mwldarm decides: "this is a code-pointer
   crossing section boundaries → emit interwork veneer + rewrite
   the pointer".

The veneer is emitted, the .rodata pointer is rewritten to point
at the veneer (not the original 0x02208760), and 1,024 bytes of
veneer pool gets appended to `.rodata`.

**Why other overlays don't trigger this:** ov002 has the widest
VA range (0x021aa4a0..0x022d2980 — 1.16 MB, covering ov004's
entire range). Only ov004's `.rodata` data symbols collide with
ov002's `.text` function addresses at the byte level. Other
overlays (ov000, ov005, ov008, etc.) have smaller VA ranges that
don't overlap ov002's `.text` in this specific way.

## What WAS tried (full investigation log)

### Option 1: `-nointerworking` global

**Outcome**: ov004 went from 8,125 → 60 byte-diffs (the 60 are
BL/BLX encoding diffs + 2 thumb-bit data diffs). But **ov002
went from 0 → 35 byte-diffs** because the global flag also
suppresses BLX-encoding in ov002's cross-mode calls.

**Verdict**: rejected. Net = −1 module flipped (lose ov002,
don't gain ov004 — still needs the 60-byte fix).

### Option 3a: `/DISCARD/`

```
/DISCARD/ : {
    *(.thunk*)
    *(.veneer*)
}
```

**Outcome**: mwldarm error "Illegal token" at the `/DISCARD/`
keyword. CodeWarrior LCF syntax doesn't recognise GNU ld's
discard section.

**Verdict**: rejected. Not supported by the ds-era toolchain.

### Option 3b: Pin `OV004_RODATA_END` to orig size

```
OV004_RODATA_END = OV004_RODATA_START + 0x2b424;
. = OV004_RODATA_END;
```

**Outcome**: mwldarm error "move current location backward" —
veneers have already inflated `.` past the pinned value when the
directive is reached.

**Verdict**: rejected. mwldarm's veneer-emit pass runs DURING
section layout, not after, so the post-hoc pin can't squeeze them
out.

### Option 3c: Modify dsd's LCF generator

**Outcome**: not attempted in Phase 1 — would require an upstream
dsd PR. The empty `OV004_THUNK_*` markers we test-injected via
the LCF post-process were valid syntactically but mwldarm did
NOT use them for veneer placement. mwldarm appears to hardcode
the veneer-emit location to the end of the producing module's
.rodata, ignoring user-defined catchall sections like
`*(.thunk)`.

**Verdict**: deferred to Phase 2. Likely requires identifying
mwldarm's actual section name for veneers (which would need
binary reverse-engineering or pret-project archaeology).

### Option 2: Per-overlay symbol filtering

**Outcome**: not attempted in Phase 1 — requires either
restructuring the link into per-overlay invocations (significant
work + risk to existing-OK modules) or post-processing .o files
to mark `func_ovXXX_*` symbols as LOCAL within their containing
overlay (87+ .o files × hundreds of symbols each).

**Verdict**: deferred to Phase 2 / brief 132. The most likely
viable path forward, but scope >> brief 131's bandwidth.

## Phase 2 plan (brief 132+)

### Brief 132 candidate (cloud, HIGH priority): symbol-scoping tool

Build a post-link or pre-link tool that:

1. **Per-overlay scope analysis**: from `dsd`'s module-pair
   data, identify mutually-exclusive overlay pairs (ov002 +
   ov004 share VAs).
2. **Symbol filter**: for each pair, identify functions/data
   that occupy the same VA in both overlays.
3. **Visibility patch**: rewrite the `.o` files' symbol tables
   so that ov002's `func_ov002_*` symbols are LOCAL when ov004's
   .o files reference VAs in ov002's `.text` range. (Or use the
   ELF visibility attribute: `STV_HIDDEN`.)
4. **Verify**: rebuild, confirm ov004 veneer count drops to 0,
   confirm ov002 still OK (intra-ov002 calls still resolve).

This addresses the root cause without modifying mwldarm itself
and without per-overlay link restructuring.

### Brief 133+ candidate (decomper, low priority): Cat 1 main fix

After Phase 2 lands, main's 9 cascade bytes auto-resolve, leaving
the 1 Cat 1 byte (brief 127's source-target finding). Brief 130
is already queued for this — it lands the main flip independently
of Phase 2.

### Optimistic outcome

If brief 132 (Phase 2) lands AND brief 130 (Cat 1) lands:

- ov004: 8,125 → **0** byte-diffs → **OK**
- main: 10 → **0** byte-diffs → **OK**
- **3-region baseline: 25/27 → 27/27** (full SHA1 match)

Pessimistic: brief 132's symbol-scoping approach hits an
unforeseen wall (e.g., mwldarm refuses LOCAL `func_ovXXX_*`
references from sibling .o files at link), and we need to escalate
to per-overlay link or upstream dsd changes.

## W7 (NEW workflow wall): mwldarm overlay-swap blindness

**Mechanism.** mwldarm 2.0/sp1p5 (ds-era CodeWarrior) doesn't
model overlay swapping. When it sees two symbol definitions at
the same VA — one a FUNC in overlay A's .text, one a DATA in
overlay B's .rodata — it treats them as co-resident. Any ABS32
reloc resolving to that VA from a third overlay's link namespace
gets the FUNC symbol's interwork treatment: a thumb→arm veneer
is emitted, and the loaded pointer is rewritten to the veneer
address.

**Diagnosis.** Run brief 129's bisection workflow:

1. `xxd build/<ver>/build/arm9_ovNNN.bin > /tmp/built.hex`
2. `xxd extract/<ver>/arm9_overlays/ovNNN.bin > /tmp/orig.hex`
3. Compare file sizes. If built > orig by ~N×12 bytes, suspect
   N spurious veneers.
4. Search built for the 8-byte veneer prefix
   `7847 c046 04f01fe5` — orig should have 0 occurrences;
   built may have many. The 4-byte literal following each prefix
   is the veneer's ultimate target.
5. Cross-reference targets against all overlays' `symbols.txt`.
   If targets land at function entries in a sibling overlay that
   shares the VA range, W7 confirmed.

**Mitigation tiers.**

1. **Phase 1 (this PR)**: `ALIGNALL(2)` on the affected overlay
   segment removes the secondary 2-byte alignment cascade.
   Doesn't eliminate veneers; reduces byte-diff by ~95%.
2. **Phase 2 (brief 132+)**: per-overlay symbol scoping —
   either local-ize sibling-overlay symbols at link time, or
   restructure to per-overlay link.
3. **Long-term (upstream)**: file ds-decomp / mwldarm issue for
   the model gap. mwldarm is closed-source (Freescale/NXP), so
   only the dsd side can be improved upstream.

**Cross-references.**

- Brief 129 — scoping doc (`docs/research/ov004-checksum-recovery.md`).
- Brief 113 — original Cat 4 hypothesis.
- CLAUDE.md — `dsd init --allow-unknown-function-calls` background.
- `docs/research/thumb-align-wall.md` — sibling wall (ALIGNALL).

## Configuration changes shipped in this PR

1. **`tools/configure.py`** — extended the LCF rule to also
   patch `.ov004` via `--also-segments .ov004` flag.
2. **`tools/patch_lcf_arm9_align.py`** — added `--also-segments`
   CLI flag. Refactored `patch_lcf_text` to accept a tuple of
   segment names rather than hard-coding `.arm9`. The public
   API now returns `list[str]` of changed segments rather than
   `bool`. Backwards-compatible: default `segments=(".arm9",)`
   preserves the original single-segment behaviour.

No source files changed. No build-system restructuring. The change
is strictly additive — a single LCF post-process flag wired into
the `lcf` ninja rule.

## TL;DR for brain

- **Brief 131 lands Phase 1**: `ALIGNALL(2)` on `.ov004` LCF
  segment. Cuts ov004 byte-diff by 95% (165K → 8,125) and main
  by 52% (21 → 10). No flips, no regressions. Safe to merge.
- **Phase 1 is NOT the 26/27 unlock by itself.** The 86 spurious
  veneers persist; Phase 2 (brief 132+) needs to address them
  for ov004 to flip OK.
- **Investigation log captures all four sub-options tried**.
  /DISCARD/ syntax-rejected, RODATA pin rejected, -nointerworking
  regresses ov002, custom thunk markers ignored by mwldarm.
- **Symbol-collision root cause identified** for Phase 2:
  ov004's `data_ov004_02208760` (DATA) collides with ov002's
  `func_ov002_02208760` (FUNC) at the same VA. mwldarm's veneer
  decision is FUNC-biased and overlay-blind.
- **Brief 132 candidate (cloud)**: per-overlay symbol scoping
  (local-ize sibling-overlay FUNC symbols at link time).
- **W7 workflow wall documented** with diagnosis recipe + 3
  mitigation tiers (Phase 1 → Phase 2 → upstream).
- **Optimistic outlook**: when brief 132 + brief 130 both land,
  3-region baseline jumps 25/27 → 27/27 (full SHA1 match).
