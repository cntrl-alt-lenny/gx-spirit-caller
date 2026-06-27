/* CAMPAIGN-PREP candidate for func_021f3318 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: :13 bitfield; bind po/io products reused across cf16c+cf1a4; operand-order base+po+0x30+io to pick add r3,r3,lr
 *   risk:       NONE residual — byte-exact. Key fix: write `cf16c + po + 0x30 + io` (io LAST) so the final add is `add r3,r3,lr` (sum-first); `po+io+0x30` gave `add r3,lr,r3`. reshape-able (done).
 *   confidence: high
 */
/* CAMPAIGN-PREP candidate for func_ov002_021f3318 (ov002, class D) — MED tier.
 * VALIDATED byte-exact (mwcc 2.0/sp1p5 -O4,p -interworking vs delinked .o).
 * Clone-family with 021f31bc/021f33c8.
 * recipe: self->parity (:1) guard, arg2 < 5 guard; the parity product (arg1&1)*
 * 0x868 (r4) and index product arg2*0x14 (lr) are HELD and reused across TWO
 * tables -> bound to locals po/io (matches mul r4 / mul lr reused for cf16c and
 * cf1a4). cf16c[+0x30] low-13-bit nonzero, cf1a4 u16 nonzero, then a global pair
 * compare cd3f4[0]==arg1 && cd3f4[+0x1c]==arg2, then return helper()==0. */
typedef unsigned short u16;

struct Ov002Self { u16 f0; u16 parity : 1; };
struct Bf13 { unsigned v : 13; };                    /* :13 field -> lsl;lsr (not and) */
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int  data_ov002_022cd3f4[];                   /* [0]=owner, [7]=slot (byte +0x1c) */
extern int  func_ov002_021c1e44(void *self, int a, int b);

int func_ov002_021f3318(struct Ov002Self *self, int arg1, int arg2) {
    int po, io;
    if (arg1 == self->parity)
        return 0;
    if (arg2 >= 5)
        return 0;
    po = (arg1 & 1) * 0x868;
    io = arg2 * 0x14;
    if (((struct Bf13 *)(data_ov002_022cf16c + po + 0x30 + io))->v == 0)
        return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + po + io) == 0)
        return 0;
    if (!(data_ov002_022cd3f4[0] == arg1 && data_ov002_022cd3f4[7] == arg2))
        return 0;
    return func_ov002_021c1e44(self, arg1, arg2) == 0;
}
