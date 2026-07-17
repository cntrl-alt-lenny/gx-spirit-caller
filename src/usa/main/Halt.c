/* Halt: NDS ARM9 BIOS SWI 0x06 thunk.
 *
 * Low-power halt; resumes on any enabled interrupt.
 *
 * Disassembly (4B, Thumb): `swi #0x6; bx lr`
 *
 * See src/main/README.md for the brief-011 thunk pattern, the
 * `#pragma thumb on` note on mwcc-ARM section alignment, and the
 * objdiff-on-Thumb tooling caveat.
 */

#pragma thumb on

asm void Halt(void) {
    nofralloc
    swi 0x6
    bx  lr
}

#pragma thumb reset
