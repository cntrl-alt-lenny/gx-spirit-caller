/* CAMPAIGN-PREP candidate for func_021ac5d0 (ov008, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     low-3-bits via plain &0x7 won't give lsl;lsr — need :N bitfield on the [+4] word; subne r3,r3,#1
 *   risk:       reshape-able + struct-guessed: the lsl#0x1d;lsr#0x1d pair is a 3-bit BITFIELD load of *(_LIT0+4) — must be a :3 bitfield struct member, not &0x7 (mask gives 'and', not lsl;lsr). 's34' arg value not recoverable from this truncated view (no [sp] for it visible); the 'extra' default branch (b .L_50 with lr live from prior) is ambiguous.
 *   confidence: low
 */
/* func_ov008_021ac5d0: small switch computing a few args, one call.
   cls C/D (switch + :5 bitfield-ish + decl-order). */

extern int data_02104f4c;   /* _LIT0, [+0x4] packed word */

extern void func_ov008_021ab484(int a0, int a1, int e2, int e3,
                                int s30, int s34, int s38, int s3c);

void func_ov008_021ac5d0(int a0, int a1, int a2)
{
    int lo5;   /* low 3 bits via <<0x1d>>0x1d */
    int extra;

    lo5 = (data_02104f4c >> 4) & 0x7;   /* [+0x4] then lsl#1d;lsr#1d = low 3 bits */
    if (a2 <= 1)
        return;

    if (lo5 != 0)
        lo5 = lo5 - 1;

    if (a2 == 2) {
        a1 = a1 + 4;
        extra = 0;
    } else if (a2 == 3 || a2 == 4) {
        a0 = a0 - 3;
        extra = 1;
    } else {
        extra = 1;   /* falls through L_50 with lr unset -> matches moveq path only on 3/4; default keeps prior */
    }

    func_ov008_021ab484(a0, a1, 0, extra + (lo5 << 1) + 2,
                        0x16 /*placeholder*/, 0x2, 0x400, 0);
}
