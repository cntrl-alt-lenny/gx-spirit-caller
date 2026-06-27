/* CAMPAIGN-PREP candidate for func_021caf80 (ov012, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     word0 bitfield struct (:3,:4,:9,:9,:7) gives the 3 lsl;lsr pairs; u8/s8 word1; A<<12,B<<12; 3-way branch
 *   risk:       struct-guessed: A:9@7,B:9@16,C:4@3 inferred from shift amounts; if real struct differs the loads change. Else reshape-able via bitfield
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov012_021caf80 (ov012, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED: MED tier rarely first-build-matches.
 *   recipe:     word0 bitfield struct (:3,:4,:9,:9,:7) reproduces all 3 lsl;lsr pairs; word1 u8 field + s8 field; A<<12,B<<12; 3-way branch, store-order stack args
 *   risk:       struct-guessed: field widths/positions of *a0 are inferred from the shift amounts -- (w0<<16)>>23, (w0<<7)>>23, (w0<<25)>>28 imply A:9@7, B:9@16, C:4@3. If real struct differs the loads change. Otherwise reshape-able (bitfield).
 *   confidence: med
 */
/* func_ov012_021caf80 (ov012, class D): from *a0 extract C(bits6:3,4b),A(bits15:7,9b),
 * B(bits24:16,9b); local pair{A<<12,B<<12}; r=func_ov000_021ac760(a0). word1=a0[1]:
 * lo=(u8) bits23:16, hi=(s8) bits31:24. If r!=0 call (lo+1,hi,2,0x10,&pair,0).
 * elif C==1 call (lo,hi,2,0x10,&pair{+0x1000 to B},0). else call (lo,hi,2,0x10,&pair,0). */
struct ov012_w0 {
    unsigned f0 : 3;
    unsigned c  : 4;
    unsigned a  : 9;
    unsigned b  : 9;
    unsigned f25 : 7;
};
struct ov012_obj {
    struct ov012_w0 w0;
    unsigned lo : 16;
    unsigned mid : 8;
    int hi : 8;
};
extern int func_ov000_021ac760(struct ov012_obj *o);
extern void func_ov012_021caea8(int r0, int r1, int r2, int r3, int *s4, int s5);

int func_ov012_021caf80(struct ov012_obj *o) {
    int pair[2];
    int c1;
    int r;
    pair[0] = o->w0.a << 12;
    pair[1] = o->w0.b << 12;
    c1 = (o->w0.c == 1);
    r = func_ov000_021ac760(o);
    if (r != 0) {
        func_ov012_021caea8(o->mid + 1, o->hi, 2, 0x10, pair, 0);
    } else if (c1) {
        pair[1] = pair[1] + 0x1000;
        func_ov012_021caea8(o->mid, o->hi, 2, 0x10, pair, 0);
    } else {
        func_ov012_021caea8(o->mid, o->hi, 2, 0x10, pair, 0);
    }
    return 0;
}
