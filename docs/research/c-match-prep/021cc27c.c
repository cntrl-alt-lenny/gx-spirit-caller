/* CAMPAIGN-PREP candidate for func_021cc27c (ov011, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C/D: 4174 lookup, halfword extract, two literal stack args, idx==0 guard
 *   risk:       permuter-class: same eaa0 stmib-grouping coin-flip as 021cc194 (3-reg group here); the 0xdd80/0x160 literals load order is scheduling-bound. Documented wall sibling, ships .s.
 *   confidence: low
 */
/* func_ov011_021cc27c: near-clone of 021cc194 over the 4174 table. Differs:
 * a 3-reg `stmib sp,{r0,r5,r6}`, two literal stack args (0xdd80 and 0x160),
 * and a single-case free guard (idx==0). Same stmib-scheduling WALL (ships .s). */
extern char data_ov011_021d4174[];
extern void func_0201e7ec(void *h, int v);
extern void func_0201e800(void *h, int v);
extern void func_0201eaa0(int a, void *h, void *p5, int hw7, int s0, int p8,
                          int lit10, int lit14, int p6, int s1c);
extern void func_0207fd28(void *h, int flags);

void func_ov011_021cc27c(int idx, int p2, int p3, int p4,
                         void *p5, int p6, int p7, int p8) {
    void *h = ((void **)data_ov011_021d4174)[idx];
    if (p2 != -1) func_0201e800(h, (unsigned int)(p2 << 16) >> 16);
    func_0201eaa0(1, h, p5, (unsigned int)(p7 << 16) >> 16,
                  0, p8, 0xdd80, 0x160, p6, 0);
    if (p2 != -1) return;
    func_0201e7ec(h, 1);
    if (idx == 0)
        func_0207fd28(h, 0x1000);
}
