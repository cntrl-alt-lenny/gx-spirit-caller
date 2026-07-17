/* HuffUnCompReadByCallback: NDS ARM9 BIOS SWI 0x13 thunk.
 *
 * Huffman decompress; source fetched via callback.
 *
 * Disassembly (4B, Thumb): `swi #0x13; bx lr`
 *
 * See src/main/README.md for the brief-011 thunk pattern, the
 * `#pragma thumb on` note on mwcc-ARM section alignment, and the
 * objdiff-on-Thumb tooling caveat.
 */

#pragma thumb on

asm void HuffUnCompReadByCallback(void) {
    nofralloc
    swi 0x13
    bx  lr
}

#pragma thumb reset
