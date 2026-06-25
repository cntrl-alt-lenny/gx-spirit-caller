/* CAMPAIGN-PREP candidate for func_021ca074 (ov001, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: pooled MMIO bases, engineB=engineA+0x1000 reuse, straight call order
 *   risk:       orig holds 0x04000000 in r2 and derives r3=r2+0x1000 (one base, one add); if mwcc pools each absolute address separately, the `add r3,r2,#0x1000` becomes two ldr -> several insns diverge. reshape-able (already modeled B as A+0x1000; may need explicit `int base=0x04000000`).
 *   confidence: med
 */
/* func_ov001_021ca074 — display/MMIO bring-up, 6 calls, mostly straight stores.
 * Halfword regs 0x04000008 and +0x1000: reg = (reg & 0x43) | 0x84.
 * Word regs 0x04000000 and +0x1000: reg = (reg & 0xffcfffef)|0x10|0x200000.
 * Engine-B base modeled as engineA+0x1000 so the `add ip,base,#0x1000` is reused.
 * Calls in order: func_ov001_021c9f24((data_ov001_021ca420[0]>>16)&0xff),
 *   func_ov000_021ab4bc(0,1), func_ov000_021ab4bc(1,1),
 *   func_0201d5c0(4,2), func_0201d5c0(9,2), func_0208c940();
 *   then *0x04001000 |= 0x10000. */

extern unsigned int data_ov001_021ca420[];
extern void func_0201d5c0(int, int);
extern void func_0208c940(void);
extern void func_ov000_021ab4bc(int, int);
extern void func_ov001_021c9f24(int);

void func_ov001_021ca074(void) {
    volatile unsigned short *dispA = (volatile unsigned short *)0x04000008;
    volatile unsigned short *dispB = (volatile unsigned short *)0x04001008;
    volatile unsigned int   *ctrlA = (volatile unsigned int *)0x04000000;
    volatile unsigned int   *ctrlB = (volatile unsigned int *)0x04001000;

    dispA[0] = (dispA[0] & 0x43) | 0x84;
    dispB[0] = (dispB[0] & 0x43) | 0x84;
    func_ov001_021c9f24((int)((data_ov001_021ca420[0] << 8) >> 24));
    func_ov000_021ab4bc(0, 1);
    func_ov000_021ab4bc(1, 1);
    ctrlA[0] = (ctrlA[0] & 0xffcfffefu) | 0x10u | 0x200000u;
    ctrlB[0] = (ctrlB[0] & 0xffcfffefu) | 0x10u | 0x200000u;
    func_0201d5c0(4, 2);
    func_0201d5c0(9, 2);
    func_0208c940();
    ctrlB[0] |= 0x10000u;
}
