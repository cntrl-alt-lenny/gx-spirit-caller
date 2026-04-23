# src/main

ARM9 main module. First decomp work inside the failing-module perimeter.

## BIOS SWI thunks — brief 011

17 BIOS SWI thunks live in main, named canonically by `dsd init`. Each is
a Thumb-mode single-instruction-plus-return of the form
`swi #N; bx lr` (4B), with two outliers bracketing the SWI with an extra
`mov` for register massaging (6B).

**As of brief 011 wave 1: 8 of 17 shipped** — the ones at 4-byte-aligned
addresses with 4-byte sizes. The remaining 9 (at 2-byte-aligned
addresses, or size 6B) hit an mwcc-ARM / dsd-lcf section-alignment wall
documented below. See [brief 011 follow-up] for the
`section_alignment_patch` tool proposal that would unblock them.

### Pattern

```c
#pragma thumb on

asm void Halt(void) {
    nofralloc
    swi 0x6
    bx  lr
}

#pragma thumb reset
```

Each thunk is its own `.c` file — one TU, one `complete` entry in
`config/eur/arm9/delinks.txt`. `asm void` + `nofralloc` is the same
escape-hatch pattern used by brief 009's sinit ov002 outlier; there's
no C equivalent for a single SWI instruction.

### The section-alignment wall

**The shipped 8 thunks:** all start at 4-aligned addresses AND their
size is 4 (so end is also 4-aligned). Each carves cleanly out of its
surrounding `_dsd_gap@main_*.o` without any linker-inserted padding —
the gap ends at a 4-aligned offset, my thunk's 4-aligned section
starts there, and the next gap picks up 4-aligned.

**The 9 blocked thunks:** start at 2-byte-aligned-but-not-4-aligned
addresses (e.g. VBlankIntrWait at `0x02000086`, SoftReset at
`0x0200078a`), or are size 6 with a 4-aligned start (Mod at `0x02000324`
→ end `0x0200032a`). For those:

- mwcc-ARM emits `.text` sections with `sh_addralign=4` regardless of
  `#pragma thumb on` / `function_align 2` / `__attribute__((aligned(2)))`
  / any other source-level directive tried.
- The auto-generated `build/eur/arm9.lcf` has `ALIGNALL(4)` at the top
  of the ARM9 segment, so section-to-section placement respects the
  max alignment of each section (stays at 4).
- Result: when my 4-aligned thunk `.o` is placed after a gap that ends
  at a 2-aligned offset, mwldarm inserts 2 bytes of padding. That
  shifts every subsequent byte — most visibly tripping dsd's final
  ROM-build step with *"expected 4-alignment for build info but got
  2-alignment"* because the `BuildInfo` struct in the ARM9 binary
  lands at the wrong offset.
- The original compile (Nintendo's) didn't hit this because everything
  was linked from one giant `.o` per TU — inner Thumb code could sit
  at any 2-aligned offset inside a 4-aligned-outer section.

The 8 shipped thunks avoid the issue by having no intra-section shift
(4-aligned start + 4-aligned size). All 8 are confirmed byte-identical
to the baserom at their exact addresses (see PR body for the
byte-by-byte comparison).

### objdiff note

`objdiff-cli report generate` **panics** on the main module when my
Thumb-mode `.o`s are present:

    thread '<unnamed>' panicked at objdiff-core/src/arch/arm.rs:130:29:
    index out of bounds: the len is 0 but the index is ...

This is an objdiff bug in its ARM/Thumb function-boundary analysis, not
a byte-level mismatch. Byte-identity is verified directly against the
extracted baserom `arm9.bin`. See PR body.
