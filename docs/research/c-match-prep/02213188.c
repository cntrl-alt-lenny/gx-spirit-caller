/* CAMPAIGN-PREP candidate for func_02213188 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: lsl/lsr pairs->:1/:5/:9 bitfields; sel=bit*0x868; idx*0x14 binds once; eq via if-assign
 *   risk:       reshape-able: cmpv reconstruction (((w>>6)&0xff)<<1)+(w>>13)&1 may schedule its shifts differently than orig lsl#2;lsr#24/lsl#1/lsl#18; tweak shift form/operand-order if the mov chain diverges.
 *   confidence: med
 */
/* func_ov002_02213188 (ov002, cls D): 5-bit field indexes a per-sel
 * 0x14-stride record table at cf16c; validate a packed compare field, then
 * on a nonzero cf1a4 side-table halfword call 021d90c0 with eq-select count. */

extern unsigned char data_ov002_022cf16c[];   /* base + sel*0x868 + 0x30 + idx*0x14 record words */
extern unsigned char data_ov002_022cf1a4[];   /* base + sel*0x868 + idx*0x14 halfword side table */
extern unsigned char data_ov002_022d016c[];   /* [0xcec]=cmp ref, [0xcf0]=counter base */
extern void func_ov002_021d90c0(int a, int b, int c, int d);

typedef struct Obj {
    unsigned short h0;          /* 0x00 */
    unsigned short b0   : 1;    /* 0x02 bit0  */
    unsigned short idx5 : 5;    /* 0x02 bits1..5 */
    unsigned short h2hi : 10;
    unsigned short f4lo : 6;    /* 0x04 bits0..5 */
    unsigned short f4   : 9;    /* 0x04 bits6..14 */
    unsigned short f4hi : 1;
} Obj;

int func_ov002_02213188(void *obj) {
    Obj *o = (Obj *)obj;
    int sel = o->b0 * 0x868;
    int idx = o->idx5 * 0x14;
    unsigned int w = *(unsigned int *)(data_ov002_022cf16c + sel + 0x30 + idx);
    int cmpv = (((w >> 6) & 0xff) << 1) + ((w >> 13) & 1);

    if ((int)o->f4 != cmpv)
        return 0;

    if (*(unsigned short *)(data_ov002_022cf1a4 + idx + sel) != 0) {
        int eq = (*(int *)(data_ov002_022d016c + 0xcec) == o->b0) ? 1 : 0;
        int n  = *(int *)(data_ov002_022d016c + 0xcf0) + 1 + eq;
        func_ov002_021d90c0(o->b0, o->idx5, n, eq);
    }
    return 0;
}
