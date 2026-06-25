/* CAMPAIGN-PREP candidate for func_02082f64 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two bit-guards, select source, reverse-order stores (sp8/sp4/sp0), counter++
 *   risk:       reshape-able: the eq/ne PREDICATED stores (streq/strne both branches) come from if/else; a ternary that hoists the load may reorder. If diff shows movcc loads, split into explicit if/else assigning v.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02082f64 (main, class C) - p_0033.
 * UNVERIFIED build-free draft: drop into src/, run ninja+objdiff, tweak per risk.
 *   recipe: two early-out bit guards; ternary-select source then three reverse-order stores (sp8,sp4,sp0); s->0++
 */
/* func_02082f64: unless busy/locked (flags 0x100/0x200), broadcast one of
 * two colors (s->e0 or s->e4 by arg1) into a 3-int param block and submit
 * cmd 0x1b; always bump the frame counter at s->0. */

extern void func_02084e0c(int cmd, int *params, int count);

void func_02082f64(unsigned char *s, int sel) {
    int flags = *(int *)(s + 8);
    if (!(flags & 0x100) && !(flags & 0x200)) {
        int p[3];
        int v = sel ? *(int *)(s + 0xe4) : *(int *)(s + 0xe0);
        p[2] = v;
        p[1] = v;
        p[0] = v;
        func_02084e0c(0x1b, p, 3);
    }
    *(int *)s += 1;
}
