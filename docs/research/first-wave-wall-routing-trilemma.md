# First-wave wall — C-35 routing trilemma

**Brief:** 204 (scaffolder). Brief 203 (PR #654) shipped 2 of 3
C-23 picks cleanly via the brief 199 `.legacy.c` recipe + extensions.
The 3rd pick — `func_02021b38` (main, 0x74) — didn't close.
Brief 203 documented the failure as a "routing trilemma":

> Orig has push {r3, r4, r5, lr} (mwcc 2.0 compact style) +
> duplicate-pool ref (mwcc 1.2/sp2p3 style) + non-strength-reduced
> loop. No single mwcc tier produces all three.

Brief 204 swept all 15 available mwccarm variants, confirmed none
match, applied the brief 202 C-34 `.s` recipe, surfaced a patcher
trim-padding false positive that broke the cascade-fill case,
fixed the patcher, shipped the worked example, and added a
composite C-35 classifier signal so future picks pre-route away
from the wrong recipe.

## Part 1 — empirical sweep of all 15 mwccarm variants

`tools/mwccarm/` has 15 variants available (excluding the `dsi/`
DSi-specific tier which uses different ABI):

  - **1.2**: base, sp2, sp2p3 (current `.legacy.c`), sp3 (current
    `.legacy_sp3.c`), sp4
  - **2.0**: base, sp1, sp1p2, sp1p5 (current default `.c`),
    sp1p6, sp1p7, sp2, sp2p2, sp2p3, sp2p4

I compiled the brief 203 stub against each, with identical
`CC_FLAGS` from `tools/configure.py`. Results:

```text
1.2/base:    built 112 B, first diff at byte 0 (push list)
1.2/sp2:     built 112 B, first diff at byte 0
1.2/sp2p3:   built 112 B, first diff at byte 0
1.2/sp3:     built 108 B, first diff at byte 0
1.2/sp4:     built 108 B, first diff at byte 0
2.0/base:    built 108 B, first diff at byte 0
2.0/sp1:     built 108 B
2.0/sp1p2:   built 108 B
2.0/sp1p5:   built 108 B (default `.c`)
2.0/sp1p6:   built 108 B
2.0/sp1p7:   built 108 B
2.0/sp2:     built 108 B
2.0/sp2p2:   built 108 B
2.0/sp2p3:   built 108 B
2.0/sp2p4:   built 108 B
```

**Orig is 116 bytes (0x74)**. The closest match is the 1.2
family at 112 B (-4 from orig). The 4-byte deficit is one full
pool word — orig has 5 pool entries (with `data_02197434`
duplicated), all variants emit 4 (CSE the duplicate). The push
list also differs — every variant emits `push {r4, lr}` (2-reg),
orig has `push {r3, r4, r5, lr}` (4-reg with r3 spill).

The 1.2 variants emit StyleA epilogue (`pop {r4, lr}; bx lr`);
orig has StyleB (`pop {regs, pc}`). The 2.0 variants emit
StyleB (matches orig's epilogue style) but otherwise diverge in
the loop body and pool count.

**Verdict:** no available mwccarm variant produces the orig
shape. The trilemma is real.

## Part 2 — recipe selection

Per the brief's options table:

| Option | Mechanism | Result |
|---|---|---|
| (a) New routing tier with another mwcc version | All 15 variants swept | None match — no new tier helps |
| (b) Per-TU compiler flag | mwcc 2.0 doesn't expose a `-no-cse` or per-pass flag at our access tier | N/A |
| (c) Source-shape hybrid | Brief 203 already exhausted: `volatile`, pointer alias, no source-shape iteration reaches mwcc IR-CSE | N/A |
| **(d) `.s` worked example** | Pure assembly bypasses both mwcc IR and mwasmarm pool dedup | **Worked. ✓** |
| (e) P-12 permanent | Not needed — (d) succeeds |

Brief 202's C-34 `.s` recipe handles exactly this — duplicate
pool slots emit byte-for-byte when written explicitly as
`.word` directives at distinct labels. Same approach generalises
to combined codegen walls: write the whole function in `.s` to
get full control over push list, reg-allocation, loop addressing
mode, AND pool slots.

## The patcher trim-padding false positive

When I shipped the `.s` worked example, the rebuilt ROM SHA1
failed:

```text
expected: 1da50df7c210fae96dc69b3825554b9ce13b4f75
actual:   c847fea96be5f220ade104912b825abb8d6e95b4
```

The function's own bytes matched orig byte-for-byte
(`build/eur/build/arm9.bin[0x21b38:0x21bac]` == orig). But the
next function (`func_02021bac`) was placed 2 bytes too early —
the cascade was visible from `arm9.bin[0x210f4]` onwards.

Root cause: `tools/patch_section_align.py::trim_text_section_padding`
trims 2 bytes from `.text` when:

  - `sh_size % 4 == 0`, AND
  - the last 2 bytes are `0x00 0x00`

That heuristic was tuned for PR #115's regression (mwasm padding
Thumb thunks). The trigger has a known **false positive**: `.s`
files ending in a reloc-placeholder pool word also have last
4 bytes `0x00 0x00 0x00 0x00` (the linker fills the reloc), and
the patcher trims 2 bytes — destroying 2 bytes of a legitimate
pool slot.

Brief 202's E-07 also tripped the false positive (`.text 112 ->
110`) but the next TU was a NAMED `.c` file with a specific
address. mwldarm placed the next TU at its named address
regardless of the trimmed .o size — no cascade.

For `func_02021b38`, the next TU is a `_dsd_gap@main_NN.o`
gap-fill (no specific address). mwldarm placed it contiguously
at `funcstart + 0x72`, two bytes before the orig
`func_02021bac` at `funcstart + 0x74`. The cascade shifted
every byte from there onward.

**Fix:** brief 204 extends the trim heuristic with **reloc
protection**. If `.rel.text` (or `.rela.text`) has an
`r_offset` in `[sh_size - 4, sh_size)`, the last 4 bytes are
a legitimate reloc placeholder — don't trim.

Implementation in `tools/patch_section_align.py`:

- New helpers: `_section_index_by_name`,
  `_rel_offsets_targeting_section`.
- New constants: `SHT_REL`, `SHT_RELA`, `SH_INFO`, `SH_FLAGS`,
  `SH_LINK`, `SH_ENTSIZE`, `REL_OFFSET`.
- Updated `trim_text_section_padding` to compute the set of
  relocation offsets targeting the current `.text` section and
  skip the trim when any offset is within
  `[cur_size - 4, cur_size)`.

This protects brief 202's E-07 too (which now keeps its full
0x70 bytes instead of 0x6e), and the regression-test surface for
PR #115's original Thumb-thunk fix is preserved — Thumb 6-byte
thunks don't have a trailing `.word` relocation (they end with
mwasm's literal `0x00 0x00` padding, no reloc).

## Worked example — `src/main/func_02021b38.s`

```text
        .text
        .extern data_02197434
        .extern data_021040ac
        .extern data_02198434
        .extern Fill32
        .global func_02021b38
        .arm

func_02021b38:
        stmdb   sp!, {r3, r4, r5, lr}     ; ← 4-reg push (mwcc emits 2)
        ldr     r4, .L_DATA_A
        ldr     r2, .L_SIZE
        mov     r5, r0
        mov     r1, r4
        mov     r0, #0x0
        bl      Fill32
        ldr     r0, .L_CFG_TABLE
        ldr     r2, .L_DATA_B
        ldr     r0, [r0, #0x38]
        str     r5, [r2, #0xb0]
        mov     r0, r0, lsl #0x10
        ldr     r1, .L_DATA_A2             ; ← duplicate ref (C-34)
        mov     r0, r0, lsr #0x10
        str     r0, [r1, #0x4]
        mov     r2, #0x0
        mvn     r1, #0x0
.L_loop:
        add     r0, r4, r2, lsl #0x4       ; ← non-strength-reduced
        add     r2, r2, #0x1
        str     r1, [r0, #0x48]
        cmp     r2, #0x100
        blt     .L_loop
        mov     r0, #0x1
        ldmia   sp!, {r3, r4, r5, pc}
.L_DATA_A:    .word data_02197434
.L_SIZE:      .word 0x000034a8
.L_CFG_TABLE: .word data_021040ac
.L_DATA_B:    .word data_02198434
.L_DATA_A2:   .word data_02197434
```

Three critical details:

1. **4-reg push** `{r3, r4, r5, lr}`. r3 is a spill for stack
   alignment (push must save an even number of regs); r4 + r5
   hold the function's two live values across the `bl Fill32`
   call.
2. **Distinct `.L_*` labels for each pool slot.** Even when two
   labels reference the same symbol (`.L_DATA_A` and
   `.L_DATA_A2`), mwasmarm doesn't merge the `.word` entries —
   they emit at distinct addresses.
3. **`add r0, r4, r2, lsl #0x4`** in the loop body —
   strength-NOT-reduced form. mwcc 2.0/sp1p5 (and all 14 other
   variants) would emit `add ip, ip, #16` increment.

Verified: 3-region `ninja sha1` PASS (EUR + USA + JPN).

## C-35 classifier — composite signal

The brief 204 wall is fundamentally a COMPOSITE of multiple
known signals firing on the same function. Both C-23 (≥ 3
pc-relative loads + clustered pool) AND C-34 (duplicate pool
ref) flag `func_02021b38` independently. The C-35 detector
recognises this stack:

```python
def detect_routing_trilemma(walls):
    ids = {w.wall_id for w in walls}
    if "C-23" in ids and "C-34" in ids:
        return [WallPrediction("C-35", ...routing trilemma cue...)]
    return []
```

Wired into both `predict_module()` and the `--address` single-
pick path. The composite cue text routes the decomper directly
to the `.s` recipe, skipping the `.legacy.c` retry loop that
brief 203 burned through.

Real-corpus smoke on `func_02021b38`:

```bash
$ python tools/predict_walls.py --version eur --module main \
    --address 0x02021b38 --size 0x74
  C-23: 5 pc-relative loads + clustered pool window (≤0x20 B span)
  C-15: constant-pair (#K, ±1) via `mvn`/`mov-sub`
  C-1:  5-instruction predicated chain
  C-34: 1 address-CSE candidate: 0x02197434 @ [0x02021b98, 0x02021ba8]
  C-33: main function size 0x74 + C-15 wall(s) → `.legacy.c` ...
  C-35: C-23 + C-34 stack — routing trilemma (no mwcc tier matches
        all combined codegen walls); ship as `.s` per brief 204
        recipe
```

Brief 202's E-07 (`func_02023f7c`) correctly does NOT fire C-35
— it has C-34 alone, no C-23 (only 4 pc-loads with no cluster).

## Tests

`tests/test_predict_walls.py::TestRoutingTrilemmaDetection` —
7 cases:

- `test_c23_plus_c34_fires` — minimal positive
- `test_c23_plus_c34_with_additional_walls_still_fires` —
  realistic 5-wall composite (matches `func_02021b38`'s actual
  classifier output)
- `test_c34_alone_does_not_fire` — brief 202 E-07's case
- `test_c23_alone_does_not_fire` — brief 199 pick #5's case
- `test_other_walls_alone_dont_fire` — unrelated walls
  (StyleA + C-1 + P-11)
- `test_empty_walls_doesnt_fire` — defensive
- `test_c32_plus_c34_does_not_fire` — wrong combo
  (C-32 is cross-overlay BL, different family)

`tools/patch_section_align.py`'s existing tests already cover
the trim behavior; the reloc-protection extension is implicitly
tested by the brief 204 build's 3-region SHA1 PASS (which
exercises both the trim case + the protect case via real .o
files).

## Cross-references

- [`docs/research/codegen-walls.md` § C-35](codegen-walls.md#c-35)
  — taxonomy entry.
- [`docs/research/first-wave-wall-address-cse.md`](first-wave-wall-address-cse.md)
  — brief 202 C-34 (the base recipe C-35 extends).
- [`docs/research/brief-203-c23-survey-drain.md`](brief-203-c23-survey-drain.md)
  — brief 203's diagnostic that surfaced the trilemma.
- [Brief 203 PR #654](https://github.com/cntrl-alt-lenny/gx-spirit-caller/pull/654)
  — pre-classification discussion.
- [`src/main/func_02021b38.s`](../../src/main/func_02021b38.s)
  — brief 204 worked example.
- [`tools/patch_section_align.py`](../../tools/patch_section_align.py)
  `trim_text_section_padding` — the reloc-protect fix.
- [`tools/predict_walls.py`](../../tools/predict_walls.py)
  `detect_routing_trilemma` — composite classifier.
