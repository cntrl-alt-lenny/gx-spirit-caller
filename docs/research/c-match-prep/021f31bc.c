/* CAMPAIGN-PREP candidate for func_021f31bc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: :13 bitfield struct for the +0x30 field (gives lsl;lsr, not and/tst); base via mla addressing not bound
 *   risk:       NONE residual — compiled byte-exact vs delinked .o. Earlier `(v&0x1fff)` mask gave ldr=0x1fff;tst; the :13 bitfield fixed it to lsl#19;lsrs#19. reshape-able (done).
 *   confidence: high
 */
/* CAMPAIGN-PREP candidate for func_ov002_021f31bc (ov002, class D) — MED tier.
 * VALIDATED byte-exact (mwcc 2.0/sp1p5 -O4,p -interworking vs delinked .o).
 * Clone-family with 021f3318/021f33c8.
 * recipe: self->parity (:1 @+2 bit0) guard, arg2 range [5,0xa), then index the
 * cf16c table at (arg1&1)*0x868 + arg2*0x14 + 0x30 (base via addressing, NOT a
 * bound local — matches mla ip,lr,0x868,cf16c then mla r3,r2,0x14,ip), test the
 * low-13-bit field (v<<0x13>>0x13 -> v & 0x1fff), then bool of one helper call.
 * Table stride/record-size match the established ov002 cf16c convention. */
typedef unsigned short u16;

struct Ov002Self { u16 f0; u16 parity : 1; };        /* parity = bit0 of [+2] */
struct Bf13 { unsigned v : 13; };                    /* :13 field -> lsl;lsr (not and) */
extern char data_ov002_022cf16c[];                   /* 0x14-byte recs, 0x868 parity stride */
extern int  func_ov002_021c2084(void *self, int a, int b, int c);

int func_ov002_021f31bc(struct Ov002Self *self, int arg1, int arg2) {
    if (arg1 == self->parity)
        return 0;
    if (arg2 < 5)
        return 0;
    if (arg2 >= 0xa)
        return 0;
    if (((struct Bf13 *)(data_ov002_022cf16c + (arg1 & 1) * 0x868 +
                         arg2 * 0x14 + 0x30))->v == 0)
        return 0;
    return func_ov002_021c2084(self, arg1, arg2, 0) != 0;
}
