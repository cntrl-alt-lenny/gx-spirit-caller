/* Sqrt: NDS ARM9 BIOS SWI 0x0d thunk.
 *
 * Integer square root of r0.
 *
 * Disassembly (4B, Thumb): `swi #0xd; bx lr`
 *
 * See src/main/README.md for the brief-011 thunk pattern, the
 * `#pragma thumb on` note on mwcc-ARM section alignment, and the
 * objdiff-on-Thumb tooling caveat.
 */

#pragma thumb on

asm void Sqrt(void) {
    nofralloc
    swi 0xd
    bx  lr
}

#pragma thumb reset
