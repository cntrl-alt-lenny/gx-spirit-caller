/* CAMPAIGN-PREP candidate for func_02092d20 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     flag-guard if(g)return;g=1 + unrolled call sequence
 *   risk:       Irregular unroll (idx 0,2 partial then 3-6 full) won't emit from a clean C loop; reg-alloc/scheduling of bl-result moves will flip. Already GLOBAL_ASM'd as no-C-match.
 *   confidence: low
 */
/* func_02092d20: one-shot init guard then a hand-unrolled per-channel
 * configure sequence. The original (brief 302) ships as whole-function
 * .s because the unroll is irregular: index 0 does b48->a48, a5c->a34;
 * index 2 does only a34(2,0) and a48(2,?); indices 3..6 do the full
 * b48->a48 / a5c->a34 quad. No natural C loop reproduces that shape,
 * and mwcc's scheduling of the `mov r1,r0` bl-result captures is
 * unlikely to match. Provided as best-effort; expect objdiff deltas. */

extern int  data_021a6628;
extern void func_02092a34(int idx, int val);
extern void func_02092a48(int idx, int val);
extern int  func_02092a5c(int idx);
extern int  func_02092b48(int idx);

void func_02092d20(void)
{
    if (data_021a6628) return;
    data_021a6628 = 1;

    func_02092a48(0, func_02092b48(0));
    func_02092a34(0, func_02092a5c(0));

    func_02092a34(2, 0);
    func_02092a48(2, 0);

    func_02092a48(3, func_02092b48(3));
    func_02092a34(3, func_02092a5c(3));

    func_02092a48(4, func_02092b48(4));
    func_02092a34(4, func_02092a5c(4));

    func_02092a48(5, func_02092b48(5));
    func_02092a34(5, func_02092a5c(5));

    func_02092a48(6, func_02092b48(6));
    func_02092a34(6, func_02092a5c(6));
}
