/* CAMPAIGN-PREP candidate for func_0208e220 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     two-MMIO bit-extract combine; identical to e1cc with reg pool 0x04000008
 *   risk:       same as e1cc; only the u16 pool address differs (0x04000008); asr/lsr split and add ordering are the residual concern
 *   confidence: high
 */
/* func_0208e220: identical to func_0208e1cc but the secondary MMIO read
 * is the u16 register at 0x04000008 instead of 0x0400000a.
 *
 *   hi  = ((*(u32*)0x04000000 & 0x38000000) >> 27) << 16   (lsr)
 *   lo  = ((*(u16*)0x04000008 & 0x1f00)     >> 8 ) << 11   (asr)
 *   ret = (hi + 0x06000000) + lo
 */

#define DISPCNT (*(volatile unsigned int   *)0x04000000)
#define REG_OFS (*(volatile unsigned short *)0x04000008)

void *func_0208e220(void) {
    return (void *)((((DISPCNT & 0x38000000) >> 0x1b) << 0x10) + 0x6000000
                    + (((REG_OFS & 0x1f00) >> 8) << 0xb));
}
