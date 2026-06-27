/* CAMPAIGN-PREP candidate for func_022241b8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     f4b2:1 guard; two distinct externs a2/a4 (separate literals); row*0x14 smulbb, bank*0x868 mul; reuse row index
 *   risk:       reshape-able(uncertain): orig emits mul for (p&1)*0x868 but smulbb for row*0x14; mwcc may pick smulbb for both. Bound the bank operand to a non-16-bit-provable temp if it diverges.
 *   confidence: med
 */
/* func_ov002_022241b8: if h4.bit2 clear and df38 ok, index a 2-bank
 * (stride 0x868) x row (stride 0x14) table of {u16 a; u16 b;} at
 * data_022cf1a2; if the .b slot is free, branch d6808/d63fc on .a. */

extern unsigned char data_ov002_022cf1a2[];   /* .a field base */
extern unsigned char data_ov002_022cf1a4[];   /* .b field base (= a2 + 2) */
extern int func_ov002_021d63fc(int a);
extern int func_ov002_021d6808(int a, int b, int c, int d, int e);
extern int func_ov002_0223de94(void *o, int sel);
extern int func_ov002_0223df38(void *o, int a, int b);

typedef struct Obj {
    unsigned short h0;          /* 0x00 */
    unsigned short h2;          /* 0x02 */
    unsigned short f4b0 : 2;    /* 0x04 */
    unsigned short f4b2 : 1;
    unsigned short f4hi : 13;
} Obj;

int func_ov002_022241b8(void *obj) {
    Obj *o = (Obj *)obj;
    int p, bank, row;

    if (o->f4b2) return 0;
    if (func_ov002_0223df38(obj, 0, 0) == 0) return 0;

    p = func_ov002_0223de94(obj, 0);
    bank = (p & 0xff) & 1;
    row = (((unsigned short)p >> 8) & 0xff) * 0x14;

    if (*(unsigned short *)(data_ov002_022cf1a4 + bank * 0x868 + row) != 0)
        return 0;
    if (*(unsigned short *)(data_ov002_022cf1a2 + bank * 0x868 + row) != 0)
        func_ov002_021d6808((int)obj, 0, 0, 0, 1);
    else
        func_ov002_021d63fc((int)obj);
    return 0;
}
