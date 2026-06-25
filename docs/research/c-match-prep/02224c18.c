/* CAMPAIGN-PREP candidate for func_02224c18 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     double-mla index (g&1)*0x868 + g2*0x14; pass g,g2 as args (CSE-reused in r1/r2); orr-pack f2b0|f2b1<<8
 *   risk:       reshape-able: orig does NOT reload r1/r2 before the call -> g and g2 are passed as args via CSE. Also field's lsl#19;lsr#19 implies a :13 bitfield, not the `& 0x1fff` (=and) I wrote.
 *   confidence: low
 */
/* func_ov002_02224c18: guard on global flag word (bit0 clear, bit1 set) and
 * 02257594()==2; index table data_022cf16c by (g&1) bank / g2 row, test the
 * low-13 of the +0x30 field, then pack h2 fields and call 021d5a08. */

extern unsigned char data_ov002_022cd3f4[];
extern unsigned char data_ov002_022cf16c[];
extern unsigned char data_ov002_022d016c[];
extern int func_ov002_021d5a08(int a, int b, int c, int d, int e, int f);
extern int func_ov002_02257594(void);

typedef struct Obj {
    unsigned short h0;          /* 0x00 */
    unsigned short f2b0 : 1;    /* 0x02 */
    unsigned short f2b1 : 5;    /* bits 1-5 */
    unsigned short f2b6 : 10;
} Obj;

int func_ov002_02224c18(void *obj) {
    Obj *o = (Obj *)obj;
    int v = *(int *)(data_ov002_022d016c + 0xd0);
    int g, g2, field, packed;

    if (v & 1) return 0;
    if (((v >> 1) & 1) == 0) return 0;
    if (func_ov002_02257594() != 2) return 0;

    g  = *(int *)data_ov002_022cd3f4;
    g2 = *(int *)(data_ov002_022cd3f4 + 0x1c);
    field = *(int *)(data_ov002_022cf16c + (g & 1) * 0x868 + g2 * 0x14 + 0x30);
    if ((field & 0x1fff) == 0) return 0;

    packed = o->f2b0 | (o->f2b1 << 8);
    func_ov002_021d5a08((int)obj, g, g2, (unsigned short)packed, 8, 0);
    return 0;
}
