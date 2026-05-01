# trim-padding false positive on relocation-tail .s files

**Asked:** brain wave-16 attempt to ship `OSi_PostIrqEvent` as `.s`
(the last unmatched named function). Build succeeded but module
checksum failed; investigation shows `tools/patch_section_align.py
--trim-padding` strips the last 2 bytes of the `.text` section.

## Reproduction

```bash
# OSi_PostIrqEvent.s ends with 5 .word symbol relocations:
.L_0209055c: .word data_021a6354
.L_02090560: .word data_021024a0
.L_02090564: .word data_021a635c
.L_02090568: .word data_027e0000
.L_0209056c: .word data_021a6358
```

mwasm correctly emits 156 bytes (.text size) with 5 R_ARM_ABS32
relocations targeting the symbols. Pre-link, the bytes at offsets
0x88..0x9c are all zero (relocations will fill them at link time).

`patch_section_align.py --trim-padding` then runs and trims the last
2 bytes:

```
patched OSi_PostIrqEvent.o: .text sh_size 156 -> 154 (trimmed mwasm padding)
```

The trim relies on:
1. `sh_size % 4 == 0` (mine: 156 ✓)
2. `last 2 bytes of section == 0x00 0x00` (mine: ✓ — relocation pre-fill)

But there's a 5th relocation at offset 0x98 expecting 4 bytes of
section. After trim, only 2 bytes remain at that offset. mwldarm
either fails or silently corrupts post-link bytes; module checksum
breaks.

## Root cause

The `trim_text_section_padding` heuristic was written for **mwasm
ARM padding 6-byte Thumb fns to 8** (per `Fill32.s`/`Copy32.s` /
`VBlankIntrWait.s` patterns). Those have ARM/Thumb instruction
endings that aren't `0x0000` — so the trim doesn't touch them.

But ARM `.s` files ending with **relocation pool words** have
legitimate `0x00 0x00 0x00 0x00` pre-link bytes that look like
padding. The heuristic can't distinguish.

## Suggested fix

In `trim_text_section_padding`, additionally check that the trimmed
bytes are NOT covered by an outgoing relocation:

```python
# Don't trim if the last 4 bytes are a relocation target.
last_word_offset = sh_size - 4
if any(r.offset >= last_word_offset and r.offset < sh_size
       for r in relocations_for_section):
    skip_trim = True
```

This would correctly handle:
- `.s` ending with `bx lr` (no reloc, true padding) → trim
- `.s` ending with `.word symbol` (reloc, real data) → don't trim

## Workaround until fix

`OSi_PostIrqEvent` deferred until either:
1. Cloud fixes the trim heuristic
2. The function ships as `.c` (mwcc emits structurally; verify-
   before-rename still applies)

The function remains the **last unmatched named symbol** (39/39 had
been claimed in #245 but applied to `__sinit_ov004_02209a5c` only;
`OSi_PostIrqEvent` was already there as the actual final un-matched
named).

## Cross-refs

- PR #115 — original `--trim-padding` motivation (Thumb 6-byte fns)
- `tools/patch_section_align.py` — source of the trim
- `_dsd_gap@main_130.s` — disasm of the target function
