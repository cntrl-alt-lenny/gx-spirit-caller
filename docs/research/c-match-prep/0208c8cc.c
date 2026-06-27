/* CAMPAIGN-PREP candidate for func_0208c8cc (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     orr chain operand-first ((mask)|(sel<<16), p1|v, v|(p2<<3)); strh before zeroing sel; gate predication
 *   risk:       volatile-load scheduling + the moveq r0,#0 predicated-zero of sel must land between the strh and the pack. mwcc may reorder the REG read or use a branch for the flag test. permuter-class (scheduling) with operand-order reshape on the orr chain.
 *   confidence: low
 */
// func_0208c8cc — pack fields into REG_BLDCNT-style MMIO word, gated by a flag halfword
// data_02102498: u16 enable flag.  data_021a6300: u16 latched value (param0).
extern unsigned short data_02102498;
extern unsigned short data_021a6300;
#define REG32 (*(volatile unsigned int *)0x04000000)

int func_0208c8cc(unsigned int p0, unsigned int p1, unsigned int p2)
{
    unsigned int v;
    unsigned int sel = p0;
    data_021a6300 = (unsigned short)p0;
    if (data_02102498 == 0) {
        sel = 0;
    }
    v = (REG32 & 0xfff0fff0) | (sel << 16);
    v = p1 | v;
    v = v | (p2 << 3);
    REG32 = v;
    if (data_021a6300 == 0) {
        data_02102498 = 0;
    }
    return (int)v;   /* return value incidental; r0 holds packed word path-dependently */
}
