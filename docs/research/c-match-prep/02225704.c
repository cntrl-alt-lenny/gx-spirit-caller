/* CAMPAIGN-PREP candidate for func_02225704 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     f2b6:6 and f14:9 bitfields (lsl/lsr pairs); eq via ==?1:0; sel = data_022cd42c[eq] mul-stride 0x38
 *   risk:       struct-guessed: f14 at +0x14 read as a 9-bit field ((x<<23)>>23) — confirm it is a :9 bitfield (else `& 0x1ff` gives `and` not lsl#23;lsr#23). bhi (unsigned >) on mid-byte must stay unsigned.
 *   confidence: med
 */
/* func_ov002_02225704: if h2.bits6-11 == 0x16, pick sel row 0/1 of
 * data_022cd42c by (global[0x38] == field14.low9), fetch packed word via
 * 021b947c, and if its mid-byte <= 4 forward the low byte to 021de4b0. */

extern unsigned char data_ov002_022cd3f4[];
extern unsigned char data_ov002_022cd42c[];
extern int func_ov002_021b947c(int a);
extern int func_ov002_021de4b0(int a, int b);

typedef struct Obj {
    unsigned short h0;          /* 0x00 */
    unsigned short f2b0 : 6;    /* 0x02 bits 0-5 */
    unsigned short f2b6 : 6;    /* bits 6-11 */
    unsigned short f2hi : 4;
    unsigned short pad4;        /* 0x04 */
    unsigned short pad6;        /* 0x06 */
    unsigned short pad8;        /* 0x08 */
    unsigned short pada;        /* 0x0a */
    unsigned short padc;        /* 0x0c */
    unsigned short pade;        /* 0x0e */
    unsigned short pad10;       /* 0x10 */
    unsigned short pad12;       /* 0x12 */
    unsigned int   f14 : 9;     /* 0x14 bits 0-8 */
    unsigned int   f14hi : 23;
} Obj;

int func_ov002_02225704(void *obj) {
    Obj *o = (Obj *)obj;
    int sel, q, eq;

    if (o->f2b6 != 0x16) return 0;

    eq = (*(int *)(data_ov002_022cd3f4 + 0x38) == o->f14) ? 1 : 0;
    sel = *(int *)(data_ov002_022cd42c + eq * 0x38);
    q = func_ov002_021b947c(sel);
    if ((((unsigned short)q >> 8) & 0xff) > 4) return 0;

    func_ov002_021de4b0((int)obj, q & 0xff);
    return 0;
}
