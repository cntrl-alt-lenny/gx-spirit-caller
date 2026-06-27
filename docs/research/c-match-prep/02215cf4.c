/* CAMPAIGN-PREP candidate for func_02215cf4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D/branch-table: phase sub#0x7d table; h2 :1/:6 bitfields; guard chain via if(==0)return; case 0x80 first
 *   risk:       permuter-class + TRUNCATED: orig is a dense sub#0x7d;addls pc table; mwcc must reproduce that exact 4-entry table and case order, and the 0x7e/0x7d bodies are absent -> those bytes unmatchable.
 *   confidence: low
 */
/* func_ov002_02215cf4 (ov002, cls D): phase 0x7d..0x80 jump table. 0x80 is a
 * guard chain (021ca0d4, 021bc618, then h2.bits6..11==0x23 special else a
 * cf288 bit15 reject; special branch -> 0225368c / 021ae400, return 0x7e);
 * 0x7f calls 0227adb8 -> 0x7d.
 * WARNING: source asm TRUNCATED at '.L_110: ... lsr #0x1f'; the 0x7e
 * (.L_110) and 0x7d (.L_12c) bodies and default (.L_144, presumed return 0)
 * are reconstructed by intent only. */

extern unsigned char data_ov002_022cdc88[];   /* _LIT3 arg to 0227adb8 */
extern unsigned char data_ov002_022ce288[];   /* [0x5a8]=phase */
extern unsigned char data_ov002_022cf288[];   /* _LIT2 table, stride 0x868 */
extern int  func_ov002_021ae400(int b0, int b);
extern int  func_ov002_021bc618(int b0);
extern int  func_ov002_021ca0d4(int b0, int h0);
extern int  func_ov002_021e286c(void);
extern int  func_ov002_0225368c(int b0, int h0, int c);
extern int  func_ov002_0226b054(int a);
extern int  func_ov002_0227adb8(int b0, void *b, int c, int d);

typedef struct Obj {
    unsigned short h0;          /* 0x00 */
    unsigned short b0   : 1;    /* 0x02 bit0 */
    unsigned short h2a  : 5;    /* 0x02 bits1..5 */
    unsigned short f2_6 : 6;    /* 0x02 bits6..11 */
    unsigned short h2hi : 4;
} Obj;

int func_ov002_02215cf4(void *obj) {
    Obj *o = (Obj *)obj;
    int phase = *(int *)(data_ov002_022ce288 + 0x5a8);

    switch (phase) {
    case 0x80:
        if (func_ov002_021ca0d4(o->b0, o->h0) == 0)
            return 0;
        if (func_ov002_021bc618(o->b0) == 0)
            return 0;
        if (o->f2_6 != 0x23) {
            unsigned int w = *(unsigned int *)(data_ov002_022cf288 + (o->b0 & 1) * 0x868);
            if ((w >> 16) & 1)
                return 0;
        }
        if (func_ov002_0225368c(o->b0, o->h0, 0) != 0)
            return 0x7f;
        func_ov002_021ae400(o->b0, 0xd);
        return 0x7e;
    case 0x7f:
        func_ov002_0227adb8(o->b0, data_ov002_022cdc88, 1, 0);
        return 0x7d;
    case 0x7e:
        /* TRUNCATED body */
        return 0;
    case 0x7d:
        /* TRUNCATED body */
        return 0;
    default:
        return 0;
    }
}
