/* CAMPAIGN-PREP candidate for func_02224b90 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     RELOAD h2.bit0 after call (read o->f2b0 fresh, don't bind); eq via ==?1:0 cmp/moveq; f4b2:1 guard
 *   risk:       reshape-able: orig reloads h2 with two ldrh (value not kept across the e104c call). If mwcc parks o->f2b0 in a callee-saved reg it drops the 2nd ldrh; if so split into two reads / add a clobber barrier.
 *   confidence: med
 */
/* func_ov002_02224b90: if h4.bit2 clear and e104c(h2.bit0,2) ok, build a
 * packed nibble ((eq+3)<<4)|1 where eq = (global[0xcec] == h2.bit0), and
 * forward it via 021e276c. h2.bit0 is re-read after the e104c call. */

extern unsigned char data_ov002_022d016c[];
extern int func_ov002_021e104c(int a, int b);
extern int func_ov002_021e276c(int a, int b, int c, int d);

typedef struct Obj {
    unsigned short h0;          /* 0x00 */
    unsigned short f2b0 : 1;    /* 0x02 */
    unsigned short f2b1 : 15;
    unsigned short f4b0 : 2;    /* 0x04 */
    unsigned short f4b2 : 1;
    unsigned short f4hi : 13;
} Obj;

int func_ov002_02224b90(void *obj) {
    Obj *o = (Obj *)obj;
    int eq, packed;

    if (o->f4b2) return 0;
    if (func_ov002_021e104c(o->f2b0, 2) == 0) return 0;

    eq = (*(int *)(data_ov002_022d016c + 0xcec) == o->f2b0) ? 1 : 0;
    packed = (((eq + 3) & 0xff) << 4) | 1;
    func_ov002_021e276c(o->f2b0, o->h0, (unsigned short)packed, 0);
    return 0;
}
