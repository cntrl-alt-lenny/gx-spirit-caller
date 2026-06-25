/* CAMPAIGN-PREP candidate for func_0208bed8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     MMIO busy-poll + 64-bit read, round-bias, >>20
 *   risk:       64-bit volatile read may emit ldrd/wrong load pair; adc/lsr+orr scheduling may differ -> may ship .s
 *   confidence: low
 */
/* func_0208bed8 — wait for the hardware divider, read the 64-bit
 * quotient at DIV_RESULT (0x040002a0), add a rounding bias and rescale.
 * Returns (u32)((result + 0x80000) >> 20).
 *
 *   ldr r1,=0x04000280
 * wait: ldrh r0,[r1]; ands r0,#0x8000; bne wait      ; DIV busy
 *   ldr r1,=0x040002a0; mov r0,#0x80000
 *   ldr r2,[r1]; ldr r1,[r1,#4]         ; {r2:r1} = 64-bit result
 *   adds r0,r2,r0; adc r1,r1,#0         ; + 0x80000
 *   lsr r0,#0x14; orr r0,r0,r1,lsl#0xc; bx lr   ; >> 20, take low 32
 *
 * The lsr#20 | (hi<<12) is exactly a 64-bit `>> 20` keeping the low
 * word, so the C uses a u64 read + add + shift. 0x80000 == 2^19 is the
 * round-to-nearest bias for the >>20 (a 2^20 fixed-point scale).
 * The 64-bit add/shift codegen is reg-alloc sensitive (USA divider
 * siblings shipped as .s) — best-effort candidate.
 */
#include <nitro/types.h>

u32 func_0208bed8(void) {
    while (*(vu16 *)0x04000280 & 0x8000)
        ;
    return (u32)(((u64)*(vu64 *)0x040002a0 + 0x80000) >> 20);
}
