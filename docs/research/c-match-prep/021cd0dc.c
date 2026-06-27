/* CAMPAIGN-PREP candidate for func_021cd0dc (ov011, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C/D: 4154 lookup, halfword extract, 0x6800/0xe0 literals, single retag guard
 *   risk:       permuter-class: identical eaa0 `stmib sp,{r0,r5,r6}` 3-reg grouping vs the p7 halfword split as 021cc194/27c; scheduling of the 0x6800/0xe0 literal stores. Documented wall sibling, ships .s.
 *   confidence: low
 */
/* func_ov011_021cd0dc: configure cell handle 4154[idx] via func_0201eaa0 with
 * two literal stack args (0x6800, 0xe0); single post-call retag guard, then an
 * UNCONDITIONAL func_0201e7ec + func_0207fd28 free.  Sibling of 021cc194/27c;
 * note p1(idx) is consumed only for the table index (no r8 save) -> the prologue
 * pushes r3 and keeps idx in r0.  Same stmib-scheduling WALL (ships .s). */
extern char data_ov011_021d4154[];
extern void func_0201e7ec(void *h, int v);
extern void func_0201e800(void *h, int v);
extern void func_0201eaa0(int a, void *h, void *p5, int hw7, int s0, int s4,
                          int lit10, int lit14, int p6, int s1c);
extern void func_0207fd28(void *h, int flags);

void func_ov011_021cd0dc(int idx, int p2, int p3, int p4,
                         void *p5, int p6, int p7) {
    void *h = ((void **)data_ov011_021d4154)[idx];
    if (p2 != -1) func_0201e800(h, (unsigned int)(p2 << 16) >> 16);
    func_0201eaa0(1, h, p5, (unsigned int)(p7 << 16) >> 16,
                  0, 0, 0x6800, 0xe0, p6, 0);
    if (p2 != -1) return;
    func_0201e7ec(h, 1);
    func_0207fd28(h, 0x1000);
}
