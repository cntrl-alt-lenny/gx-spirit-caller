/* CAMPAIGN-PREP candidate for func_0201f090 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     counted loop; (u16)i zero-extend; reload arr[i]; const arg hoist
 *   risk:       the constant 1 may emit inline mov #1 instead of being hoisted to a callee reg as orig
 *   confidence: med
 */
/* func_0201f090: counted loop. count = *(u16*)p (re-read each iteration). For
 * each i: arr[i] = func_0201ed08(1) [the 1 is loop-invariant, held in a callee
 * reg], then func_0207fd60(arr[i], func_0207e3bc(p, (u16)i), a1) with arr[i]
 * reloaded. func_0207fd60 result is discarded. */

typedef struct {
    unsigned short f_0;   /* +0x00 element count */
} list_f090;

extern int func_0201ed08(int a0);
extern int func_0207e3bc(list_f090 *p, int a1);
extern int func_0207fd60(int a0, int a1, int a2);

void func_0201f090(list_f090 *p, int a1, int *arr) {
    int i;
    for (i = 0; i < p->f_0; i++) {
        arr[i] = func_0201ed08(1);
        func_0207fd60(arr[i], func_0207e3bc(p, (unsigned short)i), a1);
    }
}
