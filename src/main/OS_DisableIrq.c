/* OS_DisableIrq: NitroSDK-standard IRQ-disable primitive. Sets CPSR bit 7
 * (I bit — IRQ mask) and returns the previous value of that bit as r0 (so
 * callers can use it with OS_RestoreIrq to nest enable/disable calls).
 *
 * mrs/msr are privileged CPSR-access instructions with no C equivalent —
 * mwcc cannot generate this from any C variation, so it ships as
 * `asm void` + `nofralloc` (see codegen-walls.md C-12 for the pattern,
 * e.g. src/main/func_02093294.c). Standard NitroSDK identity — the same
 * instruction sequence appears verbatim in every other NDS decomp that
 * matches this symbol (pokeplatinum, dqix, SonicRushAdventure-Decomp).
 *
 * Paired with OS_RestoreIrq for the enter/exit critical-section idiom
 * used throughout the engine.
 */

asm void OS_DisableIrq(void) {
    nofralloc
    mrs     r0, cpsr
    orr     r1, r0, #0x80
    msr     cpsr_c, r1
    and     r0, r0, #0x80
    bx      lr
}
