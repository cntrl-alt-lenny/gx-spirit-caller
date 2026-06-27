/* CAMPAIGN-PREP candidate for func_02201ca0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if-chain dispatch (cmp r1,+0/+1/+2) over 3 const-return blocks; 2-bit gate
 *   risk:       orig is an explicit cmp/beq if-chain not a jump table; a C switch over 3 near values may emit a table. reshape-able (write as if/else-if on kind==0x134f.. to force the cmp chain)
 *   confidence: med
 */
/* func_ov002_02201ca0 (ov002, class C) — batch p_0081.
 * arg1!=0 gate, 2-bit field@bit14 must be 0, then switch on *(u16*)arg0 over
 * {0x134f,+1,+2} -> (021b878(f0)==K1 && 021b8c0(f0)==K2) ? 1 : 0.
 * arg0 is a different record (id at +0); self=arg1 holds f0@0 and the +2 bitfield.
 */
typedef unsigned short u16;
struct Ov002Self { u16 f0; u16 : 14; u16 f2bit : 2; };

extern int func_0202b878(int hw);
extern int func_0202b8c0(int hw);

int func_ov002_02201ca0(u16 *kindp, struct Ov002Self *self) {
    if (self == 0) return 0;
    if (self->f2bit != 0) return 0;
    switch (*kindp) {
    case 0x134f:
        if (func_0202b878(self->f0) == 0x16 && func_0202b8c0(self->f0) == 2)
            return 1;
        return 0;
    case 0x1350:
        if (func_0202b878(self->f0) == 0x16 && func_0202b8c0(self->f0) == 4)
            return 1;
        return 0;
    case 0x1351:
        if (func_0202b878(self->f0) == 0x17 && func_0202b8c0(self->f0) == 4)
            return 1;
        return 0;
    default:
        return 0;
    }
}
