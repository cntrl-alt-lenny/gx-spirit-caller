/* WaitByLoop: NDS ARM9 BIOS SWI 0x03 thunk.
 *
 * Busy-wait for r0 iterations of the BIOS's internal delay loop.
 *
 * Disassembly (4B, Thumb): `swi #0x3; bx lr`
 *
 * See src/main/README.md for the brief-011 thunk pattern, the
 * `#pragma thumb on` note on mwcc-ARM section alignment, and the
 * objdiff-on-Thumb tooling caveat.
 */

#pragma thumb on

asm void WaitByLoop(void) {
    nofralloc
    swi 0x3
    bx  lr
}

#pragma thumb reset
