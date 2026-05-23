# First-wave wall — cross-overlay hardcoded BL (C-32)

**Brief:** 192 (scaffolder). Brief 190 (PR #637) skipped 15 of
25 easy-bucket picks; the decomper's hand-off documented four
new wall clusters, the **largest being "Cluster A"** — six
picks (PR #637 entries #1, #2, #4, #15, #19, #20) all sharing
the same diagnosis: ov011/ov012/ov013/main functions with a
`bl <hardcoded offset>` to a cross-overlay address (e.g.
`0x021b0b84`, `0x021b5500`). dsd emits the bytes verbatim with
`kind:arm_call to:<addr> module:none` and NO `R_ARM_PC24`
relocation — so a naive `.c` source-claim with `extern void
func_<addr>(void); bl func_<addr>();` fails to link.

This note documents the wall, proposes
[`docs/research/codegen-walls.md`'s][cw] new **C-32** entry,
ships a working recipe, and gives
[`tools/predict_walls.py`](../../tools/predict_walls.py) a
detector so brief 193+ flags affected picks before the
decomper burns iterations.

[cw]: codegen-walls.md

## What the wall is

This game's overlay layout reuses physical memory aggressively —
nine overlay groups share three base VAs:

| Shared base | Overlays | Max end |
|---|---|---:|
| `0x021aa4a0` | ov000, ov002, ov005, ov008, ov009, ov018, ov020, ov021, ov022 | `0x022cd300` |
| `0x021b2280` | ov006, ov007, ov010, ov014, ov015, ov016, ov017, ov019, ov023 | `0x021cf140` |
| `0x021c9d60` | ov001, ov003, ov004, ov011, ov012, ov013 | `0x0220b500` |

(Confirmed via `extract/eur/arm9_overlays/overlays.yaml`.)

When a function in one overlay group BLs into the range of the
other group, dsd's reloc-walk can't determine which specific
overlay owns the target address — multiple candidates fit. dsd
records the call as

```text
from:0x021d2c80 kind:arm_call to:0x021b5500 module:none
```

`module:none` means "I saw the call instruction, but I cannot
attribute the target to a specific module." dsd then emits the
BL bytes verbatim into the surrounding `_dsd_gap@*.o` and
omits the R_ARM_PC24 relocation. The bytes round-trip fine
when nothing claims the source function, but the moment a
source-claim `.o` provides the function, the linker needs to
emit a BL — and it has no symbol to resolve it against.

## Why naive source-claim fails

The natural `.c` for pick #15 (`func_ov011_021d2c64`, 40-byte
ARM function with one cross-overlay BL):

```c
extern int Task_PostLocked(int a, int b, int c);
extern void func_021b5500(void);   /* cross-overlay BL target */

void func_ov011_021d2c64(int *out) {
    int t = Task_PostLocked(0x44, 4, 0);
    func_021b5500();
    *out = t;
}
```

Build result (brief 192 Part 1 reproduction):

```text
[WARN ] No module for relocation from 0x021d2c80 in overlay 11 to 0x021b5500
mwldarm.exe: Undefined : "func_021b5500"
mwldarm.exe: Referenced from "func_ov011_021d2c64" in ov011_021d2c64.o
mwldarm.exe: alert: Link failed.

Errors caused tool to abort.
```

**The wall manifests as a hard link failure**, not a byte
cascade. This is structurally different from brief 191's C-31
interwork-veneer wall (which produced KB-scale byte
divergence + a +5 B `.rodata` shift exceeding the brief 180
patcher cap). For C-32, the patcher never runs because the
link doesn't complete:

- **Bytes differ vs orig:** N/A (no built ROM to diff)
- **Divergence run count:** N/A
- **First divergence offset:** N/A
- **Patcher behaviour:** never invoked — link step aborts

The naive `.c` recipe is **structurally unshippable**. Either
the link gets a symbol (option 1) or the source-side encodes
the BL bytes verbatim (option 2).

## Recipe — option (2) per the brief: `.s` with hand-encoded BL

The brief enumerated two options:

1. Persuade `dsd init --allow-unknown-function-calls` to
   inject a placeholder symbol at the BL target.
2. Ship the function as `.s` with the cross-overlay BL
   hand-encoded as a raw `.word`.

**Option (1) is out of scope.** This project already runs dsd
with `--allow-unknown-function-calls` (per
[`CLAUDE.md`](../../CLAUDE.md) § "Bootstrapping
`config/<ver>/`"), and dsd DOES create `func_ov000_021xxxxx_unk
kind:function(arm,size=0x0,unknown)` placeholders for some
unresolved BLs — e.g.

```text
func_ov000_021b0b38_unk kind:function(arm,size=0x0,unknown) addr:0x021b0b38
func_ov000_021b0e74_unk kind:function(arm,size=0x0,unknown) addr:0x021b0e74
func_ov000_021b11d0_unk kind:function(arm,size=0x0,unknown) addr:0x021b11d0
func_ov000_021b3314_unk kind:function(arm,size=0x0,unknown) addr:0x021b3314
... (9 total in ov000/symbols.txt)
```

But the placeholder mechanism only fires for BLs that dsd's
analysis attributes to a SINGLE module's call-graph. The
cluster-A picks specifically target the MULTI-overlay
shared-base range where dsd can't pick the owner — so the
reloc stays `module:none` and no placeholder is emitted.
Fixing this would require upstream dsd changes (a `--prefer-
overlay-for-shared-base=<id>` flag, or similar) — beyond brief
192's scope.

**Option (2) works today** and has direct precedent in this
repo: [`src/main/func_020b3814.s`](../../src/main/func_020b3814.s)
(brief's medium-tier 64-bit-divide tail) hand-encodes two
inter-function branches as raw `.word`s for the same reason —
mwldarm has no symbol to resolve the targets to. Quoting that
file's header comment:

> Because the host function itself lives at a fixed address
> (0x020b3814) and mwldarm's ARM9 LCF pins it there, the
> precomputed offsets stay correct after link.

The same logic applies to cross-overlay BLs: the host function
is pinned to its orig VA (by dsd + the brief 180 patcher), so
the precomputed BL displacement to the cross-overlay target
(also at a pinned VA in another module's loaded image) stays
correct.

### Worked example — pick #15 (`func_ov011_021d2c64`)

Original orig disassembly (40 bytes ARM, `ov011 + 0x8f04`):

```text
0x021d2c64: 38 40 2d e9   stmdb sp!, {r3, r4, r5, lr}
0x021d2c68: 00 50 a0 e1   mov   r5, r0
0x021d2c6c: 44 00 a0 e3   mov   r0, #0x44
0x021d2c70: 04 10 a0 e3   mov   r1, #0x4
0x021d2c74: 00 20 a0 e3   mov   r2, #0x0
0x021d2c78: df ce f8 eb   bl    Task_PostLocked   ; resolvable, mod:main
0x021d2c7c: 00 40 a0 e1   mov   r4, r0
0x021d2c80: 1e 8a ff eb   bl    0x021b5500        ; HARDCODED, mod:none
0x021d2c84: 00 40 85 e5   str   r4, [r5]
0x021d2c88: 38 80 bd e8   ldmia sp!, {r3, r4, r5, pc}
```

The two BLs differ structurally:

| BL | Target | reloc kind | Recipe |
|---|---|---|---|
| `0x021d2c78` | `0x020067fc` (`Task_PostLocked`, in main) | `arm_call module:main` | `bl Task_PostLocked` (mwldarm resolves) |
| `0x021d2c80` | `0x021b5500` (cross-overlay, no symbol) | `arm_call module:none` | `.word 0xebff8a1e` (hand-encoded) |

Encoding the hardcoded BL:

```text
bl 0x021b5500 from PC=0x021d2c80:
  offset    = (0x021b5500 - (0x021d2c80 + 8)) / 4 = -0x75e2
  imm24     = -0x75e2 & 0xffffff                  = 0xff8a1e
  encoding  = 0xeb000000 | 0xff8a1e               = 0xebff8a1e

baserom bytes at 0x021d2c80: 1e 8a ff eb (LE) = 0xebff8a1e ✓
```

Shipped at
[`src/overlay011/func_ov011_021d2c64.s`](../../src/overlay011/func_ov011_021d2c64.s):

```text
        .text
        .extern Task_PostLocked
        .global func_ov011_021d2c64
        .arm
func_ov011_021d2c64:
        stmdb   sp!, {r3, r4, r5, lr}
        mov     r5, r0
        mov     r0, #0x44
        mov     r1, #0x4
        mov     r2, #0x0
        bl      Task_PostLocked
        mov     r4, r0
        .word   0xebff8a1e                      ; bl 0x021b5500 (cross-overlay, mod:none)
        str     r4, [r5]
        ldmia   sp!, {r3, r4, r5, pc}
```

Verified: **EUR + USA + JPN `ninja sha1` PASS** preserved.

### Why not just emit ALL bytes as `.word`s

In principle, the entire function body could be a sequence of
`.word 0x...` directives — same outcome, byte-identical. But:

- The mnemonic form is **diff-readable** when the next-wave
  decomper comes to refine it.
- The resolvable `bl Task_PostLocked` lets mwldarm re-compute
  the displacement at link time, so if the host function ever
  shifts (e.g. surrounding TU edits), only the hardcoded
  cross-overlay BL needs review — the resolvable one
  self-heals.
- The hand-encoded `.word` is **scoped to the actual wall** —
  it isolates the cross-overlay-specific quirk rather than
  obscuring the whole function. (Same reasoning as
  `src/main/func_020b3814.s`'s mixed mnemonic + `.word`
  shape.)

## The six affected picks (brief 190 PR #637 Cluster A)

| Pick | Module | Addr | Size | Resolvable BLs | Hardcoded BLs | Recipe |
|---|---|---|---:|---:|---:|---|
| #1 | `ov013` | `0x021c9d60` | `0x14` | 1 (ov13-local) | 2 (→ 0x021b0b44, 0x021b2420) | brief 192 recipe |
| #2 | `ov012` | `0x021c9d8c` | `0x14` | 1 (ov12-local) | 2 (→ 0x021b0b44, 0x021b2420) | brief 192 recipe |
| #4 | `ov011` | `0x021ca0ac` | `0x18` | 2 (ov11-local) | 2 (→ 0x021b0b44, 0x021b2420) | brief 192 recipe |
| #15 | `ov011` | `0x021d2c64` | `0x28` | 1 (main) | 1 (→ 0x021b5500) | **shipped** as `.s` (this brief) |
| #19 | `main` | `0x020323f4` | `0x58` | 4 (all main) | 0 — **NOT C-32** (mis-tagged) | reclassify; not cluster-A |
| #20 | `ov011` | `0x021ca03c` | `0x58` | 2 (main) | 2 (→ 0x021b142c, 0x021b284c) | brief 192 recipe |

Picks #1, #2, #4, #20 all share the `(0x021b0b44, 0x021b2420)`
or `(0x021b142c, 0x021b284c)` cross-overlay target pairs —
likely common boot-time helper routines living in the
multi-overlay-shared range. Brief 193+ can drain them by
copying the brief 192 recipe with the appropriate BL
encodings.

Pick #15 was chosen as the worked example because it has the
**single** cleanest hardcoded BL (no other walls in the
function body), making the byte-level encoding verification
unambiguous.

**Pick #19 reclassification:** examination of its relocs
shows all four BLs as `kind:arm_call to:<addr> module:main`
(i.e. all resolvable). It does NOT have the cross-overlay
`module:none` shape. PR #637's "Cluster A" enumeration
mis-tagged this entry; brief 192 corrects the bookkeeping —
pick #19 is a regular main-internal function the decomper
should handle via the normal `.c` matching workflow.

## Recognition cue for the classifier

[`tools/predict_walls.py`](../../tools/predict_walls.py)'s
new `CrossOverlayBL` detector flags a function when:

1. Its `relocs.txt` contains one or more entries of the form
   `from:0x<func_addr_in_range> kind:arm_call to:0x<addr>
   module:none` where the `from:` falls inside the function's
   `[addr, addr+size)` range.

2. The detection consults the per-module relocs file directly
   (NOT disasm), because the `bl <hex_offset>` instruction
   shape alone is ambiguous — the same shape appears for
   resolvable cross-module BLs that DO have `R_ARM_PC24`
   relocs. The `module:none` marker is what disambiguates.

The classifier emits `CrossOverlayBL` with a routing hint that
points the decomper at this brief.

### Why not detect from disasm alone

A `bl <hex>` instruction's encoded displacement gives the
target VA, which we could in theory cross-reference against
the union of overlay VA ranges. But:

- Multiple overlays own the same VA range (shared bases),
  so "is this VA cross-overlay?" is a 9-way overlap test —
  not a one-line regex.
- Many cross-module BLs ARE resolvable (target in main, or in
  a different shared-base group). The reloc kind is the only
  reliable disambiguator.
- The `predict_walls.py` pipeline already loads relocs.txt
  indirectly when computing module ranges. Wiring the
  reloc-kind check is a small extension.

The detection lives in `detect_cross_overlay_bl()`, called
from `predict_module()` alongside the disasm-based
`detect_walls()`.

## Test coverage

`tests/test_predict_walls.py::TestCrossOverlayBLDetection`
covers:

- Single-BL positive case (one `module:none` reloc in the
  function's range).
- Multiple-BL positive case (two `module:none` relocs — the
  cluster-A pattern from picks #1/#2/#4/#20).
- Negative case: function with only `module:main` /
  `module:overlay(N)` relocs (regular resolvable BLs).
- Negative case: function with NO relocs at all (leaf
  function).
- Negative case: `module:none` reloc OUTSIDE the function's
  address range (belongs to a different function).

## Cross-references

- [`docs/research/codegen-walls.md` § C-32](codegen-walls.md#c-32)
  — canonical taxonomy entry.
- [`src/main/func_020b3814.s`](../../src/main/func_020b3814.s)
  — pre-existing precedent for the hand-encoded-BL `.word`
  recipe (different wall class, same technique).
- [`src/overlay011/func_ov011_021d2c64.s`](../../src/overlay011/func_ov011_021d2c64.s)
  — brief 192's worked example.
- [Brief 190 PR #637](https://github.com/cntrl-alt-lenny/gx-spirit-caller/pull/637)
  — original empirical discovery (Cluster A: 6 picks skipped
  with this wall).
- Brief 191 (C-31, mwldarm interwork veneer) — sibling
  wall; same `.s` escape-hatch pattern but for a different
  link-time mechanism.
- [`docs/research/first-wave-wall-mwldarm-interwork.md`](first-wave-wall-mwldarm-interwork.md)
  — brief 191's research note; template for this one.
