/* CAMPAIGN-PREP candidate for func_021ceffc (ov011, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield :2 set + bitfield-to-bitfield copy (f9=f5); gate early-return
 *   risk:       reshape-able: f9=f5 must yield read(lsl23;lsr28)+write(bic1e00;orr v>>19). If mwcc reads the word twice or reorders f18-store vs gate, swap statements. struct-guessed bit layout.
 *   confidence: med
 */
/* func_ov011_021ceffc (ov011, cls D): set 2-bit field [19:18]=1 at
 * base4000+0x2ac (bic 0xc0000/orr 0x40000), gate on base4000+0x2a0, then
 * copy bitfield [8:5] -> [12:9] within base403c+0x268. Both are textbook
 * bitfield assigns (lsl;lsr read, bic+orr write). f18 declared :2 at bit18,
 * f5/f9 :4 in the +0x268 word. */

extern char data_ov011_021d4000[];
extern char data_ov011_021d403c[];

struct R4000 {
    char         _pad0[0x2a0];
    unsigned int gate;            /* +0x2a0 */
    char         _pad1[0x2ac - 0x2a4];
    unsigned int : 18;           /* +0x2ac */
    unsigned int f18 : 2;        /* bits [19:18] */
};

struct R403c {
    char         _pad0[0x268];
    unsigned int : 5;            /* +0x268 */
    unsigned int f5 : 4;         /* bits [8:5] */
    unsigned int f9 : 4;         /* bits [12:9] */
};

void func_ov011_021ceffc(void) {
    struct R4000 *a = (struct R4000 *)data_ov011_021d4000;
    struct R403c *c;
    a->f18 = 1;
    if (a->gate != 0)
        return;
    c = (struct R403c *)data_ov011_021d403c;
    c->f9 = c->f5;
}
