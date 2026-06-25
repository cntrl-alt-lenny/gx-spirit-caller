/* CAMPAIGN-PREP candidate for func_0225b2e8 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard chain (== / signed >) + bind-reuse + single call returning 0x800
 *   risk:       reg-alloc must keep cd3f4[0] in r0 and (arg1+arg2) in r3 across both guards into the call args; if either re-materializes, extra movs appear
 *   confidence: med
 */
/* func_ov002_0225b2e8: gate on a != data_ov002_022cd3f4[0] and (arg1+arg2) <= 4,
 * then call 021bf294(cd3f4[0], cd3f4.f1c, a, arg1+arg2, 1); return 0x800 if it
 * fires, else 0. cd3f4[0] and the (arg1+arg2) sum are reused as call args. */

extern char data_ov002_022cd3f4[];
extern int func_ov002_021bf294(int a, int b, int c, int d, int e);

int func_ov002_0225b2e8(int a, int arg1, int arg2) {
    int g0 = *(int *)(data_ov002_022cd3f4 + 0x0);
    int sum;
    if (a == g0)
        return 0;
    sum = arg1 + arg2;
    if (sum > 4)
        return 0;
    if (func_ov002_021bf294(g0, *(int *)(data_ov002_022cd3f4 + 0x1C), a, sum, 1) != 0)
        return 0x800;
    return 0;
}
