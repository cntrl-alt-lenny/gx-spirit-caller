/* CAMPAIGN-PREP candidate for func_022158c0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: h0->thr/tbl if-chain; guard chain via if(==0)return; f2_6 :6 bitfield ==0x23; sel=(b0&1)*0x868
 *   risk:       reshape-able (0x80 chain) but TRUNCATED elsewhere: the 8-byte stack slots (sub sp,#8) are unused in shown code -> a spill the missing branches need; .L_10c return value and 0x7e/0x7f/default bytes are absent and unmatchable.
 *   confidence: low
 */
/* func_ov002_022158c0 (ov002, cls D): map h0 to (r4 threshold, r5 table ptr),
 * then phase dispatch. 0x80 is a guard chain: 021bc618 result >= r4, then
 * 021ca0d4, 021ca3f0, an h2.bits6..11==0x23 special-case, else a
 * cf-table bit15 reject; .L_10c clears ce288[0x5ac] after 021e2b3c.
 * WARNING: source asm TRUNCATED at '.L_10c: ... add sp,#8'; the .L_10c
 * return value and the 0x7e (.L_1bc) / 0x7f (.L_128) / default (.L_1c0)
 * bodies are reconstructed by intent only. */

extern unsigned char data_ov002_022be13c[];   /* _LIT3 ptr (h0==LIT0 -> r5) */
extern unsigned char data_ov002_022be144[];   /* _LIT2 ptr (h0==LIT1 -> r5) */
extern unsigned char data_ov002_022ce288[];   /* [0x5a8]=phase, [0x5ac]=cursor */
extern unsigned char data_ov002_022cf288[];   /* _LIT6 table, stride 0x868 */
extern int  func_ov002_021bc618(int b0);
extern int  func_ov002_021ca0d4(int b0, int h0);
extern int  func_ov002_021ca3f0(int b0, int v);
extern int  func_ov002_021e2b3c(void);
extern int  func_ov002_021e2c5c(void);
extern int  func_ov002_0227ac64(void);

extern const unsigned short data_ov002_KEY0_8c0;
extern const unsigned short data_ov002_KEY1_8c0;

typedef struct Obj {
    unsigned short h0;          /* 0x00 */
    unsigned short b0   : 1;    /* 0x02 bit0 */
    unsigned short h2a  : 5;    /* 0x02 bits1..5 */
    unsigned short f2_6 : 6;    /* 0x02 bits6..11 */
    unsigned short h2hi : 4;
} Obj;

int func_ov002_022158c0(void *obj) {
    Obj *o = (Obj *)obj;
    int thr = 0;
    int *tbl = 0;
    int phase;

    if (o->h0 == data_ov002_KEY0_8c0) {
        tbl = (int *)data_ov002_022be13c;
        thr = 4;
    } else if (o->h0 == data_ov002_KEY1_8c0) {
        tbl = (int *)data_ov002_022be144;
        thr = 2;
    }

    phase = *(int *)(data_ov002_022ce288 + 0x5a8);
    if (phase == 0x80) {
        if (func_ov002_021bc618(o->b0) < thr)
            return 0;
        if (func_ov002_021ca0d4(o->b0, o->h0) == 0)
            return 0;
        if (func_ov002_021ca3f0(o->b0, *tbl) == 0)
            return 0;
        if (o->f2_6 != 0x23) {
            unsigned int w = *(unsigned int *)(data_ov002_022cf288 + (o->b0 & 1) * 0x868);
            if ((w >> 16) & 1)
                return 0;
        }
        func_ov002_021e2b3c();
        *(int *)(data_ov002_022ce288 + 0x5ac) = 0;
        return 0;        /* TRUNCATED tail */
    }
    /* phase 0x7e (.L_1bc), 0x7f (.L_128), default (.L_1c0): TRUNCATED */
    return 0;
}
