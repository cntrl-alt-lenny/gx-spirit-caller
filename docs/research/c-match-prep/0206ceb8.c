/* CAMPAIGN-PREP candidate for func_0206ceb8 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     alloc(fn,obj,1); ordered 0x10/0x14/0x18/0x1c stores; 5th arg from stack; tail-call
 *   risk:       5th param d arrives on the incoming stack (orig: ldr r2,[sp,#0x18]) and orig delays its store to 0x1c past 'mov r0,r7'; mwcc may load/store it eagerly, reordering one ldr+str. reshape-able by store-order; offsets struct-guessed.
 *   confidence: med
 */
/* func_0206ceb8 (main, class D) — alloc then four ordered field stores incl stack arg. */
typedef unsigned long u32;

extern void *func_0206bf94(void *fn, void *obj, int flag);
extern int   func_0206be54(void *obj);
extern void  func_0206cd64(void);

int func_0206ceb8(void *obj, int a, int b, int c, int d)
{
    char *p = (char *)obj;
    char *n = (char *)func_0206bf94((void *)func_0206cd64, p, 1);

    *(int *)(n + 0x10) = a;
    *(int *)(n + 0x14) = b;
    *(int *)(n + 0x18) = c;
    *(int *)(n + 0x1c) = d;
    return func_0206be54(p);
}
