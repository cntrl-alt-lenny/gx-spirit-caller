/* CAMPAIGN-PREP candidate for func_0221454c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: h4.bit2 :2/:1 guard; h2 -> :1 + :5 bitfields; self bound in r4 across guard+0x7f branch
 *   risk:       reshape-able: orig binds self in r4 across the 0223df38 guard and 0x7f branch (021ca? no: 0220e518) while clobbering r4 in 0x80; if mwcc spills/reloads self the prologue regset or an extra mov diverges -- reorder branches so 0x80 is last.
 *   confidence: med
 */
/* func_ov002_0221454c (ov002, cls D): h4.bit2 guard + 0223df38 gate, then
 * phase switch: 0x80 extracts h2.bit0 and h2.bits1..5 and calls 0226b22c;
 * 0x7f gates on a counter halfword (022d0e6c[0xb2] >= 2) calling 0220e518. */

extern unsigned char data_ov002_022ce288[];   /* [0x5a8]=phase */
extern unsigned char data_ov002_022d0e6c[];   /* [0xb2]=counter halfword */
extern int  func_ov002_0220e518(void *self);
extern int  func_ov002_0223df38(void *self, int b, int c);
extern int  func_ov002_0226b22c(int b0, int idx5, int c, int d);

typedef struct Obj {
    unsigned short h0;          /* 0x00 */
    unsigned short b0   : 1;    /* 0x02 bit0 */
    unsigned short idx5 : 5;    /* 0x02 bits1..5 */
    unsigned short h2hi : 10;
    unsigned short h4b0 : 2;    /* 0x04 bits0..1 */
    unsigned short h4b2 : 1;    /* 0x04 bit2 (guard) */
    unsigned short h4hi : 13;
} Obj;

int func_ov002_0221454c(void *obj) {
    Obj *o = (Obj *)obj;
    int phase;

    if (o->h4b2)
        return 0;
    if (func_ov002_0223df38(obj, 0, 0) == 0)
        return 0;

    phase = *(int *)(data_ov002_022ce288 + 0x5a8);
    if (phase == 0x80) {
        func_ov002_0226b22c(o->b0, o->idx5, 3, 1);
        return 0x7f;
    }
    if (phase == 0x7f) {
        if (*(unsigned short *)(data_ov002_022d0e6c + 0xb2) >= 2)
            func_ov002_0220e518(obj);
        return 0;
    }
    return 0;
}
