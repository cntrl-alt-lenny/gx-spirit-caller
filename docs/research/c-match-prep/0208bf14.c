/* CAMPAIGN-PREP candidate for func_0208bf14 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     MMIO busy-poll + 64-bit volatile read (return s64)
 *   risk:       64-bit read may compile to ldrd or reversed lo/hi load order; vs64 typedef may need <nitro/types.h> support
 *   confidence: med
 */
/* func_0208bf14 — wait for the hardware divider, then return the raw
 * 64-bit quotient (DIV_RESULT at 0x040002a0) in r0:r1.
 *
 *   ldr r1,=0x04000280
 * wait: ldrh r0,[r1]; ands r0,#0x8000; bne wait    ; DIV busy
 *   ldr r1,=0x040002a0; ldr r0,[r1]; ldr r1,[r1,#4]; bx lr
 *
 * Returns a 64-bit value: lo in r0, hi in r1 (two separate ldr from
 * +0 and +4). Modelled as a volatile s64 read after the busy poll.
 * Same divider family as the .s-shipped USA siblings; the two-word
 * 64-bit load form is the residual risk.
 */
#include <nitro/types.h>

s64 func_0208bf14(void) {
    while (*(vu16 *)0x04000280 & 0x8000)
        ;
    return *(vs64 *)0x040002a0;
}
