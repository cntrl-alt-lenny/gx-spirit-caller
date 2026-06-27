/* CAMPAIGN-PREP candidate for func_021d0f38 (ov011, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     0x28-stride struct mla; :8 bitfield read(lsl24;lsr24)+write(bic;and;orr)
 *   risk:       reshape-able: if mwcc reads e->b with plain 'and #0xff' instead of lsl24;lsr24 the read diverges -- keep it a :8 bitfield (done). struct-guessed stride 0x28 / field@0xc.
 *   confidence: med
 */
/* func_ov011_021d0f38 (ov011, cls D): table base4660 stride 0x28 indexed by
 * arg0; field @+0xc holds a :8 byte (lsl#24;lsr#24 read == bitfield). If the
 * field already equals arg1, return; else write arg1's low byte into it
 * (bic 0xff + and 0xff + orr == bitfield assign). mla for idx*0x28. */

extern char data_ov011_021d4660[];

struct E4660 {
    char         _pad0[0xc];
    unsigned int b : 8;          /* +0xc, bits [7:0] */
    char         _pad1[0x28 - 0x10];
};

void func_ov011_021d0f38(int idx, int val) {
    struct E4660 *e = (struct E4660 *)data_ov011_021d4660 + idx;
    if (e->b == (unsigned int)val)
        return;
    e->b = val;
}
