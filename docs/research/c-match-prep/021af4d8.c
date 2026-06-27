/* CAMPAIGN-PREP candidate for func_021af4d8 (ov000, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     guard via &&-chained bitfield reads (matches cmp+cmpeq short-circuit); 3 :N bitfield inserts in store-order
 *   risk:       permuter-class: guard holds B[0x24] in r4 and re-shifts it for both bits5 and bits21 compares (one ldr, two shift-pairs); mwcc may reload B[0x24] or split the &&-chain cmps differently -> cond-code/reg divergence.
 *   confidence: low
 */
/* func_ov000_021af4d8: guard then pack three fields into B[0x24].
 * Guard: read A[0x2c] bits13..20 (:8) == arg1, B[0x24] bits5..12 (:8) == arg0,
 * B[0x24] bits21..25 (:5) == arg2 -> if all equal, return (no write).
 * Else rebuild B[0x24]: bit5:8=arg0, bit13:8=arg1, bit21:5=arg2 (store-order).
 *
 *   ldr r4,[A,#0x2c]; r4<<0xb; cmp r1, r4>>0x18                ; A.bits13:8
 *   ldreq r4,[B,#0x24]; moveq ip,r4<<0x13; cmpeq r0, ip>>0x18  ; B.bits5:8
 *   moveq r4,r4<<0x6; moveq r4,r4>>0x1b; cmpeq r4,r2           ; B.bits21:5
 *   ldmeqia (return)
 *   ... and r0,#0xff; and lr,r1,#0xff; and r1(r2),#0xff; field inserts -> str [B,#0x24]
 */

struct Ov000A_2c {
    char         _pad[0x2c];
    unsigned int lo   : 13;
    unsigned int f    : 8;         /* 0x2c bit13:8 */
    unsigned int hi   : 11;
};
struct Ov000B_24 {
    char         _pad[0x24];
    unsigned int b0   : 5;
    unsigned int b5   : 8;         /* bit5:8  = arg0 */
    unsigned int b13  : 8;         /* bit13:8 = arg1 */
    unsigned int b21  : 5;         /* bit21:5 = arg2 */
    unsigned int b26  : 6;
};

extern struct Ov000A_2c data_ov000_021c758c;
extern struct Ov000B_24 data_ov000_021c7594;

void func_ov000_021af4d8(int arg0, int arg1, int arg2) {
    if (data_ov000_021c758c.f == (unsigned)arg1 &&
        data_ov000_021c7594.b5 == (unsigned)arg0 &&
        data_ov000_021c7594.b21 == (unsigned)arg2)
        return;
    data_ov000_021c7594.b5  = arg0;
    data_ov000_021c7594.b13 = arg1;
    data_ov000_021c7594.b21 = arg2;
}
