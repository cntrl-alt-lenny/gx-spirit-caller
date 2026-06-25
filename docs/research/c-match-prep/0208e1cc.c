/* CAMPAIGN-PREP candidate for func_0208e1cc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     two-MMIO bit-extract combine; DISPCNT field 0x38000000>>27, reg field 0x1f00>>8
 *   risk:       different masks/shifts than df0c (0x38000000/27/16 and 0x1f00/8/11) but same shape; asr on the >>8 reg path vs lsr on DISPCNT is the residual risk
 *   confidence: high
 */
/* func_0208e1cc: VRAM page address, wider fields than func_0208df0c.
 *
 *   hi  = ((*(u32*)0x04000000 & 0x38000000) >> 27) << 16   (lsr)
 *   lo  = ((*(u16*)0x0400000a & 0x1f00)     >> 8 ) << 11   (asr)
 *   ret = (hi + 0x06000000) + lo
 */

#define DISPCNT (*(volatile unsigned int   *)0x04000000)
#define REG_OFS (*(volatile unsigned short *)0x0400000a)

void *func_0208e1cc(void) {
    return (void *)((((DISPCNT & 0x38000000) >> 0x1b) << 0x10) + 0x6000000
                    + (((REG_OFS & 0x1f00) >> 8) << 0xb));
}
