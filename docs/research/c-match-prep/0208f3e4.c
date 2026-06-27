/* CAMPAIGN-PREP candidate for func_0208f3e4 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     020900a0 template, swap base global to data_021a6324; global+b operand order; 2 stack zeros vs Copy32
 *   risk:       orig loads data_021a6324 into a callee-saved reg (r4) and keeps it; the two shared-zero stack stores + ip alloc may flip. reshape-able — structurally identical to 020900a0 (only the base symbol differs).
 *   confidence: high
 */
/* CAMPAIGN-PREP candidate for func_0208f3e4 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. Marshalling wrapper — global-base variant,
 * near-exact match to PROVEN func_020900a0. Two globals bound: base=data_021a6324,
 * handle=data_0210249c. dst = data_021a6324 + b (`add r4,r4(global),r1(b)` =
 * global-operand-first). The base add is hoisted before the -1 compare (free add).
 * handle!=-1 -> func_02093e38(handle, a, dst, n, 0, 0) else Copy32(a, dst, n). */
extern void Copy32(void *dst, void *src, int n);
extern void func_02093e38(int handle, void *src, void *dst, int n, int e, int f);
extern int  data_0210249c;
extern int  data_021a6324;

void func_0208f3e4(void *a, int b, int n)
{
    int handle = data_0210249c;
    char *dst = (char *)data_021a6324 + b;
    if (handle != -1)
        func_02093e38(handle, a, dst, n, 0, 0);
    else
        Copy32(a, dst, n);
}
