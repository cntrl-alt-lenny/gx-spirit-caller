/* CAMPAIGN-PREP candidate for func_021cc194 (ov011, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C/D: handle-table lookup, halfword (p<<16)>>16, guard-flip tails
 *   risk:       permuter-class: the 4-reg `stmib sp,{r0,r5,r6,ip}` arg grouping vs the p7&0xFFFF halfword split — scheduling decides where the 3rd store lands; C arg-order won't steer it. Documented wall, ships .s.
 *   confidence: low
 */
/* func_ov011_021cc194: configure cell handle 4110[idx] via the 8-effective-arg
 * func_0201eaa0 sink, with TWO post-call epilogue guards (retag-on-p2!=-1, and
 * a free only when p1 in {1,2}).  Sibling of the matched 021cbb64 but reads 4
 * extra stack params and has the dual tail -> this is the known stmib-scheduling
 * WALL (already ships as .s). */
extern char data_ov011_021d4110[];
extern void func_0201e7ec(void *h, int v);
extern void func_0201e800(void *h, int v);
extern void func_0201eaa0(int a, void *h, void *p5, int hw7, int s0, int p8,
                          int p4, int p3, int s10, int s14, int p6, int s1c);
extern void func_0207fd28(void *h, int flags);

void func_ov011_021cc194(int idx, int p2, int p3, int p4,
                         void *p5, int p6, int p7, int p8) {
    void *h = ((void **)data_ov011_021d4110)[idx];
    if (p2 != -1) func_0201e800(h, (unsigned int)(p2 << 16) >> 16);
    func_0201eaa0(1, h, p5, (unsigned int)(p7 << 16) >> 16,
                  0, p8, p4, p3, 0, 0, p6, 0);
    if (p2 != -1) return;
    func_0201e7ec(h, 1);
    if (idx == 1 || idx == 2)
        func_0207fd28(h, 0x1000);
}
