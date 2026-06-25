/* CAMPAIGN-PREP candidate for func_02214d74 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit2 gate; guard-chain; res byte/half split (asr#8 via short); f14 bitfields bit9/bit14; stacked 0
 *   risk:       permuter-class: orig packs a/mid/hi into r5/r6/r7 and holds them live across two calls (mov r1,r5;mov r2,r7) -- mwcc reg-alloc of three callee-saved temps across calls is allocation-order sensitive; mid via (short)>>8 must give asr#8 not lsr.
 *   confidence: low
 */
/* func_ov002_02214d74: linear guard-chain. Gate self->f4 bit2 -> 0. Guards
 * func_021bc618(bit0) and func_021ca2b8(bit0) (both !=0 to continue). Read
 * self->f14 (dword): low9=(f14<<23>>23); func_021b947c(low9) -> packed result.
 * Split: a=res&0xff, mid=((short)res>>8)&0xff, hi=(res>>16)&0xffff. Require
 * mid==0xe. Guard func_021c33e4(bit0, a, hi). Then r=func_021c93f0(a, mid, hi);
 * func_0227ac64(f14.bit9, r, 1, f14.bit14, stack=0). Returns 0. */

typedef unsigned short u16;

struct Self02214d74 {
    u16 f0;
    u16 bit0 : 1;      /* +2 */
    u16 _f4lo : 2;     /* +4 bits0-1 */
    u16 b2 : 1;        /* +4 bit2 */
    u16 _p[6];
    unsigned int f14;  /* +0x14 */
};

extern int func_ov002_021bc618(int bit0);
extern int func_ov002_021ca2b8(int bit0);
extern int func_ov002_021b947c(int low9);
extern int func_ov002_021c33e4(int bit0, int a, int hi);
extern int func_ov002_021c93f0(int a, int k, int hi);
extern int func_ov002_0227ac64(int bit9, int r, int one, int bit14, int z);

int func_ov002_02214d74(struct Self02214d74 *self) {
    int res, a, mid, hi;
    unsigned int f14;
    if (self->b2) return 0;
    if (func_ov002_021bc618(self->bit0) == 0) return 0;
    if (func_ov002_021ca2b8(self->bit0) == 0) return 0;
    f14 = self->f14;
    res = func_ov002_021b947c((int)((f14 << 23) >> 23));
    mid = (int)((short)res >> 8) & 0xff;
    a   = res & 0xff;
    hi  = (int)((unsigned int)res >> 16);
    if (mid != 0xe) return 0;
    if (func_ov002_021c33e4(self->bit0, a, hi) == 0) return 0;
    func_ov002_0227ac64((int)((f14 << 22) >> 31), func_ov002_021c93f0(a, mid, hi),
                        1, (int)((f14 << 17) >> 31), 0);
    return 0;
}
