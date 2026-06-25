/* CAMPAIGN-PREP candidate for func_0208a1e4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD (ret 2) + ldrh field + and-test branch + cond-store tail
 *   risk:       Non-zero func_0208a09c path returns its own r0 (not 0) — the `return 0` here may mismatch r0; consider returning the call result. p5 is 6th-slot arg at [sp+0x18]. Field offsets guessed.
 *   confidence: low
 */
/* func_0208a1e4: call chain with and-test guard; returns status code.
 *
 *   r7=p1, r6=p2, r5=p3 (p0/r0 unused after entry)
 *   r4 = func_0208938c();   if (r4==0) return 2
 *   if (func_0208a09c((u16)r4->h@0x4, p1, p2, p3, [sp]=0) != 0) return
 *   if (p1 & 1) {
 *       if (func_02089ee8(r4->w@0x0, p2, p3) == 0) return 6
 *       goto store
 *   } else {
 *       r0 = func_02089024(r4->w@0x0)
 *   }
 *   store: if (p4 != 0) *p4 = r0
 *   return 0
 */

extern int func_0208938c(void);
extern int func_0208a09c(int a, int b, int c, int d, int e);
extern int func_02089ee8(int a, int b, int c);
extern int func_02089024(int a);

int func_0208a1e4(int p0, int p1, int p2, int p3, int *p5) {
    int *h;
    int v;

    h = (int *)func_0208938c();
    if (h == 0) return 2;

    if (func_0208a09c((int)*(unsigned short *)((char *)h + 0x4),
                      p1, p2, p3, 0) != 0) {
        return 0;   /* addne/ldmne: returns with r0 = func_0208a09c result */
    }

    if (p1 & 1) {
        v = func_02089ee8(*h, p2, p3);
        if (v == 0) return 6;
    } else {
        v = func_02089024(*h);
    }

    if (p5 != 0) {
        *p5 = v;
    }
    return 0;
}
