/* CAMPAIGN-PREP candidate for func_02207060 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     3 calls, bit0 RELOADED per call; call2 uses one temp t for both args (matches single extract + mov r1,r0); f4 :9@6; c3>=2 => movge/movlt.
 *   risk:       permuter-class: arg scheduling of call1 (two ldrh + interleaved shifts for r0/r3 vs r1=#0xb/r2=lit) is a coin-flip mwcc may order differently. Structure/shift amounts are exact.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_02207060 (ov002, class D) — brief 494.
 * UNVERIFIED build-free draft. Bitfield args to two calls + compare tail, linear.
 * c1 = 021b3fd8(f2.bit0, 0xb, 0x16b8, f4.:9@bit6); if(c1) return 0.
 * c2 = 021ca698(t, t) where t=f2.bit0 read ONCE (asm: extract -> mov r1,r0).
 * c3 = 022536e8(f2.bit0, f0, 0);                   return c3 >= 2 ? 1 : 0.
 * f2.bit0 RELOADED across the 3 calls (3 ldrh [r4,#2]); call2's 2 args share 1 read. */
typedef unsigned short u16;

extern int func_ov002_021b3fd8(int a, int b, int c, int d);
extern int func_ov002_021ca698(int a, int b);
extern int func_ov002_022536e8(int a, int b, int c);

struct Ent7060 { u16 f0; u16 b0 : 1; u16 _2r : 15; u16 _4lo : 6; u16 f6 : 9; u16 _15 : 1; };

int func_ov002_02207060(struct Ent7060 *p) {
    int t;
    if (func_ov002_021b3fd8(p->b0, 0xb, 0x16b8, p->f6) != 0)
        return 0;
    t = p->b0;
    if (func_ov002_021ca698(t, t) == 0)
        return 0;
    return func_ov002_022536e8(p->b0, p->f0, 0) >= 2;
}
