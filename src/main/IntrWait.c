/* IntrWait: NDS ARM9 BIOS SWI 0x04 thunk.
 *
 * Halt until any of the interrupts in the r1 mask fires (r0 = clear-flag-first bool).
 *
 * Disassembly (4B, Thumb): `swi #0x4; bx lr`
 *
 * See src/main/README.md for the brief-011 thunk pattern, the
 * `#pragma thumb on` note on mwcc-ARM section alignment, and the
 * objdiff-on-Thumb tooling caveat.
 */

#pragma thumb on

asm void IntrWait(void) {
    nofralloc
    swi 0x4
    bx  lr
}

#pragma thumb reset
