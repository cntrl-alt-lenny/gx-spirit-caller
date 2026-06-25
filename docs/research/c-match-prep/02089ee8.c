/* CAMPAIGN-PREP candidate for func_02089ee8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD chain + if/else + 5-arg call + && tail-guard (clone)
 *   risk:       Same as 02089df8; only pooled fnptr differs. Same arity/order guess on func_02089f60.
 *   confidence: med
 */
/* func_02089ee8: identical cluster-33 clone of func_02089df8,
 * differs only in the pooled function pointer (func_02089c44).
 */

extern int  func_02089024(int a);
extern int  func_020893f0(void);
extern int  func_02089f60(int a, void *b, int c, int d, int e);
extern void func_02089008(int a, int b);
extern void func_02089c44(void);

int func_02089ee8(int p0, int p1, int p2) {
    int r;
    int arg2;

    r = func_02089024(p0);
    if (r != 0) return r;

    if (p2 == 0) {
        arg2 = 0;
    } else {
        arg2 = func_020893f0();
    }

    r = func_02089f60(p0, (void *)&func_02089c44, arg2, p0, p1);
    if (p2 != 0 && r != 0) {
        func_02089008(p0, r);
    }
    return r;
}
