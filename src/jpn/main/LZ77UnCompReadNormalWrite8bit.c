/* LZ77UnCompReadNormalWrite8bit: NDS ARM9 BIOS SWI 0x11 thunk.
 *
 * LZ77 decompress; 8-bit writes; source read directly from memory.
 *
 * Disassembly (4B, Thumb): `swi #0x11; bx lr`
 *
 * See src/main/README.md for the brief-011 thunk pattern, the
 * `#pragma thumb on` note on mwcc-ARM section alignment, and the
 * objdiff-on-Thumb tooling caveat.
 */

#pragma thumb on

asm void LZ77UnCompReadNormalWrite8bit(void) {
    nofralloc
    swi 0x11
    bx  lr
}

#pragma thumb reset
