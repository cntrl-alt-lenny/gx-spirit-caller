/* CAMPAIGN-PREP candidate for func_02071a74 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch w/ explicit cases; movs-obj early-return; cache a,b,c for default
 *   risk:       Orig case-order in asm is 4,7,8 (cmp #4 first) — mwcc emits compare-chain following SOURCE case order; keep cases ascending. The movs r4,r0 NULL-test then per-case must match; if mwcc builds a jump table vs cmp-chain it diverges (reshape: keep sparse cases => cmp-chain).
 *   confidence: med
 */
/* func_02071a74: lookup obj then state-switch with counter bump.
 * obj = func_020724c8(a,b,c); if(obj==0) return.
 * state=obj->_8:
 *   4 -> obj->f24++; func_02072370(obj,0); obj->_8=6; return
 *   7 -> obj->f24++; func_02072384(obj,0); obj->_8=9; return
 *   8 -> obj->f24++; func_02072384(obj,0); obj->_8=0;
 *        if(obj->f4==2){ obj->f4=0; func_020919d8(obj->f0); } return
 *   default -> func_02072234(a,b,c,0)
 *
 * NOTE func_020724c8 takes (a,b,c) = original args r0,r1,r2 cached in
 * r7,r6,r5 because the default branch re-passes them; the switch worker
 * calls take obj in r0.
 */

typedef struct Obj {
    int   f0;              /* +0x0 */
    int   f4;              /* +0x4 */
    char  _pad08[0x3];
    unsigned char state;   /* +0x8 */
    char  _pad09[0x1b];
    int   f24;             /* +0x24 */
} Obj;

extern Obj *func_020724c8(int a, int b, int c);
extern void func_02072234(int a, int b, int c, int d);
extern void func_02072370(Obj *obj, int arg);
extern void func_02072384(Obj *obj, int arg);
extern void func_020919d8(int arg);

void func_02071a74(int a, int b, int c) {
    Obj *obj = func_020724c8(a, b, c);

    if (obj == 0) return;

    switch (obj->state) {
    case 4:
        obj->f24++;
        func_02072370(obj, 0);
        obj->state = 6;
        return;
    case 7:
        obj->f24++;
        func_02072384(obj, 0);
        obj->state = 9;
        return;
    case 8:
        obj->f24++;
        func_02072384(obj, 0);
        obj->state = 0;
        if (obj->f4 == 2) {
            obj->f4 = 0;
            func_020919d8(obj->f0);
        }
        return;
    default:
        func_02072234(a, b, c, 0);
        return;
    }
}
