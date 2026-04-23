/* CpuFastSet: NDS ARM9 BIOS SWI 0x0c thunk.
 *
 * Word-only memcpy/memset; transfer size is rounded up to 32-byte blocks.
 *
 * Disassembly (4B, Thumb): `swi #0xc; bx lr`
 *
 * See src/main/README.md for the brief-011 thunk pattern, the
 * `#pragma thumb on` note on mwcc-ARM section alignment, and the
 * objdiff-on-Thumb tooling caveat.
 */

#pragma thumb on

asm void CpuFastSet(void) {
    nofralloc
    swi 0xc
    bx  lr
}

#pragma thumb reset
