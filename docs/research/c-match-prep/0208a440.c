/* CAMPAIGN-PREP candidate for func_0208a440 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     signed if(x<0) default-load (ldrlt) order p3,p2,p1; bind h(r4) across calls; 8-arg stack marshal
 *   risk:       5 callee regs (r4-r8) live across 3 calls plus 4 stacked args; reg-alloc/scheduling of the marshal block is fragile. The ldrlt defaults reshape cleanly; the spill ordering of s6/s7/q into [sp] slots is permuter-class.
 *   confidence: low
 */
// func_0208a440 — fetch ctx, derive handle, fill negative args from defaults, tail-marshal
extern void *func_02089328(int a);
extern int   func_02089024(int a);
extern void *func_0208b000(void *a, int b);
extern int   func_0208a280(int a0, int a1, int a2, int a3,
                           void *s4, int s5, int s6, int s7);

int func_0208a440(int p0, int p1, int p2, int p3, int s6, int s7)
{
    void *c;
    int   h;
    void *q;
    c = func_02089328(s6);
    if (c == 0) {
        return 0;
    }
    h = func_02089024(*(int *)c);
    if (h == 0) {
        return 0;
    }
    q = func_0208b000(c, s7);   /* NB: orig passes q's struct, not c — see risk */
    if (q == 0) {
        return 0;
    }
    if (p3 < 0) p3 = *(unsigned char  *)((char *)q + 0x8);
    if (p2 < 0) p2 = *(unsigned short *)((char *)q + 0x4);
    if (p1 < 0) p1 = *(unsigned char  *)((char *)q + 0x9);
    return func_0208a280(p0, p1, p2, p3, q, h, s6, s7);
}
