/* CAMPAIGN-PREP candidate for func_0208df0c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     two-MMIO bit-extract combine; unsigned DISPCNT (lsr) + signed u16 reg (asr); accumulator-first add
 *   risk:       the >>2 must stay asr (u16 reads signed) while >>24 stays lsr (u32 unsigned); proven by sibling func_0208deec/df40 recipe — main risk is the +base/add ordering
 *   confidence: high
 */
/* func_0208df0c: VRAM page address from DISPCNT BG-priority field plus
 * a VCOUNT-region OFS field. Two MMIO reads combined:
 *
 *   hi  = ((*(u32*)0x04000000 & 0x07000000) >> 24) << 16   (lsr, unsigned)
 *   lo  = ((*(u16*)0x0400000a & 0x3c)       >> 2 ) << 14   (asr, signed)
 *   ret = (hi + 0x06000000) + lo
 *
 * Sibling of func_0208deec/func_0208df40 (single-reg variant); the
 * volatile-cast-in-expression keeps asr on the u16 path and lsr on the
 * u32 path. Accumulator-first: base added to hi before lo (`add r0,r0,
 * #0x6000000; add r0,r0,r1,lsl #0xe`).
 */

#define DISPCNT (*(volatile unsigned int   *)0x04000000)
#define REG_OFS (*(volatile unsigned short *)0x0400000a)

void *func_0208df0c(void) {
    return (void *)((((DISPCNT & 0x7000000) >> 0x18) << 0x10) + 0x6000000
                    + (((REG_OFS & 0x3c) >> 2) << 0xe));
}
