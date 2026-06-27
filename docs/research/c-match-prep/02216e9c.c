/* CAMPAIGN-PREP candidate for func_02216e9c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D STORE-ORDER: lsl/lsr pairs->:1/:5/:9 bitfields; emit the two h4 RMW field writes in asm order, not coalesced
 *   risk:       reshape-able (store-order): orig does two separate ldrh/strh RMW on h4; mwcc may coalesce o->e1=1;o->e2=o->e1;o->e3=o->e2 into one strh -> if so split into two explicit RMW statements or volatile to force two stores.
 *   confidence: med
 */
/* func_ov002_02216e9c (ov002, cls D, STORE-ORDER): if arg1 NULL tail-call
 * 02216f3c; else extract h2(bit0,bits1..5) and h4(bits6..14) for 021d8904,
 * then two ordered RMW writes to the h4 field (set bit1 and copy bit1->bit2;
 * then copy bit2->bit3), then 021de598 with h2(bit0,bits1..5). */

extern int  func_ov002_021d8904(int b0, int idx5, int f4);
extern int  func_ov002_021de598(void *a, int b0, int idx5);
extern int  func_ov002_02216f3c(void);

typedef struct Obj {
    unsigned short h0;          /* 0x00 */
    unsigned short b0   : 1;    /* 0x02 bit0 */
    unsigned short idx5 : 5;    /* 0x02 bits1..5 */
    unsigned short h2hi : 10;
    unsigned short e0   : 1;    /* 0x04 bit0 */
    unsigned short e1   : 1;    /* 0x04 bit1 */
    unsigned short e2   : 1;    /* 0x04 bit2 */
    unsigned short e3   : 1;    /* 0x04 bit3 */
    unsigned short f4   : 9;    /* 0x04 bits6..14 (note bits4..5 fold in) */
    unsigned short h4hi : 3;
} Obj;

int func_ov002_02216e9c(void *a, void *b) {
    Obj *o = (Obj *)b;

    if (b == 0)
        return func_ov002_02216f3c();

    func_ov002_021d8904(o->b0, o->idx5, (*(unsigned short *)((char *)b + 4) >> 6) & 0x1ff);

    o->e1 = 1;
    o->e2 = o->e1;          /* first strh: set bit1, copy bit1->bit2 */
    o->e3 = o->e2;          /* second strh: copy bit2->bit3 */

    func_ov002_021de598(a, o->b0, o->idx5);
    return 0;
}
