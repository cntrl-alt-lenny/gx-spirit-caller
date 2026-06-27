/* CAMPAIGN-PREP candidate for func_02040cc0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     hoist fp + zero/count out of loop (regs r8/r5/r4/r6/fp preloaded); stride-8 slot; i++ counted
 *   risk:       orig hoists FIVE constants out of the loop into callee-saved regs (fp=r8, two zero-stores r5/r4, two blx-arg2 r6/fp=0) before the body. mwcc -O4 may not pre-load all five, materializing zero/arg inside the loop -> extra movs per iter. permuter-class (loop-invariant reg pressure).
 *   confidence: low
 */
/* func_02040cc0 (C, 148B): counted loop over stride-8 slot pairs, two blx of base[0x14] fn-ptr.
 * arg0->fp = (base+0x1000)[0x14]. for(i=0;i<count;i++){ if(list[i].a){ fp(data_020fe7b8,?,0); list[i].a=0; }
 *   if(list[i].b){ fp(data_020fe7d4,?,0); list[i].b=0; } }
 * args: r0=arg0(base), r1=list, r2=count. Loop index i in r7, stride lsl#3 (8 bytes/slot).
 */
extern char data_020fe7b8[];
extern char data_020fe7d4[];

struct Slot0204 { int a; int b; };   /* 8 bytes, indexed by i<<3 */

void func_02040cc0(char *base, struct Slot0204 *list, int count) {
    void (*fp)(void *, int, int);
    int i;
    fp = *(void (**)(void *, int, int))(base + 0x1000 + 0x14);
    if (count <= 0) return;
    for (i = 0; i < count; i++) {
        if (list[i].a != 0) {
            fp(data_020fe7b8, 0, 0);
            list[i].a = 0;
        }
        if (list[i].b != 0) {
            fp(data_020fe7d4, 0, 0);
            list[i].b = 0;
        }
    }
}
