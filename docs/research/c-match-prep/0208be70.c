/* CAMPAIGN-PREP candidate for func_0208be70 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     MMIO busy-poll (inline volatile) + unsigned add/lsr
 *   risk:       poll loop may compile to ldrh+tst+bne or fold differently; should match given the legacy-DIV sibling precedent
 *   confidence: high
 */
/* func_0208be70 — wait for the hardware square-root unit, then read
 * and rescale its result. Polls SQRTCNT (0x040002b0) busy bit, then
 * returns (SQRT_RESULT + 0x200) >> 10 (unsigned).
 *
 *   ldr r1,=0x040002b0
 * wait: ldrh r0,[r1]; ands r0,#0x8000; bne wait    ; busy
 *   ldr r0,=0x040002b4; ldr r0,[r0]; add r0,#0x200; lsr #0xa; bx lr
 *
 * The volatile MMIO casts are kept inline in-expression (matched-sibling
 * recipe: an intermediate named temp can flip asr/lsr or reorder the
 * busy poll). The final shift is `lsr` -> unsigned result type.
 */
#include <nitro/types.h>

u32 func_0208be70(void) {
    while (*(vu16 *)0x040002b0 & 0x8000)
        ;
    return (*(vu32 *)0x040002b4 + 0x200) >> 10;
}
