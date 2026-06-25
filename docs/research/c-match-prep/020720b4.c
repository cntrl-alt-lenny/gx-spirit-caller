/* CAMPAIGN-PREP candidate for func_020720b4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     u8 range via (state-3)&0xff<=1; bind obj; single 'return 1' tail
 *   risk:       Orig keeps obj in r2 (the func_020724c8 result via 'movs r2,r0') and reads f28 through r2; mwcc usually parks a callee result in r0/r4. The (u8)(state-3)<=1 may compile to sub+and+cmp matching, but the r2-pin is permuter-class.
 *   confidence: med
 */
/* func_020720b4: guard dispatch with wrapped state-decrement.
 * obj = func_020724c8(a,b,c) [r6=a,r5=b,r4=c]; if(obj==0) return 0.
 * state=obj->_8:
 *   ==1 -> func_02072144(a,b); return 1
 *   else if ((unsigned char)(state-3) <= 1) i.e. state==3||state==4:
 *        obj->f28--; func_02072144(a,b); return 1
 *   else -> func_02072234(a,b,c,0); return 1
 *  (NULL -> return 0)
 *
 * The 'add #0xfd; and #0xff; cmp #1; bhi' is (u8)(state-3) range test:
 * 0xfd == -3 mod 256, so state in {3,4} pass.
 */

typedef struct Obj {
    char  _pad08[0x8];
    unsigned char state;   /* +0x8 */
    char  _pad09[0x1f];
    int   f28;             /* +0x28 */
} Obj;

extern Obj *func_020724c8(int a, int b, int c);
extern void func_02072144(int a, int b);
extern void func_02072234(int a, int b, int c, int d);

int func_020720b4(int a, int b, int c) {
    Obj *obj = func_020724c8(a, b, c);

    if (obj == 0) return 0;

    if (obj->state == 1) {
        func_02072144(a, b);
    } else if ((unsigned char)(obj->state - 3) <= 1) {
        obj->f28--;
        func_02072144(a, b);
    } else {
        func_02072234(a, b, c, 0);
    }
    return 1;
}
