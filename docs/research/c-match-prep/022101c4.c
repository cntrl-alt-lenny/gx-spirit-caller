/* CAMPAIGN-PREP candidate for func_022101c4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: bitfield-insert RMW with strh in exact order; off-field shift extracts
 *   risk:       store-order/insert codegen: two strh to e[2] interleaved with bic/orr -- if mwcc coalesces the RMW or reorders the strh, bytes diverge. struct-guessed (off4 layout from shift constants).
 *   confidence: low
 */
/* func_ov002_022101c4 (ov002, cls D): null-guard arg1; then two read-modify-write
 * bitfield inserts into the halfword at off4 (bit1->bit2, bit2->bit3 style: orr|=2
 * then move a :1 to position 2; then move a :1 to position 3), each followed by a
 * strh -- store-order critical. Then unpacks off2 (:1,:6) and off4 (:9 area) into
 * three args for 021d8904, and if (off2 :6 field)<=0xa calls 021de598(self, off2:1).
 * arg1 (r4) is the bitfield struct; arg0 (r5) passed last. */
extern int  func_ov002_021d8904(int a, int b, int c);
extern int  func_ov002_021de598(int a, int b);
int func_ov002_022101c4(int a0, unsigned short *e) {
    unsigned short v, t;
    int x;
    if (e == 0)
        return 0;
    v = e[2] | 2;                 /* off4 = e[2]; set bit1 */
    t = (unsigned short)((v << 0x1e) >> 0x1f);   /* bit1 -> :1 */
    v = (v & ~4u) | (t << 2);
    e[2] = v;
    v = e[2];
    t = (unsigned short)((v << 0x1d) >> 0x1f);   /* bit2 -> :1 */
    v = (v & ~8u) | (t << 3);
    e[2] = v;
    {
        unsigned short h2 = e[1];
        unsigned short h4 = e[2];
        func_ov002_021d8904((h2 << 0x1f) >> 0x1f,
                            (h2 << 0x1a) >> 0x1b,
                            (h4 << 0x11) >> 0x17);
    }
    x = (e[1] << 0x1a) >> 0x1b;
    if ((unsigned)x <= 0xa)
        func_ov002_021de598(a0, (e[1] << 0x1f) >> 0x1f);
    return 0;
}
