/* CAMPAIGN-PREP candidate for func_02203580 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     multiple h2 bitfields; eor b0^b14 first-operand; guard chain to shared return-1
 *   risk:       orig lays the b12!=2 (eor) arm FIRST then the b12==2 arm at .L_48; my if(b12==2){...} inverts block order, so the two return-paths/branch polarity may flip. reshape-able (swap to if(b12!=2){...} first).
 *   confidence: low
 */
/* func_ov002_02203580 (cls D): self->b12 (h2 bits12..13). If !=2: call func_021bc8c8(
 * b0 ^ b14, b0, h2bits1..5); nonzero -> return 1 else 0. If ==2: arg1 guard, then
 * d016c.cec==b0, !(d016c.d0 & 1), func_021b3ecc(b0,0xb,self->f0)!=0,
 * func_022536e8(b0,self->f0,0)!=0 -> return 1; any fail -> 0. */
typedef unsigned short u16;
struct self_t { u16 f0; u16 b0 : 1; u16 b1 : 5; u16 :6; u16 b12 : 2; u16 b14 : 1; };
extern char data_ov002_022d016c[];
extern int func_ov002_021bc8c8(int a, int b, int c);
extern int func_ov002_021b3ecc(int a, int b, int c);
extern int func_ov002_022536e8(int a, int b, int c);
int func_ov002_02203580(struct self_t *self, int arg1) {
    int bit0;
    if (self->b12 == 2) {
        if (arg1 != 0)
            return 0;
        bit0 = self->b0;
        if (*(int *)(data_ov002_022d016c + 0xcec) != bit0)
            return 0;
        if (*(int *)(data_ov002_022d016c + 0xd0) & 1)
            return 0;
        if (func_ov002_021b3ecc(bit0, 0xb, self->f0) == 0)
            return 0;
        if (func_ov002_022536e8(self->b0, self->f0, 0) == 0)
            return 0;
        return 1;
    }
    if (func_ov002_021bc8c8(self->b0 ^ self->b14, self->b0, self->b1) == 0)
        return 0;
    return 1;
}
