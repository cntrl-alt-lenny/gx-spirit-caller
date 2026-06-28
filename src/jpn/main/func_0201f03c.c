/* CAMPAIGN-PREP candidate for func_0201f03c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     counted loop; (u16)i zero-extend; reload arr[i]; const arg hoist
 *   risk:       the constant 1 may emit inline mov #1 instead of being hoisted to a callee reg as orig
 *   confidence: med
 */
/* func_0201f03c: counted loop. count = *(u16*)p (re-read each iteration). For
 * each i: arr[i] = func_0201ecb4(1) [the 1 is loop-invariant, held in a callee
 * reg], then func_0207fc78(arr[i], func_0207e2d4(p, (u16)i), a1) with arr[i]
 * reloaded. func_0207fc78 result is discarded. */

typedef struct {
    unsigned short f_0;   /* +0x00 element count */
} list_f090;

extern int func_0201ecb4(int a0);
extern int func_0207e2d4(list_f090 *p, int a1);
extern int func_0207fc78(int a0, int a1, int a2);

void func_0201f03c(list_f090 *p, int a1, int *arr) {
    int i;
    for (i = 0; i < p->f_0; i++) {
        arr[i] = func_0201ecb4(1);
        func_0207fc78(arr[i], func_0207e2d4(p, (unsigned short)i), a1);
    }
}
