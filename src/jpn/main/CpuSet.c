/* CpuSet: NDS ARM9 BIOS SWI 0x0b thunk.
 *
 * Generic memcpy/memset: word- or halfword-wide transfers controlled by flags in r2.
 *
 * Disassembly (4B, Thumb): `swi #0xb; bx lr`
 *
 * See src/main/README.md for the brief-011 thunk pattern, the
 * `#pragma thumb on` note on mwcc-ARM section alignment, and the
 * objdiff-on-Thumb tooling caveat.
 */

#pragma thumb on

asm void CpuSet(void) {
    nofralloc
    swi 0xb
    bx  lr
}

#pragma thumb reset
